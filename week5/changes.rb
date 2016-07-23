def change(money, coins = [1, 5, 6])
  min_num_coins = [0]
  for m in 1..money
    min_num_coins[m] = 9999999
    for i in coins
      if m >= i
        num_coins = min_num_coins[m-i] + 1
        if num_coins < min_num_coins[m]
          min_num_coins[m] = num_coins
        end
      end
    end
  end
  puts min_num_coins.to_s
  return min_num_coins[money]
end

puts change(9)
