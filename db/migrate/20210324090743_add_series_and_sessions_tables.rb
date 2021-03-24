class AddSeriesAndSessionsTables < ActiveRecord::Migration[5.2]
  def change
    create_table :series do |t|
      t.string :name
      t.timestamps
    end

    create_table :sessions do |t|
      t.string :name
      t.references :series, index: true
      t.timestamps
    end

    change_table :events do |t|
      t.references :session, index: true
    end
  end
end
