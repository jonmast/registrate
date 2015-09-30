class AddBreedToAnimals < ActiveRecord::Migration
  def change
    add_column :animals, :breed, :integer, null: false
  end
end
