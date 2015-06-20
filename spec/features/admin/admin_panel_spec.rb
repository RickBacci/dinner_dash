require 'rails_helper'

def instance_of_app_controller
  allow_any_instance_of(ApplicationController)
end

describe "Admin", type: :feature do
  it 'can visit the dashboard' do
    admin = User.create(name: 'admin',
                        email_address: 'admin@site.com',
                        username: 'admin',
                        password: 'admin',
                        role: 1)

    instance_of_app_controller.to receive(:current_user).and_return(admin)

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

    instance_of_app_controller.to receive(:current_user).and_return(admin)

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
