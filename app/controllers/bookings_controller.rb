class BookingsController < ApplicationController
  before_action :set_booking, only: [:destroy, :show, :accept, :reject]

  def index
    # @user = current_user
    # @bookings = @user.bookings
    @bookings = Hotel.all
  end

  def my_bookings
    @user = current_user
    @bookings = @user.bookings
    # @vehicles = Vehicle.select(params[:vehicle_id])
    # @booked_vehicles = vehicles.booking_id
  end

  def show
    @hotel = Hotel.find(params[:hotel_id])
    @hotel = @booking.hotel
  end

  def new
    @hotel = Hotel.find(params[:hotel_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @hotel = Hotel.find(params[:hotel_id])
    @booking.hotel = @hotel
    # if @booking.start_date && @booking.end_date
    #   @booking.price = (@booking.end_date - @booking.start_date).to_f * @booking.vehicle.price.to_f
    # else
    #   @booking.price = 0
    # end
    if @booking.save
      redirect_to hotel_booking_path(@hotel, @booking)
    else
      redirect_to hotel_path(@hotel)
    end
  end

  def destroy
    @booking.destroy
    redirect_to root_path
    authorize @booking
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user_id, :hotel_id)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
