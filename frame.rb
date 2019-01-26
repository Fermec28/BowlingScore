require_relative "try"

class Frame
    attr_reader :tries
    NUM_PINES= 10
    def initialize(last_frame= false)
        @tries=[]
        @last_frame=last_frame
    end

    def make_try(value)
        if self.can_make_try?
            if @last_frame
                if  (self.sum_triess % NUM_PINES == 0 && NUM_PINES - value >= 0)
                    @tries<< Try.new(value) 
                elsif (@tries.length==1 && NUM_PINES- (self.sum_triess+value) >= 0)
                    @tries<< Try.new(value)
                end
            else 
                if (NUM_PINES- (self.sum_triess+value) >= 0 )
                    @tries<< Try.new(value)
                end
            end
        end
    end


    def can_make_try?          
        @tries.empty? || (@tries[0].value < NUM_PINES && @tries.length < 2 )|| (@last_frame &&   ((self.sum_triess % NUM_PINES) == 0 ) && @tries.length < 3 )
    end

    def sum_triess
        @tries.inject(0){|sum,try| sum + try.value }
    end
end