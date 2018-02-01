module Booleans
  class True
    def if_true(&block)
      block.call
      self
    end

    def if_false
      self
    end
  end
end
