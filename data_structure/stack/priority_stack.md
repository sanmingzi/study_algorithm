# 单调栈

## 例题

- [每日温度](https://leetcode-cn.com/problems/daily-temperatures/)
- [下一个更大元素 I](https://leetcode-cn.com/problems/next-greater-element-i/)
- [下一个更大元素 II](https://leetcode-cn.com/problems/next-greater-element-ii/)

这3个题目很类似，给定一个数组，输出每一个元素的下一个更大元素。

我们维护一个从栈底到栈顶的单调递减栈，当栈为空，或者当前元素不大于栈顶元素的时候，将当前元素入栈。

如果当前元素大于栈顶元素，那么当前元素就是栈顶元素的下一个更大元素。弹出栈顶元素，直到栈为空，或者当前元素不大于栈顶元素，将当前元素入栈。

该方法的时间复杂度和空间复杂度都是 O(n), n 是给定数组的长度。

- [从先序遍历还原二叉树](https://leetcode-cn.com/problems/recover-a-tree-from-preorder-traversal/)

这个题目当然可以用递归来做，但是其实用单调栈来做也是OK的。

我们根据节点的深度由小到维护一个单调递增栈。

如果当前节点的深度大于栈顶节点的深度，那么我们将当前节点设置为栈顶节点的左节点或者是右节点（如果左节点为nil，设置为左节点，否则设置为右节点），然后将当前节点入栈。

如果当前节点的深度小于或者等于栈顶节点的深度，我们将栈顶元素出栈。直到栈顶节点的深度小于当前节点。

- [LeetCode 0316 去除重复字母](https://leetcode-cn.com/problems/remove-duplicate-letters/)

- [LeetCode 0321 拼接最大数](https://leetcode-cn.com/problems/create-maximum-number/)
