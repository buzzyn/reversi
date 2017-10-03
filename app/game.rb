require_relative 'board'

class Game
  attr_reader :potential_move, :board

  def initialize(entries)
    @entries = entries
    @potential_move = []
    setup_board
  end

  def start
    @board.draw_board
    greedy_move
  end

  def greedy_move
    max_white_cover = 0
    @entries['black'].each do |bx, bys|

      bx = bx.to_i
      bys.keys.each do |by|

        by = by.to_i

        # try 8 directions
        (-1..1).each do |nx|
          (-1..1).each do |ny|
            level = 1
            white_count = 0

            try_x = bx+(nx*level)
            try_y = by+(ny*level)

            next if outside_board_range(try_x, try_y)
            next if try_x == bx && try_y == by

            # found white piece around black piece
            while !@entries['white'][bx+(nx*level)].nil? && !@entries['white'][bx+(nx*level)][by+(ny*level)].nil?

              white_count += 1
              level += 1
            end

            if white_count > 0

              # can place black piece?
              if @entries['black'][bx+(nx*level)].nil? || @entries['black'][bx+(nx*level)][by+(ny*level)].nil?

                if white_count > max_white_cover # only keep the most greedy move
                  max_white_cover = white_count
                  @potential_move = [bx+(nx*level), by+(ny*level)]
                end
              end
            end
          end
        end
      end
    end
  end

  private

  def setup_board
    @board = Board.new(@entries['data'])
  end

  def outside_board_range(x_in, y_in)
    return (x_in < 0 || x_in > 7 || y_in < 0 || y_in > 7) ? true : false
  end
end