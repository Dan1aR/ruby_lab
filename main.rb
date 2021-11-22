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

f_x = ->(x) { Math.sin(x) / x }
g_x = ->(x) { Math.tan(x + 1) / (x + 1) }

dist_lambda_out = 'Max dist between F(x) and G(x) using lambda'
dist_block_out = 'Max dist between F(x) and G(x) using block'

mx_block = (maxim_block { |x| Math.sin(x) / x - Math.tan(x + 1) / (x + 1) })

puts "#{dist_lambda_out} :: #{maxim(f_x, g_x)}"
puts "#{dist_block_out} :: #{mx_block}"
