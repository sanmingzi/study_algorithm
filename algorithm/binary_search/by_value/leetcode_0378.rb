# @param {Integer[][]} matrix
# @param {Integer} k
# @return {Integer}
def kth_smallest(matrix, k)
  n = matrix.length
  left, right = matrix[0][0], matrix[n - 1][n - 1]
  while left < right
    mid = left + (right - left) / 2
    if check(matrix, n, k, mid)
      right = mid
    else
      left = mid + 1
    end
  end
  return right
end

def check(matrix, n, k, mid)
  i, j = n - 1, 0
  count = 0
  while i >= 0 && j < n
    if matrix[i][j] <= mid
      count += (i + 1)
      j += 1
    else
      i -= 1
    end
  end
  count >= k
end
