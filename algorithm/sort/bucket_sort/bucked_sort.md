# 桶排序

- [维基百科](https://zh.wikipedia.org/wiki/%E6%A1%B6%E6%8E%92%E5%BA%8F)

```
桶排序是将待排序的数组分到有限数量的桶中，然后对桶进行排序。
桶排序的关键在于有限数量的桶，如果数据的重复值较多，或者数据的范围不是很大，可以考虑使用桶排序。该算法简单高效。

举个例子：
对一个很长的只包含小写字母的字符串进行排序，使用桶排序的效率会很高。小写字母一共有26个，这意味着我们只需要使用26个桶就能装下所有的字符。时间复杂度为 O(n)。
```

## 例题

- [LeetCode 0164 最大间距](leetcode_0164/leetcode_0164.md)
- [LeetCode 0220 存在重复元素 III](https://leetcode-cn.com/problems/contains-duplicate-iii/)
- [LeetCode 1370 上升下降字符串](https://leetcode-cn.com/problems/increasing-decreasing-string/)
