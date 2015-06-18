require 'rails_helper'

describe "Admin", type: :feature do
  it 'can visit the dashboard' do
    admin = User.create(name: 'admin',
                        email_address: 'admin@site.com',
                        username: 'admin',
                        password: 'admin',
                        role: 1)

    allow_any_instance_of(ApplicationController).to 
      receive(:current_user).and_return(admin)

    visit root_path

    click_button "Admin Dashboard"

    expect(page).to have_content("Admin Dashboard")
  end
end
