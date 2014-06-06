class Flight < ActiveRecord::Base

  belongs_to :from_airport, :class_name => "Airport"
  belongs_to :to_airport, :class_name => "Airport"
  has_many :bookings
  has_many :passengers, :through => :bookings

  def self.search(params)
    if params[:search] && !params[:date].blank?
      date = params[:date].to_date
      Flight.where(from_airport_id: params[:from], to_airport_id: params[:to],
                   date: date.beginning_of_day..date.end_of_day)
            .includes(:from_airport, :to_airport) # prevents N + 1 queries
    else
      Flight.none
    end
  end

  def self.get_dates
    pluck(:date).map{ |d| [ d.strftime("%m/%d/%Y"), d.to_date] }.uniq
  end


  def date_formatted
    date.strftime("%m/%d/%Y")
  end
end
