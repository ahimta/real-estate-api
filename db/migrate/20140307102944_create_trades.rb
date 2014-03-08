class CreateTrades < ActiveRecord::Migration
  def change
    create_table :trades do |t|
      t.string :name
      t.text :description
      t.integer :ideas_count, default: 0

      t.timestamps
    end
  end
end
