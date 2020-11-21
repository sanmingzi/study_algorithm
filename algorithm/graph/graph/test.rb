$LOAD_PATH.unshift(File.expand_path(".", File.dirname(__FILE__)))

require "graph"
require "depth_first_search"
require "bread_first_search"
require "connect_count"
require "two_color"
require "cycle"

# graph = Graph.new(stdin: STDIN)
graph = Graph.new(file: "graph.txt")
puts graph.inspect

puts "---depth_first_search---"
search = DepthFirstSearch.new(graph, 3)
puts search.marked.inspect
puts search.has_path_to?(4)
puts search.path_to(1).inspect

puts "---bread_first_search---"
search = BreadFirstSearch.new(graph, 3)
puts search.marked.inspect
puts search.has_path_to?(4)
puts search.path_to(1).inspect

puts "---connect_count---"
cc = ConnectCount.new(graph)
puts "count: #{cc.count}"
puts "id: #{cc.id.inspect}"
puts "1 connected to 2: #{cc.connected?(1, 6)}"

puts "---two_color---"
two_color = TwoColor.new(graph)
puts "color: #{two_color.color.inspect}"
puts "is two color: #{two_color.is_two_colorable?}"

puts "---cycle---"
cycle = Cycle.new(graph)
puts "has cycle: #{cycle.has_cycle?}"
