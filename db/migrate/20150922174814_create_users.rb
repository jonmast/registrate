class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :flock_name
      t.string :email
      t.string :phone
      t.string :fax

      t.timestamps null: false
    end
  end
end
