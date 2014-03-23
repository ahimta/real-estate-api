class MaterialsController < ApplicationController
  include SimpleCrudable

  def get_model
    Material
  end

  def safe_params
    params.require(:material).permit(Material::ATTRIBUTES - [:id])
  end
end
