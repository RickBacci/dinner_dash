require 'rails_helper'

describe "Admin", type: :feature do
  include SignInHelpers

  it 'can visit the dashboard' do
    sign_in_as(admin)

    visit root_path

    click_button "Admin Dashboard"

    expect(page).to have_content("Admin Dashboard")
  end

  xit 'can add and item to the database' do
    sign_in_as(admin)

    visit root_path

    click_button "Admin Dashboard"

    fill_in "Title", with: "Totally Awesome"
    fill_in "Description", with: "Awesome Description"
    fill_in "Price", with: "100"

    attach_file "item_picture", "spec/asset_specs/photos/test.png"

    click_button "Create Item"

    expect(page).to have_selector("img")
  end
end
