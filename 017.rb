#Number letter counts

=begin

If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?

NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.

=end

def letter_count(num)

  letter_count = 0

  (1..num).each do |n|
    letter_count += numtoword(n).length
  end
  return letter_count
end

def numtoword(num)
  numhash = {
    0 => "",
    1 => "one",
    2 => "two",
    3 => "three",
    4 => "four",
    5 => "five",
    6 => "six",
    7 => "seven",
    8 => "eight",
    9 => "nine",
    10 => "ten",
    11 => "eleven",
    12 => "twelve",
    13 => "thirteen",
    14 => "fourteen",
    15 => "fifteen",
    16 => "sixteen",
    17 => "seventeen",
    18 => "eighteen",
    19 => "nineteen",
    20 => "twenty",
    30 => "thirty",
    40 => "forty",
    50 => "fifty",
    60 => "sixty",
    70 => "seventy",
    80 => "eighty",
    90 => "ninety",
    100 => "hundred",
    1000 => "onethousand"
  }

  result = ""

  #return thousand
  if num == 1000
    result += numhash[1000]
  end

  #return hundreds
  if num >= 100 && num < 1000
    result += numhash[(num - num % 100)/100] + numhash[100]
  end

  #if nonzero remainder continue
  if num % 100 > 0 && num > 100
    result += "and"
  end

  if num > 100
    subhundred = num % 100
  else
    subhundred = num
  end
  #return tens
  if subhundred % 10 < 100 && subhundred >= 20 && subhundred < 100
    result += numhash[subhundred - subhundred % 10] + numhash[subhundred % 10]
  elsif subhundred < 20
    result += numhash[subhundred]
  end
  return result
end

puts letter_count(1000)
