require 'minitest/autorun'
require './lib/church_numerals/number'

module ChurchNumerals
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

    def test_to_i_on_a_non_nested_number_returns_1
      number = Number.new
      assert_equal 1, number.to_i
    end

    def test_to_i_on_a_n_times_nested_number_returns_n
      n = 30

      number = Zero.new
      n.times do
        number = Number.new(number)
      end

      assert_equal n, number.to_i
    end

    def test_inc_returns_the_incremented_number
      number = Number.new(Number.new)
      expected_value = 2

      assert_equal expected_value, number.to_i

      expected_value += 1
      incremented_number = number.inc

      assert_equal expected_value, incremented_number.to_i
    end
  end
end
