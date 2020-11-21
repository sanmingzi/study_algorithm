require "graph.rb"

class BreadFirstSearch
  attr_accessor :marked, :edge_to, :s

  def initialize(graph, s)
    @marked = Array.new(graph.v_count, false)
    @edge_to = Array.new(graph.v_count)
    @s = s
    bfs(graph, s)
  end

  def bfs(g, s)
    queue = []
    queue.push(s)
    marked[s] = true
    while (!queue.empty?)
      v = queue.shift
      for w in g.adj(v)
        if (!marked[w])
          marked[w] = true
          edge_to[w] = v
          queue.push(w)
        end
      end
    end
  end

  def has_path_to?(v)
    return marked[v]
  end

  def path_to(v)
    path = []
    while (v != @s)
      path.push(v)
      v = edge_to[v]
    end
    path.push(@s)
    return path
  end
end
