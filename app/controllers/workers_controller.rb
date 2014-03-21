class WorkersController < ApplicationController

  def index
    render json: Worker.all, status: 200
  end

  def show
    render json: get_worker, status: 200
  end

  def create
    worker = Worker.new safe_params

    if worker.save
      render json: worker, status: 201
    else
      render json: worker.errors, status: 400
    end
  end

  def update
    worker = get_worker
    worker.attributes = safe_params

    if worker.save
      render json: worker, status: 200
    else
      render json: worker.errors, status: 400
    end
  end

  def destroy
    render json: get_worker.destroy, status: 200
  end


  private

  def get_worker
    Worker.find params[:id]
  end

  def safe_params
    params.require(:worker).permit(:name,:phone,:lower_price,:higher_price,:rating,:notes,
      :shop_id,:trade_id)
  end
end
