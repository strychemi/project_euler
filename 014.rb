#Longest Collatz sequence

=begin
The following iterative sequence is defined for the set of positive integers:

n → n/2 (n is even)
n → 3n + 1 (n is odd)

Using the rule above and starting with 13, we generate the following sequence:

13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

Which starting number, under one million, produces the longest chain?

Note: Once the chain starts the terms are allowed to go above one million.
=end

def find_collatz(limit)
  current = 1
  current_length = 0
  longest_number = 0
  longest_length = 0

  while current < limit
    temp = current

    while temp > 1
      if temp % 2 == 0
        temp /= 2
      else
        temp = temp * 3 + 1
      end
      current_length += 1
    end

    if current_length > longest_length
      longest_length = current_length
      longest_number = current
    end

    current_length = 0
    current += 1
  end

  return longest_number
end

puts find_collatz(1000000)
