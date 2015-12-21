# Champernowne's constant

=begin

An irrational decimal fraction is created by concatenating the positive integers:

0.123456789101112131415161718192021...

It can be seen that the 12th digit of the fractional part is 1.

If dn represents the nth digit of the fractional part, find the value of the following expression.

d1 × d10 × d100 × d1000 × d10000 × d100000 × d1000000

=end

=begin
  Brute-force approach was taken here.
=end

def champernowne
  current_digit = 0
  number = 1
  result = 1
  d = [10, 10**2, 10**3, 10**4, 10**5, 10**6]
  while current_digit < 10 ** 6
    digits = number.to_s.length
    (0...digits).each do |n|
      current_digit += 1
      if current_digit == d[0]
        result *= number.to_s[n].to_i
      elsif current_digit == d[1]
        result *= number.to_s[n].to_i
      elsif current_digit == d[2]
        result *= number.to_s[n].to_i
      elsif current_digit == d[3]
        result *= number.to_s[n].to_i
      elsif current_digit == d[4]
        result *= number.to_s[n].to_i
      elsif current_digit == d[5]
        result *= number.to_s[n].to_i
        break
      end
    end
    number += 1
  end

  puts result
end

champernowne
