# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
styrian_gp = Weekend.create(gp_title: "2020 Styrian Grand Prix", location: "Spielberg, Austria", timespan: "10th - 12th July", local_timezone: "CEST", local_time_offset: "UTC +2")
Event.create(racing_class: "Formula 3", name: "Practice", start_time: DateTime.parse('2020-07-10 09:35 +0200'), weekend: styrian_gp)
Event.create(racing_class: "Formula 1", name: "Free Practice 1", start_time: DateTime.parse('2020-07-10 11:00 +0200'), weekend: styrian_gp)
Event.create(racing_class: "Formula 2", name: "Practice", start_time: DateTime.parse('2020-07-10 12:55 +0200'), weekend: styrian_gp)
Event.create(racing_class: "Formula 3", name: "Qualifying", start_time: DateTime.parse('2020-07-10 14:05 +0200'), weekend: styrian_gp)
Event.create(racing_class: "Formula 1", name: "Free Practice 2", start_time: DateTime.parse('2020-07-10 15:00 +0200'), weekend: styrian_gp)
Event.create(racing_class: "Formula 2", name: "Qualifying", start_time: DateTime.parse('2020-07-10 17:00 +0200'), weekend: styrian_gp)
Event.create(racing_class: "Porsche Supercup", name: "Practice", start_time: DateTime.parse('2020-07-10 17:55 +0200'), weekend: styrian_gp)

Event.create(racing_class: "Formula 3", name: "Race 1", start_time: DateTime.parse('2020-07-11 10:25 +0200'), weekend: styrian_gp)
Event.create(racing_class: "Formula 1", name: "Free Practice 3", start_time: DateTime.parse('2020-07-11 12:00 +0200'), weekend: styrian_gp)
Event.create(racing_class: "Porsche Supercup", name: "Qualifying", start_time: DateTime.parse('2020-07-11 13:30 +0200'), weekend: styrian_gp)
Event.create(racing_class: "Formula 1", name: "Qualifying", start_time: DateTime.parse('2020-07-11 15:00 +0200'), weekend: styrian_gp)
Event.create(racing_class: "Formula 2", name: "Feature Race", start_time: DateTime.parse('2020-07-11 16:45 +0200'), weekend: styrian_gp)

Event.create(racing_class: "Formula 3", name: "Race 2", start_time: DateTime.parse('2020-07-12 09:45 +0200'), weekend: styrian_gp)
Event.create(racing_class: "Formula 2", name: "Sprint Race", start_time: DateTime.parse('2020-07-12 11:10 +0200'), weekend: styrian_gp)
Event.create(racing_class: "Porsche Supercup", name: "Race", start_time: DateTime.parse('2020-07-12 12:25 +0200'), weekend: styrian_gp)
Event.create(racing_class: "Formula 1", name: "Race", start_time: DateTime.parse('2020-07-12 15:10 +0200'), weekend: styrian_gp)
