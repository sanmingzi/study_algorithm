MOD = 10 ** 9 + 7

class Heap
  attr_accessor :pq, :length, :sum

  def initialize
    @length = 0
    @pq = Array.new
    @sum = 0
  end

  def insert(value)
    @length += 1
    @pq[@length] = value
    @sum += value
    swim(@length)
  end

  def delete
    @sum -= root
    @pq[1], @pq[@length] = @pq[@length], nil
    @length -= 1
    sink(1)
  end

  def swim(index)
    while index > 1 && can_change?(index / 2, index)
      exch(index, index / 2)
      index /= 2
    end
  end

  def sink(index)
    while index * 2 <= @length
      child_index = index * 2
      child_index += 1 if @pq[child_index + 1] != nil && can_change?(child_index, child_index + 1)
      break if !can_change?(index, child_index)
      exch(child_index, index)
      index = child_index
    end
  end

  def exch(i, j)
    @pq[i], @pq[j] = @pq[j], @pq[i]
  end

  def root
    @pq[1]
  end

  def can_change?(parent_index, child_index)
    raise NotImplementedError.new
  end
end

class MinHeap < Heap
  def can_change?(parent_index, child_index)
    @pq[child_index] < @pq[parent_index]
  end
end

class MaxHeap < Heap
  def can_change?(parent_index, child_index)
    @pq[child_index] > @pq[parent_index]
  end
end
