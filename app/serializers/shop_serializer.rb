class ShopSerializer < ActiveModel::Serializer
  attributes :id, :name, :phone, :lower_price, :higher_price, :rating, :type, :notes, :trade_id
end
