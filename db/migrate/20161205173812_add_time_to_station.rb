class AddTimeToStation < ActiveRecord::Migration[5.0]
  def change
    add_column :railway_stations, :departure, :datetime
    add_column :railway_stations, :arrival, :datetime
  end
end
