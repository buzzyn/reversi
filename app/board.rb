require_relative 'square'

class Board
  attr_accessor :grid, :entries

  def initialize(entries)
    @x = 8
    @y = 8
    @grid = Array.new(@x) { Array.new(@y) {Square.new('.')}}
    @entries = entries
    initial_board
  end

  def draw_board
    @grid.each do |row|
      row.each { |cell| print cell.state }
      puts "\n"
    end
  end

  private

  def initial_board
    @entries.each do |e|
      @grid[e.x.to_i][e.y.to_i].set_contents(e.piece)
    end
  end
end