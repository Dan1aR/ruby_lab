def tabulate(s)
    yield s
end

#puts tabulate('a'..'c') {|x, i| "#{i} #{x}"}

#puts 'a b a bb ccc'.split.

arr = [1, 1, 33, 443]
ans = true
for i in 0...arr.size do
    ans = ans & (arr[i] % 2 == 1)
end
puts ans
