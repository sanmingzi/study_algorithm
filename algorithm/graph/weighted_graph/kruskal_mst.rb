require "../weighted_graph/graph"

module WeightedGraph
  class KruskalMST
    def initialize(g)
      @edges, @weight = [], 0
      marked = Array.new(g.v_count, false)
      g.edges.sort.each do |edge|
        v = edge.either
        w = edge.other(v)
        if(!marked[v] || !marked[w])
          @edges.push(edge)
          @weight += edge.weight
          marked[v] = true
          marked[w] = true
          break if(@edges.count == g.v_count - 1)
        end
      end
    end

    def edges
      return @edges
    end

    def weight
      return @weight
    end
  end
end
