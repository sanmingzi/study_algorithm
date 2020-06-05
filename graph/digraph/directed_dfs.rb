require "digraph"

module Digraph
  class DirectedDFS
    def initialize(g, s: nil, sources: nil)
      @marked = Array.new(g.v_count, false)
      sources = [] if (sources == nil)
      sources.push(s) if (s != nil)
      for s in sources
        if (!@marked[s])
          @marked[s] = true
          dfs(g, s)
        end
      end
    end

    def connected?(v)
      return @marked[v]
    end

    private

    def dfs(g, v)
      for w in g.adj(v)
        if (!@marked[w])
          @marked[w] = true
          dfs(g, w)
        end
      end
    end
  end
end
