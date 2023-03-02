# frozen_string_literal: true

require_relative './board'
require_relative './player'

# class for Game, wich allows to run the game
class Game
  attr_reader :game_board, :player_1, :player_2, :moves, :current_player
  
  def initialize()
    @game_board = Board.new
    @moves = 1
    start_game
  end

  def game_loop
    while moves <= 9
      move = game_move
      game_board.update_board(current_player.symbol, move)
      if current_player.player_won?(game_board)
        current_player.win_message
        break
      end
      @current_player = change_player
      moves += 1
    end
  end

  def game_move
    move = current_player.player_move
    move = current_player.player_move until 
      game_board.legal_move?(move)
    move
  end

  def start_game
    puts "\nWelcome to Tic Tac Toe!\n\n"
    assign_player_1
    assign_player_2
    game_board.display_board
    game_loop
    tie_message if moves == 10
    want_new_game
  end

  def assign_player_1
    puts "PLayer one, enter your name: "
    player_1 = Player.new(gets.chomp, "X")
    current_player = player_1
    puts "\n"
  end

  def assign_player_2
    puts "PLayer one, enter your name: "
    player_2 = Player.new(gets.chomp, "O")
  end

  def change_player
    current_player == player_1 ? player_2 : player_1
  end

  def tie_message
    puts "It's a tie, no one won!"
  end

  def want_new_game
    puts "\n Would you like to play another game? [Y/N]"
    answer = gets.chomp
    answer = gets.chomp until answer.downcase == "y" ||
      answer.downcase == "n"
    if answer == "y"
      Game.new
    else
      puts "\nGood bye!"
    end
  end
end