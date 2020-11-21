$LOAD_PATH.unshift(File.expand_path(".", File.dirname(__FILE__)))

require '../weighted_graph/graph'
require '../weighted_graph/kruskal_mst'

module WeightedGraph
  puts '---weighted_graph---'
  puts '---graph---'
  graph = Graph.new(file: 'graph.txt')
  puts graph.to_s

  puts '---kruskal_mst---'
  mst = KruskalMST.new(graph)
  puts mst.edges.inspect
  puts mst.weight
end
