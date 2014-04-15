module SimpleCrudable
  extend ActiveSupport::Concern

  def index
    render json: get_model.all, status: 200
  end

  def show
    render json: get_record, status: 200
  end

  def create
    record = get_model.new safe_params

    if record.save
      render json: record, status: 201
    else
      render json: record.errors, status: 400
    end
  end

  def update
    record = get_record
    record.attributes = safe_params

    if record.save
      render json: record, status: 200
    else
      render json: record.errors, status: 400
    end
  end

  def destroy
    render json: get_record.destroy, status: 200
  end


  private

  def get_record
    @record ||= get_model.find params[:id]
  end
end
