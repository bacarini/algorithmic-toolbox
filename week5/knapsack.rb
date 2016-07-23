w, items = gets.chomp.split.map(&:to_i)
arr = gets.chomp.split.map(&:to_i)

def knapsack(w, items)
  matrix = Array.new(items.size+1) { Array.new(w+1) { 0 } }

  for i in 1..items.size
    for j in 1..w
      if items[i-1] > j
        matrix[i][j] = matrix[i-1][j]
      else
        x = items[i-1] + matrix[i-1][j-items[i-1]]
        if x > matrix[i-1][j]
          matrix[i][j] = x
        else
          matrix[i][j] = matrix[i-1][j]
        end
      end
    end
  end
  return matrix[items.size][w]
end

puts knapsack(w, arr)
