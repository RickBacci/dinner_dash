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
      new_item = Item.all.first
      edit_item_with(new_item.id, title: nil)

      expect(page).to have_content("Title can't be blank")
    end

    it 'for an invalid description' do
      new_item = Item.all.first
      edit_item_with(new_item.id, description: nil)

      expect(page).to have_content("Description can't be blank")
    end

    it 'for an invalid price' do
      new_item = Item.all.first
      edit_item_with(new_item.id, price: nil)

      expect(page).to have_content("Price can't be blank")
    end

    it 'for and empty string as a title' do
      new_item = Item.all.first
      edit_item_with(new_item.id, title: "")

      expect(page).to have_content("Title can't be blank")
    end

    it 'for an empty string for the description' do
      new_item = Item.all.first
      edit_item_with(new_item.id, description: "")

      expect(page).to have_content("Description can't be blank")
    end

    it 'for not having a unique title' do
      item2 = { title: 'item#2',
                description: 'item#2 description',
                price: 1.00,
                category: 'test' }
      create_item_with(item2)

      new_item = Item.all.first
      edit_item_with(new_item.id, item2)

      expect(page).to have_content("Title has already been taken")
    end

    it 'for the price not being a valid decimal' do
      new_item = Item.all.first
      edit_item_with(new_item.id, price: 'price')
      expect(page).to have_content("Price is not a number")
    end

    it 'for the price being equal to zero' do
      new_item = Item.all.first
      edit_item_with(new_item.id, price: 0)
      expect(page).to have_content("Price must be greater than 0")
    end

    it 'for a price of less than 0' do
      new_item = Item.all.first
      edit_item_with(new_item.id, price: -20.00)

      expect(page).to have_content("Price must be greater than 0")
    end
  end
end

