#Power digit sum

=begin
215 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

What is the sum of the digits of the number 21000?
=end

def digit_sum(num)
  num_array = num.to_s.split("").map(&:to_i)
  sum = 0
  num_array.each do |n|
    sum += n
  end
  return sum
end

puts digit_sum(2 ** 1000)
