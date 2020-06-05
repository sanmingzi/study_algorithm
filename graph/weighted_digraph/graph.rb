require '../weighted_digraph/edge'

module WeightedDigraph
  class Graph
    def initialize(file:)
      File.open(file, 'r') do |f|
        arr = f.readline.split(" ").collect { |item| item.to_i }
        @v_count, @e_count, @edges = arr.first, 0, []
        @adjs = []
        for i in 0..(@v_count - 1)
          @adjs[i] = []
        end
        arr.last.times {
          edge = f.readline.split(' ')
          add_edge(edge[0].to_i, edge[1].to_i, edge[2].to_f)
        }
      end
    end

    def v_count
      @v_count
    end

    def e_count
      @e_count
    end

    def add_edge(from, to, weight)
      edge = Edge.new(from, to, weight)
      @edges.push(edge)
      @adjs[from].push(edge)
    end

    def adj(v)
      @adjs[v]
    end

    def edges
      @edges
    end

    def to_s
      str = ''
      @edges.each do |edge|
        str += edge.to_s
        str += "\r\n"
      end
      str
    end
  end
end
