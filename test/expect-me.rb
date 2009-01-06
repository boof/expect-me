require "#{ File.dirname __FILE__ }/../lib/expect/me.rb"

class Expectation
  class Collector
    puts Expect("all varying checks of 'Expect number of expectations to_be 1'") {

      Expect("number of expectations") { |e|
        e.using("ValueCollector") {
            obj = ValueCollector.new(self, proc {}).map { |*args| }.size }
        e.using("ExceptionCollector") {
            obj = ExceptionCollector.new(self, proc {}).map { |*args| }.size }
      }.to_be 1

    }.to :pass
  end

end

module Kernel

  puts Expect("'Expect raise RuntimeError to_raise RuntimeError'") {

    Expect("raise RuntimeError") { raise RuntimeError }.to_raise

  }.to :pass

  puts Expect("'Expect raise RuntimeError not_to_raise RuntimeError'") {

    Expect('raise RuntimeError') { raise RuntimeError }.not_to_raise

  }.not_to :pass

  puts Expect("'Expect raise RuntimeError to_raise RuntimeError'") {

    Expect("raise RuntimeError") { raise RuntimeError }.to_raise

  }.not_to_raise

  puts Expect("'Expect raise RuntimeError to_be 1'") {

    Expect("raise RuntimeError") { raise RuntimeError }.to_be 1

  }.to_raise

end

nil.instance_eval do

  puts Expect("'Expect nil to_be nil'") {

    Expect { self }.to_be nil

  }.to :pass

  puts Expect("'Expect nil not_to_be'") {

    Expect { self }.not_to_be

  }.not_to :fail

end

Object.new.instance_eval do

  puts Expect("'Expect instance of Object to_be'") {

    Expect("instance of Object") { self }.to_be

  }.to :pass

end

true.instance_eval do

  puts Expect("'Expect true to_be'") {

    Expect { self }.to_be

  }.to :pass

  puts Expect("'Expect true not_to_be'") {

    Expect { self }.not_to_be

  }.not_to :pass

end

false.instance_eval do

  puts Expect("'Expect false to_be'") {

    Expect { self }.to_be

  }.not_to :pass

  puts Expect("'Expect false not_to_be'") {

    Expect { self }.not_to_be

  }.to :pass

end

%w[foo bar baz].instance_eval do

  puts Expect("'Expect #{ inspect } to include 'foo''") {

    Expect { self }.to :include, 'foo'

  }.to :pass

  puts Expect("'Expect #{ inspect } to include 'bart''") {

    Expect { self }.to :include, 'bart'

  }.to :fail
  
  puts Expect(inspect) { self }.to_be %w[foo bar baz]

end
