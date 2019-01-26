require "minitest/autorun"
require_relative "game"

class GameTest < Minitest::Test
    def setup
        @game = Game.new('XXXXXXXXXXXX')
    end

    def test_print_lines
        p @game.line
        assert true
    end
    
end