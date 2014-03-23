module Shopable
  extend ActiveSupport::Concern

  ATTRIBUTES     = [:shop_id]
  INVALID_TRAITS = [:without_shop,:with_nonexistent_shop]
  VALID_TRAITS   = [:with_shop]

  included do
    validates :shop_id, presence: true, inclusion: { in: ->(worker) {Shop.ids} }
    belongs_to :shop, touch: true, counter_cache: true
  end
end