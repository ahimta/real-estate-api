class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.text :body, null: false
      t.belongs_to :trade, null: false, index: true

      t.timestamps
    end
  end
end
