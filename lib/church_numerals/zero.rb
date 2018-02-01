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
  end
end
