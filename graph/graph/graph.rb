class Graph
  attr_accessor :v_count, :e_count, :adjs

  def initialize(file: nil, stdin: nil)
    return init_by_file(file) if (file)
    return init_by_stdin(stdin) if (stdin)
  end

  def init_by_file(f)
    File.open(f, "r") do |file|
      arr = file.readline.split(" ").collect { |item| item.to_i }
      v, e = arr.first, arr.last
      edges = []
      e.times { edges.push(file.readline.split(" ").collect { |item| item.to_i }) }
      init(v, edges)
    end
  end

  def init_by_stdin(stdin)
    arr = stdin.gets().split(" ").collect { |item| item.to_i }
    v, e = arr.first, arr.last
    edges = []
    e.times { edges.push(stdin.gets().split(" ").collect { |item| item.to_i }) }
    init(v, edges)
  end

  def init(v, edges)
    @v_count = v
    @e_count = 0
    @adjs = Array.new(@v_count) { Array.new }
    edges.each { |edge| add_edge(edge.first, edge.last) }
  end

  def add_edge(v, w)
    adj(v).push(w)
    adj(w).push(v)
    @e_count += 1
  end

  def adj(v)
    return adjs[v]
  end
end
