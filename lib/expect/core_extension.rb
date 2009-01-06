module Kernel
  def Expect(message = '', &test)
    Expectation.new self, test, "Expect #{ message || self.inspect }"
  end
end
