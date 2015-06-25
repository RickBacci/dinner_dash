class Seed
  def self.start
    new.generate
  end

  def generate
    # create_items
    create_users
  end

  def create_items
    create_categories
    50.times { Category.all.sample.items.create(item.sample) }
    puts "#{Item.all.map(&:title).join(', ')} created."
  end

  def create_categories
    categories.each do |category_name|
      Category.create(name: category_name)
    end
  end

  def create_users
    users.map { |user| User.create(user) }
  end

  private

  def categories
    %w(Fruit Vegitable Root Grass Meat Other)
  end

  def item
    [
      [title: 'Granola', description: 'wholesome', price: 1],
      [title: 'Apple', description: 'nutritious and sweet', price: 3],
      [title: 'Grapefruit', description: 'healthy and sour', price: 2],
      [title: 'Banana', description: 'fatty and yellow', price: 4],
      [title: 'Salad', description: 'vegetarian', price: 5],
      [title: 'Chocolate', description: 'sweet', price: 6],
      [title: 'Coffee', description: 'energizing', price: 3],
      [title: 'Tea', description: 'soothing', price: 8],
      [title: 'Pasta', description: 'classic', price: 2],
      [title: 'Cheese', description: 'mmmmm', price: 9],
      [title: 'Bread', description: 'wholesome', price: 4],
      [title: 'Peanut Butter',  description: 'protein-packed', price: 52],
      [title: 'Caviar', description: 'super expensive', price: 6],
      [title: 'Jam', description: 'sweet!', price: 2],
      [title: 'Jelly', description: 'sweeter!', price: 12],
      [title: 'Preserves', description: 'fruity', price: 23],
      [title: 'Smoothie', description: 'delish', price: 13],
      [title: 'Carrots', description: 'full of fiber', price: 6],
      [title: 'Cereal', description: 'perfect for breakfast', price: 86],
      [title: 'Blackberries', description: 'my favorite!', price: 5]
    ]
  end

  def users
    [
      [name: 'user',
       email_address: 'user@user.com',
       username: 'user',
       password: 'user',
       role: 0],

      [name: 'admin',
       email_address: 'admin@admin.com',
       username: 'admin',
       password: 'admin',
       role: 1],

      [name: 'Rachel Warbelow',
       email_address: 'demo+rachel@jumpstartlab.com',
       password: 'password',
       username: '',
       role: 0],

      [name: 'Jeff Casimir',
       email_address: 'demo+jeff@jumpstartlab.com',
       password: 'password',
       username: 'j3',
       role: 0],

      [name: 'Jorge Tellez',
       email_address: 'demo+jorge@jumpstartlab.com',
       password: 'password',
       username: 'novohispano',
       role: 0],

      [name: 'Josh cheek',
       email_address: 'demo+josh@jumpstartlab.com',
       password: 'password',
       username: 'josh',
       role: 1]
    ]
  end
end

Seed.start
