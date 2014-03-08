class Idea < ActiveRecord::Base
  belongs_to :trade, touch: true
  validates :body, :trade_id, presence: true
end
