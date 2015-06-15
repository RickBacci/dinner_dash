require 'rails_helper'

RSpec.describe User, type: :feature do
  scenario "user views index page" do
    Item.create(title: "Sample Item 1", description: "best item ever", price: 35)
    Item.create(title: "Sample Item 2", description: "best item ever", price: 35)
    Item.create(title: "Sample Item 3", description: "best item ever", price: 35)

    visit root_path

    expect(page).to have_content("Sample Item 1")
    expect(page).to have_content("Sample Item 2")
    expect(page).to have_content("Sample Item 3")
    expect(page).to have_content("Welcome to our site!")
  end
end
