require 'spec_helper'

feature 'entering and accessing tasks on to-do list' do
  before(:each) do
    visit('/')
    fill_in('username', :with => 'Imo')
    click_button('Save')
  end

  scenario 'adding tasks' do
    visit('/names')
    fill_in('taskTitle', :with => 'Travel')
    fill_in('taskDetail', :with => 'book flights to Italy')
    click_button('pin my task')

    expect(current_path).to eq('/tasks')
    expect(page).to have_content('Travel')
    expect(page).to have_content('book flights to Italy')
  end

  scenario 'user can filter task by title' do
    visit('/names')
    fill_in('taskTitle', :with => 'Travel')
    fill_in('taskDetail', :with => 'book flights to Italy')
    click_button('pin my task')

    visit '/tasks/Travel'
    expect(page.status_code).to eq(200)
    expect(page).to have_content('Travel')
    expect(page).to have_content('book flights to Italy')
  end
end
