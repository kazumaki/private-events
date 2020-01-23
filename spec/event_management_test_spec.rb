require 'rails_helper'

RSpec.describe 'Event management', type: :feature do
  scenario 'User creating a valid event' do
    name = "Valid"
    User.create(name: name)
    log_in(name)
    create_event("Good party")
    expect(page).to have_content('Attendees:')
  end

  scenario 'User creating an ivalid event' do
    name = "Valid"
    User.create(name: name)
    log_in(name)
    create_event("")
    expect(page).to have_content('Description')
  end

  scenario 'User inviting someone valid to his party' do
    creator = User.create(name: "Creator")
    guest = User.create(name: "Guest")
    log_in(creator.name)
    create_event("Guest Party")
    click_link "Invite"
    fill_in 'Attendee', with: guest.id
    click_button 'Invite'
    expect(page).to have_content("Guest")
  end

  scenario 'User inviting someone invalid to his party' do
    creator = User.create(name: "Creator")
    guest = User.create(name: "")
    log_in(creator.name)
    create_event("Guest Party")
    click_link "Invite"
    fill_in 'Attendee', with: guest.id
    click_button 'Invite'
    expect(page).to have_content("Attendee")
  end

  def log_in(name)
    visit login_path
    fill_in 'Name', with: name
    click_button "Log-in"
  end

  def create_event(desc)
    click_link "Create new event"
    fill_in 'Description', with: desc
    click_button "Create Event"
  end
end