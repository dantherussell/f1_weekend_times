class Event < ApplicationRecord
  RACING_CLASSES = ["Formula 1", "Formula 2", "Formula 3", "Porsche Supercup"].freeze
  NAMES = {
    "Formula 1" => ["Practice 1", "Practice 2", "Practice 3", "Qualifying", "Race"],
    "Formula 2" => ["Practice", "Qualifying", "Feature Race", "Sprint Race"],
    "Formula 3" => ["Practice", "Qualifying", "Race 1", "Race 2"],
    "Porsche Supercup" => ["Practice", "Qualifying", "Race"],
  }

  before_save :convert_to_datetime

  belongs_to :weekend

  def circuit_time
    start_time.to_datetime.new_offset(weekend.local_time_offset).strftime("%H:%M")
  end

  def start_time_date_field
    start_time.to_date if start_time.present?
  end

  def start_time_time_field
    start_time.to_time if start_time.present?
  end

  def start_time_date_field=(date)
    # Change back to datetime friendly format
    @start_time_date_field = Date.parse(date).strftime("%Y-%m-%d")
  end

  def start_time_time_field=(time)
    # Change back to datetime friendly format
    @start_time_time_field = Time.parse(time).strftime("%H:%M:%S")
  end

  private

  def convert_to_datetime
    self.start_time = DateTime.parse("#{@start_time_date_field} #{@start_time_time_field}")
  end
end
