class Train
  attr_accessor :speed, :train_type, :number_of_wagons, :wagons
  def initialize (train_type, number_of_wagons)
    @train = {train_type: train_type, number_of_wagons: number_of_wagons}
    @speed = 0
  end
  def add_wagons(wagons)
    @train.each do |wagon|
      

  end
  def stop
  end 
  def take_route
  end
  def transfer_station
  end
  def next_station
  end
  def previous_station
  end
  def current_station
  end



end