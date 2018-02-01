require_relative './false'

module Booleans
  class True
    def if_true(&block)
      block.call
      self
    end

    def if_false(&block)
      self
    end

    def not
      False.new
    end
  end
end
