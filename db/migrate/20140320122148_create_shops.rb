class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name, null: false
      t.string :phone
      t.integer :lower_price
      t.integer :higher_price
      t.integer :rating
      t.string :type
      t.text :notes
      t.belongs_to :trade, null: false, index: true

      t.timestamps
    end
  end
end
