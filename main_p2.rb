# frozen_string_literal: true

require_relative 'lib_p2'

sick = HospitalSick.new('Name', 31, 2020)
sick.print_info
puts sick.next_examination_year
