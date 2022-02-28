class AddLocalTimeOffsetToEventsAndRaceNumberToWeekends < ActiveRecord::Migration[5.2]
  def change
    change_table :events do |t|
      t.string :local_time_offset
    end

    change_table :weekends do |t|
      t.integer :race_number
    end
  end
end
