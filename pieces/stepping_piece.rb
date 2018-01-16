module SteppingPiece

  def moves
    moves = []

    move_steps.each do |step|
      step_x, step_y = step
      pos_x, pos_y = pos
      pos = [step_x + pos_x, step_y = pos_y]

      next unless board.valid_pos?(pos)

      if board.empty?(pos)
        moves << pos
      elsif board[pos].color != color
        moves << pos
      end
    end 
  end

end
