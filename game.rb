require_relative 'computer'

class Game
    def initialize(p_name)
        @p_name = p_name
        comp = Computer.new()
        @turn_counter = 12
    end

    def play_game
        while @turn_counter > 0
            player_code = input_code()
            evaluate_code(player_code)
            turn_counter -= 1
    end
end