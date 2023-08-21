class CargoTrain < Train
  attr_accessor :wagons
  def attach_a_wagon(wagon)
    if wagon.is_a?(CargoWagon)
      self.wagons += 1
    else
      p "Вагон не является грузовым"
    end
  end
  protected
  def initial_speed
    20
  end
  def go
    60
  end
end