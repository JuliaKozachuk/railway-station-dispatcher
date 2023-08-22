class Train
  attr_writer :speed, :route
  attr_accessor :wagons

  def initialize
    self.wagons = 0
    self.speed = 0
    self.route = []
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

 
  
  


end