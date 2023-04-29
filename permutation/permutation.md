# 全排列

## 递归法

[permutation_recursion.rb](./permutation_recursion.rb)

- 不方便处理数组存在相同元素的情况
- 结果是无序的

## 字典序法

[permutation_lexicographic.rb](./permutation_lexicographic.rb)

这个方法可以计算出任意一个序列的下一个排列，而且是按照字典序排序的。

1. 从右往左，找到第一个下标 j，满足 arr[j] < arr[j + 1]，arr[j + 1 ... length] 是递减序列
2. 在 arr[j + 1 ... length] 中，找到比 arr[j] 大的最小的数字，如果有多个的话，我们选下标最大的 k，将 arr[j] 与 arr[k] 进行交换
3. 将子数组 arr[j + 1 ... length] 倒序

- 返回的全排列是有序的
- 可以处理原数组存在相同元素的情况
- 对于任意一个数组，都可求取其下一个排列
