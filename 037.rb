# Truncatable primes

=begin

The number 3797 has an interesting property. Being prime itself, it is possible to continuously remove digits from left to right, and remain prime at each stage: 3797, 797, 97, and 7. Similarly we can work from right to left: 3797, 379, 37, and 3.

Find the sum of the only eleven primes that are both truncatable from left to right and right to left.

NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.


=end

=begin
  I found the bruteforce approach adequate for this problem.
=end

def prime_truncates
  primes = eratosthenes(1000000)
  results = []

  primes.each do |x|
    if x > 10
      truncate_left = x.to_s.chars.map(&:to_i)
      truncate_right = x.to_s.chars.map(&:to_i)
      #puts "#{truncate_left.inspect} #{truncate_right.inspect}"
      num_of_digits = truncate_left.length - 1
      test_cases = 0
      num_of_digits.times do
        truncate_left.shift
        truncate_right.pop
        test_cases += 1 if is_prime?(truncate_left.join.to_i) && is_prime?(truncate_right.join.to_i)
        #puts "#{truncate_left.inspect} #{truncate_right.inspect}"
      end
      results.push(x) if test_cases == num_of_digits
    end
    break if results.length == 11
  end
  puts results.inject(:+)
end

#sieve of eratosthenes from problem 10 and 35
def eratosthenes(limit)
  nlist = [nil, nil, *2..limit]
  (2..Math.sqrt(limit)).each do |x|
    (x ** 2..limit).step(x) { |y| nlist[y] = nil } if nlist[x]
  end
  nlist.compact!
end

#prime checker from problem 7 and 35
def is_prime?(x)
  return false if x == 1
  return true if x == 2 || x == 3
  return false if x % 2 == 0 || x % 3 == 0
  limit = (x ** (1/2.0)).to_i
  i = 1
  a = 6*i - 1
  b = 6*i + 1

  while a <= limit || b <= limit
    return false if x % a == 0 || x % b == 0
    i += 1
    a = 6*i - 1
    b = 6*i + 1
  end

  return true
end

prime_truncates
