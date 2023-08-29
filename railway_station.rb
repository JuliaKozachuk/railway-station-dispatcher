require_relative 'train'
require_relative 'route'
require_relative 'railway_station'
require_relative 'instance_counter'
class RailwayStation
  include InstanceCounter
  attr_accessor :train_type, :wagons, :name_station, :train, :lists_trains, :name_station
  @@list_stations = []
  
  def initialize (name_station)
    if validate_name_station(name_station)
      self.name_station = name_station
      self.lists_trains = []
      save_stations(name_station)
      register_instance
    else
      puts 'Создание станции отменено из-за невалидного названия'
    end
  end

  def valid?
    validate_name_station
  end

  def train_arrival(train_type)
    
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

  def self.all
    p @@list_stations
  end

  private
  def validate_name_station(name_station)
    return true if /^[a-zA-Zа-яА-Я\s]+$/.match(name_station)
    
    puts 'Название станции может содержать только русские или английские буквы'
    false
  end
  def save_stations(name_station)
    @@list_stations << name_station
  end

end