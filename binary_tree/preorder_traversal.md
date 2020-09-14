# 前序遍历

```m
先遍历根节点，再遍历左节点，最后遍历右节点
```

## 递归法

```ruby
def preorder_traversal(root)
    return [] if root == nil
    
    results = []
    results.push(root.val)
    results += preorder_traversal(root.left)
    results += preorder_traversal(root.right)
    results
end
```

## 迭代法

### 方法1

```m
1. 初始化栈，将 root 节点放入栈中
2. 取出栈顶节点，将其值放入结果集中
3. 分别将栈顶节点的右孩子节点和左孩子节点压入栈中
```

```ruby
def preorder_traversal(root)
  return [] if root == nil

  rtn = []
  stack = [root]
  while !stack.empty?
    root = stack.pop
    rtn.push(root.val)
    stack.push(root.right) if root.right
    stack.push(root.left)  if root.left
  end
  return rtn
end
```

### 方法2

```m
1. 对于当前节点，我们将其值放入结果集中
2. 我们将该节点压入栈中，并将其左孩子节点依次压入栈中
3. 取出栈顶元素 root，设置 root = root.right
```

```ruby
def preorder_traversal(root)
    rtn = []
    stack = []
    while root != nil || !stack.empty?
      while root != nil
        rtn.push(root.val)
        stack.push(root)
        root = root.left
      end
      root = stack.pop
      root = root.right
    end
    return rtn
end
```

## 参考

- [二叉树的前序遍历](https://leetcode-cn.com/problems/binary-tree-preorder-traversal/)
