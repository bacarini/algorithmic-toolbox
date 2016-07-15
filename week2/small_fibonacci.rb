n = gets.chomp.to_i

arr = [0, 1]

for i in 2..n
  arr << arr[i-1] + arr[i-2]
end

puts arr[n]
