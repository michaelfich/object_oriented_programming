# Rover
class Rover
  def initialize(input)
    input = input.split

    @x = input[0].to_i
    @y = input[1].to_i
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
    instructions = instruction.chars

    instructions.each do |i|
      if i == 'M'
        move
      elsif i == 'R'
        turn(true)
      elsif i == 'L'
        turn(false)
      end
    end
  end

  def turn(direction)
    direction ? @direction.rotate : @direction.rotate!(-1)
  end

  def move
    if @direction[0] == 'N'
      @y += 1
    elsif @direction[0] == 'E'
      @x += 1
    elsif @direction[0] == 'S'
      @y -= 1
    elsif @direction[0] == 'W'
      @x -= 1
    end
  end

  def to_s
    "#{@x} #{@y} #{@direction[0]}"
  end
end

input1 = "1 2 N"
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

puts rover