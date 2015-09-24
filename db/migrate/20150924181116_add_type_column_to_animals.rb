class AddTypeColumnToAnimals < ActiveRecord::Migration
  def change
    add_column :animals, :registration_type, :string
  end
end
