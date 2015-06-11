# Rover
class Rover
  attr_accessor :x, :y, :direction

  def initialize(input)
    input = input.split

    @x = input[0]
    @y = input[1]

    @direction = input[2]
  end

  def to_s
    "Position: (#{@x}, #{@y})\nDirection: #{@direction}"
  end
end

puts "Enter the first line of input:"
input = gets.chomp

rover = Rover.new(input)
puts rover