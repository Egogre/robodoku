require './solver'

file = ARGV[0]
puzzle = File.read(file)
solver = Solver.new(puzzle)
solution = solver.solve
puts solution
