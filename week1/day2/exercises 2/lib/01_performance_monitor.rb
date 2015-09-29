require 'time'

def measure times=1
  results = []
  times.times do
    start = Time.now
    yield
    finish = Time.now
    results << finish - start
  end
  
  results.inject(:+) / results.count
end

puts measure(3) {}