class ShopSerializer < ActiveModel::Serializer
  attributes(:id, :name, :phone, :lower_price, :higher_price, :rating, :notes,
    :workers_count,:trade_id)
end
