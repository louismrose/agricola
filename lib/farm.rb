require 'supply'
require 'board'

class Farm
  attr_reader :supply, :board
  
  def initialize
    @supply = Supply.new
    @board  = Board.new
  end
  
  def plough_at x, y
    @board.plough_at x, y
  end
  
  def sow_at x, y
    @supply.spend 1, :grain
    @board.sow_at x, y
  end
end