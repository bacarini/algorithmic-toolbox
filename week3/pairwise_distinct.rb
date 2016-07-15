n = gets.chomp.to_i

total = 0
increment = 1
list = []

while (total + increment) <= n
  list << increment
  total += increment
  increment += 1
end

list[list.size - 1] += n - total

puts list.size
puts list.join(' ')
