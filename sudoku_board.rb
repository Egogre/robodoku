class SudokuBoard
  attr_reader :puzzle
  attr_accessor :flat_map
  
  def initialize(puzzle)
    @puzzle = puzzle
    @flat_map = puzzle.gsub("\n", "")
  end
  
  def new_board
    puzzle #eventually make it pretty?
  end
  
  def current_board
    "#{flat_map[0..8]}\n#{flat_map[9..17]}\n#{flat_map[18..26]}\n#{flat_map[27..35]}\n#{flat_map[36..44]}\n#{flat_map[45..53]}\n#{flat_map[54..62]}\n#{flat_map[63..71]}\n#{flat_map[72..80]}\n"
  end
  
  def positions
    0..(flat_map.length - 1)
  end
  
  def valid_numbers
    [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end
  
  def row(position)
    position / 9
  end
  
  def column(position)
    position % 9
  end
  
  def square(position)
    row_sub_1 = (row(position) /3) * 3
    column_sub_1 = column(position) / 3
    row_sub_1 + column_sub_1
  end
  
  def row_posisitons(row_number)
    positions.select { |position| (position / 9) == row_number}
  end
  
  def column_positions(column_number)
    positions.select { |position| (position % 9) == column_number}
  end
  
  def square_positions(square_number)
    positions.select do |position|
      square(position) == square_number
    end
  end
  
end
