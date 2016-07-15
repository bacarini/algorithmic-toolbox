def knapsack(values, weight)
  total = 0
  for i in values
    return total if weight == 0

    if (weight - i[0]) < 0
      total = total + weight * i[1]
      return total
    else
      weight = weight - i[0]
      a = i[0] * i[1]
      total = total + a
    end
  end
  total
end

n, W = gets.chomp.split.map(&:to_i)
arr = []
n.times do
 vi, wi = gets.chomp.split.map(&:to_f)
 arr << [wi, vi / wi]
end

sorted_array = arr.sort_by { |k| k[1] }.reverse

puts knapsack(sorted_array, W).round(4)
