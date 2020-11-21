module WeightedDigraph
  class Edge
    def initialize(from, to, weight)
      @from, @to, @weight = from, to, weight
    end

    def weight
      @weight
    end

    def from
      @from
    end

    def to
      @to
    end

    def <=>(other)
      self.weight <=> other.weight
    end

    def to_s
      "#{@from} -> #{@to} #{@weight}"
    end
  end
end
