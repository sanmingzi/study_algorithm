def detectCycle(head)
  slow, fast = head, head
  while fast != nil && fast.next != nil
    slow = slow.next
    fast = fast.next.next
    if slow == fast
      while head != slow
        head = head.next
        slow = slow.next
      end
      return head
    end
  end
  return nil
end
