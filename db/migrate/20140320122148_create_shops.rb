class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name, null: false

      t.string :phone
      t.integer :rating, default: 0
      t.text :notes

      t.integer :workers_count, default: 0

      t.belongs_to :trade, index: true, unique: false, null: false

      t.timestamps
    end
  end
end
