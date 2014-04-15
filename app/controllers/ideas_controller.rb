class IdeasController < ApplicationController
  include SimpleCrudable
  include TradableController

  def get_model
    @model ||= Idea
  end

  def safe_params
    params.require(:idea).permit Idea::SAFE_PARAMS
  end
end
