# @param {Integer} s
# @param {Integer[]} nums
# @return {Integer}
def min_sub_array_len(s, nums)
  return 0 if nums == nil || nums.empty? || s == 0

  rtn, left, right = nums.length + 1, 0, 0
  sum = nums[0]
  while true
    if sum >= s
      rtn = [rtn, right - left + 1].min
      sum -= nums[left]
      left += 1
    else
      right += 1
      break if right == nums.length
      sum += nums[right]
    end
  end
  
  return rtn == nums.length + 1 ? 0 : rtn
end
