module Colours
  def on_black(text)
    colourise(text, "\e[" + colour_codes[:on_black] + "m")
  end

  def on_red(text)
    colourise(text, "\e[" + colour_codes[:on_red] + "m")
  end

  def on_green(text)
    colourise(text, "\e[" + colour_codes[:on_green] + "m")
  end

  def on_white(text)
    colourise(text, "\e[" + colour_codes[:on_white] + "m")
  end

  def black(text)
    colourise(text, "\e[" + colour_codes[:black] + "m")
  end

  def red(text)
    colourise(text, "\e[" + colour_codes[:red] + "m")
  end

  def green(text)
    colourise(text, "\e[" + colour_codes[:green] + "m")
  end

  def yellow(text)
    colourise(text, "\e[" + colour_codes[:yellow] + "m")
  end

  def white(text)
    colourise(text, "\e[" + colour_codes[:white] + "m")
  end
  
  def escape_to_default_colours
    "\e[0m"
  end

  def colourise(text, colour_code)
    "#{colour_code}#{text}"
  end
    
  def colour_codes
    {
      :black => '30',
      :red   => '31',
      :green => '32',
      :yellow => '33',
      :white  => '37',
      :on_black => '40',
      :on_red   => '41',
      :on_green => '42',
      :on_yellow => '43',
      :on_white  => '47'
    }
  end
end

include Colours

def empty
  [on_green("   "),
   on_green("   "),
   on_green("   ")]
end

def wood
  [on_red("   "),
   on_red(" ") + on_red(cattle(1)) + on_red(" "),
   on_red("   ")]
end

def clay
 [on_white("   "),
  on_white(" 2 "),
  on_white("   ")]
end

def stone
  [on_black("   "),
   on_black(" 1 "),
   on_black("   ")]
end

def fenced
  [on_green(white("---")),
   on_green(white("|") + boar(3) + white("|")),
   on_green(white("---"))]
end

def ploughed
  [on_red("~~~"),
   on_red("~") + on_red(grain(2)) + on_red("~"),
   on_red("~~~")]
end

def vegetable(number)
  green(number)
end

def grain(number)
  yellow(number)
end

def sheep(number)
  white(number)
end

def cattle(number)
  red(number)
end

def boar(number)
  black(number)
end

def row(first, second)
  # join each row of the tiles, and unescape
  first.zip(second).map { |element| element.join + escape_to_default_colours }
end

def display(farm)
  farm.each {|row| puts row}
end

display row(fenced, clay)
