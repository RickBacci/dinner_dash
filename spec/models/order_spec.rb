require 'rails_helper'

describe Order, type: :model do
  include SignInHelpers

  it 'must belong to a user' do
    expect(jeff.orders).to eq([])

    # todo check how this test is made
  end
end

