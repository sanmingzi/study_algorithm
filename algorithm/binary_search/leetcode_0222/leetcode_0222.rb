# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer}
def count_nodes(root)
  return 0 if nil == root
  level = 0
  tmp = root
  while nil != tmp.left
    level += 1
    tmp = tmp.left
  end

  lo, hi = 1 << level, (1 << (level + 1)) - 1
  while lo < hi
    mid = lo + (hi - lo + 1) / 2
    if exist?(root, level, mid)
      lo = mid
    else
      hi = mid - 1
    end
  end
  return lo
end

def exist?(root, level, mid)
  bits = 1 << (level - 1)
  while root != nil && bits != 0
    if 0 == (bits & mid)
      root = root.left
    else
      root = root.right
    end
    bits >>= 1
  end
  return nil != root
end
