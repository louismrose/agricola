class House
  attr_reader :animals
  
  def initialize
    @animals = { }
    House.animal_types.each do |animal_type|
      @animals[animal_type] = 0
    end
  end
  
  def self.animal_types
    [:sheep, :boar, :cattle]
  end
  
  def stable number, animal_type
    @animals[animal_type] += number
  end
end