class CartPresenter
  def initialize(cart)
    @cart = cart
  end

  def items
    @cart.contents.map do |id, quantity|
      item = Item.find(id)
      ItemDecorator.new(item, quantity)
      # OpenStruct.new({
      #   title: item.title,
      #   quantity: quantity
      # })
    end
  end
end
