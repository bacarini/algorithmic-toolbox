def max_pairwise_product(arr)
  n = arr.size
  result = 0

  for i in 0..n
    for j in i+1..n-1
      x = arr[i]*arr[j]
      result = x if x > result
    end
  end
  result
end

def max_pairwise_product_fast(arr)
  max_index2 = -1
  max_index1 = -1
  n = arr.size - 1

  for i in 0..n
    max_index1 = i if ((max_index1 == -1) || (arr[i] > arr[max_index1]))
  end

  for j in 0..n
    max_index2 = j if (j != max_index1 && ((max_index2 == -1) || (arr[j] > arr[max_index2])))
  end

  arr[max_index1] * arr[max_index2]
end

# puts max_pairwise_product(Array.new(200000) { rand(0..200000) })
# puts max_pairwise_product_fast(Array.new(200000) { rand(0..200000) })

while true
  n = Random.rand(1000) + 2
  arr = Array.new(n) { rand(0..n) }
  puts n
  puts arr.to_s
  r1 = max_pairwise_product(arr)
  r2 = max_pairwise_product_fast(arr)
  if r1 != r2
    puts "Wrong answer: #{r1} #{r2}"
    break
  else
    puts 'OK'
  end
end

# n = gets.chomp.to_i
# arr = gets.chomp.split(' ').map(&:to_i)
# puts max_pairwise_product_fast(arr)
