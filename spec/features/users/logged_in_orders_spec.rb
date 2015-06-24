require "rails_helper"

RSpec.describe User, type: :feature do
  scenario "user can see their orders" do
    User.create(name: "Jeff Casimir",
                email_address: "demo+jeff@jumpstartlab.com",
                username: "j3",
                password: "password")

    visit login_path
    fill_in "Username", with: "j3"
    fill_in "Password", with: "password"
    click_button "Login"

    jeff = User.find_by(username: "j3")
    jeff.orders.create(order_date: "2015-06-21 19:54:36",
                       status: "paid",
                       created_at: "2015-06-21 19:54:36",
                       updated_at: "2015-06-21 19:54:36")

    visit user_orders_path(jeff)
    expect(page).to have_content("paid")
  end
end

