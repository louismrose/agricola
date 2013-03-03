class Board
  def initialize
    @tiles = {}
  end
  
  def plough_at x, y
    tile_at(x,y)[:type] = :ploughed
  end
  
  def stable_at x, y
    tile_at(x,y)[:type] = :stabled
  end
  
  def is_ploughed_at? x, y
    tile_at(x,y)[:type] == :ploughed
  end
  
  def is_stable_at? x, y
    tile_at(x,y)[:type] == :stabled
  end
  
  def number_of_ploughed_fields
    tiles_with_type(:ploughed).count
  end
  
  # Perhaps this and number_of_ploughed_fields belong on
  # another class that queries the board
  def animal_housing
    result = []
    tiles_with_type(:stabled).each do |position,tile|
      result << {row: position[0], column: position[1], capacity: 1}
    end
    result
  end
  
  def sow_at x, y
    tile_at(x,y)[:content] = {grain: 3}
  end
  
  def contents x, y
    tile_at(x,y)[:content] || {}
  end
  
private
  def tiles_with_type type
    @tiles.select { |position,tile| tile[:type] == type}
  end

  def tile_at x, y
    @tiles[[x,y]] = @tiles[[x,y]] || {}
  end
end

# This class is starting to grow.
# It's not quite there yet, but might soon be time to extract a class (e.g. Tile?)