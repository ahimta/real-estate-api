module Tradable
  extend ActiveSupport::Concern

  included do
    belongs_to :trade, touch: true, counter_cache: true
    validates :trade_id, presence: true
    validates :trade_id, inclusion: { in: ->(tradable) {Trade.ids} }
  end
end