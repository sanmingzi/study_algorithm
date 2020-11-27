# @param {Integer[]} nums
# @return {Integer}
def maximum_gap(nums)
  length, max_val = nums.length, nums.max
  return 0 if length < 2
  exp = 1
  while max_val >= exp
    cnt = Array.new(10, 0)
    nums.each do |num|
      digit = (num / exp) % 10
      cnt[digit] += 1
    end
    for i in 1..9
      cnt[i] += cnt[i - 1]
    end
    buf = Array.new(length)
    nums.reverse.each do |num|
      digit = (num / exp) % 10
      cnt[digit] -= 1
      buf[cnt[digit]] = num
    end
    nums = buf
    exp *= 10
  end
  rtn = 0
  for i in 1...length
    rtn = [rtn, nums[i] - nums[i - 1]].max
  end
  return rtn
end
