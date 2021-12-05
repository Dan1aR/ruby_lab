# frozen_string_literal: false

require 'minitest/autorun'
require_relative 'funcmodule'

# Lab5 Testing class
class TestRobot < Minitest::Test
  def test_calc_f
    assert_in_delta(-0.0021352323706365726, calc_f(10, 10), 0.000001)
  end

  def test_decrypt_str
    test_str = 'Привет это строка'
    assert_equal 'Рсйгёу юуп тусплб', decrypt_str(test_str)
  end
end
