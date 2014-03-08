class CreateTrades < ActiveRecord::Migration
  def change
    create_table :trades do |t|
      t.string :name
      t.text :description
      t.integer :ideas_count

      t.timestamps
    end
  end
end
