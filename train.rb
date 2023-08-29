require_relative 'manufacturer'
require_relative 'instance_counter'
class Train
include Manufacturer
include InstanceCounter
  attr_writer :speed, :route, :train_number
  attr_accessor :wagons
  @@train = {}

  def initialize (train_number)
    
    self.speed = 0
    self.train_number = train_number
    self.route = []
    #save_train(train_number)
    register_instance
    
  end

  def valid?
    validate_train_number && validate_unique_train_number
  end

  def train_number
    @train_number
  end  
  
  def start_engine
    start_engine! if engine_stopped?
  end

  def engine_stopped?
    speed == 0
  end
  
  def set_speed
    set_speed! 

  end

  def engine_stopped
    if self.speed >0
      speed = 0
    else
      "Поезд остановлен: текущая скорость: #{self.speed}"
    end
  end

  def attach_a_wagon(wagon)
    if can_attach_wagon?(wagon)
      self.wagons += 1
    else
      p "Невозможно прицепить данный вагон"
    end
  end
  def unhook_the_wagon
    if can_unhook_wagon?
      self.wagons -= 1
    else
      p "Невозможно отценпить вагон, так как прицепленных вагонов нет"
    end
  end

  
  def take_route(route)
    self.route = route
  end

  protected

  attr_reader :speed
  def can_attach_wagon?(wagon)
    true 
  end

  def can_unhook_wagon?
    self.wagons > 0
  end

  def initial_speed
    10
  end
  def go
    20
  end

  def set_speed!
    self.speed = (self.speed + go) if go >self.speed
  end

  def start_engine!
    self.speed = initial_speed
  end

  def self.find(train_number)
    @@train.find { |train| train.train_number == train_number }
  end

  private
  
  def validate_train_number
    /^[a-zA-Z0-9]{3}-?[a-zA-Z0-9]{2}$/.match?(train_number)
  end

  def validate_unique_train_number
    if @@train[train_number]
      raise "Поезд с номером #{train_number} уже существует"
    else
      @@train[train_number] = self
    end
    true
  end

  # def save_train(train) Метод становиться не нужным, если я делаю валидацию на уникальность, то я сразу сохраняю?
  #   @@train[train_number] = self
  # end
  
end