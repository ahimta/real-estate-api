class IdeasController < ApplicationController
  include SimpleCrudable

  def get_model
    Idea
  end

  def safe_params
    params.require(:idea).permit(:trade_id, :body)
  end
end
