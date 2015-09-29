#!/usr/bin/env ruby

def say_hello(name)
  puts "Hello, #{name}!"
end

if $PROGRAM_NAME == __FILE__
  name = gets.chomp
  say_hello name
end
