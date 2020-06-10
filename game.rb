require_relative 'computer'

class Game
    def initialize(p_name)
        @p_name = p_name
        comp = Computer.new()
        @code = comp.get_code
        @turn_counter = 12
    end

    def play_game
        while @turn_counter > 0
            player_code = input_code()
            evaluate_code(player_code)
            turn_counter -= 1
    end

    def input_code
        puts "Colors are: red, blue, green, yellow, orange, purple."
        puts "Please enter a guess in the form 'a, b, c, d':"
        input = gets.chomp
        guess = input.split(", ")
        return guess
    end

    def evaluate_code(player_code)
        matches = Hash.new(0)
        temp_code = clone(@code)
        player_code.each_with_index do |peg, index|
            if temp_code.include?(peg)
                if temp_code[index] == peg
                    matches[:perfect] += 1
                    temp_code[index] = "black"
                else
                    matches[:just_color] += 1
                    pos = temp_code.index(peg)
                    temp_code[pos] = "black"
                end
            end
        end
        puts "You have #{matches[:perfect]} pegs that are in both the correct position and order."
        puts "You have #{matches[:just_color]} pegs that are only the correct color"
        win() if matches[:perfect] == 4
    end

    def clone(arr)
        return arr.map {|n| n}
    end
end