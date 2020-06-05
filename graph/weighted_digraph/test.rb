$LOAD_PATH.unshift(File.expand_path(".", File.dirname(__FILE__)))
$LOAD_PATH.unshift(File.expand_path("./..", File.dirname(__FILE__)))

require '../weighted_digraph/graph'
require '../weighted_digraph/dijkstra_sp'
require '../weighted_digraph/acyclic_sp'
require '../weighted_digraph/bellman_ford_sp'

module WeightedDigraph
  puts '---weighted_digraph---'
  g = Graph.new(file: 'graph.txt')
  puts g.to_s

  puts '---dijkstra_sp---'
  dijkstra_sp = DijkstraSP.new(g, 0)
  for i in 0..(g.v_count - 1)
    puts "---from 0 to #{i}---"
    puts dijkstra_sp.dist_to(i)
    puts dijkstra_sp.path_to(i).inspect
  end

  puts '---acyclic_sp---'
  acyclic_sp = AcyclicSP.new(g, 0)
  for i in 0..(g.v_count - 1)
    puts "---from 0 to #{i}---"
    puts acyclic_sp.dist_to(i)
    puts acyclic_sp.path_to(i).inspect
  end

  puts '---bellman_ford_sp---'
  sp = BellmanFordSP.new(g, 0)
  for i in 0..(g.v_count - 1)
    puts "---from 0 to #{i}---"
    puts sp.dist_to(i)
    puts sp.path_to(i).inspect
  end
end
