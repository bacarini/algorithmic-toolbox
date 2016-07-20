def merge_sort(arr, inversion = 0)
  return arr, inversion if arr.size <= 1

  mid = arr.size / 2
  b, inversion_b = merge_sort(arr[0..mid-1], inversion)
  c, inversion_c = merge_sort(arr[mid..arr.size-1], inversion)
  d, inversion_d = merge(b, c)

  return d, inversion_b + inversion_c + inversion_d
end

def merge(arr1, arr2)
  merged = []
  count = 0

  while !arr1.empty? || !arr2.empty?
    b = arr1.first
    c = arr2.first

    if b.nil?
      merged << arr2.shift
    elsif c.nil?
      merged << arr1.shift
    elsif arr1.first > arr2.first
      merged << arr2.shift
      count += arr1.size
    else
      merged << arr1.shift
    end
  end

  if !arr1.empty?
    merged << arr1
  elsif !arr2.empty?
    merged << arr2
  end

  return merged, count
end

n = gets.chomp.to_i
arr = gets.chomp.split.map(&:to_i)

sorted, inversion = merge_sort(arr)
puts inversion
