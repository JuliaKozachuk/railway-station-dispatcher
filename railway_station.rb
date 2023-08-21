require_relative 'train'
require_relative 'route'
require_relative 'railway_station'
class RailwayStation
  attr_accessor :train_type, :wagons, :name_station, :train, :lists_trains, :name_station
  
  def initialize (name_station)
    self.name_station = name_station
    self.lists_trains = []

  end
  def train_arrival(train_type, wagons)
    
    self.lists_trains<<{type: train_type, wagons: wagons}
  end
  def train_departure(train_type,wagons)
    self.lists_trains.delete({type:train_type,wagons:wagons})
  end
  def list_of_trains_at_station
    type_counts = Hash.new(0)
    self.lists_trains.each do |train|
      type = train[:type]
      type_counts[type]+=1 
    end
    type_counts.each do |train,count|
      p "Находится на станции #{name_station} поезда: #{train} в количестве: #{count} "
    end
  end
end