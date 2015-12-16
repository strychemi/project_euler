# Circular primes

=begin

The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.

There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.

How many circular primes are there below one million?

=end

def circular_primes

end

#sieve of eratosthenes from problem 10
def eratosthenes(limit)
  nlist = [nil, nil, *2..limit]
  (2..Math.sqrt(limit)).each do |x|
    (x**2..limit).step(x) { |y| nlist[y] = nil } if nlist[x]
  end
  nlist.compact!
  puts nlist.inspect
end

eratosthenes(1000000)
