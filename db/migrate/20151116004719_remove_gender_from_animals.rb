class RemoveGenderFromAnimals < ActiveRecord::Migration
  def change
    remove_column :animals, :gender
  end
end
