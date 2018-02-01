require 'minitest/autorun'
require './lib/booleans/false'

module Booleans
  class FalseTest < Minitest::Test
    def test_if_false_executes_a_block
      t = False.new

      executed = false
      t.if_false { executed = true }

      assert executed
    end

    def test_if_true_does_not_execute_a_block
      t = False.new

      executed = false
      t.if_true { executed = true }

      refute executed
    end
  end
end



