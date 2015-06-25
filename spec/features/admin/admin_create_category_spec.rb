require 'rails_helper'

describe "As an admin", type: :feature do
  include SignInHelpers

  context "Create a new category" do
    before do
      sign_in_as(admin)
    end

    it 'I can enter a name' do
      visit admin_categories_path

      click_button "Create Category"
      save_and_open_page
      fill_in "Name", with: "test category"

      attach_file "category_picture", "spec/asset_specs/photos/test.png"

      click_on "Create Category"

      expect(page).to have_selector("img")
    end
  end

end
