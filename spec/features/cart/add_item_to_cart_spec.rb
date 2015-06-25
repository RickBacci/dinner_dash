require "rails_helper"

RSpec.describe Cart, type: :feature do
  scenario "unlogged in user tries to checkout" do
    item1 = Item.new(title: "yams!", description: "yammy", price: 2)
    item1.categories.new(name: 'test').save
    item1.save

    item2 = Item.create(title: "clams!", description: "clammy", price: 8)
    item2.categories.new(name: 'test').save
    item2.save

    visit item_path(item1.id)
    click_button "Add To Cart"

    visit item_path(item2.id)
    click_button "Add To Cart"

    click_link "Cart"

    expect(page).to have_content(item1.title)
    expect(page).to have_content(item2.title)
    expect(page).to have_content(2)
    expect(page).to have_content(2)
    expect(page).to have_content(10)
    click_button "Checkout"
    expect(current_path).to eq('/login')
  end
end
