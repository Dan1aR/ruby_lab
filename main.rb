# frozen_string_literal: true

require_relative 'funcmodule'

puts('Enter R:')
R = gets.to_f

circle_out = 'Calculate circle area and EPS = 1/1000'
circle_adv_out = 'Calculate circle area advanced and EPS = 1/1000'

puts "#{circle_out} :: #{circle_area(R, 10**-3)}"
puts "#{circle_adv_out} :: #{circle_area_advanced(R, 10**-3)}"
puts "#{circle_out} :: #{circle_area(R, 10**-4)}"
puts "#{circle_adv_out} :: #{circle_area_advanced(R, 10**-4)}"
puts

dist_proc_out = 'Max dist between F(x) and G(x) using Proc'
dist_block_out = 'Max dist between F(x) and G(x) using block'

mxl = maximb & proc {
  max_dist = 0.0
  (0.5..1).step(0.01).each do |x|
    max_dist = [max_dist, (Math.sin(x) / x - Math.tan(x + 1) / (x + 1)).abs].max
  end
  max_dist
}

mxb = maximb do
  max_dist = 0.0
  (0.5..1).step(0.01).each do |x|
    max_dist = [max_dist, (Math.sin(x) / x - Math.tan(x + 1) / (x + 1)).abs].max
  end
  max_dist
end

puts "#{dist_proc_out} :: #{mxl}"
puts "#{dist_block_out} :: #{mxb}"
