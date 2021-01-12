class Digraph
  attr_accessor :v_count, :adjs

  def initialize(v_count)
    @v_count = v_count
    @adjs = Array.new(@v_count) { Array.new }
  end

  def add_edge(v, w)
    @adjs[v].push(w)
  end

  def adj(v)
    return @adjs[v]
  end
end

class DirectedCycle
  attr_accessor :has_cycle

  def initialize(g)
    @marked = Array.new(g.v_count)
    @in_path = Array.new(g.v_count, false)
    @has_cycle = false
    for v in 0..(g.v_count - 1)
      break if @has_cycle
      if !@marked[v]
        @marked[v] = true
        @has_cycle ||= dfs(g, v)
      end
    end
  end

  private

  def dfs(g, v)
    @in_path[v] = true
    for w in g.adj(v)
      return true if @in_path[w]
      if !@marked[w]
        @marked[w] = true
        return true if dfs(g, w)
      end
    end
    @in_path[v] = false
    return false
  end
end

class Topological
  attr_accessor :order

  def initialize(g)
    @order = []
    if !DirectedCycle.new(g).has_cycle
      @marked = Array.new(g.v_count, false)
      for v in (0...g.v_count).to_a.reverse
        if !@marked[v]
          @marked[v] = true
          dfs(g, v)
        end
      end
      @order.reverse!
    end
  end

  private

  def dfs(g, v)
    for w in g.adj(v)
      if !@marked[w]
        @marked[w] = true
        dfs(g, w)
      end
    end
    @order.push(v)
  end
end

# @param {Integer} n
# @param {Integer} m
# @param {Integer[]} group
# @param {Integer[][]} before_items
# @return {Integer[]}
def sort_items(n, m, group, before_items)
  digraph = Digraph.new(n + m * 2)
  group.each_with_index do |g, item|
    if -1 != g
      digraph.add_edge(g + n, item)
      digraph.add_edge(item, g + n + m)
    end
  end
  before_items.each_with_index do |items, current|
    to = group[current] == -1 ? current : group[current] + n
    items.each do |item|
      if group[item] == group[current]
        digraph.add_edge(item, current)
      else
        from = group[item] == -1 ? item : group[item] + n + m
        digraph.add_edge(from, to)
      end
    end
  end
  Topological.new(digraph).order.select { |val| val < n }
end
