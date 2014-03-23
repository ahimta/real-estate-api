class TradeSerializer < ActiveModel::Serializer
  attributes *(Trade::ATTRIBUTES)
end
