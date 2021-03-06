require 'spec_helper'
require 'capybara/rspec'
require_relative '../app'

Capybara.app = App

feature 'manage items' do

  scenario 'adding to items list' do

    visit('/')
    expect(page).to have_title "Our Awesome Index Page"
    expect(page).to_not have_content "soup"
    click_on("Add New Item")
    expect(page).to have_title "Add Awesome Item"

    fill_in 'new_item', with: 'soup'
    click_on('Submit')
    expect(page).to have_content "soup"

    click_on("Add New Item")
    fill_in 'new_item', with: 'chicken dumplings'
    click_on('Submit')

    click_on("Add New Item")
    fill_in 'new_item', with: 'calamari'
    click_on('Submit')

    click_on("soup")
    our_field = find_field('edit_item').value
    expect(our_field).to eq "soup"
    fill_in 'edit_item', with: 'chicken soup'
    click_on('Edit')
    expect(page).to have_content "chicken soup"

    click_on('calamari')
    click_on('Delete')
    expect(page).to_not have_content "calamari"

  end

end