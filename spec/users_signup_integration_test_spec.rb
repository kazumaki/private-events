require 'rails_helper'

RSpec.describe 'User Signup', type: :feature do
  scenario 'With valid name' do
    visit new_user_path
    fill_in 'Name', with: 'Valid Name'
    click_button 'Create'
    expect(page).to have_content('Created events')
  end

  scenario 'With ivalid name' do
    visit new_user_path
    fill_in 'Name', with: ''
    click_button 'Create'
    expect(page).to have_content('Name')
  end
end
