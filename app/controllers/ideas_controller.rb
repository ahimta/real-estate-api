class IdeasController < ApplicationController

  def index
    render json: Idea.includes(:trade).all, status: 200
  end

  def show
    render json: get_idea, status: 200
  end

  def create
    idea = Idea.new safe_params

    if idea.save
      render json: idea, status: 201
    else
      render json: idea.errors, status: 400
    end
  end

  def update
    idea = get_idea
    idea.attributes = safe_params

    if idea.save
      render json: idea, status: 200
    else
      render json: idea.errors, status: 400
    end
  end

  def destroy
    render json: get_idea.destroy, status: 200
  end


  private

  def safe_params
    params.require(:idea).permit(:trade_id, :body)
  end

  def get_idea
    Idea.includes(:trade).find params[:id]
  end
end
