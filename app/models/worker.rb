class Worker < ActiveRecord::Base
  include Acquaintanceable
  include Tradable

  belongs_to :shop

  validates :shop_id, presence: true, inclusion: { in: ->(worker) {Shop.ids} }
end
