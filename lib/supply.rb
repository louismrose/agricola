class Supply  
  def initialize
    @inventory = {}
    Supply.resource_types.each do |resource_type|
      @inventory[resource_type] = 0
    end
  end
  
  def self.resource_types
    [:wood, :clay, :stone, :reed, :grain, :vegetable]
  end
  
  def gather(amount, resource_type)
    @inventory[resource_type] += amount
  end
  
  def amount_of(resource_type)
    @inventory[resource_type]
  end
end