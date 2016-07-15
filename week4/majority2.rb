def frequency(arr, key)
  count = 0
  for i in arr
    count += 1 if i == key
  end
  count
end

def majority(arr)
  return arr[0] if arr.size == 1

  mid = arr.size / 2
  b = majority(arr[0..mid-1])
  c = majority(arr[mid..arr.size])

  return b if b == c
  lcount = frequency(arr, b)
  rcount = frequency(arr, c)

  if lcount > mid
    return lcount
  elsif rcount > mid
    return rcount
  else
    return 0
  end
end

n = gets.chomp.to_i
arr = gets.chomp.split.map(&:to_i)

if majority(arr) > 1
  puts 1
else
  puts 0
end
