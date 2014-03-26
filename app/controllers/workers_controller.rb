class WorkersController < ApplicationController
  include SimpleCrudable

  def get_model
    Worker
  end

  def safe_params
    params.require(:worker).permit Worker::SAFE_PARAMS
  end
end
