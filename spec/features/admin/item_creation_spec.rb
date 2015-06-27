require 'rails_helper'

RSpec.describe Item, type: :feature do
  include SignInHelpers
  include ItemHelpers

  before do
    sign_in_as(admin)
  end
  context 'it gets a descriptive error message' do
    it 'for no title' do
      create_item_with(title: '')
      expect(page).to have_content("Title can't be blank")
    end

    it 'for no description' do
      create_item_with(description: '')

      expect(page).to have_content("Description can't be blank")
    end

    it 'for no price' do
      create_item_with(price: nil)

      expect(page).to have_content("Price can't be blank")
    end

    it 'for an empty string in title' do
      create_item_with(title: '')

      expect(page).to have_content("Title can't be blank")
    end

    it 'for an empty string in description' do
      create_item_with(description: '')

      expect(page).to have_content("Description can't be blank")
    end

    it 'for a title that already exists' do
      category = Category.new(name: 'test')
      item1 = Item.new(title: 'item#1',
                       description: 'item#1 description',
                       price: 1.00)
      item1.categories << category
      item1.save

      item2 = Item.new(title: 'item#2',
                       description: 'item#2 description',
                       price: 1.00)
      item2.categories.new(name: 'original')
      item2.categories << category
      item2.save

      visit edit_admin_item_path(Item.all.first.id)
      fill_in 'Title', with: 'item#2'
      check 'test'

      click_button 'Update Item'

      expect(page).to have_content('Title has already been taken')
    end

    it 'for a non-numeric price' do
      create_item_with(price: 'price')
      expect(page).to have_content('Price is not a number')
    end

    it 'for a price of 0' do
      create_item_with(price: 0)
      expect(page).to have_content('Price must be greater than 0')
    end

    it 'for a price of less than 0' do
      create_item_with(price: -20.00)
      expect(page).to have_content('Price must be greater than 0')
    end

    # An item must belong to at least one category.
    it 'for having no categories' do
      visit admin_dashboard_path
      click_link 'Create Item'

      fill_in 'Title', with: 'item'
      fill_in 'Description', with: 'description'
      fill_in 'Price', with: 4.99

      click_button 'Create Item'

      expect(page).to have_content("Categories can't be blank")
    end

    it 'has a stand-in photo' do
      item = { title: 'item#1', description: 'item#1 description', price: 1.00 }
      create_item_with(item)

      # add class or id after styled
      expect(page).to have_selector('img')
    end
  end
end
