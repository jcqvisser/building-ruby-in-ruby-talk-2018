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

    def test_dec_returns_one_number_lower
      number = Number.new(Number.new)
      expected_value = 2

      assert_equal expected_value, number.to_i

      expected_value -= 1
      decremented_number = number.dec

      assert_equal expected_value, decremented_number.to_i
    end

    def test_plus_with_another_number_adds_two_numbers
      two = Number.new(Number.new)
      three = Number.new(Number.new(Number.new))

      five = two + three

      assert_equal 5, five.to_i
    end

    def test_plus_with_zero_returns_the_same_number
      zero = Zero.new
      two = Number.new(Number.new)

      another_two = two + zero
      assert_equal two.to_i, another_two.to_i
    end

    def test_minus_with_a_smaller_number_returns_the_difference
      two = Number.new(Number.new)
      three = Number.new(Number.new(Number.new()))

      assert three.to_i > two.to_i

      one = three - two
      assert_equal 1, one.to_i
    end

    def test_minus_with_a_larger_number_returns_zero
      two = Number.new(Number.new)
      three = Number.new(Number.new(Number.new))

      assert three.to_i > two.to_i

      zero = two - three
      assert_equal 0, zero.to_i
    end

    def test_multiply_two_non_zero_numbers_returns_the_multiple
      two = Number.new(Number.new)
      three = Number.new(Number.new(Number.new))

      assert two.to_i > 0
      assert three.to_i > 0

      assert_equal two.to_i * three.to_i, (two * three).to_i
    end

    def test_multiply_a_non_zero_number_with_zero_returns_zero
      two = Number.new(Number.new)
      zero = Zero.new

      assert two.to_i > 0
      assert_equal zero.to_i, 0

      assert_equal 0, (two * zero).to_i
    end

    def test_times_repeats_a_block_n_times
      n = 30

      number = Zero.new
      n.times do
        number = Number.new(number)
      end

      repititions = 0
      number.times do
        repititions += 1
      end

      assert_equal n, repititions
    end
  end
end
