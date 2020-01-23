require 'rails_helper'

RSpec.describe 'User Logout', type: :feature do
  scenario 'Users logging out' do
    name = "Valid"
    visit login_path
    User.create(name: name)
    fill_in 'Name', with: name
    click_button "Log-in"
    click_link "Logout"
    expect(page).to have_content('Login')
  end
end