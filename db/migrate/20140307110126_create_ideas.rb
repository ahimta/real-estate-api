class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.text :body
      t.belongs_to :trade, index: true

      t.timestamps
    end
  end
end
