gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './robo2'

class SudokuTest < MiniTest::Test
  attr_reader :sample_puzzle, :solver
  
  def setup
    @sample_puzzle = "1        \n 2       \n  3      \n   4     \n    5    \n     6   \n      7  \n       8 \n        9\n"
    @solver = Solver.new(sample_puzzle)
  end
  
  def test_it_puts_together_the_board #Trivial test
    expected = sample_puzzle
    actual = solver.board
    
    assert_equal expected, actual
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
    
    expected = [2, nil, 3, nil, nil, nil, nil, nil, nil]
    actual = solver.query_row(2)
    
    assert_equal expected, actual 
  end
  
  def test_it_knows_what_values_are_filled_in_column
    # skip
    sample_puzzle[10] = "8"
    sample_puzzle[60] = "2"
    
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
  
  def test_it_rejects_puzzle_for_invalid_number
    #when num exists > row.length
  end
  
  def test_it_rejects_puzzle_for_invalid_placement
    #when any pre-placed num doesn't follow rules
  end

end
