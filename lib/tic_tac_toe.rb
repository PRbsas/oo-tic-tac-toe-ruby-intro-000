class TicTacToe

  def initialize
    @board = Array.new(9, " ")
  end


  WIN_COMBINATIONS = [
    [0, 1, 2], #top_row
    [3, 4, 5], #middle_row
    [6, 7, 8], #bottom_row
    [0, 3, 6], #left_column
    [1, 4, 7], #middle_column
    [2, 5, 8], #right_column
    [0, 4, 8], #diagonal_1
    [2, 4, 6]  #diagonal_2
  ]


  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end


  def input_to_index(input)
    input.to_i - 1
  end


  def move(index, player)
    @board[index] = player
  end


  def position_taken?(index)
    @board[index] != " "
  end


  def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index)
  end


  def turn_count
    @board.count {| occupied | occupied == "X" || occupied == "O" }
  end


  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end


  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end


  def won?
    WIN_COMBINATIONS.detect do | win_combination |
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        win_combination
      else
        false
      end
    end
  end


  def full?
    @board.all? { | i | i != " " }
  end


  def draw?
    full? && !won?
  end


  def over?
    won? || full? || draw?
  end


  def winner
    if winner = won?
      @board[winner[0]]
    end
  end


  def play
    while !over?
      turn
    end

    if winner
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end


end
