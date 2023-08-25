module Manufacturer
  attr_accessor :manufacturing_name
  def manufacturing_company(name)
    self.manufacturing_name = name
  end
  def get_manufacturing_name
    self.manufacturing_name
  end
  
end