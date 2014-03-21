class WorkersController < ApplicationController
  include SimpleCrudable

  def get_model
    Worker
  end

  def safe_params
    params.require(:worker).permit(:name,:phone,:lower_price,:higher_price,:rating,:notes,
      :shop_id,:trade_id)
  end
end
