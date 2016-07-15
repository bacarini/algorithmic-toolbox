def search(arr, low, high, element)
  return -1 if high < low
  mid = low + ((high - low) /2)
  if element == arr[mid]
    return mid
  elsif element < arr[mid]
    search(arr, low, mid - 1, element)
  else
    search(arr, mid + 1, high, element)
  end
end

def binary_search(arr, element)
  search(arr, 0, arr.size - 1, element)
end

arr1 =  gets.chomp.split.map(&:to_i)
arr2 =  gets.chomp.split.map(&:to_i)

output = []
for i in (1..arr2[0])
  output << binary_search(arr1[1..arr1[0]], arr2[i])
end

puts output.join(' ')
