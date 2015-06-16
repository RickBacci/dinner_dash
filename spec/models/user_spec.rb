require 'rails_helper'

RSpec.describe User, type: :model do
  def valid_attributes
    { name: "name",
      email_address: "user@email.com",
      username: "username",
      password: "pass"
    }
  end

  it 'should be valid' do
    user = User.new(valid_attributes)

    expect(user).to be_valid
  end

  it 'should not be valid without a name' do
    user = User.create(valid_attributes)
    user.name = nil

    expect(user).to_not be_valid
  end

  it 'should not be valid without an email address' do
    user = User.create(valid_attributes)
    user.email_address = nil

    expect(user).to_not be_valid
  end

  it 'should not be valid without a username' do
    user = User.create(valid_attributes)
    user.username = nil

    expect(user).to_not be_valid
  end

  it 'should have a unique username' do
    2.times { User.create(valid_attributes) }

    username_count = User.where(username: "username").count

    expect(username_count).to eq(1)
  end

  it 'should have a unique email address' do
    User.create(valid_attributes)
    User.last.update(username: "username2")
    User.create(valid_attributes)

    email_count = User.where(email_address: "user@email.com").count

    expect(email_count).to eq(1)
  end
end
