def quick_sort(a, lo, hi)
  return if lo >= hi
  exch(a, lo, lo + (hi - lo) / 2)
  value = a[lo]
  left_index, right_index = lo + 1, hi
  while true
    while left_index <= hi && a[left_index] < value
      left_index += 1
    end
    while a[right_index] > value
      right_index -= 1
    end
    break if left_index >= right_index
    exch(a, left_index, right_index)
    left_index += 1
    right_index -= 1
  end
  exch(a, lo, right_index)
  quick_sort(a, lo, right_index - 1)
  quick_sort(a, right_index + 1, hi)
end

def exch(a, i, j)
  a[i], a[j] = a[j], a[i]
end

def test
  puts 'test begin .............................................'
  arr = []
  10.times { arr.push(rand(10)) }
  # puts arr.inspect
  quick_sort(arr, 0, arr.length - 1)
  # puts arr.inspect
  for i in 1...arr.length
    if arr[i] < arr[i - 1]
      puts 'the answer is wrong'
      puts "a[#{i}] < a[#{i - 1}]"
      break
    end
  end
  puts 'test end .............................................'
end

5.times { test }
