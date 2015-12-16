# Digit factorials

=begin

145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.

Find the sum of all numbers which are equal to the sum of the factorial of their digits.

Note: as 1! = 1 and 2! = 2 are not sums they are not included.

=end

=begin
  Two Tips:
  1. Find the upper limit of numbers to check
      Since 9! = 362880, the highest 7-digit num has 7 digits:
      9999999 = 2540160 (7 digits)
      An 8-digit number also has 7 digits, so 2540160 is our limit.

  2. Don't forget to add 0! to sum of digit factorials!!
  3. To speed up the calculation time:
      Cache the factorials by precalculating them!
=end
def digit_factorials
  total_sum = 0
  factorial = (0..9).to_a
  #precalculate factorials here
  factorial.map! do |x|
    #if x is not 0, calculate factorial of digit else 0! = 1
    x != 0 ? (1..x).inject(:*) : 1
  end

  (10..2540161).each do |x|
    temp_sum = 0
=begin
This method takes a lot longer to run, refactored it below
    #split the number into a digit array
    digits = x.to_s.split("").map(&:to_i)

    #compute factorial for each digit and sum them
    digits.each do |x|
      #factorial in one line!
      temp_sum += factorial[x]
    end
=end
    #compute factorial for each digit and sum them
    current = x
    while current > 0
      d = current % 10
      current /= 10
      temp_sum += factorial[d]
    end
    
    #check if factorial digit sum equals original number
    if temp_sum == x
      total_sum += temp_sum
      #puts temp_sum
    end
    #puts "#{temp_sum} #{x}"
  end

  puts total_sum
end

digit_factorials
