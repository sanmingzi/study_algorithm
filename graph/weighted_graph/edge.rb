module WeightedGraph
  class Edge
    def initialize(v, w, weight)
      @v, @w, @weight = v.to_i, w.to_i, weight.to_f
    end

    def weight
      @weight
    end

    def either
      @v
    end

    def other(u)
      if (u == @v)
        return @w
      elsif (u == @w)
        return @v
      else
        return nil
      end
    end

    def <=>(other)
      self.weight <=> other.weight
    end
  end
end
