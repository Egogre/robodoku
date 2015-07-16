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
  
  def test_it_knows_range_of_value_positions
    expected = 0..80
    actual = board.positions
    
    assert_equal expected, actual 
  end
  
  def test_it_knows_what_row_for_given_position
    position = 47
    
    expected = 5
    actual = board.row(position)
    
    assert_equal expected, actual 
  end
  
  def test_it_knows_what_column_for_given_position
    position = 47
    
    expected = 2
    actual = board.column(position)
    
    assert_equal expected, actual 
  end
  
  def test_it_knows_what_square_for_given_position
    position = 47
    
    expected = 3
    actual = board.square(position)
    
    assert_equal expected, actual 
  end
  
  def test_it_knows_all_positions_for_given_row
    row = 2
    
    expected = [18, 19, 20, 21, 22, 23, 24, 25, 26]
    actual = board.row_positions(row)
    
    assert_equal expected, actual 
  end 
  
  def test_it_knows_all_positions_for_given_column
    column = 2
    
    expected = [2, 11, 20, 29, 38, 47, 56, 65, 74]
    actual = board.column_positions(column)
    
    assert_equal expected, actual 
  end
  
  def test_it_knows_all_positions_for_given_square
    square = 2
    
    expected = [6, 7, 8, 15, 16, 17, 24, 25, 26]
    actual = board.square_positions(square)
    
    assert_equal expected, actual 
  end
  
  def test_it_rejects_puzzle_for_invalid_placement
    skip
    #when any pre-placed num doesn't follow rules
  end
  
end
