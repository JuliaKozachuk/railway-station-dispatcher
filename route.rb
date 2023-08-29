require_relative 'railway_station'
require_relative 'train'
require_relative 'railway_station'
class Route
  attr_accessor :start_route, :end_route, :stations, :route, :station
  def initialize(start_route,end_route)
    #validate_start_station(start_route)
    #validate_end_station(end_route)
    self.start_route = start_route
    self.end_route = end_route
    self.stations = [] 
  end
  def valid?
    validate_start_station && validate_end_station
  end
  # def valid_add_station?
  #   validate_add_station
  # end
  def add_station(station)
    validate_add_station(station)
    self.stations<<station
  end
  def delete_station(station)
    self.stations.delete(station)
  end
  def station_on_the_route
    self.route = [start_route, *stations, end_route]
    
  end

  private

  def validate_start_station
    if /^[a-zA-Zа-яА-Я]{1,}$/.match?(start_route)
      true
    else
      p 'Название станции может содержать только русские или английские буквы'
      false
    end
  end
  
  def validate_end_station
    if /^[a-zA-Zа-яА-Я]{1,}$/.match?(end_route)
      true
    else
      p 'Название станции может содержать только русские или английские буквы'
      false
    end
  end
  
  def validate_add_station(station)
    if /^[a-zA-Zа-яА-Я]{1,}$/.match?(station)
      true
    else
      p 'Название станции может содержать только русские или английские буквы'
      false
    end
  end
  

 

end