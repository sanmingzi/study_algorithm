# 并查集

```m
在无向图中，并查集可以用来计算连通分量。
也可用于判断无向图是否连通，连通分量 > 1，则无向图不连通。

需要注意，很多时候需要通过路径压缩来提高算法的效率。
```

## 核心代码

```ruby
def find_root(node, parents)
  return node if parents[node] == node
  root = find_root(parents[node], parents)
  parents[node] = root
  return root
end

def union(node_a, node_b, parents)
  root_a, root_b = find_root(node_a, parents), find_root(node_b, parents)
  parents[root_a] = root_b if root_a != root_b
end
```

## 例题解析

- [保证图可完全遍历](https://leetcode-cn.com/problems/remove-max-number-of-edges-to-keep-graph-fully-traversable/)

```m
1. 分别对Alice和Bob做一次并查集
2. 做并查集的时候，我们优先考虑共享边
3. 我们用一个数组 used 来标记一条边是否被使用
4. 最后统计未使用的边的条数即可
```

[AC Code](leetcode_1579.rb)

- [最长连续序列](https://leetcode-cn.com/problems/longest-consecutive-sequence/)
