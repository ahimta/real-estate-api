class ShopsController < ApplicationController
  include SimpleCrudable

  def get_model
    Shop
  end

  def safe_params
    params.require(:shop).permit(:name,:phone,:lower_price,:higher_price,:rating,
      :notes,:trade_id)
  end
end
