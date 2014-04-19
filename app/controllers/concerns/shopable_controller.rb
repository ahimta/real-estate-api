module ShopableController
  extend ActiveSupport::Concern

  def index
  	page = params[:page] || 1

    render json: get_model.page(page), meta: {parents: {trades: Trade.all, shops: Shop.all},
      pagination: {page: page, count: get_model.count}}
  end
end
