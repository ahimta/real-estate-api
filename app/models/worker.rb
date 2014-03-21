class Worker < ActiveRecord::Base
  include Tradable

  belongs_to :shop

  validates :name, :shop_id, presence: true
  validates :rating, numericality: { only_integer: true, greater_than: -1, less_than: 6 }
  validates :shop_id, inclusion: { in: ->(worker) {Shop.ids} }
end
