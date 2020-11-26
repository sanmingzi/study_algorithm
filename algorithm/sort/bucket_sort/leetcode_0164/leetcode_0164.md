# LeetCode 0164 最大间距

- [leetcode 0164 最大间距](https://leetcode-cn.com/problems/maximum-gap/)
- [source code](leetcode_0164.rb)

```
给定一个无序数组，求排序后相邻元素之间的最大差值。
这个题目有一个很暴力的做法，就是排序，然后找相邻元素之间的最大差值。
但是普通的排序算法的复杂度一般在 nlg(n)。
使用基于桶的算法来解决这个问题会比较高效。

第1步：
求出数组的最小值 min_val 和 最大值 max_val

第2步：
求出平均差值
d = [1, (max_val - min_val) / (nums.length - 1)].max
和 1 比较取较大值是因为有可能 min_val == max_val

第3步：
计算出所需桶的数目：
bucket_size = (max_val - min_val) / d + 1

第4步：
将各个元素放入相应的桶中，每个桶中只保留最大值和最小值
对于元素 num
bucket_id = (num - min_val) / d

第5步：
用后一个桶的最小值与前一个桶的最大值之差作为两个桶的间距，就能得到最终答案。
rtn = [rtn, current_bucket[0] - pre_bucket[1]].max

证明如下：
平均差值为：
d = [1, (max_val - min_val) / (nums.length - 1)].max
那么必有，
rtn >= d
其中 rtn == d 是极端情况，就是数组恰好是等差数列。
我们知道桶的大小是 d，所以桶内相邻元素的差值不可能大于 d。
那么最大差值一定是出现在不同的桶中。
所以我们只需要求取相邻桶的间距，就能得到正确答案。
```
