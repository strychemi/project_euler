# Digit fifth powers

=begin
Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:

1634 = 14 + 64 + 34 + 44
8208 = 84 + 24 + 04 + 84
9474 = 94 + 44 + 74 + 44
As 1 = 14 is not a sum it is not included.

The sum of these numbers is 1634 + 8208 + 9474 = 19316.

Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.
=end

#brute force approach
def digit_fifth_power
  result = 0
  (2..999999).each do |x|
    sum = x.to_s.chars.map(&:to_i).inject(0) { |result, i| result + (i ** 5) }
    if sum == x
      result += sum
    end
  end
  puts result
end

digit_fifth_power
