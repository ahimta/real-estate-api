class Idea < ActiveRecord::Base
  belongs_to :trade, touch: true, counter_cache: true
  validates :body, :trade, :trade_id, presence: true
end
