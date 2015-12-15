#Sum square difference

=begin
The sum of the squares of the first ten natural numbers is,

12 + 22 + ... + 102 = 385
The square of the sum of the first ten natural numbers is,

(1 + 2 + ... + 10)2 = 552 = 3025
Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.

Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
=end

def sum(final)
  return final * (final + 1) / 2
end

def square_sums(final)
  return final * (final + 1) * (2 * final + 1) / 6
end

puts sum(100) ** 2 - square_sums(100)
