# Pandigital multiples

=begin

Take the number 192 and multiply it by each of 1, 2, and 3:

192 × 1 = 192
192 × 2 = 384
192 × 3 = 576
By concatenating each product we get the 1 to 9 pandigital, 192384576. We will call 192384576 the concatenated product of 192 and (1,2,3)

The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 4, and 5, giving the pandigital, 918273645, which is the concatenated product of 9 and (1,2,3,4,5).

What is the largest 1 to 9 pandigital 9-digit number that can be formed as the concatenated product of an integer with (1,2, ... , n) where n > 1?

=end

=begin

  Simple brute force method in ruby.

=end

def pandigital_multiples
  pandigital = [1,2,3,4,5,6,7,8,9]
  num = 1
  array = [1,2,3,4,5]
  results = []
  product = array.map{ |x| num * x }.map(&:to_s).join

  while array.length > 1
    product = array.map{ |x| num * x }.map(&:to_s).join
    if product.length == 9
      product_digits = product.split("").map(&:to_i)
      #puts "#{num} #{array}" if product_digits & pandigital == product_digits
      results.push(product) if product_digits & pandigital == product_digits
    elsif product.length > 9
      array.pop
      num = 0
    end
    num += 1
  end

  puts results.max
end

pandigital_multiples
