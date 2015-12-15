#Lattice paths

=begin
Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.

How many such routes are there through a 20×20 grid?
=end

=begin
initial recursive solution took too long
found it could be solve:
1. dynamic programming
2. pascals triangle

def lattice_paths(x, y)
  return 1 if x == 0 && y == 0
  paths = 0
  paths += lattice_paths(x-1, y) if x > 0
  paths += lattice_paths(x, y-1) if y > 0
  return paths
end

=end

def lattice_paths(grid_size)
  grid = Array.new(grid_size+1) { Array.new(grid_size+1) }
  # for a grid size of N, there are N + 1 grid points
  (0..grid_size).each do |n|
    grid[n][grid_size] = 1
    grid[grid_size][n] = 1
  end

  (grid_size-1).downto(0) do |n|
    (grid_size-1).downto(0) do |m|
      grid[n][m] = grid[n + 1][m] + grid[n][m + 1]
    end
  end

  return grid[0][0]
end

puts lattice_paths(20)
