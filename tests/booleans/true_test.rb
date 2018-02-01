require 'minitest/autorun'
require './lib/booleans/true'

module Booleans
  class TrueTest < Minitest::Test
    def test_if_true_executes_a_block
      t = True.new

      executed = false
      t.if_true { executed = true }

      assert executed
    end

    def test_if_false_does_not_execute_a_block
      t = True.new

      executed = false
      t.if_false { executed = true }

      refute executed
    end

    def test_not_returns_a_false
      t = True.new
      f = t.not

      assert f.is_a?(False)
    end
  end
end

