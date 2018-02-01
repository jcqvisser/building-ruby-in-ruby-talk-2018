require 'minitest/autorun'
require_relative '../lib/number'

class NumberTest < Minitest::Test
  class ValueToProcess
    attr_reader :times_processed

    def initialize
      @times_processed = 0
    end

    def process
      @times_processed += 1
      self
    end
  end

  def test_call_applies_the_action_to_the_value_and_returns_the_result
    number = Number.new

    value = ValueToProcess.new
    action = ->(value_to_process){ value_to_process.process }

    assert_equal 1, number.call(value, &action).times_processed
  end

  def test_call_applies_the_action_to_the_value_twice_if_two_numbers_are_nested
    number = Number.new(Number.new)

    value = ValueToProcess.new
    action = ->(value_to_process){ value_to_process.process }

    assert_equal 2, number.call(value, &action).times_processed
  end

  def test_call_applies_the_action_to_the_value_n_times_if_n_numbers_are_nested
    n = 30

    value = ValueToProcess.new
    action = ->(value_to_process){ value_to_process.process }

    number = Zero.new
    n.times do
      number = Number.new(number)
    end

    assert_equal n, number.call(value, &action).times_processed
  end
end
