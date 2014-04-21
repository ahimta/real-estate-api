module ShopableController
  extend ActiveSupport::Concern

  def index
  	trades = Trade.select(:id, :name, *Trade.props.counter_caches)
  	shops  = Shop.select(:id, :name, *Shop.props.counter_caches)

    render json: @model.page(params[:page]), meta: {parents: {trades: trades, shops: shops},
      pagination: @pagination}
  end
end
