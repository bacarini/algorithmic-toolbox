def gdc(a, b)
  return a if b == 0
  c = a % b
  gdc(b, c)
end

a, b = gets.chomp.split

puts gdc(a.to_i, b.to_i)
