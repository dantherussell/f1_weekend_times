class AddWeekendsAndEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :weekends do |t|
      t.string :gp_title
      t.string :location
      t.string :timespan
      t.string :local_timezone
      t.string :local_time_offset
      t.timestamps
    end

    create_table :events do |t|
      t.string :racing_class
      t.string :name
      t.datetime :start_time
      t.references :weekend, index: true
      t.timestamps
    end
  end
end
