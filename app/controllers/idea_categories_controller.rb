class IdeaCategoriesController < ApplicationController

  def index
    render json: IdeaCategory.all, status: 200
  end

  def show
    render json: get_idea_category
  end

  def create
    idea_category = IdeaCategory.new safe_params

    if idea_category.save
      render json: idea_category, status: 201
    else
      render json: idea_category.errors, status: 400
    end
  end

  def update
    idea_category = get_idea_category
    idea_category.attributes = safe_params

    if idea_category.save
      render json: idea_category, status: 200
    else
      render json: idea_category.errors, status: 400
    end
  end

  def destroy
    render json: get_idea_category.destroy, status: 200
  end

  private

  def safe_params
    params.require(:idea_category).permit(:name, :description)
  end

  def get_idea_category
    IdeaCategory.find params[:id]
  end
end
