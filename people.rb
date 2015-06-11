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

chris = Instructor.new("Chris")
chris.greeting

christina = Student.new("Christina")
christina.greeting

chris.teach
christina.learn

christina.teach # => results in an error when running the program

=begin
Unable to run the 'teach' method on the object 'christina' because it is an
instance of the Student class

The .teach() method is only accessible through instances of the Teacher class,
rather than within the parent class Person, as not all instances of Person will
perform the task of teaching.
=end