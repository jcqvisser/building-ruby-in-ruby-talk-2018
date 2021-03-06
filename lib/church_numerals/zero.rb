require_relative './number'

module ChurchNumerals
  class Zero
    def call(value, &action)
      value
    end

    def to_i
      0
    end

    def inc
      Number.new
    end

    def dec
      self
    end

    def +(other)
      other
    end

    def -(other)
      self
    end

    def *(other)
      self
    end

    def times
    end
  end
end
