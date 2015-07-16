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
  
  def test_it_rejects_puzzle_for_invalid_placement
    skip
    #when any pre-placed num doesn't follow rules
  end
  
end
