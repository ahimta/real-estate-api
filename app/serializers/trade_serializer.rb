class TradeSerializer < ActiveModel::Serializer
  self.root = false

  attributes :id, :name, :description, :ideas_count, :created_at, :updated_at
  has_many :ideas
end
