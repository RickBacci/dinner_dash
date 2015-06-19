require 'rails_helper'

describe "Admin", type: :feature do
  it 'can visit the dashboard' do
    admin = User.create(name: 'admin',
                        email_address: 'admin@site.com',
                        username: 'admin',
                        password: 'admin',
                        role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit root_path

    click_button "Admin Dashboard"

    expect(page).to have_content("Admin Dashboard")
  end

  it 'can add and item to the database' do
    admin = User.create(name: 'admin',
                        email_address: 'admin@site.com',
                        username: 'admin',
                        password: 'admin',
                        role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit root_path

    click_button "Admin Dashboard"

    fill_in "Title", with: "Totally Awesome"
    fill_in "Description", with: "Awesome Description"
    fill_in "Price", with: "100"

    attach_file "item_picture", "spec/asset_specs/photos/test.png"

    click_button "Create Item"

    expect(page).to have_selector("img")
  end

# An item must have a title, description, and price.
# An item must belong to at least one category.
# The title and description cannot be empty strings.
# The title must be unique for all items in the system.
# The price must be a valid decimal numeric value and greater than zero.
# The photo is optional. If not present, a stand-in photo is used.

end
