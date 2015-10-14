class CreateTransfers < ActiveRecord::Migration
  def change
    create_table :transfers do |t|
      t.references :seller, index: true
      t.references :buyer, index: true
      t.references :animal, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
