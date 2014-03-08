class CreateIdeaCategories < ActiveRecord::Migration
  def change
    create_table :idea_categories do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
