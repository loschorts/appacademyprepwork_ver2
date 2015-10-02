def shuffle_file
  puts Dir.pwd
  puts Dir.entries(".").sort
  print "Enter filename: "
  filename = gets.chomp
  
  file = File.readlines(filename)
  
  File.open("#{filename}-- shuffled.txt", 'w') do |f|
    f.puts file.shuffle
  end
end

shuffle_file if __FILE__==$0