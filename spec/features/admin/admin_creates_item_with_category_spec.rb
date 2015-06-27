require 'rails_helper'

RSpec.describe 'As a logged in admin', type: :feature do
  include SignInHelpers

  it 'I can create a new item with a category' do
    Category.create(name: 'test')

    sign_in_as(admin)

    visit admin_dashboard_path

    click_link 'Create Item'

    fill_in 'Title', with: 'cherry'
    fill_in 'Description', with: 'are red and awesome'
    fill_in 'Price', with: 2

    check 'test'

    click_on 'Create Item'

    expect(page).to have_content('Item created!')
    expect(page).to have_content('cherry')

    visit categories_path

    expect(page).to have_content('test')
  end
end
