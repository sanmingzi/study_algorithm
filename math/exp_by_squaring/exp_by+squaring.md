# 快速幂

```
求取 x 的 n 次方，最简单的做法就是累乘法，复杂度为 O(n)。
如果 n 很大的话，这个方法非常容易超时。
为了提高算法效率，我们可以考虑逐步提高因子的大小，这样就可以大大减少计算量。

如果我们将 n 看作一个二进制数，那么每一位对应的因子应该满足如下关系：
exp[0] = x
exp[i] = exp[i - 1] ** 2
如果当前位为 1，那么
rtn *= exp

如果我们将 n 看作一个十进制数，那么每一位对应的因子应该满足如下关系：
exp[0] = x
exp[i] = exp[i - 1] ** 10
如果当前为 digit != 0，那么
rtn *= (exp ** digit)
```

- 二进制快速幂

```ruby
rtn, exp = 1, x
while n > 0
  rtn *= exp if (n & 1) == 1
  n >>= 1
  exp *= exp
end
```

- 十进制快速幂

```ruby
rtn, exp = 1, x
while n > 0
  rtn *= (exp ** (n % 10)) if (n % 10) != 0
  n /= 10
  exp = exp ** 10
end
```

## Practice

- [LeetCode 0050 Pow(x, n)](https://leetcode-cn.com/problems/powx-n/)
