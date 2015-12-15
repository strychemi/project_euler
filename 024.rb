# Lexicographic permutations

=begin

A permutation is an ordered arrangement of objects. For example, 3124 is one possible permutation of the digits 1, 2, 3 and 4. If all of the permutations are listed numerically or alphabetically, we call it lexicographic order. The lexicographic permutations of 0, 1 and 2 are:

012   021   102   120   201   210

What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?

=end

#brute force method
=begin
digits = [0,1,2,3,4,5,6,7,8,9]
perm = digits.permutation.to_a

puts perm[999999]
=end

#mathy mathod
=begin
for n things, there are n! permutations
there are 9! permutations with 0 at the beginning (362880)
again 9! more with 1 at the beginning (another 362880)
another 9! with 2 at the beginning

Adding up the permutations (362880 * 2 = 725760),
the millionth permutation is when it begins with a 2
725761st permutation = 2013456789
8! = 40320, we have to change the number 7 times (from 0 => 7)
in order to get to the millionth permutation, so 7 is the 2nd number.

continue this pattern until all digits are found
=end

def millionth
  digits = "0123456789"
  solution = ""
  perm_left = 999999

  (0..9).each do |x|
    if x == 9
      perm_count = 1
    else
      perm_count = (1..9-x).inject(:*)
    end
    n = perm_left / perm_count
    solution += digits[n]
    perm_left -= perm_count * n
    digits.delete(digits[n])
  end

  puts solution
end

millionth
