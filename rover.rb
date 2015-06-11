# Rover
class Rover
  def initialize(input)
    input = input.split

    @x = input[0]
    @y = input[1]
    @direction = ['N', 'E', 'S', 'W']

    direction = input[2]

    if direction == 'E'
      @direction.rotate!
    elsif direction == 'S'
      @direction.rotate!(2)
    elsif direction == 'W'
      @direction.rotate!(-1)
    end
  end

  def read_instruction(instruction)
    instruction = instruction.chars
  end

  def turn(direction)
    if direction == 'R'
      @direction.rotate
    elsif direction == 'L'
      @direction.rotate!(-1)
    end
  end

  def to_s
    "Position: (#{@x}, #{@y})\nDirection: #{@direction[0]}"
  end
end

input1 = "1 2 W"
instructions1 = "LMLMLMLMM"

puts "Enter the first line of input:"
print ">> "
puts input1
# input1 = gets.chomp

puts "Enter the second line of input:"
print ">> "
puts instructions1
# instructions1 = gets.chomp

rover = Rover.new(input1)
rover.read_instruction(instructions1)
