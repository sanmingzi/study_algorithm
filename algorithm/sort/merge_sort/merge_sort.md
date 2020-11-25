# 归并排序

```
归并排序同快速排序一样，也是一种分治算法

1. 将待排序对象分为两个部分
2. 分别对子部分进行排序
3. 将子部分合并

在数组中使用归并排序会使用很多的额外空间。
在链表中使用归并排序只会用到递归调用的栈空间。
```

## 链表的归并排序

```ruby
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# 对 [head, tail) 进行排序
def merge_sort(head, tail)
  return nil if head == tail
  if head.next == tail
    head.next = nil
    return head
  end
  pivot = mid_point(head, tail)
  head0 = merge_sort(head, pivot)
  head1 = merge_sort(pivot, tail)
  merge(head0, head1)
end

# 通过快慢指针找到链表的中点
def mid_point(head, tail)
  slow, fast = head, head
  while fast != tail && fast.next != tail
    fast = fast.next.next
    slow = slow.next
  end
  return slow
end

def merge(head0, head1)
  dummy = ListNode.new(nil)
  current = dummy
  while head0 != nil && head1 != nil
    if head0.val < head1.val
      current.next = head0
      head0 = head0.next
    else
      current.next = head1
      head1 = head1.next
    end
    current = current.next
  end
  if nil == head0
    current.next = head1
  else
    current.next = head0
  end
  return dummy.next
end
```

## 例题

- [LeetCode 0148](https://leetcode-cn.com/problems/sort-list/)
