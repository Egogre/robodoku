gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './sudoku_board'

class SudokuBoardTest < MiniTest::Test
  attr_reader :sample_puzzle, :board
  
  def setup
    @sample_puzzle = "1        \n 2       \n  3      \n   4     \n    5    \n     6   \n      7  \n       8 \n        9\n"
    @board = SudokuBoard.new(sample_puzzle)
  end
  
  def test_it_puts_together_the_board #Trivial test
    expected = sample_puzzle
    actual = board.new_board
    
    assert_equal expected, actual
  end
  
  def test_it_knows_a_spot_is_empty #Trivial + 1
    # skip
    expected = nil
    actual = board.query_spot(12)
    
    assert_equal expected, actual
  end
  
  def test_it_knows_the_value_of_a_filled_in_spot # Trivial + 2
    # skip
    expected = 2
    actual = board.query_spot(10)
    
    assert_equal expected, actual
  end
  
  def test_it_knows_what_values_are_filled_in_row #Easy Test
    # skip
    sample_puzzle[20] = "2"
    board = SudokuBoard.new(sample_puzzle)
    
    expected = [2, nil, 3, nil, nil, nil, nil, nil, nil]
    actual = board.query_row(2)
    
    assert_equal expected, actual 
  end
  
end
