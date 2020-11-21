class Edge
  attr_accessor :from, :to, :cap, :flow

  def initialize(from, to, cap)
    @from = from
    @to = to
    @cap = cap
    @flow = 0
  end
end

class MaxFlow
  attr_accessor :n, :edges, :graph

  def initialize(n)
    @inf = 999999999
    @n = n
    @edges = []
    @graph = Array.new(n) { [] }
  end

  def add_edge(from, to, cap)
    edges.push(Edge.new(from, to, cap))
    edges.push(Edge.new(to, from, 0))
    graph[from].push(edges.length - 2)
    graph[to].push(edges.length - 1)
  end

  def solve(s, t)
    max_flow = 0
    while(true)
      delta = Array.new(@n, 0)
      path = Array.new(@n)
      queue = [s]
      delta[s] = @inf
      while !queue.empty?
        from = queue.shift
        @graph[from].each do |edge_index|
          edge = @edges[edge_index]
          to = edge.to
          if delta[to] == 0 && edge.cap > edge.flow
            path[to] = edge_index
            delta[to] = [delta[from], edge.cap - edge.flow].min
            queue.push(to)
          end
        end
        break if delta[t] != 0
      end
      break if delta[t] == 0
      max_flow += delta[t]
      node = t
      while node != s
        edge_index = path[node]
        @edges[edge_index].flow += delta[t]
        @edges[edge_index ^ 1].flow -= delta[t]
        node = @edges[edge_index].from
      end
    end
    return max_flow
  end
end

# @param {Character[][]} seats
# @return {Integer}
def max_students(seats)
  row, col = seats.length, seats[0].length
  seats_indexs = {}
  seats_count = 0
  for i in 0...row
    for j in 0...col
      if seats[i][j] == '.'
        seats_count += 1
        seats_indexs["#{i}-#{j}"] = seats_count
      end
    end
  end
  seats_count += 2
  max_flow = MaxFlow.new(seats_count)

  for i in 0...row
    for j in 0...col
      if seats[i][j] == '.'
        index = seats_indexs["#{i}-#{j}"]
        if j % 2 == 0
          max_flow.add_edge(0, index, 1)
        else
          max_flow.add_edge(index, seats_count - 1, 1)
        end
      end
    end
  end

  dircts = [[-1, -1], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 1]]
  for i in 0...row
    j = 0
    while j < col
      if seats[i][j] == '.'
        index = seats_indexs["#{i}-#{j}"]
        dircts.each do |dirct|
          adj_index = seats_indexs["#{i + dirct[0]}-#{j + dirct[1]}"]
          if adj_index != nil
            max_flow.add_edge(index, adj_index, 1)
          end
        end
      end
      j += 2
    end
  end

  return seats_count - 2 - max_flow.solve(0, seats_count - 1)
end

seats = [["#",".","#","#",".","#"], [".","#","#","#","#","."], ["#",".","#","#",".","#"]]
# 4
puts max_students(seats)

seats = [
  [".","#"],
  ["#","#"],
  ["#","."],
  ["#","#"],
  [".","#"]]
# 3
puts max_students(seats)
