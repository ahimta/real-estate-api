class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name, null: false

      t.string :phone
      t.integer :lower_price
      t.integer :higher_price
      t.integer :rating
      t.text :notes

      t.integer :workers_count, default: 0

      t.belongs_to :trade, index: true, null: false

      t.timestamps
    end
  end
end
