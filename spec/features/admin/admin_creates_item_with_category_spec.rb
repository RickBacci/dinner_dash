require 'rails_helper'

describe User, type: :feature do
  include SignInHelpers

  it 'should be able to create new item with category as an admin' do
    Category.create(name: 'test')

    sign_in_as(admin)

    visit admin_dashboard_path

    click_link "Create Item"

    fill_in "Title", with: "cherry"
    fill_in "Description", with: "are red and awesome"
    fill_in "Price", with: 2

    check 'test'

    click_on "Create Item"

    expect(page).to have_content("Item created!")
    expect(page).to have_content("cherry")

    visit categories_path

    expect(page).to have_content("test")
  end
end
