# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def find_kth_largest(nums, k)
  small, big = [], []
  num = nums[0]
  for i in 1...nums.length
    small.push(nums[i]) if nums[i] < num
    big.push(nums[i]) if nums[i] >= num
  end
  if big.length < k - 1
    return find_kth_largest(small, k - 1 - big.length)
  elsif big.length == k - 1
    return num
  else
    return find_kth_largest(big, k)
  end
end

nums = [3,2,1,5,6,4]
k = 2
puts find_kth_largest(nums, k)

nums = [3,2,3,1,2,4,5,5,6]
k = 4
puts find_kth_largest(nums, k)
