require_relative 'train'
require_relative 'route'
require_relative 'railway_station'
require_relative 'passanger_wagon'
require_relative 'passanger_train'
require_relative 'wagon'
require_relative 'cargo_wagon'
require_relative 'cargo_train'
require_relative 'manufacturer'

class Main
  attr_accessor :stations, :passanger_trains, :cargo_trains, :passanger_wagons, :cargo_wagons, :routes
  def initialize
    self.stations = []
    self.passanger_trains = []
    self.cargo_trains = []
    self.passanger_wagons = []
    self.cargo_wagons = []
    self.routes = []
  end
  def menu
    loop do
      puts 'Выберите действие:'
      puts '1. Создать станцию'
      puts '2. Создать пассажирский поезд'
      puts '3. Создать грузовой поезд'
      puts '4. Добавить вагон к пассажирскому поезду'
      puts '5. Добавить вагон к грузовому поезду'
      puts '6. Отцепить вагон от пассажирского поезда'
      puts '7. Отцепить вагон от грузового поезда'
      puts '8. Поместить пассажирский поезд на станцию'
      puts '9. Поместить грузовой поезд на станцию'
      puts '10. Список поездов на станции'
      puts '11. Создание маршрута'
      puts '12. Создание промежуточных станций маршрута'
      puts '13. Список станций маршрута'
      puts '0. Выход'
      choice = gets.chomp.to_i
      case choice
      when 1
        create_station
      when 2
        create_passenger_train
      when 3
        create_cargo_train
      when 4
        add_passanger_wagon
      when 5
        add_cargo_wagon
      when 6
        unhook_passanger_wagon
      when 7
        unhook_cargo_wagon
      when 8
        add_to_station_passanger_train
      when 9
        add_to_station_cargo_train
      when 10 
        list_trains_station
      when 11
        create_route
      when 12
        add_station_to_route
      when 13
        list_stations
      when 0
        break
      else
        puts 'Неверный выбор'
      end
    end
  end

  def create_station
    print 'Введите название станции: '
    name = gets.chomp
    station = RailwayStation.new(name)
    self.stations<<station
    puts "Станция '#{name}' создана"
  end

  def create_passenger_train
    passanger_train = PassangerTrain.new
    self.passanger_trains<<passanger_train
    p 'Пасажирский поезд создан'
  end

  def create_cargo_train
    cargo_train = CargoTrain.new
    self.cargo_trains<<cargo_train
    p 'Грузовой поезд создан'
  end

  def add_passanger_wagon
    puts 'Выберите пассажирский поезд:'
  self.passanger_trains.each_with_index { |train, index| puts "#{index + 1}. Пассажирский поезд №#{index + 1}" }
  train_index = gets.chomp.to_i - 1

  passanger_train = self.passanger_trains[train_index]
  wagon = PassangerWagon.new
  passanger_train.attach_a_wagon(wagon)
  self.passanger_wagons << wagon
  puts "Вагон прицеплен к пассажирскому поезду №#{train_index + 1}"
  end

  def add_cargo_wagon
    puts 'Выберите грузовой поезд:'
    self.cargo_trains.each_with_index { |train, index| puts "#{index + 1}. Грузовой поезд №#{index + 1}" }
    train_index = gets.chomp.to_i - 1
  
    cargo_train = self.cargo_trains[train_index]
    wagon = CargoWagon.new
    cargo_train.attach_a_wagon(wagon)
    self.cargo_wagons << wagon
    puts "Вагон прицеплен к грузовому поезду №#{train_index + 1}"
  end

  def unhook_passanger_wagon
    p 'Выберите пассажирский поезд: '
    self.passanger_trains.each_with_index { |train, index| puts "#{index + 1}. Пассажирский поезд №#{index + 1}" }
    train_index = gets.chomp.to_i - 1

    passanger_train = self.passanger_trains[train_index]
    if passanger_train.unhook_the_wagon 
      p "Вагон отцеплен от поезда № #{train_index + 1} " 
    else
      p "Невозможно отцепить вагон от поезда № #{train_index + 1}, т.к. прицепленных вагонов нет "
    end
    

  end
  def unhook_cargo_wagon
    p 'Выберите грузовой поезд: '
    self.cargo_trains.each_with_index { |train, index| puts "#{index + 1}. Грузовой поезд №#{index + 1}" }
    train_index = gets.chomp.to_i - 1

    cargo_train = self.passanger_trains[train_index]
    if cargo_train.unhook_the_wagon 
      p "Вагон отцеплен от поезда № #{train_index + 1} " 
    else
      p "Невозможно отцепить вагон от поезда № #{train_index + 1}, т.к. прицепленных вагонов нет "
    end
  end

  def add_to_station_passanger_train
    p 'Выберете станцию:'
    self.stations.each_with_index { |station, index| puts "#{index + 1}. Станция #{station.name_station}" }
    change_station_index = gets.chomp.to_i
    selected_station = self.stations[change_station_index - 1] 
    if selected_station
      p 'Выберите пассажирский поезд: '
      self.passanger_trains.each_with_index { |train, index| puts "#{index + 1}. Пассажирский поезд №#{index + 1}" }
      train_index = gets.chomp.to_i - 1

      passanger_train = self.passanger_trains[train_index]
      selected_station.train_arrival(passanger_train)
      p "Поезд #{passanger_train} прибыл на станцию #{selected_station}"
    else
      p "Станция с номером #{change_station_index} не найдена"
    end
  end

  def add_to_station_cargo_train
    p 'Выберете станцию:'
    self.stations.each_with_index { |station, index| puts "#{index + 1}. Станция #{station.name_station}" }
    change_station_index = gets.chomp.to_i
    selected_station = self.stations[change_station_index - 1] 
    if selected_station
      p 'Выберите грузовой поезд: '
      self.cargo_trains.each_with_index { |train, index| puts "#{index + 1}. Грузовой поезд №#{index + 1}" }
      train_index = gets.chomp.to_i - 1

      cargo_train = self.cargo_trains[train_index]
      selected_station.train_arrival(cargo_train)
      p "Поезд #{cargo_train} прибыл на станцию #{selected_station}"
    else
      p "Станция с номером #{change_station_index} не найдена"
    end
  end

  def list_trains_station
    p 'Выберете станцию:'
    self.stations.each_with_index { |station, index| puts "#{index + 1}. Станция #{station.name_station}" }
    change_station_index = gets.chomp.to_i
    selected_station = self.stations[change_station_index - 1] 
    selected_station.list_of_trains_at_station
  end

  def create_route
    print 'Введите название станции начала маршрута: '
    start_route = gets.chomp
    print 'Введите название станции окончания маршрута: '
    end_route = gets.chomp
    route = Route.new(start_route, end_route)
    self.routes << route
  end
  
  def add_station_to_route
    p 'Выберите маршрут: '
    self.routes.each_with_index { |route, index| puts "#{index + 1}. Маршрут №#{index + 1}" }
    route_index = gets.chomp.to_i - 1

    selected_route = self.routes[route_index] 
    print 'Введите название станции: '
    station_route = gets.chomp
    selected_route.add_station(station_route)



  end
  
  def list_stations
    p 'Выберите маршрут: '
    self.routes.each_with_index { |route, index| puts "#{index + 1}. Маршрут №#{index + 1}" }
    route_index = gets.chomp.to_i - 1

    selected_route = self.routes[route_index] 
     p selected_route.station_on_the_route

  end


end
main = Main.new
main.menu



