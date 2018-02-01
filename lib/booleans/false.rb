module Booleans
  class False
    def if_true(&block)
      self
    end

    def if_false(&block)
      block.call
      self
    end
  end
end

