# 位运算 Bit Operation

## lowbit

```ruby
def lowbit(x)
  x & -x
end
```

lowbit 方法在树状数组中十分常见，该方法用来求取一个整数最低位的 1 所代表的值。

该方法巧妙的使用了负数的二进制码。我们知道负数的二进制表示为该负数对应的正数取反然后加 1 。

```
7: 0111
-7: 1000 + 1 = 1001
7 & -7 = 0001
```

## x & (x - 1)

x & (x - 1) 得到的结果为将 x - lowbit(x) ，也就是将 x 最低为的 1 减去后所得到的值。

```
x = 6: 110
x - 1 = 5: 100
x & (x - 1) = 4: 100
4 恰好是 6 去掉最低位的 1 后得到的值
```

这个方法有一个妙用就是能够统计一个数的二进制中 1 的数目。

- [LeetCode 0191 位1的个数](https://leetcode-cn.com/problems/number-of-1-bits/)

## Practice

- [LeetCode 0190 颠倒二进制位](https://leetcode-cn.com/problems/reverse-bits/)
- [LeetCode 0477 汉明距离总和](https://leetcode-cn.com/problems/total-hamming-distance/)
- [LeetCode 1310 子数组异或查询](https://leetcode-cn.com/problems/xor-queries-of-a-subarray/)
- [LeetCode 1442 形成两个异或相等数组的三元组数目](https://leetcode-cn.com/problems/count-triplets-that-can-form-two-arrays-of-equal-xor/)
- [LeetCode 1734 解码异或后的排列](https://leetcode-cn.com/problems/decode-xored-permutation/)
- [LeetCode 1738 找出第 K 大的异或坐标值](https://leetcode-cn.com/problems/find-kth-largest-xor-coordinate-value/)
