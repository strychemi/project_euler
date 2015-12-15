#Smallest multiple

=begin
2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
=end

def gcd(x, y)
  if (y == 0)
    return x
  else
    gcd(y, x%y)
  end
end

def lcm(x, y)
  return x * y / gcd(x, y)
end

final_lcm = 1
(1..20).each do |x|
  final_lcm *= x / gcd(final_lcm, x)
end

puts final_lcm
