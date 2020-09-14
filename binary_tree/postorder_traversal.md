# 后序遍历

```m
先遍历左节点，再遍历右节点，最后遍历根节点
```

## 递归法

```ruby
def postorder_traversal(root)
  return [] if root == nil

  rtns = postorder_traversal(root.left)
  rtns += postorder_traversal(root.right)
  rtns += [root.val]
  return rtns
end
```

## 迭代法

### 方法1

```m
1. 初始化栈，将根节点放入栈中
2. 取出栈顶元素，我们将其值放入结果集中
3. 我们将该节点的左节点和右节点分别压入栈中
4. 将结果逆序就是后序遍历

后序遍历和前序遍历异曲同工，差别主要在两点：
1. 入栈顺序不同，前序遍历是先将右孩子节点入栈，然后是左孩子节点；后序遍历恰好相反
2. 结果集需要逆序
```

```ruby
def postorder_traversal(root)
  return [] if root == nil

  rtns = []
  stack = [root]
  while !stack.empty?
    root = stack.pop
    rtns.push(root.val)
    stack.push(root.left) if root.left
    stack.push(root.right) if root.right
  end
  rtns.reverse
end
```

### 方法2

```m
1. 对于当前节点，我们将其值放入结果集中
2. 我们将该节点压入栈中，并将其右孩子节点依次压入栈中
3. 取出栈顶元素 root，设置 root = root.left

该方法也与前序遍历很类似，区别主要在两点：
1. 前序遍历是将左孩子节点入栈，然后取出栈顶元素，设置 root = root.right；后序遍历恰好相反
2. 结果集需要逆序
```

```ruby
def postorder_traversal(root)
    rtn = []
    stack = []
    while root != nil || !stack.empty?
      while root != nil
        rtn.push(root.val)
        stack.push(root)
        root = root.right
      end
      root = stack.pop
      root = root.left
    end
    return rtn.reverse
end
```

## 参考

- [二叉树的后序遍历](https://leetcode-cn.com/problems/binary-tree-postorder-traversal/)
