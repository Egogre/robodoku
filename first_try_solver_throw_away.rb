class Solver
  attr_accessor :flat_map, :row, :column, :square

  def board(puzzle)
    puzzle #eventually put in code to make it look "pretty"
  end
  
  def find_square(position)
    row_sub_1 = (find_row(position) / 3) * 3
    column_sub_1 = find_column(position) / 3
    @square = row_sub_1 + column_sub_1
      # row = position / 9
      # column = position % 9
      # row_sub_1 = (row / 3) * 3
      # column_sub_1 = column / 3
  end
  
  def find_row(position)
    @row = position / 9
  end
  
  def find_column(position)
    @column = position % 9
  end
  
  def board_map(puzzle)
    puzzle.split("\n")
  end
  
  def flatten_map(puzzle)
    @flat_map = puzzle.gsub("/n", "")
  end
  
  def query_spot(puzzle, x_coordinate, y_coordinate)
    spot = (board_map(puzzle)[y_coordinate])[x_coordinate]
    if spot == " "
      "empty"
    else
      spot.to_i
    end
  end
  
  def query_row(puzzle, y_coordinate)
    row = board_map(puzzle)[y_coordinate]
    row_values = row.split("")
    row_used_numbers = []
    row_values.each do |value|
      if value.to_i > 0
        row_used_numbers << value.to_i
      end
    end
    row_used_numbers
  end
  
  def query_column(puzzle, x_coordinate)
    column_values = board_map(puzzle).map { |row| row[x_coordinate].to_i}
    column_used_values = column_values.select { |value| value > 0}
  end
  
  def query_square(puzzle, section)
    puzzle_numbers = flatten_map(puzzle)
    positions = 0..(puzzle_numbers.length) -1
    positions.select { |position| find_square(position) == section }
    numbers_in_square = []
    positions.each do |position|
      if puzzle_numbers[position] > 0
        numbers_in_square << puzzle_numbers[position]
      end
    end
  end

end



# file = ARGV[0]
# puzzle = File.read(file)
# solver = Solver.new
# solution = solver.solve(puzzle)
# puts solution
