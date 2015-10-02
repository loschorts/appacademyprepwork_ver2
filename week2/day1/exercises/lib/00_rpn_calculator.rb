class RPNCalculator
	def initialize
  		@stack = []
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
		archive = @stack.map {|item| item}
	 	result = pop
	 	@stack = archive
	 	result
	end

	def tokens (string)
		string.split(" ").map {|token| 
			%w[+ - * /].include?(token) ? token.to_sym : token.to_i}
	end

	def evaluate (string)
		tokens(string).each do |token|
			case token
			when :+
				@stack << add
			when :-
				@stack << subtract
			when :*
				@stack << multiply
			when :/
				@stack << division
			else
				@stack << token
			end
		end
		value
	end

end

