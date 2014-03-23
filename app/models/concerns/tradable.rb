module Tradable
  extend ActiveSupport::Concern

  ATTRIBUTES     = [:trade_id]
  INVALID_TRAITS = [:with_nonexistent_trade,:without_trade]
  VALID_TRAITS   = [:with_trade]

  included do
    validates :trade_id, presence: true, inclusion: { in: ->(tradable) {Trade.ids} }
    belongs_to :trade, touch: true, counter_cache: true
  end
end