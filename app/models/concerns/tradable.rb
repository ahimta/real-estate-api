module Tradable
  extend ActiveSupport::Concern

  included do
    validates :trade_id, presence: true, inclusion: { in: ->(tradable) {Trade.ids} }
    belongs_to :trade, touch: true, counter_cache: true
  end
end