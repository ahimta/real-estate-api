module TradableController
  extend ActiveSupport::Concern

  def index
    render json: get_model.page(params[:page]), meta: {parents: {trades: Trade.all}}
  end
end
