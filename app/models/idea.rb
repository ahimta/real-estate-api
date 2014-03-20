class Idea < ActiveRecord::Base
  belongs_to :trade, touch: true, counter_cache: true
  validates :body, :trade_id, presence: true
  validates :trade_id, inclusion: { in: ->(idea) {Trade.ids} }
end
