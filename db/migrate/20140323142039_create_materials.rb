class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.string :name, null: false

      t.string :material_type
      t.integer :lower_price
      t.integer :higher_price
      t.integer :rating
      t.text :notes

      t.belongs_to :shop, index: true, null: false
      t.belongs_to :trade, index: true, null: false

      t.timestamps
    end
  end
end
