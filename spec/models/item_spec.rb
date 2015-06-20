require 'rails_helper'

describe Item, type: :model do
  it 'must have a title'
  it 'cannot have an empty string for a title'
  it 'must have a unique title'

  it 'must have a description'
  it 'cannot have an empty string for a title'

  it 'must have a price'
  it 'must be a valid decimal numeric value'
  it 'must be greater than zero'

  it 'must belong to at least one category'

  it 'can be created without a photo'
end

#   An item must have a title, description, and price.
#
#   An item must belong to at least one category.
#   The title and description cannot be empty strings.
#
#   The title must be unique for all items in the system.
#
#   The price must be a valid decimal numeric value and greater than zero.
#
#   The photo is optional. If not present, a stand-in photo is used.
#
#
