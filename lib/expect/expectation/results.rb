class Expectation

  class Result
    attr_reader :object, :clause

    def initialize(object, clause)
      @object, @clause = object, clause
    end

    def ok?
      false
    end
    def failed?
      false
    end

    def to_s
      @clause
    end
  end

  class Success < Result
    def ok?
      true
    end
  end

  class Failure < Result
    def failed?
      true
    end
    def to_s
      "#{ super }, but is #{ object.inspect }"
    end
  end

end