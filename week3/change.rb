def changes(n)
  total = 0
  arr = [10, 5, 1]
  for i in arr
    x = n / i
    n = n - (x * i)
    total += x
  end
  total
end

n = gets.chomp.to_i

puts changes(n)
