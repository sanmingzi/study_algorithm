# 双指针

当我们需要枚举数组中的两个元素的时候，如果我们发现随着第一个元素递增，第二个元素递减，那么就可以使用双指针。

举个例子，我们需要在一个递增数组中，找到两个元素 num1 num2，使得 num1 + num2 == target。

## 双指针法

```ruby
first = 0
second = length - 1
while first < second
  sum = nums[first] + nums[second]
  if sum < target
    first += 1
  elsif sum == target
    return [first, second]
  else
    second -= 1
  end
end
```

使用双指针的时间复杂度是 O(N)。

## 二分查找

还有一种办法是枚举其中一个元素，使用二分去查找另外一个元素，复杂度是 O(N * lgN)。

## 空间换时间

另外还有一种办法是以空间换时间，我们用map来存储一些信息。对于元素 num，map[num] = true，如果 map[target - num] == true，那么就说明我们找到符合条件的元素对。这个方法的时间复杂度和空间复杂度都是 O(N)。

该方法最主要的优点在于不需要数组有序。

- [和为K的子数组](https://leetcode-cn.com/problems/subarray-sum-equals-k/)

## 总结

在满足递增的条件下，最优的方法应该是双指针。

空间换时间的方法会消耗更多的内存资源，但是该方法的适用性更广泛，最主要是能对未排序的数组使用。

## 习题

- [两数之和](https://leetcode-cn.com/problems/two-sum/)
- [三数之和](https://leetcode-cn.com/problems/3sum/)
- [三数之和题解](https://leetcode-cn.com/problems/3sum/solution/san-shu-zhi-he-by-leetcode-solution/)
- [和为K的子数组](https://leetcode-cn.com/problems/subarray-sum-equals-k/submissions/)
