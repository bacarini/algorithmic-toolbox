def fibonacci(n ,m)
  arr = [0, 1]
  for i in 2..n
    arr << (arr[i-1] + arr[i-2]) % m
    remainder = arr[i-1..i].join
    if remainder == '01'
      return arr[0..(arr.size - 3)].size
    end
  end
  arr
end

n, m = gets.chomp.split.map(&:to_i)

pisano = fibonacci(n, m)
if pisano.is_a? Array
  result = pisano[n]
else
  p_length = n % pisano
  result = fibonacci(p_length, m)[p_length]
end

puts result
