tobe - micro (or even nano) Testing Framework
=============================================

Put the tests where they belong!

USAGE
-----

    require 'lib/tobe'

    class Object

      puts Expect('itself', self) { |object_class| object_class }.to :respond_to, :Expect

    end

    [1, 2].instance_eval do

      puts Expect('number of elements', self) { |array|
        using(':size') { array.size }
        using(':length') { array.size }
      }.to_be 2

    end

TODO
----

* bm build_results
* to_be\_a
* to_be Comparable
* in_delta
* collector => formatter => outputter
