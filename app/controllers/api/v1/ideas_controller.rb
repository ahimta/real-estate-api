class Api::V1::IdeasController < ApplicationController
  include SimpleCrudable
  include TradableController

  def get_model
    @model ||= Idea
  end

  def safe_params
    params.require(:idea).permit Idea.props.safe_params
  end
end
