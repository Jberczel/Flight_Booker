# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Passenger.delete_all


Airport.delete_all   
lax = Airport.create(code: "LAX", city: "Los Angeles")
sfo = Airport.create(code: "SFO", city: "San Francisco")
iad = Airport.create(code: "IAD", city: "Washington D.C.")
jfk = Airport.create(code: "NYC", city: "New York City")

duration = { "LAX_SFO" => 1.hour, "LAX_IAD" => 5.hours, "LAX_NYC" => 6.hours, "SFO_LAX" => 1.hour, "IAD_LAX" => 5.hours, "NYC_LAX" => 6.hours,
             "SFO_IAD" => 9.hours, "SFO_NYC" => 8.hours, "IAD_SFO" => 9.hours, "NYC_SFO" => 8.hours, 
             "IAD_NYC" => 1.hour, "NYC_IAD" => 1.hour }

Flight.delete_all


Airport.all.each do |airport1|
  Airport.all.each do |airport2|
    unless airport1 == airport2
      dur = duration["#{airport1.code}_#{airport2.code}"]
      Flight.create(from_airport_id: airport1.id, to_airport_id: airport2.id, date: Time.now, duration: dur)
      Flight.create(from_airport_id: airport1.id, to_airport_id: airport2.id, date: 3.hours.from_now, duration: dur)
      Flight.create(from_airport_id: airport1.id, to_airport_id: airport2.id, date: 6.hours.from_now, duration: dur)
      Flight.create(from_airport_id: airport1.id, to_airport_id: airport2.id, date: 1.day.from_now, duration: dur)
      Flight.create(from_airport_id: airport1.id, to_airport_id: airport2.id, date: (1.day + 6.hours).from_now, duration: dur)
      Flight.create(from_airport_id: airport1.id, to_airport_id: airport2.id, date: 2.days.from_now, duration: dur)
      Flight.create(from_airport_id: airport1.id, to_airport_id: airport2.id, date: (2.days + 3.hours).from_now, duration: dur)
    end
  end
end

