gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './solver'

class SolverTest < MiniTest::Test
  attr_reader :sample_puzzle, :solver
  
  def setup
    @sample_puzzle = "1        \n 2       \n  3      \n   4     \n    5    \n     6   \n      7  \n       8 \n        9\n"
    @solver = Solver.new(sample_puzzle)
  end
  
  def test_it_knows_a_spot_is_empty #Trivial + 1
    # skip
    expected = nil
    actual = solver.query_spot(12)
    
    assert_equal expected, actual
  end
  
  def test_it_knows_the_value_of_a_filled_in_spot # Trivial + 2
    # skip
    expected = 2
    actual = solver.query_spot(10)
    
    assert_equal expected, actual
  end
  
  def test_it_knows_what_values_are_filled_in_row #Easy Test
    # skip
    sample_puzzle[20] = "2"
    solver = Solver.new(sample_puzzle)
    
    expected = [2, nil, 3, nil, nil, nil, nil, nil, nil]
    actual = solver.query_row(2)
    
    assert_equal expected, actual 
  end
  
  def test_it_knows_what_values_are_filled_in_column
    # skip
    sample_puzzle[10] = "8"
    sample_puzzle[60] = "2"
    solver = Solver.new(sample_puzzle)
    
    expected = [1, 8, nil, nil, nil, nil, 2, nil, nil]
    actual = solver.query_column(0)
    
    assert_equal expected, actual
  end
  
  def test_it_knows_what_values_are_filled_in_square
    # skip
    expected = [4, nil, nil, nil, 5, nil, nil, nil, 6]
    actual = solver.query_square(4)
    
    assert_equal expected, actual
  end
  
  def test_it_knows_what_values_are_still_available_for_empty_spot #First Valuable test
    expected = [1, 2, 3, 4, 5, 6]
    actual = solver.numbers_available(79)
    
    assert_equal expected, actual
  end
  
  def test_it_fills_in_an_empty_spot
    solver.place_number(9, 12)
    
    expected = 9
    actual = actual = solver.query_spot(12)
    
    assert_equal expected, actual
  end

  def test_it_solves_trivial_puzzle
    # skip
    new_puzzle = "826594317\n715638942\n394721865\n163459278\n948267153\n257813694\n531942786\n482176539\n 79385421\n"
    new_solver = Solver.new(new_puzzle)
    
    expected = "826594317\n715638942\n394721865\n163459278\n948267153\n257813694\n531942786\n482176539\n679385421"
    actual = new_solver.solve
    
    assert_equal expected, actual
  end
  
  def test_it_solves_easy_puzzle
    # skip
    new_puzzle = "82659 317\n71563894 \n3  721865\n163459278\n 48267153\n25781 694\n5 1942786\n482176  9\n 7938542 \n"
    new_solver = Solver.new(new_puzzle)
    
    expected = "826594317\n715638942\n394721865\n163459278\n948267153\n257813694\n531942786\n482176539\n679385421"
    actual = new_solver.solve
    
    assert_equal expected, actual
  end
  
  def test_it_solves_harder_easy_puzzle
    # skip
    new_puzzle = "8  5 4  7\n  5 3 9  \n 9 7 1 6 \n1 3   2 8\n 4     5 \n2 78136 4\n 3 9 2 8 \n  2 7 5  \n6  3 5  1\n"
    new_solver = Solver.new(new_puzzle)
    
    expected = "826594317\n715638942\n394721865\n163459278\n948267153\n257813694\n531942786\n482176539\n679385421"
    actual = new_solver.solve
    
    assert_equal expected, actual
  end

end
