require 'byebug'
require 'pieces'

class Board
  attr_reader :rows
  def initialize(make_grid? = true)
    make_starting_grid(make_grid?)

  end

  def [](pos)
    raise 'Hate to break it to you, but this position is not a thing' unless valid_pos?(pos)

    row, col = pos
    @rows[row][col]
  end

  def []=(pos, piece)
    raise 'Hate to break it to you, but this position is not a thing' unless valid_pos?(pos)

    row, col = pos
    @rows[row][col] = piece
  end

  def empty?(pos)
    self[pos].empty?
  end

  def valid_move?(from_pos, to_pos)
    self[pos].moves(from_pos,dir)
  end

  def move_piece(color, from_pos, to_pos)
    if self[from_pos].is_a?(NullPiece)
      raise "That isnt a piece."
    elsif piece.color != turn.color
      raise "that isn't your piece."
    elsif valid_move?(from_pos, to_pos) == false
      raise "Your piece doesn't move like that."
    else
      move_piece!(from_pos,to_pos)
    end
  end

  def move_piece!(from_pos, to_pos)
    self[to_pos] = self[from_pos]
    self[from_pos] = NullPiece.new(from_pos)
  end

  def make_starting_grid
    @grid = Array.new(8) {Array.new(8) {NullPiece.new}}
  end

end
