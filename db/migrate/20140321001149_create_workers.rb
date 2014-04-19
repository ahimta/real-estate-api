class CreateWorkers < ActiveRecord::Migration
  def change
    create_table :workers do |t|
      t.string :name, null: false

      t.string :phone
      t.integer :rating, default: 0
      t.text :notes

      t.belongs_to :shop, index: true, unique: false, null: false
      t.belongs_to :trade, index: true, unique: false, null: false

      t.timestamps
    end
  end
end
