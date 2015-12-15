# Maximum path sum 1

=begin


By starting at the top of the triangle below and moving to adjacent numbers on the row below, the maximum total from top to bottom is 23.

3
7 4
2 4 6
8 5 9 3

That is, 3 + 7 + 4 + 9 = 23.

Find the maximum total from top to bottom of the triangle below:

75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23

NOTE: As there are only 16384 routes, it is possible to solve this problem by trying every route. However, Problem 67, is the same challenge with a triangle containing one-hundred rows; it cannot be solved by brute force, and requires a clever method! ;o)

=end

def path_sum()
  triangle = "75
              95 64
              17 47 82
              18 35 87 10
              20 04 82 47 65
              19 01 23 75 03 34
              88 02 77 73 07 63 67
              99 65 04 28 06 16 70 92
              41 41 26 56 83 40 80 70 33
              41 48 72 33 47 32 37 16 94 29
              53 71 44 65 25 43 91 52 97 51 14
              70 11 33 28 77 73 17 78 39 68 17 57
              91 71 52 38 17 14 91 43 58 50 27 29 48
              63 66 04 68 89 53 67 30 73 16 69 87 40 31
              04 62 98 27 23 09 70 98 73 93 38 53 60 04 23".split("\n")
  #convert str to int array
  triangle = triangle.map { |row| row.split(" ").map(&:to_i) }

  #Add the highest sums from buttom row up to top
  #"preprocess" without having to try routes
  #find highest sum between 63 and it's adjacent elements 04 and 62
  #process it for the row and keep moving up

  (triangle.length-1).downto(1) do |row|
    triangle[row-1].each_with_index.map do |element, index|
      if triangle[row][index] > triangle[row][index+1]
        triangle[row-1][index] += triangle[row][index]
      else
        triangle[row-1][index] += triangle[row][index+1]
      end
    end
  end

  print_array(triangle)
end

#method for printing 2D array
def print_array(array)
  array.each do |row|
    row.each do |ele|
      print "#{ele} "
    end
    puts
  end
end
path_sum()
