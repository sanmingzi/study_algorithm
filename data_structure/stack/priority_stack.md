# 单调栈

## 下一个最大元素

- [LeetCode 0496 下一个更大元素 I](https://leetcode-cn.com/problems/next-greater-element-i/)
- [LeetCode 0503 下一个更大元素 II](https://leetcode-cn.com/problems/next-greater-element-ii/)
- [LeetCode 0739 每日温度](https://leetcode-cn.com/problems/daily-temperatures/)

给定一个数组，输出每一个元素的下一个更大元素。

我们维护一个从栈底到栈顶的单调递减栈。当栈为空，或者当前元素不大于栈顶元素的时候，将当前元素入栈。如果当前元素大于栈顶元素，那么当前元素就是栈顶元素的下一个更大元素。弹出栈顶元素。不断比较当前元素与栈顶元素，直到满足入栈条件。

该方法的时间复杂度和空间复杂度都是 O(n), n 是给定数组的长度。

## 最大矩形

- [LeetCode 0084 柱状图中最大的矩形](https://leetcode-cn.com/problems/largest-rectangle-in-histogram/)
- [LeetCode 0085 最大矩形](https://leetcode-cn.com/problems/maximal-rectangle/)

给定 n 个非负整数，用来表示柱状图中各个柱子的高度。每个柱子彼此相邻，且宽度为 1 。求在该柱状图中，能够勾勒出来的矩形的最大面积。

这个题目其实可以转换为求每一个元素的下一个更小元素。如何转换呢？

针对每一个柱子，如果我们可以该柱子的高度为基准，就是说以该高度为矩形的高度。那么我们只需要求取左边比该柱子更矮的元素以及右边比该柱子更矮的元素。

```
area = h * (right - left - 1)
```

所以这个问题可以转换为下一个更小元素和上一个更小元素。我们甚至能够只使用一次遍历就能求取最终的答案。

## Practice

- [LeetCode 0316 去除重复字母](https://leetcode-cn.com/problems/remove-duplicate-letters/)
- [LeetCode 0321 拼接最大数](https://leetcode-cn.com/problems/create-maximum-number/)
- [LeetCode 0456 132 模式](https://leetcode-cn.com/problems/132-pattern/)
- [LeetCode 1028 从先序遍历还原二叉树](https://leetcode-cn.com/problems/recover-a-tree-from-preorder-traversal/)
- [LeetCode 1776 车队 II](https://leetcode-cn.com/problems/car-fleet-ii/)

