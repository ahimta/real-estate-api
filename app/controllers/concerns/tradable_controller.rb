module TradableController
  extend ActiveSupport::Concern

  def index
  	page = params[:page] || 1

    render json: @model.page(params[:page]), meta: {parents: {trades: Trade.all},
      pagination: {page: page, count: @model.count}}
  end
end
