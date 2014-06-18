class PassengerMailer < ActionMailer::Base
  default from: "from@example.com"


  def thank_you_email(passenger)
    @passenger = passenger
    @booking = @passenger.bookings.last
    email_with_name = "#{@passenger.name} <#{@passenger.email}>"
    @url  = 'http://flight-booker.herokuapp.com'

    mail(to: email_with_name, subject: 'Thank you for booking with FlightBooker!')

  end
end
