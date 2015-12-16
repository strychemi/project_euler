# Truncatable primes

=begin

The number 3797 has an interesting property. Being prime itself, it is possible to continuously remove digits from left to right, and remain prime at each stage: 3797, 797, 97, and 7. Similarly we can work from right to left: 3797, 379, 37, and 3.

Find the sum of the only eleven primes that are both truncatable from left to right and right to left.

NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.

=end

=begin
The approach to this problem is similar to that of problem 35:
Any primes with 2, 5 in their digits will eventually become a composite number (i.e. not prime) when truncated.

Example: 23 => 2 (truncated from right by removing 3 first)

Therefore, any primes containing digits of 2 and 5 can be eliminated.

=end
