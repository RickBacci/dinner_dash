require 'rails_helper'

describe "Admin", type: :feature do
  include SignInHelpers

  it 'retire item' do
    item1 = {title: "Apricot", description: "it's orange", price: 2}
    sign_in_as(admin)

    category = Category.create(name: "test")
    category.items.create(item1)

    visit admin_items_path

    expect(page).to have_content("Apricot")
    click_link "Retire"
    expect(page).to have_content("Item retired!")

    visit items_path
    expect(page).to_not have_content("Apricot")
  end

end
