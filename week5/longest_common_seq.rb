def calculte(first, second, third)
  matrix = Array.new(first.size+1) { Array.new(second.size+1) { Array.new(third.size+1) { 0 } } }

  for i in 1..first.size
    for j in 1..second.size
      for k in 1..third.size
        if first[i-1] == second[j-1] && second[j-1] == third[k-1]
          matrix[i][j][k] = (matrix[i-1][j-1][k-1]+1)
        else
          matrix[i][j][k] = [matrix[i-1][j][k], matrix[i][j-1][k], matrix[i][j][k-1]].max
        end
      end
    end
  end
  matrix[first.size][second.size][third.size]
end

first_length = gets.chomp.to_i
first = gets.chomp.split(' ').map(&:to_i)
second_length = gets.chomp.to_i
second = gets.chomp.split(' ').map(&:to_i)
third_length = gets.chomp.to_i
third = gets.chomp.split(' ').map(&:to_i)

puts calculte(first, second, third)
