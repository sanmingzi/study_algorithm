require "digraph"
require "depth_first_order"

module Digraph
  class KosarajuSCC
    attr_accessor :id, :count

    def initialize(g)
      @count = 0
      @id = Array.new(g.v_count)
      @marked = Array.new(g.v_count, false)
      order = DepthFirstOrder.new(g.reverse).reverse_post
      puts "---order---: #{order}"
      for v in order
        if (!@marked[v])
          dfs(g, v)
          @count += 1
        end
      end
    end

    private

    def dfs(g, v)
      @marked[v] = true
      @id[v] = @count
      for w in g.adj(v)
        dfs(g, w) if (!@marked[w])
      end
    end
  end
end
