require_relative "try"

class Frame
    attr_reader :tries
    NUM_PINES = 10
    def initialize(last_frame= false)
        @tries=[]
        @last_frame=last_frame
    end

    def make_try(value)
        @tries<< Try.new(value) if  self.can_make_try? && (NUM_PINES- (self.sum_triess+value) >= 0 )
    end


    def can_make_try?          
        @tries.empty? || (@tries[0].value < NUM_PINES && @tries.length < 2 )|| (@last_frame &&   ((self.sum_triess % NUM_PINES) == 0 ) && @tries.length < 3 )
    end

    def sum_triess
        @tries.inject(0){|sum,try| sum + try.value }
    end
end