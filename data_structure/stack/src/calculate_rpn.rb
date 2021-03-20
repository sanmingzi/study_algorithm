class Array
  def rpn_value
    nums = []
    self.each do |str|
      if str =~ /^[-+*\/]$/
        num1, num2 = nums.pop, nums.pop
        nums.push(eval("(1.0 * #{num2} #{str} #{num1}).to_i"))
      else
        nums.push(str.to_i)
      end
    end
    nums[0]
  end
end

class String
  OPT_LEVELS = {'+' => 0, '-' => 0, '*' => 1, '/' => 1}

  def opt_level
    OPT_LEVELS[self]
  end

  def rpn
    tokens, signs = [], []
    n = self.length
    i = 0
    pre_char = nil
    while i < n
      if self[i] == ' '
        i += 1
      elsif self[i] =~ /^[-+*\/]$/
        tokens.push('0') if pre_char == '(' || pre_char == nil
        pre_char = self[i]
        while !signs.empty? && signs.last != '(' && signs.last.opt_level >= self[i].opt_level
          tokens.push(signs.pop)
        end
        signs.push(self[i])
        i += 1
      elsif self[i] == '('
        pre_char = '('
        signs.push('(')
        i += 1
      elsif self[i] == ')'
        pre_char = ')'
        while signs.last != '('
          tokens.push(signs.pop)
        end
        signs.pop
        i += 1
      else
        pre_char = self[i]
        num = ''
        while i < n && self[i] >= '0' && self[i] <= '9'
          num += self[i]
          i += 1
        end
        tokens.push(num)
      end
    end
    while !signs.empty?
      tokens.push(signs.pop)
    end
    tokens
  end
end

def calculate(s)
  s.rpn.rpn_value
end

[
  "1 + 1",
  "1 + 1 - (2 + 2)",
  "2 + 2 / (1 + 1) * 10 / (5 + 5)",
  "-(2 + 3)",
  "-5 * (2 + 4)",
  "1-(+1+1)"
].each do |s|
  puts calculate(s)
  puts '------------------'
end
