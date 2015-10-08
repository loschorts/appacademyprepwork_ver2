
def run
  __FILE__ == $0 ? dir = './' : dir = ''
  puts File.readlines("#{dir}dictionary.txt")[0..10]
end

run