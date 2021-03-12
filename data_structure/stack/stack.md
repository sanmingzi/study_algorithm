# Stack

## 括弧匹配

括弧匹配是栈的一个经典使用场景。题意大概如此：给定一个字符串 s ，该字符串仅包含 "(" / ")" 两种字符，现在请问该字符串 s 中有多少对有效括弧。

这类问题用栈来解决非常简单。

- 遍历字符串 s
- 如果是左括弧 "(" ，我们将其压入栈中
- 如果是右括弧 ")" ，我们将其与栈顶字符去匹配。如果栈顶是 "(" ，那么这是一对有效括弧，我们将栈顶元素弹出

## 计算器

计算器是栈的一个经典使用场景。我们使用栈 + 递归的方式能够计算几乎所有的四则运算式。具体请参考 [calculate.rb](src/calculate.rb) 。

- 遍历字符串 s ，i = 0 ，sign = '+'
- 如果 s[i] 为空，i += 1
- 如果 s[i] = [+-*/] ，sign = s[i] ， i += 1
- 如果 s[i] 是数字，我们通过循环将整个数字取出来，num = s[i..j] ，并根据 sign 将 num 压入栈 nums ，push_num(nums, sign, num)
- 如果 s[i] 是 '(' ，我们递归调用该方法，num, i = cal(s, n, i + 1) ，计算出该括号对应的值，并且更新 i 。我们还需要根据 sign 将 num 压入栈 nums ，push_num(nums, sign, num)
- 如果 s[i] 是 ')' ，i += 1 ，跳出循环，计算 nums.sum

这里还需要解释一下 push_num 方法

- sign = '+', nums.push(num)
- sign = '-', nums.push(-num)
- sign = '*', nums.push(nums.pop * num)
- sign = '/', nums.push((nums.pop * 1.0 / num).to_i)

## Practice

- [LeetCode 0224 基本计算器](https://leetcode-cn.com/problems/basic-calculator/)
- [LeetCode 0227 基本计算器 II](https://leetcode-cn.com/problems/basic-calculator-ii/)
- [LeetCode 0331 验证二叉树的前序序列化](https://leetcode-cn.com/problems/verify-preorder-serialization-of-a-binary-tree/)
- [LeetCode 1047 删除字符串中的所有相邻重复项](https://leetcode-cn.com/problems/remove-all-adjacent-duplicates-in-string/)
