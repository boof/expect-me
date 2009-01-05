class Expectation

  class Collector
    def initialize(receiver, generator)
      @receiver, @generator = receiver, generator
      @populating = false
    end
    def map
      raise RuntimeError if @populating
      values.map { |obj, sub_clause| yield obj, sub_clause }
    end
  end

  class ValueCollector < Collector

    def using(subordinate, &generator)
      value = @receiver.instance_eval(&generator)
      @values << [value, ", using #{ subordinate }"]
    end

    protected
    def values
      @populating, @values, collector, generator = true, [], self, @generator

      value = @receiver.instance_eval { generator[collector] }
      @values << [value, ''] if @values.empty?

      @values
    ensure
      @populating = false
    end

  end

  class ExceptionCollector < Collector

    def using(subordinate, &generator)
      begin
        value = @receiver.instance_eval(&generator)
        @values << [value.inspect, ", using #{ subordinate }"]
      rescue Object => exception
        @values << [exception, ", using #{ subordinate }"]
      end
    end

    protected
    def values
      @populating, @values, collector, generator = true, [], self, @generator

      begin
        value = @receiver.instance_eval { generator[collector] }
        @values << [value.inspect, ''] if @values.empty?
      rescue Object => exception
        @values << [exception, '']
      end

      @values
    ensure
      @populating = false
    end

  end

end
