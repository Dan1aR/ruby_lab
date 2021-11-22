# frozen_string_literal: true

def file_write(filename_w, values)
  File.open(filename_w, 'w') do |f|
    values.each do |element|
      element.split.each do |sub_el|
        f.puts(sub_el) if (sub_el.count('a') + sub_el.count('а')).positive?
      end
    end
  end
end

def file_process(filename_r, filename_w)
  values = []
  File.readlines(filename_r).each { |line| values << line.chomp }
rescue Errno::ENOENT
  puts 'No such file or directory'
else
  file_write(filename_w, values)
end
