require 'rails_helper'

describe Item, type: :feature do
  include SignInHelpers
  include NewItemHelpers

  before do
    sign_in_as(admin)
  end
  context 'it gets a descriptive error message' do
    it 'for no title' do
      create_item_with(title: nil)
save_and_open_page
      expect(page).to have_content("Title can't be blank")
    end

    it 'for no description' do
      create_item_with(description: nil)

      expect(page).to have_content("Description can't be blank")
    end

    it 'for no price' do
      create_item_with(price: nil)

      expect(page).to have_content("Price can't be blank")
    end

    it 'for an empty string in title' do
      create_item_with(title: "")

      expect(page).to have_content("Title can't be blank")
    end

    it 'for an empty string in description' do
      create_item_with(description: "")

      expect(page).to have_content("Title can't be blank")
    end

    it 'for a title that already exists' do
      Category.create(name: "test _category")
      item = { title: 'item#1', description: 'item#1 description', price: 1.00 }
      2.times { create_item_with(item) }

      expect(page).to have_content("Title has already been taken")
    end

    it 'for a non-numeric price' do
      create_item_with(price: 'price')
      expect(page).to have_content("Price is not a number")
    end

    it 'for a price of 0' do
      create_item_with(price: 0)
      expect(page).to have_content("Price must be greater than 0")
    end

    it 'for a price of less than 0' do
      create_item_with(price: -20.00)
      expect(page).to have_content("Price must be greater than 0")
    end

    # An item must belong to at least one category.
    xit 'for having no categories' do
      item = { title: 'item#1', description: 'item#1 description', price: 1.00 }
      create_item_with(item)
    end

    it 'has a stand-in photo' do
      item = { title: 'item#1', description: 'item#1 description', price: 1.00 }
      create_item_with(item)

      # add class or id after styled
      expect(page).to have_selector("img")
    end
  end
end
