#10001st prime

=begin
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

What is the 10 001st prime number?
=end

def generate_primes(nth)
  prime_counter = 2
  i = 1
  a = 6*i - 1
  b = 6*i + 1

  while prime_counter < nth

    if is_prime?(a)
      prime_counter += 1
      return a if prime_counter == nth
    end

    if is_prime?(b)
      prime_counter += 1
      return b if prime_counter == nth
    end

    i += 1
    a = 6*i - 1
    b = 6*i + 1
  end

end

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

puts generate_primes(10001)
