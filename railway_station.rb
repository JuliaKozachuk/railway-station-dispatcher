class RailwayStation
  attr_reader :train_type, :wagons, :name_station, :train, :lists_trains 
  def initialize (name_station)
    @name_station = name_station
    @lists_trains = []

  end
  def train_arrival(train_type, wagons)
    
    @lists_trains<<{type: train_type, wagons: wagons}
  end
  def train_departure(train_type,wagons)
    @lists_trains.delete({type:train_type,wagons:wagons})
  end
  def list_of_trains_at_station
    type_counts = Hash.new(0)
    @lists_trains.each do |train|
      type = train[:type]
      type_counts[type]+=1 
    end
    type_counts.each do |train,count|
      p "Находится на станции #{name_station} поезда: #{train} в количестве: #{count} "
    end
  end
end