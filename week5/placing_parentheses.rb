arr = gets.chomp.split('')

d = []
@op = []
for i in 0..(arr.size - 1)
  if i.even?
    d << arr[i]
  else
    @op << arr[i]
  end
end

@matrix_min = Array.new(d.size) { Array.new(d.size) { 0 } }
@matrix_max = Array.new(d.size) { Array.new(d.size) { 0 } }

for i in 0..(d.size - 1)
  @matrix_min[i][i] = d[i].to_i
  @matrix_max[i][i] = d[i].to_i
end

def min_and_max(i,j)
  min = 10**20
  max = -10**20
  for k in i..(j-1)

    break if k >= @op.size

    a = @matrix_max[i][k].method(@op[k]).(@matrix_max[k+1][j])
    b = @matrix_max[i][k].method(@op[k]).(@matrix_min[k+1][j])
    c = @matrix_min[i][k].method(@op[k]).(@matrix_max[k+1][j])
    d = @matrix_min[i][k].method(@op[k]).(@matrix_min[k+1][j])

    min = [min,a,b,c,d].min
    max = [max,a,b,c,d].max
  end

  return min, max
end

for s in 1..(d.size - 1)
  for i in 0..(d.size - (s+1))
    j = i + s
    @matrix_min[i][j], @matrix_max[i][j] = min_and_max(i,j)
  end
end

puts @matrix_max[0][d.size-1]
