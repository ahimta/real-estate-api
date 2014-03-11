class TradeSerializer < ActiveModel::Serializer
  self.root = false

  attributes :id, :name, :description, :ideas_count
  has_many :ideas
end
