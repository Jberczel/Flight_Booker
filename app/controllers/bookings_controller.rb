class BookingsController < ApplicationController

  def new
    @flight = Flight.find(params[:flight_id])
    @booking = @flight.bookings.build

    params[:passengers].to_i.times { @booking.passengers.build }
    @booking.passengers.build if params[:passengers].blank? #one passenger by default (user forgot to select)
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      @booking.passengers.each { |p| PassengerMailer.thank_you_email(p).deliver! }
       
      redirect_to booking_path(@booking)
      
    else
      render 'new'
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

   private
    def booking_params
      params.require(:booking).permit(:flight_id,
                                      :passengers_attributes => [:name, :email] )
    end
end
