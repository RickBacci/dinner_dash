require 'rails_helper'

RSpec.describe 'Admin', type: :feature do
  include SignInHelpers

  it 'retire item' do
    item1 = Item.new(title: 'Apricot', description: "it's orange", price: 2)
    item1.categories.new(name: 'test')
    item1.save

    sign_in_as(admin)

    visit admin_items_path

    expect(page).to have_content('Apricot')
    click_link 'Retire'
    expect(page).to have_content('Item retired!')

    visit items_path
    expect(page).to_not have_content('Apricot')
  end
end
