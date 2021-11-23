class Solve < ApplicationRecord
    def initialize(params)
        @num = 0
        
        # n is actually pretty useless 
        @n = params['n'].gsub!(/[^0-9]/, '').to_i
        @array = (params['a'] + ' ' ).gsub!(/[^0-9]/, ' ').split.map(&:to_i)
    end

    def perfect(n)
        n == (1...n).select {|i| n % i == 0}.inject(:+)
    end 

    def solution
        #here comes the solution!
        @ans = []
        @ids = []

        n = @array.length
        n.times do |p1|
            (p1..n-1).each do |p2|
                if perfect(@array[p2])
                    @ans << @array[p1..p2] 
                    @ids << ( p1 != p2 ? [p1, p2] : [p1] )
                else
                    break
                end
            end
        end

        @num = @ans.length
    end

    def num_subarrays
        @num
    end 

    def ans_array
        @ans
    end 

    def ans_ids
        @ids
    end 

    def input_array
        @array
    end

    def longest_one
        @ans.max_by(&:size)
    end

end
