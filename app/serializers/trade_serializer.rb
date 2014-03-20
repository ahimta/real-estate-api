class TradeSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :ideas_count, :shops_count
  has_many :ideas
  has_many :shops
end
