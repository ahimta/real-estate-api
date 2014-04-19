module ShopableController
  extend ActiveSupport::Concern

  def index
    render json: get_model.page(params[:page]), meta: {parents: {trades: Trade.all, shops: Shop.all}}
  end
end
