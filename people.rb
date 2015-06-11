class Person
	def initialize(name)
		@name = name
	end

	def greeting
		puts "Hi, my name is #{@name}"
	end
end

class Student < Person
	def initialize(name)
		super(name)
	end

	def learn
		puts "I get it!"
	end
end

class Instructor < Person
	def initialize(name)
		super(name)
	end

	def teach
		puts "Everything in Ruby is an Object."
	end
end

chris = Instructor.new("chris")
chris.greeting