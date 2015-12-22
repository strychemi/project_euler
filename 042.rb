# Coded triangle numbers

=begin

The nth term of the sequence of triangle numbers is given by, tn = ½n(n+1); so the first ten triangle numbers are:

1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

By converting each letter in a word to a number corresponding to its alphabetical position and adding these values we form a word value. For example, the word value for SKY is 19 + 11 + 25 = 55 = t10. If the word value is a triangle number then we shall call the word a triangle word.

Using words.txt (right click and 'Save Link/Target As...'), a 16K text file containing nearly two-thousand common English words, how many are triangle words?

=end

def triangle_sequence(nth)
  sequence = []
  (1..nth).each do |x|
    sequence.push( x * (x + 1) / 2 )
  end
  return sequence
end

#finds word value (repurposed method from problem 22)
def word_val(word)
  letter = Hash["ABCDEFGHIJKLMNOPQRSTUVWXYZ".split("").each_with_index.map { |val, index| [val, index + 1] }]
  word_val = 0
  word.split("").each do |char|
    word_val += letter[char]
  end
  return word_val
end

file = File.open("words.txt")
contents = file.read.split("\",\"")
t_word_count = 0
contents[0] = "A"
contents[-1] = "YOUTH"
#this is to figure out the upper bound for triangle sequence
contents.map! { |word| word_val(word) }
#max_val = contents.each_with_index.max[1]
#puts max_val
t_sequence = triangle_sequence(60)
#puts t_sequence.last
contents.each do |x|
  t_word_count += 1 if t_sequence.include?(x)
end
puts t_word_count
