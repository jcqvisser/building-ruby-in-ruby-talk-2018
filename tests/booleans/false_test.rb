require 'minitest/autorun'
require './lib/booleans/false'

module Booleans
  class FalseTest < Minitest::Test
    def test_if_false_executes_a_block
      f = False.new

      executed = false
      f.if_false { executed = true }

      assert executed
    end

    def test_if_true_does_not_execute_a_block
      f = False.new

      executed = false
      f.if_true { executed = true }

      refute executed
    end

    def test_not_returns_a_false
      f = False.new
      t = f.not

      assert t.is_a?(True)
    end
  end
end



