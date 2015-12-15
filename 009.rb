#Special Pythagorean triplet

=begin
A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

a2 + b2 = c2
For example, 32 + 42 = 9 + 16 = 25 = 52.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.
=end

def is_pt?(a, b, c)
    return a ** 2 + b ** 2 == c ** 2
end

def pt_product(perimeter)
  (1..(perimeter/3)).each do |a|
    (a..(perimeter/2)).each do |b|
      c = perimeter - a - b
      return a*b*c if is_pt?(a, b, c)
    end
  end
end

puts pt_product(1000)
