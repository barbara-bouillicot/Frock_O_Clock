class CostumesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @costumes = Costume.all
  end

  def new
    @costume = Costume.new
  end

  def create
    @costume = Costume.new(costume_params)
    @costume.user = current_user
    if @costume.save
      redirect_to costume_path(@costume)
    else
      raise
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @costume = Costume.find(params[:id])
  end

  private

  def costume_params
    params.require(:costume).permit(:name, :category, :size, :material, :description, :price, :user_id)
  end
end
