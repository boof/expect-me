class Expectation

  def initialize(receiver, generator, subject)
    @subject, @generator, @receiver = subject, generator, receiver
    @results = []
  end

  def to_s
    @results.map { |r| "#{r}" } * "\n"
  end

  def pass?
    @results.all? { |result| result.ok? }
  end
  def fail?
    @results.any? { |result| result.failed? }
  end

  protected
  def describe_array(array)
    array.empty?? '' : " with #{ array.map { |e| e.inspect }.join ', ' }"
  end

  def eval(collector, verb_and_object, *args, &expector)
    @collector = collector.new @receiver, @generator
    @expector, @args, @verb_and_object = expector, args, verb_and_object

    build_results

    self
  end
  def build_result(object, subordinate_clause)
    ( @expector[object, *@args] ? Success : Failure ).
    new object, "#{ @subject } #{ @verb_and_object }#{ subordinate_clause }"
  end
  def build_results
    @results = @collector.
        map { |obj, sub_clause| build_result obj, sub_clause }
  end

end
