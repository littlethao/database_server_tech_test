require 'spec_helper'

feature 'entering and accessing tasks on to-do list' do
  before(:each) do
    visit('/')
    fill_in('username', :with => 'Imo')
    click_button('Save')
  end

  scenario 'adding tasks' do
    visit('/names')
    fill_in('taskTitle', :with => 'Santa Claus Season')
    fill_in('taskDetail', :with => 'send out Christmas cards')
    click_button('pin my task')

    expect(current_path).to eq('/tasks')
    expect(page).to have_content('Santa Claus Season')
    expect(page).to have_content('send out Christmas cards')
  end
end
