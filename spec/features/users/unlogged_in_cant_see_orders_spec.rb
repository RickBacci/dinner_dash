require "rails_helper"

RSpec.describe User, type: :feature do
  scenario "user can't see their orders" do
    visit root_path
    expect(page).to_not have_content("Orders")
  end
end

