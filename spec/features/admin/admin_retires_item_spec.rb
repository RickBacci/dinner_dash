require 'rails_helper'

describe User, type: :feature do
  include SignInHelpers

  it 'should retire item' do
    item1 = {title: "Apricot", description: "it's orange", price: 2}
    sign_in_as(admin)

    category = Category.create(name: "test")
    category.items.create(item1)

    visit admin_categories_path
    click_link("test")

    expect(page).to have_content("Apricot")

    click_link "Retire"

    expect(page).to have_content("Apricot")
    click_link "Logout"

    visit categories_path

    click_link("test")

    expect(page).to_not have_content("Apricot")
  end
end
