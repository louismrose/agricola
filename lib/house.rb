class House
  attr_reader :animals
  
  def initialize
    @animals = { sheep: 0 }
  end
  
  def stable number, animal_type
    @animals[animal_type] += number
  end
end