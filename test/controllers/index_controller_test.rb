# frozen_string_literal: true

require 'test_helper'

class IndexControllerTest < ActionDispatch::IntegrationTest
  test 'should get input' do
    get root_url
    assert_response :success
  end
end
