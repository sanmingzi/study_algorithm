# 快速排序

```
对于需要排序的数组或者是链表:
1. 我们随机找其中的一个元素
2. 将比该元素小的放在该元素左边，比该元素大的放在右边
3. 我们以该元素为节点，将数组或链表分为左右两个部分，然后分别对左右子部分进行排序
```

## 数组的快速排序

[数组的快速排序](quick_sort_array.rb)

```ruby
def quick_sort(a, lo, hi)
  return if lo >= hi
  
  # 我们选取 a[lo + (hi - lo)] 为被比较的元素
  # 这样做能够避免一些特殊 case 导致的效率急剧下降
  # 被选取的元素应该是越随机越好
  exch(a, lo, lo + (hi - lo) / 2)
  value = a[lo]

  left_index, right_index = lo + 1, hi
  while true
    # 左索引从左往右扫描，负责找到大于或等于 a[lo] 的元素
    while left_index <= hi && a[left_index] < value
      left_index += 1
    end

    # 右索引从右往左扫描，负责找到小于或等于 a[lo] 的元素
    while a[right_index] > value
      right_index -= 1
    end

    break if left_index >= right_index
    # 我们找到两个元素，a[right_index] <= a[lo] <= a[left_index]，将这两个元素交换
    exch(a, left_index, right_index)
    left_index += 1
    right_index -= 1
  end

  # 将被比较的元素 a[lo] 与 a[right_index] 进行交换
  exch(a, lo, right_index)

  # 以 right_index 为节点，将原数组分为两部分
  # a[lo..right_index - 1] a[right_index + 1, hi]
  # 对子数组进行排序
  quick_sort(a, lo, right_index - 1)
  quick_sort(a, right_index + 1, hi)
end

def exch(a, i, j)
  a[i], a[j] = a[j], a[i]
end
```

## 链表的快速排序

```ruby
def quick_sort(head, tail)
  return if head == tail || head.next == tail || sorted?(head, tail)

  # 通过快慢指针找到链表的中点
  # 将该点设置为待比较的节点
  # 将该节点与 head 进行交换
  swap(head, mid_point(head, tail))

  # 设置两个指针 pivot 和 current
  # [head, pivot] <= head
  # (pivot, current) >= head
  # current 在向右扫描的过程中，如果 current < head
  # pivot = pivot.next
  # swap(pivot, current)
  pivot, current = head, head.next
  val = head.val
  while true
      while current != tail && current.val >= val
          current = current.next
      end
      break if current == tail
      pivot = pivot.next
      swap(pivot, current)
      current = current.next
  end
  swap(head, pivot)
  quick_sort(head, pivot)
  quick_sort(pivot.next, tail)
end

# 如果链表已经有序，可以不用再排序
# 该判断能够避免很多重复值的 case
def sorted?(head, tail)
  while head != tail && head.next != tail
    return false if head.val > head.next.val
    head = head.next
  end
  return true
end

# 通过快慢指针找到链表的中间节点
# 可以使得被比较的节点更为随机
def mid_point(head, tail)
  slow, fast = head, head
  while fast != tail && fast.next != tail
    fast = fast.next.next
    slow = slow.next
  end
  return slow
end

def swap(node1, node2)
    node1.val, node2.val = node2.val, node1.val
end
```

## 例题

- [LeetCode 0148](https://leetcode-cn.com/problems/sort-list/)
