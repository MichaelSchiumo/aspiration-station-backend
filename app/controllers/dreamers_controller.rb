class DreamersController < ApplicationController
    before_action :set_dreamer, only: [:update, :destroy]

  def index
    @dreamers = Dreamer.all
    options = {
      include: [:aspirations]
    }
    render json: DreamerSerializer.new(@dreamer, options)
  end

  def create
    @dreamer = Dreamer.create!(dreamer_params)
    options = {
      include: [:aspirations]
    }
    render json: DreamerSerializer.new(@dreamer)
  end

  def show
    @dreamer = Dreamer.find_by(id: params[:id])
    options = {
      include: [:aspirations]
    }
    render json: DreamerSerializer.new(@dreamer, options)
  end

  def update
    @dreamer.update(dreamer_params)
    head :no_content
  end

  def destroy
    @dreamer.destroy
    head :no_content
  end

  private

  def dreamer_params
    params.require(:dreamer).permit(:age, :sex, :name)
  end

  def set_dreamer
    @dreamer = Dreamer.find(params[:id])
  end
end
