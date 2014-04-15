module ShopableController
  extend ActiveSupport::Concern

  def index
    render json: get_model.all, meta: {trades: Trade.all, shops: Shop.all}, meta_key: 'parents'
  end
end
