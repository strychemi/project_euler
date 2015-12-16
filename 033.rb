# Digit Canceling Fractions

=begin

The fraction 49/98 is a curious fraction, as an inexperienced mathematician in attempting to simplify it may incorrectly believe that 49/98 = 4/8, which is correct, is obtained by cancelling the 9s.

We shall consider fractions like, 30/50 = 3/5, to be trivial examples.

There are exactly four non-trivial examples of this type of fraction, less than one in value, and containing two digits in the numerator and denominator.

If the product of these four fractions is given in its lowest common terms, find the value of the denominator.

=end

#brute-force method
def digit_cancel_fraction
  #remove trivial numbers
  range = (10..99).to_a.select { |x| x % 10 != 0 }
  results = []

  range.each do |denominator|

    #numerators should be less than denominator
    numerator_range = range.select { |x| x < denominator }

    numerator_range.each do |numerator|

      original = numerator / (denominator * 1.0)
      changed = 0
      #puts "#{numerator} / #{denominator} = #{numerator / (denominator * 1.0)}"

      #original fraction = ab /cd
      a = numerator / 10
      b = numerator % 10
      c = denominator / 10
      d = denominator % 10

      #if any common digits exits, cancel them and compute the changed fraction
      if a == c
        changed = b / (d * 1.0)
      elsif a == d
        changed = b / (c * 1.0)
      elsif b == c
        changed = a / (d * 1.0)
      elsif b == d
        changed = a / (c * 1.0)
      end

      #compare the original and changed fraction and add fraction to results
      if original == changed
        results.push([numerator, denominator])
      end

    end
  end

  #compute product
  num = 1
  denom = 1
  results.each do |fraction|
    num *= fraction[0]
    denom *= fraction[1]
  end

  product = Rational(num, denom)
  puts product
end

digit_cancel_fraction
