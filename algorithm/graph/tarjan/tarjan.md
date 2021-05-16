# Tarjan

- [60 分钟搞定图论中的 Tarjan 算法（一）](https://zhuanlan.zhihu.com/p/101923309)

tarjan 算法可以用来求无限图的割点和割边（桥），具体做法如下：

1. 我们使用 dfs 来遍历整个图
2. 在 dfs 的过程中，我们用 dfn 数组来表示每个节点在 dfs 中出现的时间戳
3. 在 dfs 的过程中，我们还需要定义 low 数组来表示当前节点能达到的最小 dfn ，但是不能使用已经遍历的边
4. 如果 low[to] < dfn[from] ，则说明 to 无法通过其他路径到达 from 或者 from 的祖先，也就是说 from-to 这条边是割边，from / to 是割点

举个特别简单的例子，无限图 0-1-2-3-0 形成一个环，我们从 #1 开始遍历，很显然：

```
dfn = [0, 1, 2, 3]
low = [0, 0, 0, 0]
```

## 核心代码

```ruby
def tarjan(from, father, dfn, low)
  dfn[from] = low[from] = @timestamp
  @timestamp += 1
  @adjs[from].each do |edge_index|
    to = @edges[edge_index].another(from)
    next if father == to

    if !dfn[to]
      tarjan(to, from, dfn, low)
      low[from] = [low[from], low[to]].min
      if low[to] < dfn[from]
        # @edges[edge_index] from-to 是一条割边
        # from 点是一个割点
      end
    else
      low[from] = [low[from], dfn[to]].min
    end
  end
end
```

## Practices

- [LeetCode 1568 使陆地分离的最少天数](https://leetcode-cn.com/problems/minimum-number-of-days-to-disconnect-island/)
