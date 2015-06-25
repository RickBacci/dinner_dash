module ItemHelpers
  def create_item_with(title: 'item',
                       description: 'description',
                       price: 3.00)
    Category.create(name: 'test')

    visit new_admin_item_path
    fill_in 'Title', with: title
    fill_in 'Description', with: description
    fill_in 'Price', with: price
    check 'test'
    click_button 'Create Item'
  end

  def edit_item_with(item_id, attributes)
    Category.create(name: 'test')
    item = Item.find(item_id)
    title = attributes[:title] || item.title
    description = attributes[:description] || item.description
    price = attributes[:price] || item.price
    category = attributes[:category] || 'test'

    visit edit_admin_item_path(item_id)

    fill_in 'Title', with: title
    fill_in 'Description', with: description
    fill_in 'Price', with: price
    check "#{category}"
    click_button 'Update Item'
  end
end

# title = attributes[:title].nil? ? nil : attributes[:title]
# description = attributes[:description].nil? ? nil : attributes[:description]
# price = attributes[:price].nil? ? nil : attributes[:price]
# category = attributes[:category].nil? ? nil : attributes[:category]
# title = attributes[:title].presence || 'item'
# description = attributes[:description].presence || 'item desc'
# price = attributes[:price].presence || 3.00
# category = attributes[:category].presence || 'test'
#

#     visit new_admin_item_path
#     fill_in "Title", with: title
#     fill_in "Description", with: description
#     fill_in "Price", with: price
#     #fill_in "Category items", with: category
# #    fill_in "Categories", with: category
#     check 'test'
#     click_button "Create Item"
#   end
