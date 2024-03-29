class CostumesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    if params[:query].present?
      @costumes = Costume.search_by_name_and_description_category_material(params[:query])
    else
      @costumes = Costume.all
    end
  end

  def new
    @costume = Costume.new
  end

  def create
    @costume = Costume.new(costume_params)
    @costume.user = current_user
    if @costume.save
      redirect_to my_costumes_costumes_path(@costume)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @costume = Costume.find(params[:id])
    @booking = Booking.new
    @booking.price = @costume.price
    @user = @costume.user
    @marker = {
      lat: @user.latitude,
      lng: @user.longitude,
      info_window_html: render_to_string(partial: "info_window", locals: { costume: @costume }),
      marker_html: render_to_string(partial: "marker", locals: { costume: @costume })
    }
  end

  def edit
    @costume = Costume.find(params[:id])
  end
  # add update action

  def update
    @costume = Costume.find(params[:id])
    @costume.update(costume_params)
    redirect_to costume_path(@costume)
  end

  def destroy
    @costume = Costume.find(params[:id])
    @costume.destroy
    redirect_to my_costumes_costumes_path, status: :see_other
  end

  def my_costumes
    @costumes = Costume.where(user: current_user)
  end

  private

  def costume_params
    params.require(:costume).permit(:name, :category, :size, :material, :description, :price, :user_id, photos: [])
  end
end
