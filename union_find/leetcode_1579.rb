# @param {Integer} n
# @param {Integer[][]} edges
# @return {Integer}
def max_num_edges_to_remove(n, edges)
  edges.sort! { |edge0, edge1| edge1[0] <=> edge0[0] }
  used = Array.new(edges.length, false)
  return -1 if !union(edges, 1, used, n) || !union(edges, 2, used, n)
  used.inject(0) { |rtn, u| rtn + (u ? 0 : 1) }
end
  
def union(edges, exclude_type, used, n)
  parents = (0..n).to_a
  for i in 0...edges.length
    edge = edges[i]
    next if edge[0] == exclude_type
    node_a, node_b = edge[1], edge[2]
    root_a, root_b = find_root(node_a, parents), find_root(node_b, parents)
    if root_a != root_b
      parents[root_a] = root_b
      used[i] = true
    end
  end

  root = find_root(1, parents)
  for node in 2..n
    return false if find_root(node, parents) != root
  end
  return true
end

def find_root(node, parents)
  return node if parents[node] == node
  root = find_root(parents[node], parents)
  parents[node] = root
  return root
end
