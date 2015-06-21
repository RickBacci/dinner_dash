require 'rails_helper'

describe Item, type: :model do
  def valid_attributes
    {
      title: "Item#1",
      description: "Super cool item",
      price: 1.99,
      picture: nil
    }
  end

  it 'should be valid' do
    expect(Item.new(valid_attributes)).to be_valid
  end

  it 'must have a title' do
    item = Item.new(valid_attributes)
    item.title = nil

    expect(item).to_not be_valid
  end

  it 'cannot have an empty string for a title' do
    item = Item.new(valid_attributes)
    item.title = ""

    expect(item).to_not be_valid
  end

  it 'must have a unique title' do
    2.times { Item.create(valid_attributes) }

    items = Item.where(title: 'Item#1')
    expect(items.size).to eq(1)
  end

  it 'must have a description' do
    item = Item.new(valid_attributes)
    item.description = nil

    expect(item).to_not be_valid
  end

  it 'must have a price' do
    item = Item.new(valid_attributes)
    item.price = nil

    expect(item).to be_invalid
  end
  it 'price must be a valid decimal numeric value' do
    item = Item.new(valid_attributes)
    item.price = "not a decimal"

    expect(item).to be_invalid
  end

  it 'price must be greater than zero' do
    item = Item.new(valid_attributes)
    item.price = -1.00
    expect(item).to be_invalid
  end

  it 'must belong to at least one category' do
    item = Item.create(valid_attributes)
    item.categories.create(name: 'category1')

    expect(Item.first.categories).to_not be_empty
  end

  it 'can be created without a photo' do
    item = Item.create(valid_attributes)

    expect(item).to be_valid
  end
end
