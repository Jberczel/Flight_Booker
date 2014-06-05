class FlightsController < ApplicationController
  def index
    

    @flights = Flight.search(params)
    @airports = Airport.get_codes
    @dates = Flight.get_flights


  end

  private
    
end
