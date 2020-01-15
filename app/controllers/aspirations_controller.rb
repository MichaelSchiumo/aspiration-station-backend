class AspirationsController < ApplicationController
  before_action :set_aspiration, only: [:update, :destroy]

  def index
    @aspirations = Aspiration.all
    render json: AspirationSerializer.new(@aspirations), include: [:dreamer]
  end

  def create
    @aspiration = Aspiration.new(aspiration_params)

    if @aspiration.save
      json_response(@aspiration, :created)
    else
      render json: { message: 'Aspiration was not created.'}
    end
  end

  def show
    @aspiration = Aspiration.find_by(id: params[:id])
    render json: AspirationSerializer.new(@aspiration), include: [:dreamer]
  end

  def update
    @aspiration.update(aspiration_params)
  end

  def destroy
    @aspiration.destroy
    head :no_content
  end

  private

  def aspiration_params
    params.require(:aspiration).permit(:title, :category, :timeframe, :status, :dreamer_id)
  end

  def set_aspiration
    @aspiration = Aspiration.find_by(id: params[:id])
  end
end
