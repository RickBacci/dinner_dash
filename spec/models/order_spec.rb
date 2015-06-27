require 'rails_helper'

RSpec.describe Order, type: :model do
  include SignInHelpers

  it 'must belong to a user' do
    expect(jeff.orders).to eq([])

    # TODO: check how this test is made
  end
end
