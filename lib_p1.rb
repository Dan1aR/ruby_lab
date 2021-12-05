# frozen_string_literal: true

require 'faker'

def generate_file(file_name, num_sentences = 10)
  File.open(file_name, 'w') do |file|
    num_sentences.times { file.puts Faker::Lorem.sentence }
  end
end

def file_write(filename_w, values)
  File.open(filename_w, 'w') do |f|
    values.each do |element|
      el = ''
      element.split do |sub_el|
        # Проверяет, есть ли в слове 'а' (На Латинице и Кириллице)
        el += "#{sub_el} " if (sub_el.count('a') + sub_el.count('а')).positive?
      end
      f.puts(el.rstrip) if el.length.positive?
    end
  end
end

def file_process(filename_r, filename_w)
  values = File.readlines(filename_r).map(&:chomp)
rescue Errno::ENOENT
  puts 'No such file or directory'
else
  file_write(filename_w, values)
end
