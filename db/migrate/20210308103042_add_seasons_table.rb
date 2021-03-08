class AddSeasonsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :seasons do |t|
      t.string :name
      t.timestamps
    end

    change_table :weekends do |t|
      t.references :season, index: true
    end
  end
end
