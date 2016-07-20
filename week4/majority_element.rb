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
  merged = []

  while !arr1.empty? || !arr2.empty?
    b = arr1.first
    c = arr2.first

    if b.nil?
      merged << arr2.shift
    elsif c.nil?
      merged << arr1.shift
    elsif arr1.first < arr2.first
      merged << arr1.shift
    else
      merged << arr2.shift
    end
  end

  if !arr1.empty?
    merged << arr1
  elsif !arr2.empty?
    merged << arr2
  end

  merged
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

if n == 1 && arr.size == 1
  puts 1
else
  sorted = merge_sort(arr)
  puts counting(sorted, n)
end
