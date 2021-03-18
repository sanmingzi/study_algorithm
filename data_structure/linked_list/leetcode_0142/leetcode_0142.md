# LeetCode 0142 环形链表 II

## 题意

找出环形链表中入环的第 1 个点。如果不存在环，返回 nil 。

## 快慢指针

定义快慢指针 slow / fast ，初始值均为 head 。slow 每次移动 1 步，fast 每次移动 2 步。如果 slow 和 fast 不能相遇，那么该链表无环。如果 slow 和 fast 相遇，则证明该链表有环。由于 fast 的速度是 slow 的两倍，所以 fast 走过的路程也是 slow 的两倍。通过计算可得，从相遇点到入环的第 1 个点的距离等于从 head 到入环的第 1 个点的距离。此时，我们同时移动 slow / head ，它们的第 1 个相遇点即为第 1 个入环点。

该方法的时间复杂度为 O(n) ，空间复杂度为 O(1) 。

[leetcode_0142.rb](leetcode_0142.rb)
