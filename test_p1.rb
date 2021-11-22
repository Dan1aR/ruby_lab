# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'lib_p1'

# Here goes some tests
class TestRobot < Minitest::Test
  def read_values(filename_r)
    values = []
    File.readlines(filename_r).each do |element|
      element.split.each do |sub_el|
        values << sub_el if (sub_el.count('a') + sub_el.count('а')).positive?
      end
    end
    values
  end

  def test_if_a_condition
    filename_r = 'file'
    filename_w = 'file_w'

    values = read_values(filename_r)
    file_process(filename_r, filename_w)

    values_ans = []
    File.readlines(filename_w).each { |line| values_ans << line.chomp }

    assert_equal(values, values_ans)
  end
end
