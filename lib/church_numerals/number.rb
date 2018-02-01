require_relative './zero'

module ChurchNumerals
  class Number
    def initialize(previous_number = Zero.new)
      @previous_number = previous_number
    end

    def call(value, &action)
      next_value = action.call(value)
      previous_number.call(next_value, &action)
    end

    def to_i
      call(0) { |value| value + 1 }
    end

    def inc
      Number.new(self)
    end

    def dec
      previous_number
    end

    def +(other)
      call(other) { |new_value|
        new_value.inc
      }
    end

    def -(other)
      other.call(self) { |new_value|
        new_value.dec
      }
    end

    def *(other)
      call(Zero.new) { |new_value|
        new_value + other
      }
    end

    def times(&block)
      call(nil) { block.call }
    end

    private
    attr_reader :previous_number
  end
end
