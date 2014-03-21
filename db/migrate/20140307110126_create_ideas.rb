class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.text :body, null: false

      t.belongs_to :trade, index: true, null: false

      t.timestamps
    end
  end
end
