require 'rails_helper'

RSpec.describe 'User login', type: :feature do
  scenario 'With valid login data' do
    name = 'Valid'
    visit login_path
    User.create(name: name)
    fill_in 'Name', with: name
    click_button 'Log-in'
    expect(page).to have_content('Created events')
  end

  scenario 'With invalid login data' do
    visit login_path
    fill_in 'Name', with: ''
    click_button 'Log-in'
    expect(page).to have_content('Login')
  end
end
