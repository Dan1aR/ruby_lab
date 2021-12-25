# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'
require 'session_helper'

RSpec.describe SessionController, type: :feature do
  include ActionView::Helpers
  include SessionHelper

  let!(:user_test) { User.new(username: 'user_test', password: '123_test_password').save }

  scenario 'did not login yet' do
    visit root_path
    expect(page).to have_content('Login')
  end

  scenario 'trying to login' do
    visit root_path
    expect(page).to have_content('Login')
    click_on 'Login'
    fill_in 'login', with: 'user_test'
    fill_in 'password', with: '123_test_password'
    click_on 'Submit'
    expect(page).to have_content('Logout')
  end

  scenario 'trying to login with incorrect credentials' do
    visit root_path
    expect(page).to have_content('Login')
    click_on 'Login'
    fill_in 'login', with: 'user_test'
    fill_in 'password', with: '123_tasdfest_password'
    click_on 'Submit'
    expect(page).to have_content('Submit')
  end

  scenario 'trying to open post without login' do
    Post.create title: 'Post2', text: 'Text2', user_id: 'not_user_test'
    visit root_path
    expect(page).to have_content('Login')
    click_on 'Open'
    expect(page).to have_content('Submit')
  end

  scenario 'login and create post' do
    visit root_path
    expect(page).to have_content('Login')
    click_on 'Login'
    fill_in 'login', with: 'user_test'
    fill_in 'password', with: '123_test_password'
    click_on 'Submit'
    expect(page).to have_content('Logout')
    click_on '+'
    fill_in 'post[title]', with: 'Title'
    fill_in 'post[text]', with: 'Text'
    click_on 'Create Post'
    expect(page).to have_content('Title')
    expect(page).to have_content('Text')
  end

  scenario 'login and edit post' do
    Post.create title: 'Post2', text: 'Text2', user_id: 'user_test'
    visit root_path
    expect(page).to have_content('Login')
    click_on 'Login'
    fill_in 'login', with: 'user_test'
    fill_in 'password', with: '123_test_password'
    click_on 'Submit'
    expect(page).to have_content('Logout')

    click_on 'Open'
    click_on 'Edit'
    fill_in 'post[title]', with: 'Title_new'
    fill_in 'post[text]', with: 'Text_new'
    click_on 'Save Result'
    expect(page).to have_content('Title_new')
    expect(page).to have_content('Text_new')
  end

  scenario 'trying to edit not yours post' do
    Post.create title: 'Post2', text: 'Text2', user_id: 'not_user_test'
    visit root_path
    expect(page).to have_content('Login')
    click_on 'Login'
    fill_in 'login', with: 'user_test'
    fill_in 'password', with: '123_test_password'
    click_on 'Submit'

    click_on 'Open'

    expect(page).to have_no_content('Edit')
  end

  scenario 'deleting post' do
    Post.create title: 'Post2', text: 'Text2', user_id: 'user_test'
    visit root_path
    expect(page).to have_content('Login')
    click_on 'Login'
    fill_in 'login', with: 'user_test'
    fill_in 'password', with: '123_test_password'
    click_on 'Submit'

    click_on 'Open'
    click_on 'Edit'
    click_on 'Delete Post'

    expect(page).to have_no_content('Text2')
  end
end
