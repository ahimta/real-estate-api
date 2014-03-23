class IdeasController < ApplicationController
  include SimpleCrudable

  def get_model
    Idea
  end

  def safe_params
    params.require(:idea).permit(Idea::ATTRIBUTES - [:id])
  end
end
