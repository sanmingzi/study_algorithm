module Digraph
  class Digraph
    attr_accessor :v_count, :e_count, :adjs

    def initialize(file: nil, v_count: 0)
      if (file)
        init_by_file(file)
      else
        init(v_count, [])
      end
    end

    def adj(v)
      return @adjs[v]
    end

    def add_edge(v, w)
      @adjs[v].push(w)
      @e_count += 1
    end

    def reverse
      digraph = Digraph.new(v_count: @v_count)
      for v in 0..(@v_count - 1)
        for w in @adjs[v]
          digraph.add_edge(w, v)
        end
      end
      return digraph
    end

    private

    def init_by_file(f)
      File.open(f, "r") do |file|
        arr = file.readline.split(" ").collect { |item| item.to_i }
        v, e = arr.first, arr.last
        edges = []
        e.times { edges.push(file.readline.split(" ").collect { |item| item.to_i }) }
        init(v, edges)
      end
    end

    def init(v, edges)
      @v_count = v
      @e_count = 0
      @adjs = Array.new(@v_count) { Array.new }
      edges.each { |edge| add_edge(edge.first, edge.last) }
    end
  end
end
