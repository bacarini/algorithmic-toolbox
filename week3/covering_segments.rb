n = gets.chomp.to_i

arr = []
n.times do
 arr << gets.chomp.split.map(&:to_i)
end

def min(arr)
  min = 10**9
  for b,e in arr
    if e < min
      min = e
    end
  end
  min
end

list = []
while arr.size > 0
  endpoint = min(arr)
  list << endpoint
  arr.delete_if { |b,e| endpoint >= b && endpoint <= e }
end

puts list.size
puts list.join(' ')
