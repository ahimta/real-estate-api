class CreateTrades < ActiveRecord::Migration
  def change
    create_table :trades do |t|
      t.string :name, null: false
      t.text :description
      t.integer :ideas_count, default: 0
      t.integer :shops_count, default: 0
      t.integer :workers_count, default: 0

      t.timestamps
    end
  end
end
