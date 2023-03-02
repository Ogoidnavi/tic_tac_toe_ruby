# frozen_string_literal: true

require_relative './board'

# Class for Player
class ClassName
  attr_reader :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end

  def player_move
    puts "#{@name}, where would you like to play?"
    location = gets.chomp until location.to_i.between?(1, 9)
    location.to_i
  end

  def player_won?(board)
    board.row_win?(symbol) || board.column_win?(symbol) ||
      board.diagonal_win?(symbol)
  end

  def win_message
    puts "Congratulations #{@name}, you won the game!!!"
  end
end
