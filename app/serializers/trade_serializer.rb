class TradeSerializer < ActiveModel::Serializer
  attributes *Trade.props.attrs
end
