#Summation of primes

=begin
The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

Find the sum of all the primes below two million.
=end

def eratosthenes(limit)
  nlist = [nil, nil, *2..limit]
  (2..Math.sqrt(limit)).each do |x|
    (x**2..limit).step(x) { |y| nlist[y] = nil } if nlist[x]
  end
  nlist.compact!
end

def sum_primes(primes)
  sum = 0
  primes.each do |x|
    sum += x
  end
  sum
end
puts sum_primes(eratosthenes(2000000))
