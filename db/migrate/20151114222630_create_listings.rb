class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.belongs_to :animal, index: true, foreign_key: true
      t.integer :price
      t.text :description

      t.timestamps null: false
    end
  end
end
