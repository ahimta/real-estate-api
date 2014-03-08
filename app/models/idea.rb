class Idea < ActiveRecord::Base
  belongs_to :trade, touch: true
  validates :text, presence: true
end
