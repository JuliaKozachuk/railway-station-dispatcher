require_relative 'railway_station'
require_relative 'train'
require_relative 'railway_station'
class Route
  attr_accessor :start_route, :end_route, :stations, :route, :station
  def initialize(start_route,end_route)
    self.start_route = start_route
    self.end_route = end_route
    self.stations = [] 
  end
  def add_station(station)
    self.stations<<station
  end
  def delete_station(station)
    self.stations.delete(station)
  end
  def station_on_the_route
    self.route = [start_route, *stations, end_route]
    
  end

 

end