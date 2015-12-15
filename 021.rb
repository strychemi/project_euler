# Amicable numbers

=begin

Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called amicable numbers.

For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

Evaluate the sum of all the amicable numbers under 10000.

=end

def amicable(num)
  pairs = Array.new
  proper_divisors = Array.new(num + 1) { Array.new }
  proper_sums = Array.new(num + 1)
  proper_divisors[0] = [0]
  proper_divisors[1] = [0]
  proper_sums[0] = 0
  proper_sums[1] = 0
  sum = 0

  #find proper divisors for all number from 2 to num
  #and determine the sum of proper divisors for each num
  (2..num).each do |x|
    numsqrt = (x ** 0.5)
    proper_divisors[x].push(1)
    (2..numsqrt.to_i).each do |f|
      if x % f == 0
        if f == numsqrt
          proper_divisors[x].push(f)
        else
          proper_divisors[x].push(f)
          proper_divisors[x].push(x / f)
        end
      end
    end
    proper_divisors[x] = proper_divisors[x].sort
    proper_sums[x] = proper_divisors[x].inject(:+)
  end

  #find all the amicable pairs
  (2..num).each do |x|
    var_a = x
    var_b = proper_sums[x]
    if var_a == proper_sums[var_b] && var_a != var_b
      pairs.push(var_a)
    end
  end
  
  puts pairs.inject(:+)
end

def print_array(array)
  array.each_with_index { |x, index| puts "#{index} #{x}"}
end
amicable(10000)
