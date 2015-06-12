# Rover
class Rover
  attr_reader :x, :y

  def initialize(input, plateau)
    input = input.split

    @x = input[0].to_i
    @y = input[1].to_i
    @plateau = plateau

    @direction = ['N', 'E', 'S', 'W']
    direction = input[2]

    if direction == 'E'
      @direction.rotate!
    elsif direction == 'S'
      @direction.rotate!(2)
    elsif direction == 'W'
      @direction.rotate!(-1)
    end

    # checks to see if a rover is already present at the initial coordinates
    if plateau.collide?(self)
      puts "(#{@x}, #{@y}) is occupied by another rover"
      return nil
    # checks to see if the rover is within the range of the plateau
    elsif !plateau.within_range?(self)
      puts "(#{@x}, #{@y}) is not on the plateau"
      return nil
    else
      plateau.add_rover(self)
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
    direction ? @direction.rotate! : @direction.rotate!(-1)
  end

  def move
    if @direction[0] == 'N'
      if @plateau.can_move?(self, "N")
        @y += 1
      end
    elsif @direction[0] == 'E'
      if @plateau.can_move?(self, "E")
        @x += 1
      end
    elsif @direction[0] == 'S'
      if @plateau.can_move?(self, "S")
        @y -= 1
      end
    elsif @direction[0] == 'W'
      if @plateau.can_move?(self, "W")
        @x -= 1
      end
    end
  end

  def to_s
    "#{@x} #{@y} #{@direction[0]}"
  end
end

# Plateau
class Plateau
  attr_reader :x, :y
  attr_accessor :rovers

  def initialize(platform)
    platform = platform.split

    @x = platform[0].to_i
    @y = platform[1].to_i

    @rovers = []
  end

  def add_rover(rover)
    @rovers << rover
  end

  def can_move?(rover, direction)
    if direction == "N"
      return true if rover.y != @y && !collide?(rover, direction)
    elsif direction == "E"
      return true if rover.x != @x && !collide?(rover, direction)
    elsif direction == "S"
      return true if rover.y != 0 && !collide?(rover, direction)
    elsif direction == "W"
      return true if rover.x != 0 && !collide?(rover, direction)
    else
      return false
    end
  end

  # return true if the move wil cause a collision with another rover
  def collide?(rover, direction=nil)
    @rovers.each do |r|
      break if rover.equal?(r)

      if direction == "N"
        return true if r.x == rover.x && r.y == (rover.y + 1)
      elsif direction == "E"
        return true if r.x == (rover.x + 1) && r.y == rover.y
      elsif direction == "S"
        return true if r.x == rover.x && r.y == (rover.y - 1)
      elsif direction == "W"
        return true if r.x == (rover.x - 1) && r.y == rover.y
      elsif direction == nil
        return true if r.x == rover.x && r.y == rover.y
      end
    end

    false
  end

  # returns true if rover can be placed on a valid set of x & y coordinates
  def within_range?(rover)
    return false if rover.x > @x || rover.y > @y

    true
  end
end

plateau = Plateau.new("5 5")

rover1 = Rover.new("1 2 N", plateau)
rover1.read_instruction("LMLMLMLMM")
puts rover1

rover2 = Rover.new("3 3 E", plateau)
rover2.read_instruction("MMRMMRMRRM")
puts rover2

rover3 = Rover.new("4 3 E", plateau)
rover3.read_instruction("RLRLRMMRM")
puts rover3

rover4 = Rover.new("1 5 S", plateau)
rover4.read_instruction("MMMMMRRM")
puts rover4

rover5 = Rover.new("1 5 N", plateau)

rover6 = Rover.new("6 3 W", plateau)

rover7 = Rover.new("2 8 S", plateau)
