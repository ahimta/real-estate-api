module ShopableController
  extend ActiveSupport::Concern

  def index
  	page = params[:page] || 1
  	trades = Trade.select(:id, :name, *Trade.props.counter_caches)
  	shops  = Shop.select(:id, :name, *Shop.props.counter_caches)

    render json: @model.page(page), meta: {parents: {trades: trades, shops: shops},
      pagination: @pagination}
  end
end
