class Shop < ActiveRecord::Base
  include Tradable

  validates :name, presence: true
  validates :rating, numericality: { only_integer: true, greater_than: -1, less_than: 6 }
end
