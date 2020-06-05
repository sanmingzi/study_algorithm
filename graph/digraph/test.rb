$LOAD_PATH.unshift(File.expand_path(".", File.dirname(__FILE__)))

require "digraph"
require "directed_dfs"
require "directed_cycle"
require "depth_first_order"
require "topological"
require "kosaraju_scc"

module Digraph
  puts "---digraph---"
  digraph = Digraph.new(file: "digraph.txt")
  puts digraph.adjs.inspect

  puts "---reverse---"
  reverse = digraph.reverse
  puts reverse.adjs.inspect

  puts "---directed_dfs---"
  dfs = DirectedDFS.new(digraph, s: 0)
  puts "0 connected to 4: #{dfs.connected?(4)}"

  dfs = DirectedDFS.new(digraph, sources: [0, 5])
  puts "[0, 5] connected to 4: #{dfs.connected?(4)}"

  puts "---directed_cycle---"
  cycle = DirectedCycle.new(digraph)
  puts "has_cycle: #{cycle.has_cycle?}"
  puts "cycle: #{cycle.cycle}"

  puts "---depth_first_order---"
  order = DepthFirstOrder.new(digraph)
  puts "pre order: #{order.pre}"
  puts "post order: #{order.post}"
  puts "reverse post order: #{order.reverse_post}"

  puts "---topological---"
  topological = Topological.new(digraph)
  puts "is_DAG: #{topological.is_DAG?}"
  puts "topological order: #{topological.order}"

  puts "---strong connect count---"
  scc = KosarajuSCC.new(digraph)
  puts "scc: #{scc.count}"
  puts "id: #{scc.id}"
end
