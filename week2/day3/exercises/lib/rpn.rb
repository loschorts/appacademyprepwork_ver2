class RPNCalculator
	def initialize
  		@stack = []
  end
  
  def self.live_input
  	calc = RPNCalculator.new
  	puts 'Input number or [+ - * /]; Enter Again When Done'
  	line = :start
  	until line.empty?
  		line = gets.chomp
  		calc.evaluate(line)
  	end
  	puts calc.value
  end

  def self.from_file filename
  	File.readlines(filename).each do |line|
  		puts RPNCalculator.new.evaluate(line.chomp)
  	end
  end

	def push arg
	  	@stack << arg
	end

	def pop
		raise "calculator is empty" if @stack.empty?
	  	@stack.pop
	end

	def plus
	  	@stack << add
	end

	def minus
		@stack << subtract
	end

	def times
		@stack << multiply
	end

	def divide
		@stack << division
	end

	def add
	  	pop + pop
	end

	def subtract
		num2 = pop
		num1 = pop
	  num1 - num2
	end

	def multiply
		pop * pop
	end

	def division
		num2 = pop
		num1 = pop
		num1.to_f / num2
	end

	def value
		@stack.last
	end

	def evaluate (string)
		string.split(" ").each do |token|
			case token
			when "+"
				push add
			when "-"
				push subtract
			when "*"
				push multiply
			when "/"
				push division
			else
				push token.to_i
			end
		end
		value
	end

end

if __FILE__ == $PROGRAM_NAME
	if ARGV.empty?
		RPNCalculator.live_input
	else
		RPNCalculator.from_file(ARGV[0])
	end
end
