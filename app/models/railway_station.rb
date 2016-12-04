class RailwayStation < ApplicationRecord
  has_many :trains
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  
  validates :title, presence: true  
  scope :ordered, -> { joins(:routes).where('routes.id=railway_stations_routes.route_id')
    .order('railway_stations_routes.station_order') }
end
