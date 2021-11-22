# frozen_string_literal: true

require 'minitest/autorun'
require './funcmodule'

def actual_f(x_param, y_param)
  ((x_param - 1).abs**0.5 - y_param.abs**0.5) / (1 + x_param**2 / 2 + y_param**2 / 4)
end

def actual_decrypt(str)
  str.force_encoding('UTF-8')

  abc = 'абвгдеёжзийклмнопрстуфхцчшщъыьэюя'.split('')
  str.length.times do |i|
    c = str[i].eql?(' ') ? ' ' : abc[(abc.index(str[i].downcase) + 1) % 33]
    str[i] = /[[:upper:]]/.match(str[i]) ? c.upcase : c
  end
  str
end

# Lab5 Testing class
class TestRobot < Minitest::Test
  def test_calc_f
    100.times do |x|
      100.times do |y|
        assert_equal actual_f(x, y), calc_f(x, y)
      end
    end
  end

  def test_decrypt_str
    abc = 'абвгдеёжзийклмнопрстуфхцчшщъыьэюя '.split('')
    test_str = []
    [0..rand(5..10)].each do
      test_str.push(abc[rand(0..abc.length - 1)])
    end
    assert_equal actual_decrypt(test_str.join), decrypt_str(test_str.join)
  end
end
