# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'funcmodule'

# Testing class for Lab6
class TestRobot < Minitest::Test
  def test_circle_area
    area = ->(r) { Math::PI * (r**2) }
    (1..100).step(0.2).each do |x|
      assert_in_delta(area.call(x), circle_area(x, 10**-3), 10**-3)
      assert_in_delta(area.call(x), circle_area_advanced(x, 10**-3), 10**-3)
      assert_in_delta(area.call(x), circle_area(x, 10**-4), 10**-4)
      assert_in_delta(area.call(x), circle_area_advanced(x, 10**-4), 10**-4)
    end
  end

  def test_f_x_g_x
    f_x = ->(x) { Math.sin(x) / x }
    g_x = ->(x) { Math.tan(x + 1) / (x + 1) }
    assert_in_delta(798.9039723309172, maxim(f_x, g_x), 10**-6)
    assert_in_delta(798.9039723309172, maxim_block { |x| Math.sin(x) / x - Math.tan(x + 1) / (x + 1) }, 10**-6)
  end
end
