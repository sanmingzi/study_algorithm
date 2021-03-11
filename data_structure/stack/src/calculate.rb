def calculate(s)
  cal(s, s.length, 0).first
end

def cal(s, n, i)
  sign, nums = '+', []
  while i < n
    if s[i] == ' '
      i += 1
    elsif is_digit?(s, i)
      num = 0
      while i < n && s[i] >= '0' && s[i] <= '9'
        num *= 10
        num += s[i].to_i
        i += 1
      end
      push_num(nums, sign, num)
    elsif s[i] == '('
      num, i = cal(s, n, i + 1)
      push_num(nums, sign, num)
    elsif s[i] == ')'
      i += 1
      break
    else
      sign = s[i]
      i += 1
    end
  end
  [nums.inject { |sum, num| sum + num}, i]
end

def is_digit?(s, i)
  s[i] >= '0' && s[i] <= '9'
end

def push_num(nums, sign, num)
  case sign
  when '+'
    nums.push(num)
  when '-'
    nums.push(-num)
  when '*'
    nums.push(nums.pop * num)
  when '/'
    nums.push((nums.pop * 1.0 / num).to_i)
  end
end

[
  "1 + 1",
  "1 + 1 - (2 + 2)",
  "2 + 2 / (1 + 1) * 10 / (5 + 5)",
  "-(2 + 3)",
  "-5 * (2 + 4)"
].each do |s|
  puts calculate(s)
  puts '------------------'
end
