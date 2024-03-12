class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to @booking, notice: 'Booking created!'
    else
      render:new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_url, notice: "Booking deleted!"
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :price, :total)
  end
end
