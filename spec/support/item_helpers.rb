module ItemHelpers
  def create_item_with(attributes)
    # title = attributes[:title].nil? ? nil : attributes[:title]
    # description = attributes[:description].nil? ? nil : attributes[:description]
    # price = attributes[:price].nil? ? nil : attributes[:price]
    # category = attributes[:category].nil? ? nil : attributes[:category]
    title = attributes[:title]
    description = attributes[:description]
    price = attributes[:price]
    category = attributes[:category]

    visit new_admin_item_path
    fill_in "Title", with: title
    fill_in "Description", with: description
    fill_in "Price", with: price
    fill_in "Category items", with: category

    click_button "Create Item"
  end

  def edit_item_with(item_id, attributes)
    title = attributes[:title].nil? ? nil : attributes[:title]
    description = attributes[:description].nil? ? nil : attributes[:description]
    price = attributes[:price].nil? ? nil : attributes[:price]
    category = attributes[:category].nil? ? nil : attributes[:category]

    visit edit_admin_item_path(item_id)

    fill_in "Title", with: title
    fill_in "Description", with: description
    fill_in "Price", with: price
    fill_in "Category items", with: category

    click_button "Update Item"
  end
end

