# Quadratic primes

=begin

Euler discovered the remarkable quadratic formula:

n² + n + 41

It turns out that the formula will produce 40 primes for the consecutive values n = 0 to 39. However, when n = 40, 402 + 40 + 41 = 40(40 + 1) + 41 is divisible by 41, and certainly when n = 41, 41² + 41 + 41 is clearly divisible by 41.

The incredible formula  n² − 79n + 1601 was discovered, which produces 80 primes for the consecutive values n = 0 to 79. The product of the coefficients, −79 and 1601, is −126479.

Considering quadratics of the form:

n² + an + b, where |a| < 1000 and |b| < 1000

where |n| is the modulus/absolute value of n
e.g. |11| = 11 and |−4| = 4
Find the product of the coefficients, a and b, for the quadratic expression that produces the maximum number of primes for consecutive values of n, starting with n = 0.
=end

#solved by brute force
def q_primes
  a = 999
  b = 999
  max = 0
  coeff = 0

  (-a..a).each do |x|
    (-b..b).each do |y|
      #start count from 0
      n = 0

      #count primes for particular a, b
      while is_prime?(n ** 2 + x * n + y)
        n += 1
      end

      #save max # of primes for consecutive n
      if n > max
        max = n
        coeff = x * y
        puts "#{x} #{y} #{coeff} #{max}"
      end

    end
  end

end

def is_prime?(x)
  x = x.abs
  return true if x == 2 || x == 3
  return false if x % 2 == 0 || x % 3 == 0
  limit = (x ** 0.5).to_i
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

q_primes
