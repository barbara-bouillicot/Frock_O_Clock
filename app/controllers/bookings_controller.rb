class BookingsController < ApplicationController

  def index
    booking = Booking.all
  end

  def show
    @booking = @booking.find(params[:id])
  end
end
