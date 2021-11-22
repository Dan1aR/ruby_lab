# frozen_string_literal: true

require_relative 'lib_p1'

puts 'Enter filename to read from: '
filename_r = gets.chomp
puts 'Enter filename to write to: '
filename_w = gets.chomp

file_process(filename_r, filename_w)
