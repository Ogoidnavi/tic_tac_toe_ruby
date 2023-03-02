# frozen_string_literal: true

# class for Board
class Board
  attr_reader :board

  def initialize
    @board = Array.new(9) { |n| n + 1 }
  end

  def display_board
    puts "\n
    #{@board[0]} | #{@board[1]} | #{@board[2]}
    --+---+--
    #{@board[3]} | #{@board[4]} | #{@board[5]}
    --+---+--
    #{@board[6]} | #{@board[7]} | #{@board[8]}
    \n"
  end

  def update_board(symbol, location)
    board[location - 1] = symbol
    display_board
  end

  def row_win?(symbol)
    board.values_at(0, 1, 2).all? { |sym| sym == symbol } ||
      board.values_at(3, 4, 5).all? { |sym| sym == symbol } ||
      board.values_at(6, 7, 8).all? { |sym| sym == symbol }
  end

  def column_win?(symbol)
    board.values_at(0, 3, 6).all? { |sym| sym == symbol } ||
      board.values_at(1, 4, 7).all? { |sym| sym == symbol } ||
      board.values_at(2, 5, 8).all? { |sym| sym == symbol }
  end

  def diagonal_win?(symbol)
    board.values_at(0, 4, 8).all? { |sym| sym == symbol } ||
      board.values_at(2, 4, 6).all? { |sym| sym == symbol }
  end

  def legal_move?(location)
    return true if board[location - 1].is_a?(Numeric)
  end
end
