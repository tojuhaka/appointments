# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
Appointment.create([{title: "tesdasfsdt", description: "tasdad",
    start: DateTime.new(2013, 10, 1), end: DateTime.new(2013, 10, 2)}])
