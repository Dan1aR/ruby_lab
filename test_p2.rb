# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'lib_p2'

# Here goes some tests
class TestRobot < Minitest::Test
  def test_classes
    sick = HospitalSick.new('Name', 31, 2020)
    assert_equal('Name 31 2020', sick.info)
    assert_equal('Object', HospitalSick.superclass.superclass.name)
    assert_equal('Sick', HospitalSick.superclass.name)
  end
end
