def add x, y
  x + y
end

def subtract x, y
  x - y
end

def sum array
  array.inject(0) {|sum, num| sum+num}
end

def multiply *factors
  factors.inject(1) {|prod, factor| prod * factor}
end

def power root, exponent
  result = 1
  exponent.times do
    result *= root
  end
  result
end

def factorial num
  1.upto(num).inject(1) {|prod, factor| prod * factor}
end
