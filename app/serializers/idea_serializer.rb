class IdeaSerializer < ActiveModel::Serializer
  attributes *Idea.props.attrs
end
