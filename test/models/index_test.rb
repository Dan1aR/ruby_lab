# frozen_string_literal: true

require 'test_helper'
require 'rails_helper'

class IndexTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  let!(:arr1266) { Index.create array: '1 2 6 6', result: '[[6, 2],...]', error: false, longest_one: '[...]' }

  test 'should not create existing array' do
    expect(Index.create_from_arr('1 2 6 6').valid?).to be(false)
  end
end
