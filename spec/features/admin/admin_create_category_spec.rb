require 'rails_helper'

describe "As an admin", type: :feature do
  include SignInHelpers

  context "Create a new category" do
    before do
      sign_in_as(admin)
    end

    xit 'I can enter a name' do
      visit new_admin_category_path

      fill_in "Name", with: "category"

      attach_file "category_picture", "spec/asset_specs/photos/test.png"

      click_on "Create Category"

      expect(page).to have_selector("img")
    end
  end

end
