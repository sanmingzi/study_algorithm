
class PermutationLexicographic
  class << self
    def execute(arr)
      arr.sort!
      count = 0
      while arr != nil
        puts arr.inspect
        count += 1
        arr = generate_next(arr)
      end
      count
    end

    def generate_next(arr)
      # 1. from right to left, find the first arr[j] < arr[j + 1]
      # 2. exchange arr[j] with the minimum from arr(j + 1 ... length) which is bigger than arr[j]
      # 3. sort arr(j + 1 ... length) ASC
      j = arr.length - 2
      while j >= 0 && arr[j] >= arr[j + 1]
        j -= 1
      end
      # the current permutation is the biggest one
      if j == -1
        return nil
      end

      k = j + 1
      for i in k + 1...arr.length
        if arr[i] > arr[j]
          k = i
        else
          break
        end
      end
      arr[j], arr[k] = arr[k], arr[j]
      return arr[0, j + 1] + arr[j + 1, arr.length].reverse
    end
  end
end

[
  [1, 1, 2, 2],
  [1, 2],
  [1, 2, 3],
  [1, 2, 3, 4],
  [1, 2, 3, 4, 5],
].each do |arr|
  count = PermutationLexicographic.execute(arr)
  puts count
  puts "\n"
end
