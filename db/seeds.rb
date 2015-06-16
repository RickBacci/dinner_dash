class Seed
  def self.start
    new.generate
  end

  def generate
    create_items
  end

  def create_items
    item.each do |title, description, price|
      Item.create(title: title, description: description, price: price)
    end
    puts "#{Item.all.map(&:title).join(", ")} created."
  end

  private

  def item
    {"item 1"  => {"description" => "wholesome",  "price"  => 1}, 
     "item 2"  => {"description" => "nutritious", "price"  =>  2},
     "itmem 3" => {"description" => "healthy",    "price" => 3},
     "item 4"  => {"description" => "smooth",     "price" => 4}
    }
    # {"item 2"  => "nutritious", 
    #  "nutritious" => 2}
  end
end

Seed.start