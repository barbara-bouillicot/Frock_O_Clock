class BookingsController < ApplicationController


  def index
    @bookings = current_user.bookings
    @booking_requests = current_user.costumes.map do | costume|
      costume.bookings
    end.flatten
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
    @costume = Costume.find(params[:costume_id])
    @booking.price = @costume.price
  end

  def create
    @costume = Costume.find(params[:costume_id])
    @booking = Booking.new(booking_params)
    @booking.costume = @costume
    @booking.user = current_user
    @booking.price = @costume.price
    if @booking.save
      redirect_to costume_path(@costume), notice: 'Booking created!'
    else
      render:new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_url, notice: "Booking successfully deleted!"
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      redirect_to  bookings_path
    else
      # render # where was the booking update form?
      redirect_to  bookings_path
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :price, :total, :status)
  end
end
