class AspirationsController < ApplicationController
  before_action :set_aspiration, only: [:update, :destroy]

  def index
    @aspirations = Aspiration.all
    render json: AspirationSerializer.new(@aspirations), include: [:dreamer]
  end

  def create
    @dreamer = Dreamer.new(name: aspiration_params[:name], age: aspiration_params[:age], sex: aspiration_params[:sex])

    @aspiration = @dreamer.aspirations.build(title: aspiration_params[:title], category: aspiration_params[:category], timeframe: aspiration_params[:timeframe], status: aspiration_params[:status])



    if @aspiration.save
      render json: {aspiration: @aspiration}
      # json_response(@aspiration, :created)
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
    render json: { message: 'Aspiration was deleted.' }
  end

  private

  def aspiration_params
    params.require(:aspiration).permit(:title, :category, :timeframe, :status, :dreamer_id, :age, :sex, :name)
  end

  def set_aspiration
    @aspiration = Aspiration.find_by(id: params[:id])
  end
end
