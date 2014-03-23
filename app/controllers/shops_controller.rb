class ShopsController < ApplicationController
  include SimpleCrudable

  def get_model
    Shop
  end

  def safe_params
    params.require(:shop).permit(Shop::ATTRIBUTES - [:id])
  end
end
