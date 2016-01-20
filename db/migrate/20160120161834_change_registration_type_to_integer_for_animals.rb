class ChangeRegistrationTypeToIntegerForAnimals < ActiveRecord::Migration
  def change
    remove_column :animals, :registration_type
    add_column :animals, :registration_type, :integer
  end
end
