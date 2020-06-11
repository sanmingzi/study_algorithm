# 单调栈

## 例题

- [每日温度](https://leetcode-cn.com/problems/daily-temperatures/)
- [下一个更大元素 I](https://leetcode-cn.com/problems/next-greater-element-i/)
- [下一个更大元素 II](https://leetcode-cn.com/problems/next-greater-element-ii/)

这3个题目很类似，给定一个数组，输出每一个元素的下一个更大元素。

我们维护一个从栈底到栈顶的单调递减栈，当栈为空，或者当前元素不大于栈顶元素的时候，将当前元素入栈。

如果当前元素大于栈顶元素，那么当前元素就是栈顶元素的下一个更大元素。弹出栈顶元素，直到栈为空，或者当前元素不大于栈顶元素，将当前元素入栈。

该方法的时间复杂度和空间复杂度都是 O(n), n 是给定数组的长度。
