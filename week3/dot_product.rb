n = gets.chomp.to_i

arr1 =  gets.chomp.split.map(&:to_i)
arr2 =  gets.chomp.split.map(&:to_i)

sorted_one = arr1.sort
sorted_two = arr2.sort.reverse

total = 0
n.times do |i|
  total = total + (sorted_one[i] * sorted_two[i])
end

puts total
