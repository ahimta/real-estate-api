class WorkerSerializer < ActiveModel::Serializer
  attributes :id,:name,:phone,:lower_price,:higher_price,:rating,:notes,:shop_id,:trade_id
end
