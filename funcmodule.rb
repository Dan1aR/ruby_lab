def calc_f(x, y)
    ( ((x - 1).abs)**(0.5) - ((y).abs)**(0.5) ) / (1 + x**2/2 + y**2/4)
end

def decrypt_str(str)
    str.force_encoding('UTF-8')
    abc = "абвгдеёжзийклмнопрстуфхцчшщъыьэюя".split('')
    str
        .split('')
        .each
        .map { |s_i|
            c = (s_i.eql? " ") ? " " : abc[ ( abc.index(s_i.downcase) + 1 ) % abc.length ]
            /[[:upper:]]/.match(s_i) ? c.upcase : c
        }
        .join('')

end 

