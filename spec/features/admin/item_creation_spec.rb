require 'rails_helper'

describe Item, type: :feature do
  include SignInHelpers

  it 'gets a descriptive error message for no title' do
    sign_in_as(admin)
    visit admin_dashboard_path
    click_link "Create item"
    click_button "Create item"
    expect(page).to have_content("Title can't be blank")

  end
end
# An item must have a title, description, and price.
# An item must belong to at least one category.
# The title and description cannot be empty strings.
# The title must be unique for all items in the system.
# The price must be a valid decimal numeric value and greater than zero.
# The photo is optional. If not present, a stand-in photo is used.
