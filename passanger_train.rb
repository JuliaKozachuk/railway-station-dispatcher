require_relative 'train'
class PassangerTrain < Train
  attr_accessor :wagons
  def attach_a_wagon(wagon)
    if wagon.is_a?(PassangerWagon)
      self.wagons += 1
    else
      p "Вагон не является пассажирским"
    end
  end

  def unhook_the_wagon
    if can_unhook_wagon?
      self.wagons -= 1
    else
      #p "Невозможно отцепить данный вагон"
    end
  end
  
  protected
  
  def initial_speed
    5
  end
  def go
    40
  end
end