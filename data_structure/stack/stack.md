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

## 逆波兰表达式

[逆波兰表示法](https://zh.wikipedia.org/wiki/%E9%80%86%E6%B3%A2%E5%85%B0%E8%A1%A8%E7%A4%BA%E6%B3%95)

逆波兰表示法，将操作符置于操作数的后面。该方法的好处在于不需要使用括号来标识操作符的优先级。在遇到求解字符串表达式的时候，我们可以先将该字符串表达式转为逆波兰表达式，然后再进行求解。

逆波兰表达式求值是比较简单的，只需要使用栈就可以了。难点在于如何将一个字符串表达式转换为逆波兰表达式。下面给出伪代码。

- 从左至右扫描字符串
- 如果 s[i] 为空，i += 1
- 如果 s[i] 为左括号，signs.push('(')
- 如果 s[i] 为右括号，tokens.push(signs.pop) 直到 signs.top 为左括号，移除栈顶的左括号
- 如果 s[i] 为运算符
  - 如果该操作符位于字符串头部或者紧跟左括号，比如 (-2) ，此时我们需要 tokes.push('0') ，相当于在符号前面添加一个 '0' ，这样做并不会改变表达式的值，却又能够巧妙的处理前导符号的情况
  - 如果栈不为空 && 栈顶不是左括号 && signs.top.level >= s[i].level ，tokens.push(signs.pop) ，这里的 level 表示运算符的优先级
- 如果 s[i] 为数字，将整个数字读取出来，tokens.push(num)
- 字符串遍历结束之后，tokens.push(signs.pop) 直到 signs 为空。数组 tokens 就是逆波兰表达式

[calculate_rpn.rb](src/calculate_rpn.rb)

## Practice

- [LeetCode 0150 逆波兰表达式求值](https://leetcode-cn.com/problems/evaluate-reverse-polish-notation/)
- [LeetCode 0224 基本计算器](https://leetcode-cn.com/problems/basic-calculator/)
- [LeetCode 0227 基本计算器 II](https://leetcode-cn.com/problems/basic-calculator-ii/)
- [LeetCode 0331 验证二叉树的前序序列化](https://leetcode-cn.com/problems/verify-preorder-serialization-of-a-binary-tree/)
- [LeetCode 0341 扁平化嵌套列表迭代器](https://leetcode-cn.com/problems/flatten-nested-list-iterator/)
- [LeetCode 1047 删除字符串中的所有相邻重复项](https://leetcode-cn.com/problems/remove-all-adjacent-duplicates-in-string/)
