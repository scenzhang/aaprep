class Timer
    def initialize()
        @seconds = 0
    end
    def seconds
        @seconds
    end
    def seconds=(sec)
        @seconds = sec
    end
    
    def time_string()
        "#{padded(seconds / 3600)}:#{padded((seconds % 3600) / 60)}:#{padded(seconds % 60)}"
    end
    def padded(num)
        if num < 10
            "0#{num.to_s}"
        else
            num.to_s
        end
    end
    
        
end
