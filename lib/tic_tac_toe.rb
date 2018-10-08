#rspec spec/01_tic_tac_toe_spec.rb
WIN_COMBINATIONS = [
 [0, 1, 2],
 [3, 4, 5],
 [6, 7, 8],
 [0, 3, 6],
 [1, 4, 7],
 [2, 5, 8],
 [0, 4, 8],
 [2, 4, 6]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  index = input.to_i - 1
end

def move(board, index, value)
  board[index] = value
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board,index)
  if index.between?(0, 8) && !position_taken?(board, index)
    true
  else
    false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
  elsif !valid_move?(board, index)
  until valid_move?(board, index)
   puts "Please enter 1-9:"
   input = gets
   index = input_to_index(input)
  end
   move(board, index, current_player(board))
 end
 display_board(board)
end

def turn_count(board)
counter = 0
  board.each do |count|
    if count == "X" || count == "O"
      counter += 1
    end
  end
  return counter
end

def current_player(board)
 turn = turn_count(board)
  if turn.even?
    return "X"
  else
    return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |win|
    if board[win[0]] == "X" && board[win[1]] == "X" && board[win[2]] == "X"
      won = true
      return win
    elsif board[win[0]] == "O" && board[win[1]] == "O" && board[win[2]] == "O"
      won = true
      return win
    else
      won = false
    end
    won
  end

end
