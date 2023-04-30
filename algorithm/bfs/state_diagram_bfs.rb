class Cantor
  FACTORIAL = [1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880]

  class << self
    # arr: a permutation
    # return: the order of this permutation in all lexicographic permutations
    def hash(arr)
      length = arr.length
      order = 0
      for i in 0...length
        count = 0
        for j in (i + 1)...length
          count += 1 if arr[i] > arr[j]
        end
        order += count * FACTORIAL[length - i - 1]
      end
      order
    end

    # elements: it should be sorted
    # order: the order of a permutation in all lexicographic permutations
    # return: the order-th permutation
    def reverse_hash(elements, order)
      length = elements.length
      retn = []
      for i in 0...length
        index = order / FACTORIAL[length - i - 1]
        retn[i] = elements[index]
        elements.delete_at(index)
        order %= FACTORIAL[length - i - 1]
      end
      retn
    end
  end
end

class StateDiagramBFS
  class Node
    attr_accessor :state, :index_zero, :distance, :father

    def initialize(state, index_zero, distance, father = nil)
      @state = state
      @index_zero = index_zero
      @distance = distance
      @father = father
    end
  end

  # state: two-dimensional array
  # target_state: two-dimensional array
  def initialize(state, target_state)
    @rows, @cols = state.length, state.first.length
    @length = @rows * @cols
    @dirs = [[0, -1], [0, 1], [-1, 0], [1, 0]]
    @state, @target_state = state.flatten, target_state.flatten
    @state.each_with_index do |num, index|
      if num == 0
        @index_zero = index
        break
      end
    end
  end

  def execute
    return 0 if @state == @target_state

    start = Node.new(@state, @index_zero, 0)
    target_hash = Cantor.hash(@target_state)
    visited = []
    visited[Cantor.hash(start.state)] = true
    queue = [start]
    while !queue.empty?
      head = queue.shift
      row, col = head.index_zero / @cols, head.index_zero % @cols
      @dirs.each do |delta_row, delta_col|
        next_row, next_col = row + delta_row, col + delta_col
        if next_row >= 0 && next_row < @rows && next_col >= 0 && next_col < @cols
          next_state = head.state.dup
          next_index_zero = next_row * @cols + next_col
          next_state[next_index_zero], next_state[head.index_zero] = next_state[head.index_zero], next_state[next_index_zero]
          hash = Cantor.hash(next_state)
          return head.distance + 1 if hash == target_hash
          unless visited[hash]
            visited[hash] = true
            queue.push(Node.new(next_state, next_index_zero, head.distance + 1, head))
          end
        end
      end
    end

    return -1 # can not found
  end
end

[
  [[[3,2,4],[1,5,0]], [[1,2,3],[4,5,0]]]
].each do |state, target_state|
  puts StateDiagramBFS.new(state, target_state).execute
end
