class ShopSerializer < ActiveModel::Serializer
  attributes *Shop.props.attrs
end
