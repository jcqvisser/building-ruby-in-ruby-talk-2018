require 'minitest/autorun'
require './lib/church_numerals/zero'

module ChurchNumerals
  class ZeroTest < Minitest::Test
    def test_call_returns_the_value_without_processing_it
      zero = Zero.new

      value = "some value"
      expected_new_value = value.dup

      actual_new_value = zero.call(value) { |value_to_process|
        "this value has been processed: #{value_to_process}"
      }

      assert_equal expected_new_value, actual_new_value
    end

    def test_to_i_returns_0
      zero = Zero.new
      assert_equal 0, zero.to_i
    end
  end
end
