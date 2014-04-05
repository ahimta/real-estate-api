class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.text :body, null: false

      t.belongs_to :trade, index: true, unique: false, null: false

      t.timestamps
    end
  end
end
