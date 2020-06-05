require "digraph"

module Digraph
  class DirectedCycle
    attr_accessor :cycle

    def initialize(g)
      @cycle = nil
      @path = Array.new(g.v_count)
      @marked = Array.new(g.v_count, false)
      @edge_to = Array.new(g.v_count)
      for v in 0..(g.v_count - 1)
        if (!@marked[v])
          @marked[v] = true
          dfs(g, v)
        end
      end
    end

    def has_cycle?
      @cycle != nil
    end

    private

    def dfs(g, v)
      @path.push(v)
      for w in g.adj(v)
        if (has_cycle?)
          return
        elsif (!@marked[w])
          @marked[w] = true
          @edge_to[w] = v
          dfs(g, w)
        elsif (@path.include?(w))
          @cycle = []
          while (v != w)
            @cycle.push(v)
            v = @edge_to[v]
          end
          @cycle.push(w)
        end
      end
      @path.pop
    end
  end
end
