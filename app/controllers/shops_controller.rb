class ShopsController < ApplicationController

  def index
    render json: Shop.all, status: 200
  end

  def show
    render json: get_shop, status: 200
  end

  def create
    shop = Shop.new safe_params

    if shop.save
      render json: shop, status: 201
    else
      render json: shop.errors, status: 400
    end
  end

  def update
    shop = get_shop
    shop.attributes = safe_params

    if shop.save
      render json: shop, status: 200
    else
      render json: shop.errors, status: 400
    end
  end

  def destroy
    render json: get_shop.destroy, status: 200
  end


  private

  def get_shop
    Shop.find params[:id]
  end

  def safe_params
    params.require(:shop).permit(:name,:phone,:lower_price,:higher_price,:rating,:material_type,
      :notes,:trade_id)
  end
end
