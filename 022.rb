# Names scores

=begin

Using names.txt (right click and 'Save Link/Target As...'), a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order. Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.

For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of 938 × 53 = 49714.

What is the total of all the name scores in the file?

=end

#ruby implementation of quicksort
def quicksort(array)
  return array if array.length <= 1

  pivot_index = (array.length / 2).to_i
  pivot_value = array[pivot_index]
  array.delete_at(pivot_index)

  lesser = Array.new
  greater = Array.new

  array.each do |x|
    if x <= pivot_value
      lesser.push(x)
    else
      greater.push(x)
    end
  end

  return quicksort(lesser) + [pivot_value] + quicksort(greater)
end

#finds namevalue
def name_val(name)
  letter = Hash["ABCDEFGHIJKLMNOPQRSTUVWXYZ".split("").each_with_index.map { |val, index| [val, index + 1] }]
  name_val = 0
  name.split("").each do |char|
    name_val += letter[char]
  end
  return name_val
end

#calculate sum
file = File.open("names.txt")
contents = file.read.split("\",\"")
contents[0] = "MARY"
contents[-1] = "ALONSO"
sorted_names = quicksort(contents)
sum = 0

sorted_names.each_with_index do |x, i|
  sum += name_val(x) * (i + 1)
end
puts sum
