# Pandigital products

=begin

We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once; for example, the 5-digit number, 15234, is 1 through 5 pandigital.

The product 7254 is unusual, as the identity, 39 × 186 = 7254, containing multiplicand, multiplier, and product is 1 through 9 pandigital.

Find the sum of all products whose multiplicand/multiplier/product identity can be written as a 1 through 9 pandigital.

HINT: Some products can be obtained in more than one way so be sure to only include it once in your sum.

=end

#brute-force approach
def pandigital
  digits = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  product_list = []

  (1..9999).each do |x|
    (1..99).each do |y|
      product = x * y
      pandigital = x.to_s + y.to_s + product.to_s
      if pandigital.length == 9
        identity = pandigital.split("").map(&:to_i)
        if identity & digits == identity
          #puts "#{x} * #{y} = #{product}"
          product_list.push(product)
        end
      end
    end
  end

  #remove duplicate products
  product_list.uniq!
  puts product_list.inject(:+)
end

pandigital
