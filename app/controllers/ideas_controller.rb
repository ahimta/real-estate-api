class IdeasController < ApplicationController
  include SimpleCrudable
  include TradablesController

  def get_model
    Idea
  end

  def safe_params
    params.require(:idea).permit Idea::SAFE_PARAMS
  end
end
