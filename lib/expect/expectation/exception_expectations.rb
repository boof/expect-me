class Expectation
  module ExceptionExpectations

    P_CHECK = proc do |e, e_class, *e_message_ary|
      e.is_a? e_class and
      e_message_ary.empty? || e.message == e_message_ary.first
    end
    N_CHECK = proc do |e, e_class, *e_message_ary|
      !( e.is_a? e_class and
         e_message_ary.empty? || e.message == e_message_ary.first )
    end

    def to_raise(e_class = RuntimeError, *e_message_ary)
      msg = "to raise #{ e_class.name }#{ describe_array e_message_ary }"
      eval ExceptionCollector, msg, e_class, *e_message_ary, &P_CHECK
    end

    def not_to_raise(e_class = RuntimeError, *e_message_ary)
      msg = "not to raise #{ e_class.name }#{ describe_array e_message_ary }"
      eval ExceptionCollector, msg, e_class, *e_message_ary, &N_CHECK
    end

  end
  include ExceptionExpectations
end
