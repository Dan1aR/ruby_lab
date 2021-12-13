class IndexController < ApplicationController
  def input; end

  def output
    @result = Solve.call params
    @error = @result.length.zero?
    @longest_one = @result[@result.map{|a| a[0].length}.each_with_index.max[1]] if not @error
  end
end
