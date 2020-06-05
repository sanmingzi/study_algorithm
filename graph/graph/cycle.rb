require "graph"

class Cycle
  attr_accessor :marked, :has_cycle

  def initialize(graph)
    @has_cycle = false
    @marked = Array.new(graph.v_count, false)
    for v in 0..(graph.v_count - 1)
      if (!@marked[v])
        @marked[v] = true
        dfs(graph, v, v)
      end
    end
  end

  def has_cycle?
    return has_cycle
  end

  private

  def dfs(graph, u, v)
    for w in graph.adj(v)
      if (!@marked[w])
        @marked[w] = true
        dfs(graph, v, w)
      elsif (w != u)
        @has_cycle = true
        break
      end
    end
  end
end
