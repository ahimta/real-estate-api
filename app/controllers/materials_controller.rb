class MaterialsController < ApplicationController
  include SimpleCrudable

  def get_model
    Material
  end

  def safe_params
    params.require(:material).permit(:name,:material_type,:lower_price,:higher_price,:rating,
      :notes,:shop_id,:trade_id)
  end
end
