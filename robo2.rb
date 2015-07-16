class Solver
  require './sudoku_board'
  attr_reader :board
  
  def initialize(puzzle)
    @board = SudokuBoard.new(puzzle)
  end
  
  def solve
    while board.flat_map.match(" ")
      fill_in_known_values
    end
    board.current_board
  end

  def query_spot(position)
    spot_number(position) unless spot_empty?(position)
  end
  
  def query_row(row_number)
    board.row_posisitons(row_number).map do |position| 
      query_spot(position)
    end
  end
  
  def query_column(column_number)
    board.column_positions(column_number).map do |position|
      query_spot(position)
    end
  end
  
  def query_square(square_number)
    board.square_positions(square_number).map do |position|
      query_spot(position)
    end
  end
  
  def numbers_available(position)
      a = board.valid_numbers 
      b = query_row(board.row(position))
      c = query_column(board.column(position))
      d = query_square(board.square(position))
      a - b - c - d
  end

  def place_number(number, position)
    board.flat_map[position] = "#{number}"
  end
  
  private
  
  def spot_number(position)
    board.flat_map[position].to_i
  end
  
  def spot_empty?(position)
    spot_number(position) == 0
  end
  
  def only_one_number_available_for_a_position?(position)
    query_spot(position) == nil && numbers_available(position).length == 1
  end
  
  def place_known_value_for_spot(position)
    if only_one_number_available_for_a_position?(position)
      place_number(numbers_available(position)[0], position)
    end
  end
  
  def fill_in_known_values
    board.positions.map do |position|
      place_known_value_for_spot(position)
    end
  end
  
end

# file = ARGV[0]
# puzzle = File.read(file)
# solver = Solver.new(puzzle)
# solution = solver.solve
# puts solution
