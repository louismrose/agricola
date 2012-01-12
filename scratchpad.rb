#  _
# |2|  
#  ‾
#  w  s
# w wsos
#  w  s
#  c
# coc
#  c

def empty
  puts on_green("   ")
  puts on_green("   ")
  puts on_green("   ")
end

def wood
  puts on_red("   ")
  puts on_red(" ") + on_red(cattle(1)) + on_red(" ")
  puts on_red("   ")
end

def clay
  puts on_white("   ")
  puts on_white(" 2 ")
  puts on_white("   ")
end

def stone
  puts on_black("   ")
  puts on_black(" 1 ")
  puts on_black("   ")
end

def fenced
  puts on_green("---")
  puts on_green("|") + on_green(boar(3)) + on_green("|")
  puts on_green("---")
end

def ploughed
  puts on_red("~~~")
  puts on_red("~") + on_red(grain(2)) + on_red("~")
  puts on_red("~~~")
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

def on_black(text)
  colourise(text, "\e[40m")
end

def on_red(text)
  colourise(text, "\e[41m")
end

def on_green(text)
  colourise(text, "\e[42m")
end

def on_white(text)
  colourise(text, "\e[47m")
end

def black(text)
  colourise(text, "\e[30m")
end

def red(text)
  colourise(text, "\e[31m")
end

def green(text)
  colourise(text, "\e[32m")
end

def yellow(text)
  colourise(text, "\e[33m")
end

def white(text)
  colourise(text, "\e[37m")
end

def colourise(text, colour_code)
  "#{colour_code}#{text}\e[0m"
end

wood
clay
stone
empty