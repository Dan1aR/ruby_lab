# frozen_string_literal: true

def calc_f(x_param, y_param)
  ((x_param - 1).abs**0.5 - y_param.abs**0.5) / (1 + x_param**2 / 2 + y_param**2 / 4)
end

def decrypt_str(str)
  str.force_encoding('UTF-8')
  abc = 'абвгдеёжзийклмнопрстуфхцчшщъыьэюя'.split('')
  str
    .split('')
    .each
    .map do |s_i|
      c = s_i.eql?(' ') ? ' ' : abc[(abc.index(s_i.downcase) + 1) % abc.length]
      /[[:upper:]]/.match(s_i) ? c.upcase : c
    end
    .join('')
end
