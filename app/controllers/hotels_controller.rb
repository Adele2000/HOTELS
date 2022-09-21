class HotelsController < ApplicationController
  before_action :set_hotel, only: [:show, :edit, :update, :destroy]

  def index
    @hotels = Hotel.all
  end

  def show
    @booking = Booking.new
    @bookings = @hotel.bookings
    @bookings_dates = @bookings.map do |booking|
      {
        from: booking.start_date,
        to:   booking.end_date
      }
    end
  end

  def new
    @hotel = Hotel.new
  end

  def create
    @hotel = Hotel.new(hotel_params)
    @hotel.save
    redirect_to hotel_path(@hotel)
  end

  def edit
  end

  def update
    @hotel.update(hotel_params)
    redirect_to hotel_path(@hotel)
  end

  def destroy
    @hotel.destroy
    redirect_to hotels_path, status: :see_other
  end

private

  def hotel_params
    params.require(:hotel).permit(:name, :address, :description, :price, :room_type, :user_id, :photo)
  end

  def set_hotel
    @hotel = Hotel.find(params[:id])
  end
end
