# https://leetcode-cn.com/problems/yong-liang-ge-zhan-shi-xian-dui-lie-lcof/

class CQueue
  attr_accessor :stack0, :stack1

  def initialize()
    @stack0, @stack1 = [], []
  end

=begin
  :type value: Integer
  :rtype: Void
=end
  def append_tail(value)
    @stack0.push(value)
  end

=begin
  :rtype: Integer
=end
  def delete_head()
    if @stack1.empty?
      while !@stack0.empty?
        @stack1.push(@stack0.pop)
      end
    end
    
    return -1 if @stack1.empty?
    @stack1.pop
  end
end

# Your CQueue object will be instantiated and called as such:
# obj = CQueue.new()
# obj.append_tail(value)
# param_2 = obj.delete_head()
