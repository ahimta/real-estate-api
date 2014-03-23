class IdeaSerializer < ActiveModel::Serializer
  attributes *(Idea::ATTRIBUTES)
end
