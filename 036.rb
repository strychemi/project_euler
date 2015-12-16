# Double-base palindromes

=begin

The decimal number, 585 = 10010010012 (binary), is palindromic in both bases.

Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.

(Please note that the palindromic number, in either base, may not include leading zeros.)

=end

=begin

This problem is quite trivial in ruby with the String#to_s method. Check it's implementation below.

=end
def db_palindrome(num)
  results = []

  (1..num).each do |x|
    #to_s converts to base 10 by default
    digits_baseten = x.to_s
    if digits_baseten == digits_baseten.reverse
      #to_s(2) converts base 10 integer to base 2 string
      digits_basetwo = x.to_s(2)
      results.push(x) if digits_basetwo == digits_basetwo.reverse
    end
  end

  puts results.inject(:+)
end

db_palindrome(1000000)
