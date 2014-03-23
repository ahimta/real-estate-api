class ShopSerializer < ActiveModel::Serializer
  attributes *(Shop::ATTRIBUTES)
end
