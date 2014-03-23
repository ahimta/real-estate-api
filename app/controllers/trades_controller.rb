class TradesController < ApplicationController
  include SimpleCrudable

  def get_model
    Trade
  end

  def safe_params
    params.require(:trade).permit(Trade::ATTRIBUTES - [:id])
  end
end
