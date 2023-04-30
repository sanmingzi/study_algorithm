
class AllCombinationBinary
  def initialize(arr)
    @arr, @n = arr, arr.length
    @retn = []
  end

  def execute
    for i in 0...(2 ** @n)
      count = 0
      _i = i
      retn = []
      for j in 0...@n
        retn.push(@arr[j]) if _i & (1 << j) != 0
      end
      @retn.push(retn)
    end
    @retn
  end
end

[
  [1, 2, 3],
  [1, 2, 3, 4]
].each do |arr|
  combination = AllCombinationBinary.new(arr)
  retn = combination.execute
  puts retn.inspect
  puts "\n"
end
