require "graph"

class ConnectCount
  attr_accessor :set, :count, :id, :marked

  def initialize(graph)
    @count = 0
    @set = Array.new(graph.v_count)
    @id = Array.new(graph.v_count)
    @marked = Array.new(graph.v_count)
    for v in 0..(graph.v_count - 1)
      set[v] = v
    end
    for v in 0..(graph.v_count - 1)
      if (!marked[v])
        marked[v] = true
        bfs(graph, v)
        @count += 1
      end
    end
  end

  def connected?(v, w)
    return find(v) == find(w)
  end

  private

  def bfs(graph, s)
    queue = [s]
    while (!queue.empty?)
      v = queue.shift
      id[v] = @count
      union(s, v)
      for w in graph.adj(v)
        if (!marked[w])
          marked[w] = true
          queue.push(w)
        end
      end
    end
  end

  def find(v)
    while (v != set[v])
      set[v] = find(set[v])
      v = set[v]
    end
    return set[v]
  end

  def union(v, w)
    v, w = find(v), find(w)
    set[v] = w if (v != w)
  end
end
