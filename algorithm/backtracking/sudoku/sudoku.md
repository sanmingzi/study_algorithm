# 数独

```m
数独问题是非常经典的回溯问题，类似的问题还有八皇后问题等等。
```

## 递归回溯

```ruby
# find the available num for the board[x][y]
def available(board, x, y)
  rtn = ('1'..'9').to_a
  rtn -= board[x]
  rtn -= board.collect { |arr| arr[y] }

  top_x, top_y = x / 3 * 3, y / 3 * 3
  bottom_x, bottom_y = top_x + 2, top_y + 2
  for i in top_x..bottom_x
    for j in top_y..bottom_y
      rtn.delete(board[i][j])
    end
  end

  return rtn
end

def dfs(board, x, y)
  while true
    break if board[x][y] == '.'
    y += 1
    x += y / 9
    y %= 9
    return true if x == 9
  end

  available(board, x, y).each do |num|
    board[x][y] = num
    return true if dfs(board, x, y)
    board[x][y] = '.'
  end
  return false
end
```

## 习题

- [解数独](https://leetcode-cn.com/problems/sudoku-solver/)
