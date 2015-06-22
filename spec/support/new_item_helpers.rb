module NewItemHelpers
  def create_item_with(attributes)
   title = attributes[:title].nil? ? nil : attributes[:title] || 'item#1'
   description = attributes[:description].nil? ? nil : attributes[:description] || 'item#1 description'
   price = attributes[:price].nil? ? nil : attributes[:price] || 1.00

    visit new_item_path

    fill_in "Title", with: title
    fill_in "Description", with: description
    fill_in "Price", with: price

    click_button "Create Item"
  end
end

