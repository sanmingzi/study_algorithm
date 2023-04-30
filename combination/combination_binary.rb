
class CombinationBinary
  # n: the length of array
  # k: choose k elements from array
  def initialize(n, k)
    @n, @k = n, k
    @retn = []
  end

  def execute
    for i in 0...(2 ** @n)
      count = 0
      _i = i
      while(_i > 0)
        _i = _i & (_i - 1)
        count += 1
      end
      @retn.push(i) if count == @k
    end
    @retn
  end
end

[
  [3, 0],
  [3, 1],
  [3, 2],
  [3, 3]
].each do |n, k|
  combination_binary = CombinationBinary.new(n, k)
  retn = combination_binary.execute
  puts "#{n} #{k}"
  puts retn.inspect
  puts "\n"
end
