module SimpleCrudable
  extend ActiveSupport::Concern

  included do
    before_action :get_model
    before_action :get_pagination
    before_action :get_record, only: [:show, :update, :destroy]
  end

  def index
    page = params[:page] || 1

    render json: @model.page(params[:page]), meta:
      {pagination: @pagination}
  end

  def show
    render json: @record, status: 200
  end

  def create
    record = @model.new safe_params

    if record.save
      render json: record, status: 201
    else
      render json: record.errors, status: 400
    end
  end

  def update
    @record.attributes = safe_params

    if @record.save
      render json: @record, status: 200
    else
      render json: @record.errors, status: 400
    end
  end

  def destroy
    render json: @record.destroy, status: 200
  end


  private

    def get_record
      @record ||= @model.find params[:id]
    end

    def get_pagination
      page  = params[:page] || 1
      count = @model.count
      pages = (count / 10.0).ceil

      @pagination ||= {page: page, count: count, per_page: 10, pages: pages}
    end
end
