class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.text :body
      t.belongs_to :idea_category, index: true

      t.timestamps
    end
  end
end
