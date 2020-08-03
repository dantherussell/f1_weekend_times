class Event < ApplicationRecord
  RACING_CLASSES = ["Formula 1", "Formula 2", "Formula 3", "Porsche Supercup"].freeze
  NAMES = {
    "Formula 1" => ["Practice 1", "Practice 2", "Practice 3", "Qualifying", "Race"],
    "Formula 2" => ["Practice", "Qualifying", "Feature Race", "Sprint Race"],
    "Formula 3" => ["Practice", "Qualifying", "Race 1", "Race 2"],
    "Porsche Supercup" => ["Practice", "Qualifying", "Race"],
  }

  belongs_to :weekend

  def circuit_time
    start_time.to_datetime.new_offset(weekend.local_time_offset).strftime("%H:%M")
  end
end
