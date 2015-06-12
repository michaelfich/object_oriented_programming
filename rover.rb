# Rover
class Rover
  attr_reader :x, :y

  def initialize(input, plateau=nil)
    input = input.split

    @x = input[0].to_i
    @y = input[1].to_i
    @direction = ['N', 'E', 'S', 'W']

    @plateau = plateau
    if plateau.collide?(self)
      puts "(#{@x}, #{@y} is already occupied by another rover"
      return nil
    else
      plateau.add_rover(self)
    end

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
end

plateau = Plateau.new("5 5")

rover1 = Rover.new("1 2 N", plateau)
rover1.read_instruction("LMLMLMLMM")

rover2 = Rover.new("3 3 E", plateau)
rover2.read_instruction("MMRMMRMRRM")

rover3 = Rover.new("4 3 E", plateau)
rover3.read_instruction("RLRLRMMRM")

rover4 = Rover.new("1 5 S", plateau)
rover4.read_instruction("MMMMMRRM")

plateau.rovers.each do |rovers|
  puts rovers
end
