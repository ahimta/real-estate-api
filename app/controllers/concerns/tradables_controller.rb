module TradablesController
  extend ActiveSupport::Concern

  def index
    render json: get_model.all, meta: {trades: Trade.all}, meta_key: 'parents'
  end
end
