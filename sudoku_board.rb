class SudokuBoard
  attr_reader :puzzle
  attr_accessor :flat_map
  
  def initialize(puzzle)
    @puzzle = puzzle
    @flat_map = puzzle.gsub("\n", "")
  end
  
  def new_board
    puzzle
  end
  
  def query_spot(position)
    spot = flat_map[position].to_i
    spot unless spot == 0
  end
  
  def query_row(row_number)
    row_posisitons(row_number).map do |position| 
      flat_map[position].to_i unless flat_map[position].to_i == 0
    end
  end
  
  private
  
  
  
end
