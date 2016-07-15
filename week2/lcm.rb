def gdc(a, b)
  return a if b == 0
  c = a % b
  gdc(b, c)
end

def lcd(a, b)
  x = gdc(a, b)
  a * b / x
end

a, b = gets.chomp.split

puts lcd(a.to_i, b.to_i)
