s, p = gets.chomp.split.map(&:to_i)

segments = []
s.times do
  segments << gets.chomp.split.map(&:to_i)
end

points = gets.chomp.split.map(&:to_i)

def search(arr, low, high, element)
  return [0,0] if high < low
  mid = low + ((high - low) /2)

  if element == arr[mid][0]
    return arr[mid]
  elsif element < arr[mid][0]
    search(arr, low, mid - 1, element)
  else
    search(arr, mid + 1, high, element)
  end
end

def binary_search(arr, element)
  search(arr, 0, arr.size - 1, element)
end

def find_points(list)
  left = 0
  points_arr = []
  j = 0
  for i in list
    if i[1] == 'l'
      left +=1
    elsif i[1] == 'p' && left > 0
      points_arr[j] = i[0], left
      j += 1
    elsif i[1] == 'r'
      left -= 1
    end
  end
  points_arr
end

def output(points, result)
  out = []
  for i in points
    out << binary_search(result,i)[1]
  end
  puts out.join(' ')
end

def generate_list(segments, points)
  all = []
  for i in points
    all << [i, 'p']
  end
  for i in segments
    all << [i[0], 'l']
    all << [i[1], 'r']
  end
  all.sort {|a,b| [a[0],a[1]] <=> [b[0],b[1]]}
end

list = generate_list(segments, points)
result = find_points(list)
output(points, result)
