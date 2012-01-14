require 'supply'
require 'board'

class Farm
  attr_reader :supply, :board
  
  def initialize
    @supply = Supply.new
    @board  = Board.new
  end
end