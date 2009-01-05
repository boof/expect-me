tobe - micro (or even nano) Testing Framework
=============================================

Put the tests where they belong!

USAGE
-----

    require 'lib/tobe'

    class Object

      puts Expect(inspect) { self }.to :respond_to, :Expect

    end

    [1, 2].instance_eval do

      puts Expect("#{ inspect }'s number of elements") { |e|
        e.using(':size') { size }
        e.using(':length') { length }
      }.to_be 2

    end

TODO
----

* bm build\_results
* to\_be\_a
* to\_be Comparable
* in\_delta
* collector => formatter => outputter
