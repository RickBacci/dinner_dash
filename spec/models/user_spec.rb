require 'rails_helper'

describe User, type: :model do
  def valid_attributes
    {
      name: "Jeff Casimir",
      email_address: "demo+jeff@jumpstartlab.com",
      username: "j3",
      password: "password"
    }
  end

  def valid_no_display_name
    {
      name: "Rachel Warbelow",
      email_address: "demo+rachel@jumpstartlab.com",
      password: "password",
      username: nil
    }
  end

  it 'should be valid' do
    user = User.new(valid_attributes)

    expect(user).to be_valid
  end

  it 'should not be valid without a full name' do
    user = User.create(valid_attributes)
    user.name = nil

    expect(user).to_not be_valid
  end

  it 'name should not be valid with only spaces' do
    user = User.create(valid_attributes)
    user.name = "     "

    expect(user).to_not be_valid
  end

  it 'username should not be valid with less than 2 characters' do
    user = User.create(valid_attributes)
    user.username = "x"

    expect(user).to_not be_valid
  end

  it 'username should not be valid with more than 32 characters' do
    user = User.create(valid_attributes)
    user.username = "x" * 33

    expect(user).to_not be_valid
  end

  it 'can leave the username blank and their full name will be used' do
    user = User.create(name: "name",
                       email_address: "user@email.com",
                       username: nil,
                       password: "pass")

    expect(user).to_not be_valid
  end

  it 'should not be valid without an email address' do
    user = User.create(valid_attributes)
    user.email_address = nil

    expect(user).to_not be_valid
  end

  it 'should have a unique email address' do
    User.create(valid_attributes)
    User.last.update(username: "username2")
    User.create(valid_attributes)

    email_count = User.where(email_address: "demo+jeff@jumpstartlab.com").count

    expect(email_count).to eq(1)
  end
end
