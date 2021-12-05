# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'funcmodule'

# Testing class for Lab6
class TestRobot < Minitest::Test
  def test_circle_area3
    area = ->(r) { Math::PI * (r**2) }
    (1..100).step(0.2).each do |x|
      assert_in_delta(area.call(x), circle_area(x, 10**-3), 10**-3)
    end
  end

  def test_circle_area3_adv
    area = ->(r) { Math::PI * (r**2) }
    (1..100).step(0.2).each do |x|
      assert_in_delta(area.call(x), circle_area_advanced(x, 10**-3), 10**-3)
    end
  end

  def test_circle_area4
    area = ->(r) { Math::PI * (r**2) }
    (1..100).step(0.2).each do |x|
      assert_in_delta(area.call(x), circle_area(x, 10**-4), 10**-4)
    end
  end

  def test_circle_area4_adv
    area = ->(r) { Math::PI * (r**2) }
    (1..100).step(0.2).each do |x|
      assert_in_delta(area.call(x), circle_area_advanced(x, 10**-4), 10**-4)
    end
  end

  def test_proc
    mxl = maximb(&proc {
      max_dist = 0.0
      (0.5..1).step(0.01).each do |x|
        max_dist = [max_dist, (Math.sin(x) / x - Math.tan(x + 1) / (x + 1)).abs].max
      end
      max_dist
    })

    assert_in_delta(798.9039723309172, mxl, 10**-6)
  end

  def test_bloc
    mxb = maximb do
      max_dist = 0.0
      (0.5..1).step(0.01).each do |x|
        max_dist = [max_dist, (Math.sin(x) / x - Math.tan(x + 1) / (x + 1)).abs].max
      end
      max_dist
    end
    assert_in_delta(798.9039723309172, mxb, 10**-6)
  end
end
