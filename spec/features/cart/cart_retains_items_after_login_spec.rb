require 'rails_helper'

RSpec.describe Cart, type: :feature do
  scenario 'cart retains items after user logs in' do
    item = Item.new(title: 'banana', description: 'sweet', price: 1)
    item.categories.new(name: 'test').save
    item.save

    # item = Item.create(title: "banana", description: "sweet", price: 1)
    def any_instance
      allow_any_instance_of(ApplicationController)
    end
    
    user = User.create(name: 'Bam',
                       email_address: 'email@address.com',
                       username: 'bambam',
                       password: 'pass')
    any_instance.to receive(:current_user).and_return(user)
    # creates a current_user

    visit item_path(item.id)
    click_button 'Add To Cart'
    click_link 'Cart'

    expect(page).to have_content(item.title)
    # expect(page).to have_link("Login")
    expect(page).to_not have_link('Checkout')

    visit cart_path

    expect(page).to have_link('Logout', href: logout_path)
    expect(page).to_not have_link('Login')

    within('.site-wrap') do
      expect(page).to have_content(item.title)
      expect(page).to have_content('1')
    end
  end
end
