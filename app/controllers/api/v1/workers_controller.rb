class Api::V1::WorkersController < ApplicationController
  include SimpleCrudable
  include ShopableController

  def get_model
    @model ||= Worker
  end

  def safe_params
    params.require(:worker).permit Worker::SAFE_PARAMS
  end
end
