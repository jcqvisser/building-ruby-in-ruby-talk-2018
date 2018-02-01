require_relative './true'

module Booleans
  class False
    def if_true(&block)
      self
    end

    def if_false(&block)
      block.call
      self
    end

    def not
      True.new
    end
  end
end

