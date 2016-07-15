def frequency(arr, key)
  count = 0
  for i in arr
    count += 1 if i == key
  end
  count
end

def merge_sort(arr)
  if arr.size <= 1
    return arr
  end

  mid = arr.size / 2
  b = merge_sort(arr[0..mid-1])
  c = merge_sort(arr[mid..arr.size])
  merge(b, c)
end

def merge(arr1, arr2)
  return arr2 if arr1.empty?
  return arr1 if arr2.empty?

  if arr1.first < arr2.first
    [arr1.first] + merge(arr1[1..arr1.size], arr2)
  else
    [arr2.first] + merge(arr1, arr2[1..arr2.size])
  end
end

n = gets.chomp.to_i
arr = gets.chomp.split.map(&:to_i)

sorted = merge_sort(arr)
memo = nil
count = 0
for i in sorted.uniq
  if memo != i
    memo = i
    feq = frequency(sorted, memo)
    if feq > arr.size / 2
      count +=1
    end
  end
end

puts count
