class Search

  include ActiveModel::Model

  attr_accessor :start_station, :end_station
  attr_reader :search_result

  def find_start_station
    @start_station ||= RailwayStation.find(start_station)
  end

  def find_end_station
    @end_station ||= RailwayStation.find(end_station)
  end

  def do_search
    @search_result = Train.includes(route: :railway_stations).where(railway_stations: {id: start_station}) &
    Train.includes(route: :railway_stations).where(railway_stations: {id: end_station})
  end

end