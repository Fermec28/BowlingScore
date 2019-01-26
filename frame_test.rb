require "minitest/autorun"
require_relative "frame"

class FrameTest < Minitest::Test

    def setup
        @frame = Frame.new
        @last_frame = Frame.new(true)
    end

    def test_frame_can_try_firs_try
        assert @frame.can_make_try?
    end

    def test_frame_can_try_secon_try_with_10
        @frame.make_try(10)
        refute @frame.can_make_try?
    end

    def test_frame_can_try_secon_try_with_5
        @frame.make_try(5)
        assert @frame.can_make_try?
    end

    def test_frame_can_try_third_try_with_total_7
        @frame.make_try(5)
        @frame.make_try(2)
        refute @frame.can_make_try?
    end
    def test_last_frame_can_try_third_try_with_total_7
        @last_frame.make_try(5)
        @last_frame.make_try(2)
        refute @last_frame.can_make_try?
    end

    def test_last_frame_can_try_third_try_with_total_10
        @last_frame.make_try(8)
        @last_frame.make_try(2)
        assert @last_frame.can_make_try?
    end

    def test_last_frame_can_try_third_try_with_total_12
        @last_frame.make_try(10)
        @last_frame.make_try(2)        
        refute @last_frame.can_make_try?
    end

    def test_last_frame_can_try_third_try_with_total_20
        @last_frame.make_try(10)
        @last_frame.make_try(10)
        assert @last_frame.can_make_try?
    end

    def test_frame_make_try_invalid_value_11
        assert_nil @last_frame.make_try(11)
    end

    def test_frame_make_try_invalid_value_11_second_try_with_total_16
        @frame.make_try(5)
        assert_nil @frame.make_try(11)
    end

    def test_frame_make_try_invalid_value_11_second_try_with_total_21
        @last_frame.make_try(10)
        assert_nil @last_frame.make_try(11)
    end

   
    
    def test_last_frame_make_try_invalid_value_11_second_try_with_total_16
        @last_frame.make_try(5)
        assert_nil @last_frame.make_try(11)
    end

    def test_last_frame_make_try_invalid_value_11_second_try_with_total_21
        @last_frame.make_try(10)
        assert_nil @last_frame.make_try(11)
    end

    def test_last_frame_make_try_invalid_value_11_second_try_with_total_31
        @last_frame.make_try(10)
        @last_frame.make_try(10)
        assert_nil @last_frame.make_try(11)
    end

end