class AddRetireToItems < ActiveRecord::Migration
  def change
    add_column :items, :retire, :boolean, default: false
  end
end
