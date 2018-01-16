require 'colorize'
require_relative 'board'
require_relative 'cursor'

class Display

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)

  def render(board)
      system('clear')
      (0..7).each do |row|
        (0..7).each do |col|
          pos = [row,col]
          space = "something's horribly wrong"
          if board[pos].is_a?(NullPiece)
            space = '|_|'
          elsif board[pos].is_a?(Piece)
            space = '|p|'
          end

          if @cursor.cursor_pos == pos
            if @cursor.selected
              space = space.colorize(:color => :white, :background => :red)
            else
              space = space.colorize(:color => :white, :background => :black)
            end
          end
          print space
        end
        puts ""
      end
    end
  end


end
