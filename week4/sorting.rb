def quick_sort(arr,low,high)
  if low < high
    l, r = partition(arr,low,high)
    quick_sort(arr,low,l-1)
    quick_sort(arr,r+1,high)
  end
  arr
end

def partition(arr,low,high)
  pivot = arr[low]
  i = low+1
  lt = low
  gt = high

  while i <= gt
    if arr[i] < pivot
      arr[i], arr[lt] = arr[lt], arr[i]
      lt += 1
      i += 1
    elsif arr[i] > pivot
      arr[i], arr[gt] = arr[gt], arr[i]
      gt -= 1
    else
      i += 1
    end
  end
  return lt,gt
end

n = gets.chomp.to_i
arr = gets.chomp.split.map(&:to_i)

puts quick_sort(arr, 0, n-1).join(' ')

