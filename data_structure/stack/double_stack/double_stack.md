# 双栈

## 两个栈实现队列

我们可以用两个栈来实现队列，其中一个栈 @in 负责 push，另一个栈 @out 负责pop 。在 pop 的时候如果 @out 为空，则将 @in 的数据倒入 @out 中。

```ruby
# 在 pop 的时候检查 @out 是否为空
def check_out
  if @out.empty?
    while !@in.empty?
      @out.push(@in.pop)
    end
  end
end
```

## Practices

- [LeetCode 0232 用栈实现队列](https://leetcode-cn.com/problems/implement-queue-using-stacks/)
- [Leetcode 剑指 Offer 09. 用两个栈实现队列](https://leetcode-cn.com/problems/yong-liang-ge-zhan-shi-xian-dui-lie-lcof/)
