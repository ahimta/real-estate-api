class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.string :name, null: false

      t.integer :lower_price, default: 0
      t.integer :higher_price, default: 0
      t.integer :rating, default: 0
      t.text :notes

      t.belongs_to :shop, index: true, unique: false, null: false
      t.belongs_to :trade, index: true, unique: false, null: false

      t.timestamps
    end
  end
end
