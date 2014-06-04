class Flight < ActiveRecord::Base
  belongs_to :from_airport, :class_name => "Airport"
  belongs_to :to_airport, :class_name => "Airport"

  def self.search(params)
    if params[:search]
      date = params[:date].to_date
      Flight.where(from_airport_id: params[:from], 
                   to_airport_id: params[:to],
                   date: date.beginning_of_day..date.end_of_day)
    else
      Flight.all
    end
  end


  def self.get_flights
    all.map{ |d| [ d.date_formatted, d.date.to_date] }.uniq
  end



  def date_formatted
    date.strftime("%m/%d/%Y")
  end
end
