class TradesController < ApplicationController

  def index
    render json: Trade.includes(:ideas), status: 200
  end

  def show
    render json: get_trade
  end

  def create
    trade = Trade.new safe_params

    if trade.save
      render json: trade, status: 201
    else
      render json: trade.errors, status: 400
    end
  end

  def update
    trade = get_trade
    trade.attributes = safe_params

    if trade.save
      render json: trade, status: 200
    else
      render json: trade.errors, status: 400
    end
  end

  def destroy
    render json: get_trade.destroy, status: 200
  end

  private

  def safe_params
    params.require(:trade).permit(:name, :description)
  end

  def get_trade
    Trade.includes(:ideas).find params[:id]
  end
end
