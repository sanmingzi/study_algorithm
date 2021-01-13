class UnionFind
  attr_accessor :parents

  def initialize(n)
    @parents = Array.new(n + 2, nil)
  end

  def find(x)
    nil == @parents[x] ? x : @parents[x] = find(@parents[x])
  end

  def union(x, y)
    @parents[x] = y
  end
end

# @param {Integer[][]} edges
# @return {Integer[]}
def find_redundant_directed_connection(edges)
  conflict_node = find_conflict_node(edges)
  return find_cycle_edge(edges) if nil == conflict_node
  conflict_edges = edges.select { |from, to| to == conflict_node }
  edges.delete(conflict_edges.last)
  nil == find_cycle_edge(edges) ? conflict_edges.last : conflict_edges.first
end

def find_conflict_node(edges)
  count = Array.new(edges.length + 1, 0)
  edges.each do |from, to|
    count[to] += 1
    return to if count[to] == 2
  end
  return nil
end

def find_cycle_edge(edges)
  union_find = UnionFind.new(edges.length)
  edges.each do |x, y|
    root_x, root_y = union_find.find(x), union_find.find(y)
    return [x, y] if root_x == root_y
    union_find.union(root_x, root_y)
  end
  return nil
end
