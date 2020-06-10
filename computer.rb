class Computer
    def initialize
        @code = generate_code()
    end

    def generate_code
        code = []
        1.upto(4) do |num|
            peg = case rand(5)
            when 0 then "red"
            when 1 then "blue"
            when 2 then "green"
            when 3 then "yellow"
            when 4 then "orange"
            when 5 then "purple"
            end
            code.push(peg)
        end
        return code
    end

    def get_code
        return @code
    end
end