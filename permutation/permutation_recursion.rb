
# the result is un-sorted
# the result is not uniq if the arr is not uniq
class PermutationRecursion
  def initialize(arr)
    @arr = arr.sort!
    @length = @arr.length
    @permutation = []
  end

  def execute
    recursion(0)
    @permutation
  end

  private

  def recursion(start_index)
    if start_index == @length - 1
      @permutation += [@arr.dup]
      return
    end

    for index in start_index...@length
      @arr[start_index], @arr[index] = @arr[index], @arr[start_index]
      recursion(start_index + 1)
      @arr[start_index], @arr[index] = @arr[index], @arr[start_index]
    end
  end
end

[
  [1, 2, 3],
  [1, 2, 3, 4],
  [1, 2, 3, 4, 5],
  [1, 2, 3, 4, 5, 6]
].each do |arr|
  permutation = PermutationRecursion.new(arr)
  retn = permutation.execute
  puts retn.uniq.size
end
