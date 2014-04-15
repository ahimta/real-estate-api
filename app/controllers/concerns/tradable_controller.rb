module TradableController
  extend ActiveSupport::Concern

  def index
    render json: get_model.all, meta: {parents: {trades: Trade.all}}
  end
end