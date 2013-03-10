require 'supply'
require 'board'
require 'house'

class Farm
  attr_reader :supply, :board, :house
  
  def initialize
    @supply = Supply.new
    @board  = Board.new
    @house = House.new
  end
  
  def plough_at x, y
    @board.plough_at x, y
  end
  
  def sow_at x, y
    @supply.spend 1, :grain
    @board.sow_at x, y
  end
  
  def stable_at x, y
    @board.stable_at x, y
  end
  
  def gather number, resource
    @supply.gather number, resource
    @house.stable number, resource if House.animal_types.include? resource
  end
end