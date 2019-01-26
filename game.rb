require_relative "frame"
class Game
    attr_reader :line
    NUM_PINES= 10
    def initialize(string)
        @line=[]        
        @tries = string.split('').map.with_index do |element,index|
            case element
            when 'X'
                10
            when '-'
                0
            when '/'
                NUM_PINES-(string.split('')[index-1].to_i)
            else 
                element.to_i
            end           
        end
        populate_line
    end

    def populate_line
        10.times do |n|
            @line<< Frame.new unless n==9
            @line<< Frame.new(true) if n==9
        end

        @line.map do |frame|
            while (frame.can_make_try?)
                frame.make_try(@tries.shift)
            end
        end
    end  
    
end