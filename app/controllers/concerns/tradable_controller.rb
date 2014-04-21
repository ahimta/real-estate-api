module TradableController
  extend ActiveSupport::Concern

  def index
  	page   = params[:page] || 1
  	trades = Trade.select(:id, :name, *Trade.props.counter_caches)

    render json: @model.page(page), meta: {parents: {trades: trades},
      pagination: @pagination}
  end
end
