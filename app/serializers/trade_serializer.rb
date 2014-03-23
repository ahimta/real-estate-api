class TradeSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :ideas_count, :shops_count, :workers_count
end
