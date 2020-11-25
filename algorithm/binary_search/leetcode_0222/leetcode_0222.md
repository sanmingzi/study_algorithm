# LeetCode 0222 完全二叉树的节点个数

- [LeetCode 0222 完全二叉树的节点个数](https://leetcode-cn.com/problems/count-complete-tree-nodes/)

```
这个题目是要求取完全二叉树的节点个数。这个问题其实有比较简单暴力的方法，比如 BFS DFS 等。
但是这个问题还有一个非常巧妙的解法，那就是二分 + 位运算。
```

## 方法1：二分 + 位运算

- [source code](leetcode_0222.rb)

```
第一步：
找出二叉树的层数 level，根节点的 level = 0

第二步：
假如二叉树的最底层只有 1 个节点，那么该二叉树一共有 2 ^ level 个节点；
假如二叉树的最底层是满的，那么该二叉树一共有 2 ^ (level + 1) - 1。
层数为 level 的二叉树的节点个数范围为：
[2 ^ level, 2 ^ (level + 1) - 1]
因此，我们可以通过二分来确定二叉树节点的个数。

第三步：
如何判断最底层的节点 mid 是否存在。举个例子：
level = 3
那么，最底层的节点应该为 [4..7]
```

十进制 | 二进制
- | -
4 | 100
5 | 101
6 | 110
7 | 111

```
这几个数字的最高位都是 1，第二位是 0 表示该节点位于 root 的左子树，第二位是 1 表示该节点位于 root 的右子树上。
通过这个规律，我们可以使用位运算来判断节点 mid 是否位于二叉树上
```

```ruby
def exist?(root, level, mid)
  bits = 1 << (level - 1)
  while root != nil && bits != 0
    if 0 == (bits & mid)
      root = root.left
    else
      root = root.right
    end
    bits >>= 1
  end
  return nil != root
end
```
