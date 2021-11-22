# frozen_string_literal: true

require './funcmodule'

puts('Enter x, y:')
x, y = gets.split.map(&:to_f)
puts calc_f(x, y)

puts('Enter your string:')
str = gets.chomp
puts "#{str.force_encoding('UTF-8')} :: #{decrypt_str(str)}"
