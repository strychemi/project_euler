# Factorial digit sum

=begin

n! means n × (n − 1) × ... × 3 × 2 × 1

For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

Find the sum of the digits in the number 100!

=end

def factorial_digit_sum(num)
  result = 1
  num.downto(1) do |x|
    result *= x
  end

  result = result.to_s.split("").map(&:to_i).inject { |sum, iterator| sum += iterator }
  puts result
end

factorial_digit_sum(100)
