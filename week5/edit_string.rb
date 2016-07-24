first_string = gets.chomp.split('')
second_string = gets.chomp.split('')

def create_matrix(row, col)
  matrix = Array.new(col+1) { Array.new(row+1) { 0 } }
  for i in 0..([row, col].max + 1)
    matrix[0][i] = i if i <= row
    matrix[i][0] = i if i <= col
  end
  matrix
end

def edit_string(first_string, second_string)
  matrix = create_matrix(first_string.size, second_string.size)

  for i in 1..(second_string.size)
    for j in 1..(first_string.size)
      if second_string[i-1] == first_string[j-1]
        matrix[i][j] = matrix[i-1][j-1]
      else
        val = [matrix[i-1][j-1], matrix[i-1][j], matrix[i][j-1]].min
        matrix[i][j] = val + 1
      end
    end
  end
  matrix[second_string.size][first_string.size]
end


puts edit_string(first_string, second_string)
