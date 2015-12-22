# Sub-string divisibility

=begin

The number, 1406357289, is a 0 to 9 pandigital number because it is made up of each of the digits 0 to 9 in some order, but it also has a rather interesting sub-string divisibility property.

Let d1 be the 1st digit, d2 be the 2nd digit, and so on. In this way, we note the following:

d2d3d4=406 is divisible by 2
d3d4d5=063 is divisible by 3
d4d5d6=635 is divisible by 5
d5d6d7=357 is divisible by 7
d6d7d8=572 is divisible by 11
d7d8d9=728 is divisible by 13
d8d9d10=289 is divisible by 17

Find the sum of all 0 to 9 pandigital numbers with this property.

=end

=begin
  Recursion is the name of the game here. The "base cases" check for divisibility rules as soon as the appropriate digits are generated saving computation time when possible.
=end
$pandigitals = []

def generate_pandigitals(digit_pool, number)
  #test divisibility rules based on how far the recursion has created a certain permutation of a pandigital
  if number.length == 1 && number == "0"
    return
  elsif number.length == 4
    num = number[-3..-1].to_i
    return if num % 2 != 0
  elsif number.length == 5
    num = number[-3..-1].to_i
    return if num % 3 != 0
  elsif number.length == 6
    num = number[-3..-1].to_i
    return if num % 5 != 0
  elsif number.length == 7
    num = number[-3..-1].to_i
    return if num % 7 != 0
  elsif number.length == 8
    num = number[-3..-1].to_i
    return if num% 11 != 0
  elsif number.length == 9
    num = number[-3..-1].to_i
    return if num % 13 != 0
  elsif number.length == 10
    num = number[-3..-1].to_i
    return if num % 17 != 0
    $pandigitals.push(number)
  end
    digit_pool.each do |x|
      generate_pandigitals(digit_pool - [x], number + x)
    end
  #end
end

generate_pandigitals(["0","1","2","3","4","5","6","7","8","9"], "")
puts $pandigitals
puts $pandigitals.map(&:to_i).inject(:+)
