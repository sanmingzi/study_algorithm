# find the first index which value is bigger than target
def binary_search(begin_index: 0, end_index: nil, arr: [], target: 0)
  end_index ||= arr.length
  while begin_index < end_index
    mid_index = begin_index + (end_index - begin_index) / 2
    if arr[mid_index] <= target
      begin_index = mid_index + 1
    else
      end_index = mid_index
    end
  end
  return begin_index
end

def test
  5.times {
    length = rand(10)
    arr = []
    length.times { arr.push(rand(10000)) }
    arr.sort!
    max_value = arr.last
    5.times {
      target = rand(10000)
      index = binary_search(arr: arr, target: target)
      puts arr.inspect
      puts "target: #{target} index: #{index}"
    }
  }
end

test
