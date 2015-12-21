# Integer right triangles

=begin

If p is the perimeter of a right angle triangle with integral length sides, {a,b,c}, there are exactly three solutions for p = 120.

{20,48,52}, {24,45,51}, {30,40,50}

For which value of p ≤ 1000, is the number of solutions maximised?

=end

=begin
  Brute-force approach was taken here.
  If p = a + b + c and a <= b < c, then a < p/3 and b < p/2.
  So having these upper limits helps reduce computation time.
  Algorithm is still quite slow, but works.
=end

def int_right_triangles(num)
  triplets = Hash.new(0)

  (3..num).each do |perimeter|
    (1..(perimeter/3)).each do |a|
      (a..(perimeter/2)).each do |b|
        c = perimeter - a - b
        if a**2 + b**2 == c**2
          triplets[perimeter] += 1
        end
      end
    end
  end

  puts triplets.max_by { |key, value| value }[0]

end


int_right_triangles(1000)
