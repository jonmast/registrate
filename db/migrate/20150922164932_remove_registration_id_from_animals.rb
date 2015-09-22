class RemoveRegistrationIdFromAnimals < ActiveRecord::Migration
  def change
    remove_column :animals, :registration_id
  end
end
