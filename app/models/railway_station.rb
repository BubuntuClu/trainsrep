class RailwayStation < ApplicationRecord
  has_many :trains
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  validates :title, presence: true
  scope :ordered, -> {
                    joins(:routes).where('routes.id=railway_stations_routes.route_id')
                                  .order('railway_stations_routes.station_order') }

  def update_station_order(route, order)
    temp_station_order = station_order(route)
    temp_station_order.update(station_order: order) if temp_station_order
  end

  def position_in(route)
    station_order(route).try(:station_order)
  end

  protected

  def station_order(route)
    @station_ord ||= railway_stations_routes.where(route: route).first
  end
end
