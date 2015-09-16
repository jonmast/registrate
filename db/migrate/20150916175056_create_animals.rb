class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.belongs_to :breeder, index: true
      t.belongs_to :owner, index: true
      t.belongs_to :sire, index: true
      t.belongs_to :dam, index: true
      t.string :registration_id, null: false
      t.date :birth_date, null: false
      t.string :gender, null: false
      t.integer :birth_type, null: false
      t.boolean :artificial_insemination, null: false
      t.string :embryo_transfer, null: false
      t.integer :percentage, null: false

      t.timestamps null: false
    end
  end
end
