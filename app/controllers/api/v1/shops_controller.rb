class Api::V1::ShopsController < ApplicationController
  include SimpleCrudable
  include TradableController

  def get_model
    @model ||= Shop
  end

  def safe_params
    params.require(:shop).permit Shop.props.safe_params
  end
end
