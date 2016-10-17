require 'spec_helper'

feature 'entering user' do
  scenario 'add username who owns to-do list' do
    visit('/')
    fill_in('username', :with => 'Imo')
    click_button('Save')

    expect(page).to have_content('Hello Imo')
  end
end
