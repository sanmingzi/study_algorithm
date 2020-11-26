# @param {Integer[]} nums
# @return {Integer}
def maximum_gap(nums)
  return 0 if nums.length < 2
  min_val, max_val = nums.min, nums.max
  return 0 if min_val == max_val
  d = (max_val - min_val) / (nums.length - 1)
  puts d
  buckets = Array.new((max_val - min_val) / d) { [-1, 1] }
  nums.each do |num|
    bucket_id = (num - min_val) / d
    puts bucket_id
    if -1 == buckets[bucket_id].first
      buckets[bucket_id] = [num, num]
    else
      buckets[bucket_id].first = [buckets[bucket_id].first, num].min
      buckets[bucket_id].last = [buckets[bucket_id].last, num].max
    end
  end
  rtn, pre_id = 0, 0
  for i in 1...buckets.length
    next if -1 == buckets[i].first
    rtn = [rtn, buckets[i].first - buckets[pre_id].last]
    pre = i
  end
  return rtn
end
