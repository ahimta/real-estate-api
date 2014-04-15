module TradablesController
  extend ActiveSupport::Concern

  def index
    render json: get_model.all, meta: Trade.all, meta_key: :trades
  end
end
