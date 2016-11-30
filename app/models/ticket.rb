class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :train
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :end_station, class_name: 'RailwayStation', foreign_key: :end_station_id
end
