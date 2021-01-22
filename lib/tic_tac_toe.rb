require 'pry'
class TicTacToe

 attr_accessor :board
 WIN_COMBINATIONS = [
     [0,1,2],
     [3,4,5],   
     [6,7,8],

     [0,3,6],
     [1,4,7],
     [2,5,8],
     [0,4,8],
     [2,4,6]
 ]

    def initialize
        @board = Array.new(9," ")
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input) #Returns Int
        index = input.to_i - 1
    end

    def move(index, token = "X") #Returns "X" or "O"
        self.board[index] = token
    end

    def position_taken?(index) #Returns true or false
        self.board[index] == " " ? false : true
    end

    def valid_move?(index)
        position_taken?(index) ? false : true if (0..8).to_a.include?(index)
    end

    def turn_count
        self.board.count{|t| t == "X" || t == "O"}
    end

    def current_player
        self.turn_count.even? ? "X" : "O"
    end

    def turn
        token = self.current_player
        puts "Please enter 1-9:"
        player_move = gets
        index = self.input_to_index(player_move)
        if self.valid_move?(index)
            self.move(index,token)
        else 
            self.turn
        end
        self.display_board
    end

    def won?
        WIN_COMBINATIONS.any? do |win_combo|
            if self.position_taken?(win_combo[0]) && self.board[win_combo[0]] == self.board[win_combo[1]] && self.board[win_combo[2]] == self.board[win_combo[1]]
                return win_combo
            end
        end
        # WIN_COMBINATIONS.each do |win_combination|
        #     if self.board[win_combination[0]] == "X" && self.board[win_combination[1]] == "X" && self.board[win_combination[2]] == "X"
        #         return win_combination
        #     elsif self.board[win_combination[0]] == "Y" && self.board[win_combination[1]] == "Y" && self.board[win_combination[2]] == "Y"
        #         return win_combination
        #      end
        # end
        # false
    end

    def full?
        self.board.all? {|sign| sign !=  " "}
    end

    def draw?
        !self.won? && self.full? ? true : false
    end

    def over?
        self.won? || self.draw?
    end

    def winner
        self.board[self.won?[0]] if self.won?
    end

    def play
        self.turn until self.over?
        if self.won?
            puts "Congratulations #{self.winner}!"
        elsif self.draw?
            puts "Cat's Game!"
        end
    end

end
            
        

            





            



