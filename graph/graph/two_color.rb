require "graph"

class TwoColor
  attr_accessor :marked, :is_two_colorable, :color

  def initialize(graph)
    @marked = Array.new(graph.v_count, false)
    @color = Array.new(graph.v_count)
    @is_two_colorable = true
    for v in 0..(graph.v_count - 1)
      if (!@marked[v])
        @marked[v] = true
        @color[v] = true
        dfs(graph, v)
      end
    end
  end

  def is_two_colorable?
    return @is_two_colorable
  end

  private

  def dfs(graph, v)
    for w in graph.adj(v)
      if (!@marked[w])
        @marked[w] = true
        @color[w] = !color[v]
        dfs(graph, w)
      elsif (@color[w] == @color[v])
        @is_two_colorable = false
        break
      end
    end
  end
end
