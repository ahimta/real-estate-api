class ShopsController < ApplicationController
  include SimpleCrudable
  include TradablesController

  def get_model
    Shop
  end

  def safe_params
    params.require(:shop).permit Shop::SAFE_PARAMS
  end
end
