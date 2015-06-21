require 'rails_helper'

PAGE_DOES_NOT_EXIST = "The page you were looking for doesn't exist"

describe User, type: :feature do
  include SignInHelpers

  scenario "user views index page" do
    category = Category.create(name: "cheap smoothies")

    category.items.create(title: "Sample Item 1",
                          description: "best item ever",
                          price: 35)
    category.items.create(title: "Sample Item 2",
                          description: "best item ever",
                          price: 35)
    category.items.create(title: "Sample Item 3",
                          description: "best item ever",
                          price: 35)

    visit category_items_path(category.id)

    expect(page).to have_content("Sample Item 1")
    expect(page).to have_content("Sample Item 2")
    expect(page).to have_content("Sample Item 3")
  end

  scenario "user views categories page" do
    Category.create(name: "category 1")
    Category.create(name: "category 2")
    Category.create(name: "category 3")
    visit categories_path

    expect(page).to have_content("category 1")
    expect(page).to have_content("category 2")
    expect(page).to have_content("category 3")
  end

  scenario "that tries to visit the admin dashboard gets a 404" do
    visit admin_dashboard_path

    expect(page).to have_content(PAGE_DOES_NOT_EXIST)
  end

  scenario "that tries to visit a users show page gets a 404" do
    visit user_path(1)

    expect(page).to have_content(PAGE_DOES_NOT_EXIST)
  end

  scenario "that tries to visit a non-existent user show page gets a 404" do
    sign_in_as(jeff)
    user = User.all.first
    visit user_path(user.id + 1)

    expect(page).to have_content(PAGE_DOES_NOT_EXIST)
    expect(page).to_not have_content("Couldn't find User")
  end
end
