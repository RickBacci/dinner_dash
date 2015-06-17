class Seed
  def self.start
    new.generate
  end

  def generate
    destroy_items
    create_items
  end

  def destroy_items
    items_destroyed = Item.destroy_all
    puts "#{items_destroyed.count} items destroyed"
  end

  def create_items
    item.each do |(title, description, price)|
      Item.create(title: title, description: description, price: price)
    end
    puts "#{Item.all.map(&:title).join(", ")} created."
  end

  private

  def item
    [
     ["Granola", "wholesome", 1],
     ["Apple", "nutritious", 1],
     ["Grapefruit", "healthy", 1],
     ["Banana", "fatty", 1],
     ["Pineapple", "hairy", 1]
    ]
  end
end

Seed.start