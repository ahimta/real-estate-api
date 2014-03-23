module Shopable
  extend ActiveSupport::Concern

  included do
    validates :shop_id, presence: true, inclusion: { in: ->(worker) {Shop.ids} }
    belongs_to :shop, touch: true, counter_cache: true
  end
end