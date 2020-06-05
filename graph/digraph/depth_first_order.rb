require "digraph"

module Digraph
  class DepthFirstOrder
    attr_accessor :pre, :post

    def initialize(g)
      @pre = []
      @post = []
      @marked = Array.new(g.v_count, false)
      for v in 0..(g.v_count - 1)
        if (!@marked[v])
          @marked[v] = true
          dfs(g, v)
        end
      end
    end

    def reverse_post
      post.reverse
    end

    private

    def dfs(g, v)
      pre.push(v)
      for w in g.adj(v)
        if (!@marked[w])
          @marked[w] = true
          dfs(g, w)
        end
      end
      post.push(v)
    end
  end
end
