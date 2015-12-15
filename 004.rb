#Largest palindrome product

=begin
A palindromic number reads the same both ways.
The largest palindrome made from the product of two 2-digit numbers is
9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.
=end

def check_palindrome?(number)
  str = number.to_s
  str == str.reverse
end

def generate_numbers(digits)
  largest = 0
  max = 0
  temp = 0

  for x in 1..digits
    max += 9 * ( 10 ** ( x - 1 ) )
  end

  for n in max.downto(100)
    for m in max.downto(100)
      temp = n * m
      largest = temp if check_palindrome?(temp) && temp > largest
    end
  end

  return largest
end

puts generate_numbers(3)
