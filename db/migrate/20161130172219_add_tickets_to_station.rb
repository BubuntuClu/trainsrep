class AddTicketsToStation < ActiveRecord::Migration[5.0]
  def change
    add_belongs_to :tickets, :current_station
    add_belongs_to :tickets, :end_station
  end
end
