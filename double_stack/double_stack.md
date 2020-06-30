# 双栈

[Leetcode 用两个栈实现队列](https://leetcode-cn.com/problems/yong-liang-ge-zhan-shi-xian-dui-lie-lcof/)

我们可以用两个栈来实现队列，其中一个栈stack0负责push，另一个栈stack1负责pop，如果在pop的时候stack1为空，则将stack0的数据倒入stack1中。

```ruby
class CQueue
    attr_accessor :stack0, :stack1

    def initialize()
      @stack0, @stack1 = [], []
    end

=begin
    :type value: Integer
    :rtype: Void
=end
    def append_tail(value)
      @stack0.push(value)
    end

=begin
    :rtype: Integer
=end
    def delete_head()
      if @stack1.empty?
        while !@stack0.empty?
          @stack1.push(@stack0.pop)
        end
      end
      
      return -1 if @stack1.empty?
      @stack1.pop
    end
end
```
