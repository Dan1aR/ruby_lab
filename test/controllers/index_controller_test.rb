# frozen_string_literal: true

require 'rails_helper'
require 'test_helper'

class IndexControllerTest < ActionDispatch::IntegrationTest
  test 'should get input' do
    get root_url
    assert_response :success
  end

  test 'should get output with error messege (No params)' do
    get index_output_url
    assert_response :success
    assert_nil assigns[:result]
    assert_equal 'Некорректный ввод', assigns[:error]
  end

  test 'should get output with error messege (Incorrect input)' do
    get index_output_url, params: { a: 'a s d f 12' }
    assert_response :success
    assert_nil assigns[:result]
    assert_equal 'Некорректный ввод', assigns[:error]
  end

  test 'should return correct answer' do
    get index_output_url, params: { a: '1 2 6 6' }
    assert_response :success
    assert_equal [[[6], [2]], [[6, 6], [2, 3]], [[6], [3]]], assigns[:result]
    assert_equal [[6, 6], [2, 3]], assigns[:longest_one]
    assert_nil assigns[:error]
  end

end
