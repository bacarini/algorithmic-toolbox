def merge_sort(arr, inversion = 0)
  return arr, inversion if arr.size <= 1

  mid = arr.size / 2
  b, inversion_b = merge_sort(arr[0..mid-1], inversion)
  c, inversion_c = merge_sort(arr[mid..arr.size-1], inversion)
  d, inversion_d = merge(b, c)

  return d, inversion_b + inversion_c + inversion_d
end

def merge(arr1, arr2)
  return arr2, 0 if arr1.empty?
  return arr1, 0 if arr2.empty?

  if arr1.first > arr2.first
    arr, count = merge(arr1, arr2[1..arr2.size])
    return [arr2.first] + arr, count += arr1.size
  else
    arr, count = merge(arr1[1..arr1.size], arr2)
    return [arr1.first] + arr, count
  end
end

n = gets.chomp.to_i
arr = gets.chomp.split.map(&:to_i)

sorted, inversion = merge_sort(arr)
puts inversion
