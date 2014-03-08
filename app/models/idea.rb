class Idea < ActiveRecord::Base
  belongs_to :idea_category, touch: true
  validates :text, presence: true
end
