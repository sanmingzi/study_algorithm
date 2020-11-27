# 基数排序

- [维基百科](https://zh.wikipedia.org/wiki/%E5%9F%BA%E6%95%B0%E6%8E%92%E5%BA%8F)
- [算法总结系列之五: 基数排序(Radix Sort)](https://www.cnblogs.com/sun/archive/2008/06/26/1230095.html)

```
基数排序是一种非比较型排序算法。
我们可以将一个整数按位数进行切分，然后按每个位进行排序。
举个例子：
arr = [342, 58, 576, 356]

第一次排序（个位）：
342
576
356
58

第二次排序（十位）：
342
356
58
576

第三次排序（百位）：
58
342
356
576
```

## 核心代码

```ruby
# exp 是以 10 为底的指数，用来计算各个数字的每一位的数字
exp = 1

while max_val >= exp
  # cnt 为计数数组，用来统计该数位上不同数字的个数
  cnt = Array.new(10, 0)
  nums.each do |num|
    digit = (num / exp) % 10
    cnt[digit] += 1
  end

  # 这个地方进行累加处理是为了后面确定各个数字的位置
  for i in 1..9
    cnt[i] += cnt[i - 1]
  end

  buf = Array.new(length)

  # 这个地方注意数组是从后往前进行遍历
  # 因为经过部分数位排序之后，后面的数字相对来说更大
  # 我们需要将更大的数字放到后面，从而实现递增排序
  nums.reverse.each do |num|
    digit = (num / exp) % 10
    
    # 这个地方就能看出 cnt 的作用了
    # 可以用来根据数位的值来确定每一个数字的位置
    cnt[digit] -= 1
    buf[cnt[digit]] = num
  end
  nums = buf
  exp *= 10
end
```

## 例题

- [LeetCode 0164 最大间距](leetcode_0164/leetcode_0164.md)
