# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
styrian_gp = Weekend.create(gp_title: "2020 Styrian Grand Prix", location: "Speilberg, Austria", timespan: "10th - 12th July", local_timezone: "CEST", local_time_offset: "UTC +2")
Event.create(racing_class: "Formula 3", name: "Practice", start_time: DateTime.parse('2020-07-10 09:35 +0200'), weekend: styrian_gp)
Event.create(racing_class: "Formula 1", name: "Free Practice 1", start_time: DateTime.parse('2020-07-10 11:00 +0200'), weekend: styrian_gp)
Event.create(racing_class: "Formula 3", name: "Race 1", start_time: DateTime.parse('2020-07-11 10:25 +0200'), weekend: styrian_gp)
