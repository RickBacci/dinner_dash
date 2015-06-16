require "rails_helper"

RSpec.describe Cart, type: :feature do
  scenario "Unauthenticated user adds item to cart" do
    visit items_path

    click_button "Add To Cart"

    expect(page).to have_content("Added #{item} to cart")
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