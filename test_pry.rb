require 'pry'

# def test
#   puts "Hello, David"
#   puts "Hey, Bodnok"
#   binding.pry
#   puts "Test Done 👍"
# end

# test

def plus_two(num)
  num + 2
  binding.pry
  num
end

plus_two(1)