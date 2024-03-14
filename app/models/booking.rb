class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :costume
  before_save :calculate_total_price

  @@shipping_price = 5

  validates :start_date, :end_date, :price, presence: true


  def calculate_total_price
    total_price = (costume.price * booking_duration) + @@shipping_price
    return total_price
  end


  def pending?
    status == 'pending'
  end

  private

    def booking_duration
      (start_date..end_date).count
    end


  private
end
