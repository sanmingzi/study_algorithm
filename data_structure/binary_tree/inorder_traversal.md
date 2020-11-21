# 中序遍历

```m
先遍历左节点，再遍历根节点，最后遍历右节点
```

## 递归法

```ruby
def inorder_traversal(root)
    return [] if root == nil
    
    results = []
    results += inorder_traversal(root.left)
    results.push(root.val)
    results += inorder_traversal(root.right)
    results
end
```

## 迭代法

```m
1. 对于当前节点，我们将其压入栈中，并将其左孩子节点依次压入栈中
2. 取出栈顶元素 root，将其值放入结果集中
3. 设置 root = root.right
```

```ruby
def inorder_traversal(root)
  rtn = []
  stack = []
  while root != nil || !stack.empty?
    while root != nil
      stack.push(root)
      root = root.left
    end
    root = stack.pop
    rtn.push(root.val)
    root = root.right
  end
  return rtn
end
```

## 参考

- [二叉树的中序遍历](https://leetcode-cn.com/problems/binary-tree-inorder-traversal/)
- [二叉树的中序遍历解题报告](https://leetcode-cn.com/problems/binary-tree-inorder-traversal/solution/er-cha-shu-de-zhong-xu-bian-li-by-leetcode-solutio/)
