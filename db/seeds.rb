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

# Airport.all.each do |airport|

#   unless airport1 == 'lax'
#     Flight.create(from_airport_id: airport.id, to_airport_id: airport.id, date: Time.now, duration: 1.hour + 20.minutes)
#     Flight.create(from_airport_id: airport.id, to_airport_id: airport.id, date: 3.hours.from_now, duration: 1.hour + 10.minutes)
#     Flight.create(from_airport_id: airport.id, to_airport_id: airport.id, date: 6.hours.from_now, duration: 1.hour + 10.minutes)
#     Flight.create(from_airport_id: airport.id, to_airport_id: airport.id, date: 1.day.from_now, duration: 1.hour)
#     Flight.create(from_airport_id: airport.id, to_airport_id: airport.id, date: (1.day + 6.hours).from_now, duration: 1.hour)
#     Flight.create(from_airport_id: airport.id, to_airport_id: airport.id, date: 2.days.from_now, duration: 1.hour)
#     Flight.create(from_airport_id: airport.id, to_airport_id: airport.id, date: (2.days + 3.hours).from_now, duration: 1.hour + 20.minutes)
#   end
# end
# Flights

# lax_sfo = Flight.create(from_airport_id: lax.id, to_airport_id: sfo.id, date: Time.now, duration: 1.hour + 20.minutes)
# lax_sfo = Flight.create(from_airport_id: lax.id, to_airport_id: sfo.id, date: 3.hours.from_now, duration: 1.hour + 10.minutes)
# lax_sfo = Flight.create(from_airport_id: lax.id, to_airport_id: sfo.id, date: 6.hours.from_now, duration: 1.hour + 10.minutes)
# lax_sfo = Flight.create(from_airport_id: lax.id, to_airport_id: sfo.id, date: 1.day.from_now, duration: 1.hour)
# lax_sfo = Flight.create(from_airport_id: lax.id, to_airport_id: sfo.id, date: 2.days.from_now, duration: 1.hour)
# lax_sfo = Flight.create(from_airport_id: lax.id, to_airport_id: sfo.id, date: 2.days.from_now, duration: 1.hour + 20.minutes)

# sfo_lax = Flight.create(from_airport_id: sfo.id, to_airport_id: lax.id, date: Time.now, duration: 1.hour)
# sfo_lax = Flight.create(from_airport_id: sfo.id, to_airport_id: lax.id, date: 3.hours.from_now, duration: 1.hour)
# sfo_lax = Flight.create(from_airport_id: sfo.id, to_airport_id: lax.id, date: 1.day.from_now, duration: 1.hour)
# sfo_lax = Flight.create(from_airport_id: sfo.id, to_airport_id: lax.id, date: 2.days.from_now, duration: 1.hour)

# lax_iad = Flight.create(from_airport_id: lax.id, to_airport_id: iad.id, date: 2.days.from_now, duration: 5.hour)
# lax_iad = Flight.create(from_airport_id: lax.id, to_airport_id: iad.id, date: 2.days.from_now, duration: 5.hour)
# lax_iad = Flight.create(from_airport_id: lax.id, to_airport_id: iad.id, date: 1.day.from_now, duration: 5.hour)
# lax_iad = Flight.create(from_airport_id: lax.id, to_airport_id: iad.id, date: 1.day.from_now, duration: 5.hour)
# lax_iad = Flight.create(from_airport_id: lax.id, to_airport_id: iad.id, date: Time.now, duration: 5.hour)
# lax_iad = Flight.create(from_airport_id: lax.id, to_airport_id: iad.id, date: 3.hours.from_now, duration: 5.hour)

# iad_lax = Flight.create(from_airport_id: iad.id, to_airport_id: lax.id, date: 2.days.from_now, duration: 5.hour)
# iad_lax = Flight.create(from_airport_id: iad.id, to_airport_id: lax.id, date: 1.day.from_now, duration: 5.hour)
# iad_lax = Flight.create(from_airport_id: iad.id, to_airport_id: lax.id, date: Time.now, duration: 5.hour)

# lax_nyc = Flight.create(from_airport_id: lax.id, to_airport_id: nyc.id, date: Time.now, duration: 2.hours)
# lax_jfk = Flight.create(from_airport_id: lax.id, to_airport_id: jfk.id, date: Time.now, duration: 3.hours)
# sfo_lax = Flight.create(from_airport_id: sfo.id, to_airport_id: lax.id, date: 1.hour.from_now, duration: 1.hour)
# sfo_nyc = Flight.create(from_airport_id: sfo.id, to_airport_id: nyc.id, date: 2.hours.from_now, duration: 2.hours)
# sfo_jfk = Flight.create(from_airport_id: sfo.id, to_airport_id: jfk.id, date: 3.hours.from_now, duration: 3.hours)
# nyc_jfk = Flight.create(from_airport_id: lax.id, to_airport_id: sfo.id, date: 1.day.from_now, duration: 1.hour)
# nyc_sfo = Flight.create(from_airport_id: lax.id, to_airport_id: nyc.id, date: 2.days.from_now, duration: 2.hours)
# jfk_lax = Flight.create(from_airport_id: jfk.id, to_airport_id: lax.id, date: 3.days.from_now, duration: 3.hours)

# lax_sfo = Flight.create(from_airport_id: lax.id, to_airport_id: sfo.id, date: Time.now, duration: 1.hour)
# lax_nyc = Flight.create(from_airport_id: lax.id, to_airport_id: nyc.id, date: Time.now, duration: 2.hours)
# lax_jfk = Flight.create(from_airport_id: lax.id, to_airport_id: jfk.id, date: Time.now, duration: 3.hours)
# sfo_lax = Flight.create(from_airport_id: sfo.id, to_airport_id: lax.id, date: 1.hour.from_now, duration: 1.hour)
# sfo_nyc = Flight.create(from_airport_id: sfo.id, to_airport_id: nyc.id, date: 2.hours.from_now, duration: 2.hours)
# sfo_jfk = Flight.create(from_airport_id: sfo.id, to_airport_id: jfk.id, date: 3.hours.from_now, duration: 3.hours)
# nyc_jfk = Flight.create(from_airport_id: lax.id, to_airport_id: sfo.id, date: 1.day.from_now, duration: 1.hour)
# nyc_sfo = Flight.create(from_airport_id: lax.id, to_airport_id: nyc.id, date: 2.days.from_now, duration: 2.hours)
# jfk_lax = Flight.create(from_airport_id: jfk.id, to_airport_id: lax.id, date: 3.days.from_now, duration: 3.hours)