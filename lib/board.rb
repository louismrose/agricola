class Board
  def initialize
    @tiles = {}
  end
  
  def plough_at x, y
    tile_at(x,y)[:type] = :ploughed
  end
  
  def is_ploughed_at? x, y
    tile_at(x,y)[:type] == :ploughed
  end
  
  def number_of_ploughed_fields
    @tiles.values.select { |tile| tile[:type] == :ploughed}.count
  end
  
  def sow_at x, y
    tile_at(x,y)[:content] = {grain: 3}
  end
  
  def contents x, y
    tile_at(x,y)[:content] || {}
  end
  
private
  def tile_at x, y
    @tiles[[x,y]] = @tiles[[x,y]] || {}
  end
end

# This class is starting to grow.
# It's not quite there yet, but might soon be time to extract a class (e.g. Tile?)