class MaterialsController < ApplicationController
  include SimpleCrudable
  include ShopablesController

  def get_model
    Material
  end

  def safe_params
    params.require(:material).permit Material::SAFE_PARAMS
  end
end
