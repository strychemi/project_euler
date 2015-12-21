# Pandigital prime

=begin

We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is also prime.

What is the largest n-digit pandigital prime that exists?

=end

=begin

  For pandigital numbers from 1 to 9 digits, we can use a neat divisibility rule to eliminate computation time.

  If the sum of the digits is dibisible by 3, then the number itself is divisible by 3. Therefore:

  1+2+3+4+5+6+7+8+9 = 45 (9 digit pandigitals are not prime)

  1+2+3+4+5+6+7+8 = 36 (8 digit pandigitals are not prime)

  1+2+3+4+5+6+7 = 28 (7 digit pandigitals ARE PRIME)

  1+2+3+4+5+6 = 21 (6 digit pandigitals are not prime)

  1+2+3+4+5 = 15 (5 digit pandigitals are not prime)

  1+2+3+4 = 10 (4 digit pandigitals ARE PRIME)

  1+2+3 = 6 (3 digit pandigitals are not prime)

  1+2 = 3 (2 digit pandigitals are not prime)

  Strategy: generate primes up to 7 digits long, then check only the 4 and 7 digit pandigital ones along the way.

=end

def pandigital_prime
  #upper limit of pandigital 7 digit numbers
  upper_limit = 7654321
  #generate primes up to and including 7 digits long
  primes = eratosthenes(upper_limit)
  #cut out anything 7 digits
  seven = primes.select { |x| x.to_s.length == 7 }.reverse
  pandigital_seven = [1,2,3,4,5,6,7]
  #check for pandigitals among 7
  seven.each do |x|
    number = x.to_s.split("").map(&:to_i)
    #check for pandigital condition
    if number & pandigital_seven == number
      puts x
      break
    end
  end

end

#sieve of eratosthenes from problem 10
def eratosthenes(limit)
  nlist = [nil, nil, *2..limit]
  (2..Math.sqrt(limit)).each do |x|
    (x**2..limit).step(x) { |y| nlist[y] = nil } if nlist[x]
  end
  nlist.compact!
end

pandigital_prime
