Expect /me - where tests belong!
================================

"Expect /me" is a very small testing framework that works directly in the context of your Objects that you want to test. It will enforce you to do make single behaviour expectations while you can specify multiple ways that reflect that behaviour. 

SYNOPSIS
--------

    require 'expect/me'

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
* RakeTask
* Gemify