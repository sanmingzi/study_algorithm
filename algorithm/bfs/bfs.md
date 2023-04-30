# BFS

## 状态图搜索

状态图搜索可以解决非常经典的八数码问题。在状态图搜索中，比较麻烦的是状态去重。通常的话我们可以使用康托展开（Cantor）来进行去重。如果是是用 ruby 语言，因为 ruby 中的 hash 的 key 是可以是任何一个 object，所以此时可以直接用 hash 来做去重即可。

[state_diagram_bfs](./state_diagram_bfs.rb)

[LeetCode 0773 滑动谜题](https://leetcode.cn/problems/sliding-puzzle/)

## Practice

- [LeetCode 0103 二叉树的锯齿形层序遍历](https://leetcode-cn.com/problems/binary-tree-zigzag-level-order-traversal/)
- [LeetCode 0135 分发糖果](https://leetcode-cn.com/problems/candy/)
- [LeetCode 0547 省份数量](https://leetcode-cn.com/problems/number-of-provinces/)
- [LeetCode 0993 二叉树的堂兄弟节点](https://leetcode-cn.com/problems/cousins-in-binary-tree/)
- [LeetCode 1631 最小体力消耗路径](https://leetcode-cn.com/problems/path-with-minimum-effort/)
