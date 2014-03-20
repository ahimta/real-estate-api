class ShopSerializer < ActiveModel::Serializer
  attributes(:id, :name, :phone, :lower_price, :higher_price, :rating, :material_type, :notes,
    :trade_id)
end
