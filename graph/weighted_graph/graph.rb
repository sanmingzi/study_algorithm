require "../weighted_graph/edge"

module WeightedGraph
  class Graph
    attr_accessor :edges, :v_count, :e_count

    def initialize(file:)
      File.open(file, "r") do |file|
        arr = file.readline.split(" ").collect { |item| item.to_i }
        @v_count, @e_count, @edges = arr.first, 0, []
        @adjs = []
        for i in 0..(@v_count - 1)
          @adjs[i] = []
        end
        arr.last.times {
          edge = file.readline.split(" ")
          add_edge(edge[0].to_i, edge[1].to_i, edge[2].to_f)
        }
      end
    end

    def add_edge(v, w, weight)
      edge = Edge.new(v, w, weight)
      @e_count += 1
      @edges.push(edge)
      @adjs[v].push(edge)
      @adjs[w].push(edge)
    end

    def adj(v)
      @adjs[v]
    end

    def to_s
      str = ''
      @edges.each do |edge|
        v = edge.either
        w = edge.other(v)
        str += "#{v} #{w} #{edge.weight}\r\n"
      end
      str
    end
  end
end
