class IdeaSerializer < ActiveModel::Serializer
  self.root = false

  attributes :id, :body, :trade_id
  has_one :trade
end
