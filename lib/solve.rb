class Solve
    class << self
      def call params
        new(params).send :execute
      end
    end
  
    private
  
    def initialize params
        @array = ( params[:a] + ' ' ).gsub!(/[^0-9]/, ' ').split.map(&:to_i)
    end

    def perfect(n)
        n == (1...n).select {|i| n % i == 0}.inject(:+)
    end 
  
    def execute
        #here comes the solution!
        ans = []

        n = @array.length
        n.times do |p1|
            (p1..n-1).each do |p2|
                if perfect(@array[p2])
                    ans << [@array[p1..p2], ( p1 != p2 ? [p1, p2] : [p1] )]
                else
                    break
                end
            end
        end
        
        ans
    end
  end