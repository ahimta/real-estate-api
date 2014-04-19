module ShopableController
  extend ActiveSupport::Concern

  def index
  	page = params[:page] || 1

    render json: @model.page(page), meta: {parents: {trades: Trade.all, shops: Shop.all},
      pagination: {page: page, count: @model.count}}
  end
end
