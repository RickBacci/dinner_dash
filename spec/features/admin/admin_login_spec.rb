require 'rails_helper'

RSpec.describe User, type: :feature do
  it 'should be able to login as an admin' do
    admin = User.new(name: 'admin',
                     email_address: 'admin@site.com',
                     username: 'admin',
                     password: 'admin',
                     role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    expect(page).to have_content('Welcome Admin')
  end
end
