require "rails_helper"

RSpec.describe Cart, type: :feature do
  scenario "user flash message when adding item to cart" do
    item1 = Item.create(title: "milk shake", description: "milky", price: 2)

    visit item_path(item1.id)
    
    click_button "Add To Cart"

    expect(current_path).to eq(item_path(item1.id))
  
    expect(page).to have_content("You now have 1 #{item1.title}")
  end
end