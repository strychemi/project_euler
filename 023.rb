# Non-abundant sums

=begin

A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.

As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.

Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.

=end

#returns array of proper divisors of num
def proper_divisors(num)
  proper_divisors = []
  numsqrt = (num ** 0.5)
  proper_divisors.push(1)
  (2..numsqrt.to_i).each do |f|
    if num % f == 0
      if f == numsqrt
        proper_divisors.push(f)
      else
        proper_divisors.push(f)
        proper_divisors.push(num / f)
      end
    end
  end
  return proper_divisors.sort!
end

#list of abundant numbers below limit
abundant = []
limit = 28123
(1..limit).each do |x|
  abundant.push(x) if x < proper_divisors(x).inject(:+)
end

#list of numbers that are sum of 2 abundant numbers
two_abund = []
abundant.each do |x|
  abundant[abundant.index(x)..abundant.length-1].each do |y|
    sum = x + y
    break if sum > limit
    two_abund.push(sum)
  end
end

#obtains list of nums not sum of 2 abundant nums
not_abund = (1..limit).to_a - two_abund
puts not_abund.inject(:+)
