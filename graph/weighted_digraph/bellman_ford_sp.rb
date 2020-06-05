require '../weighted_digraph/edge'
require '../weighted_digraph/graph'
require '../weighted_digraph/sp'

# TODO
# 增加负权重环的检测
module WeightedDigraph
  class BellmanFordSP < SP
    def initialize(g, s)
      super(g, s)
      # 这里不考虑负权重环的情况
      queue = []
      queue << s
      while(!queue.empty?)
        v = queue.shift
        relax(g, v, queue)
      end
    end

    private

    def relax(g, v, queue)
      for edge in g.adj(v)
        to = edge.to
        if(@dist_to[to] > @dist_to[v] + edge.weight)
          @dist_to[to] = @dist_to[v] + edge.weight
          @edge_to[to] = edge
          queue << to unless(queue.include?(to))
        end
      end
    end
  end
end
