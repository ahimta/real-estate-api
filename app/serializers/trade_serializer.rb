class TradeSerializer < ActiveModel::Serializer
  attributes :id, :name, :ideas_count, :shops_count, :workers_count
end
