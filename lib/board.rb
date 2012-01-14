class Board
  def initialize
    @tiles = {}
  end
  
  def plough_at x, y
    @tiles[[x,y]] = :ploughed
  end
  
  def is_ploughed_at? x, y
    @tiles[[x,y]] == :ploughed
  end
  
  def number_of_ploughed_fields
    @tiles.values.select { |value| value == :ploughed}.count
  end
end