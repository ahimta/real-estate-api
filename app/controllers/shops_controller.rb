class ShopsController < ApplicationController
  include SimpleCrudable
  include TradableController

  def get_model
    @model ||= Shop
  end

  def safe_params
    params.require(:shop).permit Shop::SAFE_PARAMS
  end
end
