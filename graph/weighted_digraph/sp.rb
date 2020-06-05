module WeightedDigraph
  class SP
    def initialize(g, s)
      @dist_to = []
      for i in 0..(g.v_count - 1)
        @dist_to[i] = Float::INFINITY
      end
      @dist_to[s], @edge_to = 0, []
    end

    def dist_to(v)
      @dist_to[v]
    end

    def has_path_to?(v)
      @dist_to[v] != Float::INFINITY
    end

    def path_to(v)
      rtn = []
      edge = @edge_to[v]
      while(edge)
        rtn << edge
        v = edge.from
        edge = @edge_to[v]
      end
      rtn
    end
  end
end
