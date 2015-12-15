# Number spiral diagonals

=begin

Starting with the number 1 and moving to the right in a clockwise direction a 5 by 5 spiral is formed as follows:

21 22 23 24 25
20  7  8  9 10
19  6  1  2 11
18  5  4  3 12
17 16 15 14 13

It can be verified that the sum of the numbers on the diagonals is 101.

What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed in the same way?

=end

#the sequence of the diagonal numbers are
# 1, [3,5,7,9], [13,17,21,25], [31,37,43,49], etc.
# 1x1,    3x3,        5x5,        7x7,    etc.
def num_spiral
  sum = 0
  seq = [1]
  step = 2

  #build sequence by building spiral n x n
  (3..1001).step(2) do |n|

    #generate the 4 diagonal nums for n x n
    4.times { seq.push(seq[-1] + step) }

    #increase step size for sequence
    step += 2
  end

  #sum the diagonals
  puts seq.inject(:+)
end

num_spiral
