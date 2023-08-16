class Route
  attr_reader :start_route, :end_route, :stations, :route, :station
  def initialize(start_route,end_route)
    @start_route = start_route
    @end_route = end_route
    @stations = [] 
  end
  def add_station(station)
    @stations<<station
  end
  def delete_station(station)
    @stations.delete(station)
  end
  def station_on_the_route
    @route = [start_route, stations, end_route]
  end

end