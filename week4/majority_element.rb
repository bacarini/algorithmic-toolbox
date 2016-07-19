def merge_sort(arr)
  if arr.size <= 1
    return arr
  end

  mid = arr.size / 2
  b = merge_sort(arr[0..mid-1])
  c = merge_sort(arr[mid..arr.size-1])
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

def counting(sorted, n)
  memo = nil
  count = 0

  for i in sorted
    if memo != i
      memo = i
      count = 1
    else
      count += 1
      return 1 if count > n / 2
    end
  end

  0
end

n = gets.chomp.to_i
arr = gets.chomp.split.map(&:to_i)

sorted = merge_sort(arr)
puts counting(sorted, n)
