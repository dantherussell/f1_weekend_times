class Event < ApplicationRecord
  belongs_to :weekend

  def circuit_time
    start_time.to_datetime.new_offset(weekend.local_time_offset).strftime("%H:%M")
  end
end
