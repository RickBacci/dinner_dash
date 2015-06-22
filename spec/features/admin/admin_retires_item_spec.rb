require 'rails_helper'

describe User, type: :feature do
  include SignInHelpers

  it 'should retire item' do
    item = Item.create(title: "Banana", description: "it's ripe", price: 3)

    sign_in_as(admin)

    visit items_path

    expect(page).to have_content("Banana")

    click_link "Retire"
    click_link "Logout"

    visit items_path

    expect(page).to_not have_content("Banana")
  end
end
