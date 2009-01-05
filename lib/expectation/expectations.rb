class Expectation
  module Expectations

    P_CHECK = proc do |value, *expected_values|
      expected_values.empty? && value || expected_values == [*value]
    end
    N_CHECK = proc do |value, *expected_values|
      !( expected_values.empty? && value || expected_values == [*value] )
    end

    def to_be(*expected_values)
      eval ValueCollector, "to be#{ describe_array expected_values }",
          *expected_values, &P_CHECK
    end
    def not_to_be(*expected_values)
      eval ValueCollector, "not to be#{ describe_array expected_values }",
          *expected_values, &N_CHECK
    end

  end
  include Expectations
end
