class AddTimeToStation < ActiveRecord::Migration[5.0]
  def change
    add_column :railway_stations_routes, :departure, :string
    add_column :railway_stations_routes, :arrival, :string
  end
end
