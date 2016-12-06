class RailwayStation < ApplicationRecord
  has_many :trains
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  validates :title, presence: true
  scope :ordered, -> {
                    joins(:routes).where('routes.id=railway_stations_routes.route_id')
                                  .order('railway_stations_routes.station_order') 
  }

  def update_station_order(route, order)
    temp_station_order = station(route)
    temp_station_order.update(station_order: order) if temp_station_order
  end

  def position_in(route)
    station(route).try(:station_order)
  end

  def update_time(route, arrival, departure)    
    temp_station = station(route)
    temp_station.update(arrival: arrival) if temp_station
    temp_station.update(departure: departure) if temp_station
  end

  def station_time(route, time)
    station(route).try(time)
  end

  protected

  def station(route)
    @station ||= railway_stations_routes.where(route: route).first
  end
end
