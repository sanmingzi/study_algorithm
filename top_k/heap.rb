class MinHeap
  attr_accessor :pq, :length

  def initialize(nums, k)
    @length = 0
    @pq = Array.new
    for i in 0...k
      insert(nums[i])
    end
  end

  def insert(value)
    @length += 1
    @pq[@length] = value
    swim(@length)
  end

  def del_min
    @pq[1], @pq[@length] = @pq[@length], nil
    @length -= 1
    sink(1)
  end

  def swim(index)
    while index > 1
      parent_index = index / 2
      if less(index, parent_index)
        exch(index, parent_index)
        index = parent_index
      else
        break
      end
    end
  end

  def sink(index)
    while index * 2 <= @length
      child_index = index * 2
      child_index += 1 if child_index < @length && less(child_index + 1, child_index)
      break if less(index, child_index)
      exch(child_index, index)
      index = child_index
    end
  end

  def exch(i, j)
    @pq[i], @pq[j] = @pq[j], @pq[i]
  end

  def less(i, j)
    @pq[i] < @pq[j]
  end

  def root
    @pq[1]
  end
end

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def find_kth_largest(nums, k)
  min_heap = MinHeap.new(nums, k)
  for i in k...nums.length
    min_heap.insert(nums[i])
    min_heap.del_min
  end
  return min_heap.root
end

nums = [3,2,1,5,6,4]
k = 2
puts find_kth_largest(nums, k)

nums = [3,2,3,1,2,4,5,5,6]
k = 4
puts find_kth_largest(nums, k)
