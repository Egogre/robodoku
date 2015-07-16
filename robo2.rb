class Solver
  attr_reader :puzzle
  attr_accessor :flat_map

  
  def initialize(puzzle)
    @puzzle = puzzle
    @flat_map = puzzle.gsub("\n", "")
  end
  
  def solve
    while flat_map.match(" ")
      positions.map do |position|
        if query_spot(position) == nil && numbers_available(position).length == 1
          place_number(numbers_available(position)[0], position)
        end
      end
    end
    current_board
  end
  
  def board
    puzzle #eventually put in code to make it look "pretty"
  end
  
  def current_board
    "#{flat_map[0..8]}\n#{flat_map[9..17]}\n#{flat_map[18..26]}\n#{flat_map[27..35]}\n#{flat_map[36..44]}\n#{flat_map[45..53]}\n#{flat_map[54..62]}\n#{flat_map[63..71]}\n#{flat_map[72..80]}\n"
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
  
  def query_column(column_number)
    column_positions(column_number).map do |position|
      flat_map[position].to_i unless flat_map[position].to_i == 0
    end
  end
  
  def query_square(section_number)
    section_positions(section_number).map do |position|
      flat_map[position].to_i unless flat_map[position].to_i == 0
    end
  end
  
  def numbers_available(position)
    if query_spot(position)
      [query_spot(position)]
    else
      a = valid_numbers 
      b = query_row(row(position))
      c = query_column(column(position))
      d = query_square(section(position))
      a - b - c - d
    end
  end
  
  def place_number(number, position)
    flat_map[position] = "#{number}"
  end
  
  private
  
  def positions
    0..(flat_map.length - 1)
  end
  
  def row(position)
    position / 9
  end
  
  def column(position)
    position % 9
  end
  
  def section(position)
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
  
  def section_positions(section_number)
    positions.select do |position|
      section(position) == section_number
    end
  end
  
  def valid_numbers
    [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end
  
  def numbers_remaining_in_row(position)
    valid_numbers - query_row(row(position))
  end
  
  def numbers_remaining_in_column(position)
    valid_numbers - query_column(column(position))
  end
  
  def numbers_remaining_in_section(position)
    valid_numbers - query_square(section(position))
  end
  
end

file = ARGV[0]
puzzle = File.read(file)
solver = Solver.new(puzzle)
solution = solver.solve
puts solution
