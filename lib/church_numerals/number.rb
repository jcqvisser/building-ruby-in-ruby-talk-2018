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

    private
    attr_reader :previous_number
  end
end
