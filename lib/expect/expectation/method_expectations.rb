class Expectation
  module MethodExpectations

    P_CHECK = proc do |r, meth, *args|
      r.instance_eval { send :"#{ meth }?", *args }
    end
    N_CHECK = proc do |r, meth, *args|
      !( r.instance_eval { send :"#{ meth }?", *args } )
    end

    def to(meth, *args)
      msg = "to #{ meth }#{ describe_array args }"
      eval ValueCollector, msg, meth, *args, &P_CHECK
    end
    def to_have(meth, *args)
      msg = "to have #{ meth }#{ describe_array args }"
      eval ValueCollector, msg, meth, *args, &P_CHECK
    end
    def not_to(meth, *args)
      msg = "not to #{ meth }#{ describe_array args }"
      eval ValueCollector, msg, meth, *args, &N_CHECK
    end
    def not_to_have(meth, *args)
      msg = "not to have #{ meth }#{ describe_array args }"
      eval ValueCollector, msg, meth, *args, &N_CHECK
    end

  end
  include MethodExpectations
end