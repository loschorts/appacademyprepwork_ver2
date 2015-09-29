class Temperature
	
	def initialize (option)
		if option[:f]
			@f = option[:f]
			@c = self.class.ftoc(@f)
		elsif option[:c]
			@c = option[:c]
			@f = self.class.ctof(@c)
		end
	end

	def self.from_celsius(c)
	  self.new(c: c)
	end
	
	def self.from_fahrenheit(f)
	  self.new(f: f)
	end

	def in_celsius
		@c
	end

	def in_fahrenheit
		@f
	end
	
	def self.ftoc(f)
	  (f.to_f-32) * 5/9
	end
	
	def self.ctof(c)
	  (c.to_f * 9/5) + 32
	end
end

class Celsius < Temperature
  def initialize c
    @c = c
    @f = self.class.ctof(@c)
  end
end

class Fahrenheit < Temperature
  def initialize f
    @f = f
    @c = self.class.ftoc(@f)
  end
end
