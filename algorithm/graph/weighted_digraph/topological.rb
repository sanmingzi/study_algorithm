require "weight_digraph/graph"
require "weight_digraph/directed_cycle"
require "weight_digraph/depth_first_order"

module WeightDigraph
  class Topological
    def initialize(g)
      @order = nil
      # directed_cycle = DirectedCycle.new(g)
      # if (!directed_cycle.has_cycle?)
        depth_first_order = DepthFirstOrder.new(g)
        @order = depth_first_order.reverse_post
      # end
    end

    def is_DAG?
      @order != nil
    end

    def order
      @order
    end
  end
end
