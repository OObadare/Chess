module SlidingPiece

  HORIZONTAL_MOVES = [
    [0, 1],
    [1,0],
    [0, -1]
    [-1,0]
  ]

  DIAGONAL_MOVES = [
    [1,1],
    [-1,1],
    [1,-1],
    [-1,-1]
  ]

  def moves
    moves = []


  end

  def find_moves(dx, dy)
    moves = []
    pos_x, pos_y = pos

    while pos_x < 8 && pos_y < 8
      pos_x = pos_x + dx
      pos_y = pos_y + dy

      pos = [pos_x, pos_y]

      if board.valid_move? == false
        break
      elsif board.empty?(pos)
        moves << pos
      elsif board[pos].color != color
        moves << pos
      end
      break
    end
    return moves
  end

end
