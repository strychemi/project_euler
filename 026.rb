# Reciprocal cycles

=begin

A unit fraction contains 1 in the numerator. The decimal representation of the unit fractions with denominators 2 to 10 are given:

1/2	= 	0.5
1/3	= 	0.(3)
1/4	= 	0.25
1/5	= 	0.2
1/6	= 	0.1(6)
1/7	= 	0.(142857)
1/8	= 	0.125
1/9	= 	0.(1)
1/10	= 	0.1
Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It can be seen that 1/7 has a 6-digit recurring cycle.

Find the value of d < 1000 for which 1/d contains the longest recurring cycle in its decimal fraction part.

=end

#full reptend primes
#https://www.ima.umn.edu/~mlwright/docs/cycles_of_digits.pdf

def recip
  puts (0..1000).map { |d|
    (1..d).detect(lambda{0}) { |t| (10 ** t % d) == 1 }#detect requires a lambda/proc as argument, default value of lambda argument is 0 for comparison
  }.each_with_index.max[1] #each_with_index without block returns enumerator with item and index, max is then called and returns the value-index pair of the maximum element in the enumerator, so max[1] returns the index of the maximum value
end

recip
