require "rails_helper"

RSpec.describe Cart, type: :feature do
  scenario "user flash message when adding item to cart" do
    item1 = Item.create(title: "milk shake", description: "milky", price: 2)

    visit items_path
    
    click_button "Add To Cart"

    expect(current_path).to eq(items_path)
  
    expect(page).to have_content("Added #{item1.title} to cart")
  end

  xscenario "Unauthenticated tries to checkout" do
    visit items_path

    click_button "Add To Cart"
    click_button "Add To Cart"
    click_button "Add To Cart"
    click_button "Checkout"

    expect(current_path).to eq(login_path)
  end
end