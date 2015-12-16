# Double-base palindromes

=begin

The decimal number, 585 = 10010010012 (binary), is palindromic in both bases.

Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.

(Please note that the palindromic number, in either base, may not include leading zeros.)

=end

def db_palindrome(num)
  results = []

  (1..num).each do |x|
    digits_baseten = x.to_s
    if digits_baseten == digits_baseten.reverse
      digits_basetwo = x.to_s(2)
      results.push(x) if digits_basetwo == digits_basetwo.reverse
    end
  end

  puts results.inject(:+)
end

db_palindrome(1000000)
