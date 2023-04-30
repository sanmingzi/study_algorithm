
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

[
  [1, 2, 3],
  [3, 2, 1],
  [9, 8, 7, 6, 5, 4, 3, 2, 1]
].each do |arr|
  puts "Cantor.hash: #{arr.inspect} #{Cantor.hash(arr)}"
end


[
  [[1, 2, 3], 0],
  [[1, 2, 3], 5],
  [[1, 2, 3, 4, 5, 6, 7, 8, 9], 362879]
].each do |elements, order|
  puts "Cantor.reverse_hash: #{elements.inspect} #{order} #{Cantor.reverse_hash(elements, order)}"
end
