module TradableController
  extend ActiveSupport::Concern

  def index
  	page = params[:page] || 1

    render json: get_model.page(params[:page]), meta: {parents: {trades: Trade.all},
      pagination: {page: page, count: get_model.count}}
  end
end
