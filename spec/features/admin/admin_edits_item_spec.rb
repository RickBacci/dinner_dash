require 'rails_helper'

describe "As an admin when I edit an item", type: :feature do
  include SignInHelpers
  include ItemHelpers

  before do
    sign_in_as(admin)
    item = { title: 'item#1',
             description: 'item#1 description',
             price: 1.00,
             category: 'test' }
    create_item_with(item)
  end

  context 'I get a descriptive error message' do
    it 'for an invalid title' do
      edit_item_with(title: nil)

      expect(page).to have_content("Title can't be blank")
    end

    it 'for an invalid description' do
      edit_item_with(description: nil)

      expect(page).to have_content("Description can't be blank")
    end

    it 'for an invalid price' do
      edit_item_with(price: nil)

      expect(page).to have_content("Price can't be blank")
    end

    it 'for and empty string as a title' do
      edit_item_with(title: "")

      expect(page).to have_content("Title can't be blank")
    end

    it 'for an empty string for the description' do
      edit_item_with(description: "")

      expect(page).to have_content("Description can't be blank")
    end

    it 'for not having a unique title' do
      item2 = { title: 'item#2',
                description: 'item#2 description',
                price: 1.00,
                category: 'test' }
      create_item_with(item2)

      edit_item_with(item2)
      expect(page).to have_content("Title has already been taken")
    end
    it 'for the price not being a valid decimal' do
      edit_item_with(price: 'price')
      expect(page).to have_content("Price is not a number")
    end

    it 'for the price being equal to zero' do

      edit_item_with(price: 0)
      expect(page).to have_content("Price must be greater than 0")
    end

    it 'for a price of less than 0' do

      edit_item_with(price: -20.00)
      expect(page).to have_content("Price must be greater than 0")
    end

    it 'for having no categories' do
      item = { title: 'item#1', description: 'item#1 description', price: 1.00, category: nil }
      edit_item_with(item)
      expect(page).to have_content("Category cannot be empty")
    end
  end
end

