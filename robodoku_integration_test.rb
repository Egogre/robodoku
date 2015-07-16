gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './solver'

class RobodokuIntegrationTest < MiniTest::Test

  def test_it_solves_test0_from_file
    puzzle = File.read('./sudoku-sample-puzzles/puzzles/puzzle_0.txt')
    solver = Solver.new(puzzle)
    
    solution = solver.solve
    expected = File.read('./sudoku-sample-puzzles/solutions/puzzle_0.txt')
    
    assert_equal expected, solution
  end
  
  def test_it_solves_test1_from_file
    skip
    puzzle = File.read('./sudoku-sample-puzzles/puzzles/puzzle_1.txt')
    solver = Solver.new(puzzle)
    
    solution = solver.solve
    expected = File.read('./sudoku-sample-puzzles/solutions/puzzle_1.txt')
    
    assert_equal expected, solution
  end

end
