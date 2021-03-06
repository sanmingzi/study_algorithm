class Matrix
  attr_accessor :arr

  def initialize(arr: [[]])
    @arr = arr
  end

  def row_length
    @arr.length
  end

  def col_length
    @arr[0].length
  end

  def +(obj)
    deviation(obj)
  end

  def -(obj)
    deviation(obj, -1)
  end

  def *(obj)
    tmp = Matrix.new
    for i in 0...self.row_length
      tmp.arr[i] = Array.new(obj.col_length, 0)
      for j in 0...obj.col_length
        for k in 0...self.col_length
          tmp.arr[i][j] += self.arr[i][k] * obj.arr[k][j]
        end
      end
    end
    return tmp
  end

  def clone
    rtn = Matrix.new
    for i in 0...row_length
      rtn.arr[i] = @arr[i].clone
    end
    return rtn
  end

  def **(n)
    rtn = Matrix.new
    for i in 0...row_length
      rtn.arr[i] = Array.new(row_length, 0)
      rtn.arr[i][i] = 1
    end
    exp = self.clone
    while n > 0
      rtn = rtn * exp if 1 == (n & 1)
      n >>= 1
      exp *= exp
    end
    return rtn
  end

  private

  def deviation(obj, factor: 1)
    tmp = Matrix.new
    for i in 0...self.arr.length
      tmp.arr[i] ||= []
      for j in 0...self.arr[0].length
        tmp.arr[i][j] = self.arr[i][j] + obj.arr[i][j] * factor
      end
    end
    return tmp
  end
end

matrix0 = Matrix.new(arr: [[0, 1], [2, 3]])
matrix1 = Matrix.new(arr: [[0, 1], [2, 3]])
puts (matrix0 + matrix1).inspect
puts (matrix0 * matrix1).inspect
# puts (matrix0 ** 0).inspect
# puts (matrix0 ** 1).inspect
puts (matrix0 ** 2).inspect
puts (matrix0 * matrix0).inspect
