class Seed
  def self.start
    new.generate
  end

  def generate
    # destroy_all
    create_items
    create_categories
  end

  def destroy_all
    items_destroyed = Item.destroy_all
    categories_destroyed = Category.destroy_all
    puts "#{items_destroyed.count} items destroyed and #{categories_destroyed.count} categories destroyed"
  end

  def create_items
    item.each do |(title, description, price)|
      Item.create(title: title, description: description, price: price)
    end
    puts "#{Item.all.map(&:title).join(', ')} created."
  end

  def create_categories
    category.each do |name|
      Category.create(name: name)
    end
  end

  private

  def category
    [
      "Fruit",
      "Vegitable",
      "Root",
      "Grass",
      "Other"
    ]
  end

  def item
    [
      ["Granola", "wholesome", 1],
      ["Apple", "nutritious", 3],
      ["Grapefruit", "healthy", 2],
      ["Banana", "fatty", 4],
      ["Pineapple", "hairy", 5]
    ]
  end
end

Seed.start
