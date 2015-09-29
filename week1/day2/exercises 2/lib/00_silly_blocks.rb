def reverser
  yield.split(' ').map do |word|
    word.reverse
  end.join(' ')
end

def adder num=1
  num + yield
end

def repeater times=1
  times.times {yield}
  
end