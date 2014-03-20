class Shop < ActiveRecord::Base
  belongs_to :trade, touch: true, counter_cache: true

  validates :name, :trade_id, presence: true
  validates :trade_id, inclusion: { in: ->(shop) {Trade.ids} }
  validates :rating, numericality: { only_integer: true, greater_than: -1, less_than: 6 }
end
