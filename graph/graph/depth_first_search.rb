require "graph.rb"

class DepthFirstSearch
  attr_accessor :marked, :count, :edge_to, :s

  def initialize(graph, s)
    @count = 0
    @marked = Array.new(graph.v_count, false)
    @edge_to = Array.new(graph.v_count)
    @s = s
    dfs(graph, s)
  end

  def dfs(graph, v)
    @marked[v] = true
    @count += 1
    graph.adj(v).each do |w|
      if (!@marked[w])
        edge_to[w] = v
        dfs(graph, w)
      end
    end
  end

  def has_path_to?(v)
    return @marked[v]
  end

  def path_to(v)
    return nil if (!has_path_to?(v))
    path = []
    while (v != @s)
      path << v
      v = edge_to[v]
    end
    path.push(@s)
    return path
  end
end
