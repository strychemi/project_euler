# Circular primes

=begin

The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.

There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.

How many circular primes are there below one million?

=end

def circular_primes(num)
  circular = []
  #generate primes below num
  primes = eratosthenes(num)
  #for each prime, check for circularity by swapping digits
  primes.each do |x|
    if x < 10
      circular.push(x)
    else
      digits = x.to_s.chars.map(&:to_i)
      #this lines helps for optimization:
      #if a prime has a 2 or 5 in its digits, cycling will eventually lead to
      # a number divisible by 2 or 5
      next if digits.include?(2) || digits.include?(5)
      permutations = digits.length
      test_cases = 0
      permutations.times do
        digits.push(digits.shift)
        number = digits.join.to_i
        test_cases += 1 if is_prime?(number)
      end
      circular.push(x) if test_cases == permutations
    end

  end
  puts circular.length
end

#sieve of eratosthenes from problem 10
def eratosthenes(limit)
  nlist = [nil, nil, *2..limit]
  (2..Math.sqrt(limit)).each do |x|
    (x ** 2..limit).step(x) { |y| nlist[y] = nil } if nlist[x]
  end
  nlist.compact!
end

#prime checker from problem 7
def is_prime?(x)
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

circular_primes(1000000)
