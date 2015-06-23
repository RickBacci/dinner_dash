module NewItemHelpers
  def create_item_with(attributes)
   title = attributes[:title].nil? ? nil : attributes[:title]
   description = attributes[:description].nil? ? nil : attributes[:description]
   price = attributes[:price].nil? ? nil : attributes[:price]

    visit new_item_path

    fill_in "Title", with: title
    fill_in "Description", with: description
    fill_in "Price", with: price

    click_button "Create Item"
  end
end

