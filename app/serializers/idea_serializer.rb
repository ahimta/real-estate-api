class IdeaSerializer < ActiveModel::Serializer
  self.root = false

  attributes :id, :body, :trade_id, :created_at, :updated_at
end
