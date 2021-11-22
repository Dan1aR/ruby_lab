require "minitest/autorun"
require "./funcmodule.rb"

def actual_f(x, y)
    ( ((x - 1).abs)**(0.5) - ((y).abs)**(0.5) ) / (1 + x**2/2 + y**2/4)
end

def actual_decrypt(str)
    str.force_encoding('UTF-8')

    abc = "абвгдеёжзийклмнопрстуфхцчшщъыьэюя".split("")
    for i in 0..str.length()-1
        c = (str[i].eql? " ") ? " " : abc[ ( abc.index(str[i].downcase) + 1 ) % 33 ]
        str[i] = /[[:upper:]]/.match(str[i]) ? c.upcase : c
    end
    return str
end

class TestRobot < Minitest::Test
    def test_calc_f
        for x in 0..100
            for y in 0..100
                assert_equal actual_f(x, y), calc_f(x, y)
            end
        end
    end

    def test_decrypt_str
        abc = "абвгдеёжзийклмнопрстуфхцчшщъыьэюя ".split("")
        test_str = []
        for i in 0..rand(5..10)
            test_str.push(abc[rand(0..abc.length()-1)])
        end
        assert_equal actual_decrypt(test_str.join()), decrypt_str(test_str.join())
    end
end

