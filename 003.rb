#Largest prime factor

=begin
The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?
=end

def larget_prime_factor(n)
  temp = n
  largest = 0
  div = 2

  while temp >= div * div
    if temp % div == 0
      temp /= div
    else
      div += 1
    end
  end

  largest = temp if temp > largest
  return largest
end

puts larget_prime_factor(600851475143)
