require 'weighted_digraph/edge'
require 'weighted_digraph/graph'
TODO require 'weighted_digraph/topological'

# TODO
# if this is an acyclic digraph
# we can relax the node by the topological order
# this method is faster than dijkstra
module WeightedDigraph
  class AcyclicSP < SP
    def initialize(g, s)
      super(g, s)
      top = Topological.new(g)
      for v in top.order
        relax(g, v)
      end
    end

    private

    def relax(g, v)
    end

    def relax(g, v, queue)
      for edge in g.adj(v)
        to = edge.to
        if(@dist_to[to] > @dist_to[v] + edge.weight)
          @dist_to[to] = @dist_to[v] + edge.weight
          @edge_to[to] = edge
        end
      end
    end
  end
end
