# 双向广搜 (both direction bfs)

```
顾名思义，双向广搜就是从两个方向同时开始进行广搜。
这个方法的好处是可以有效的减少搜索空间，提高搜索效率。
```

## 例题

### [单词接龙](https://leetcode-cn.com/problems/word-ladder/)

- [AC by Ruby](leetcode_0127.rb)

```ruby
step = 0
begin_node, end_node = word_ids[begin_word], word_ids[end_word]
queue0, queue1 = [begin_node], [end_node]
flag0, flag1 = Array.new(@node_num, false), Array.new(@node_num, false)
flag0[begin_node], flag1[end_node] = true, true
while !queue0.empty?
  step += 1
  queue0.length.times {
    node = queue0.shift
    edges[node].each do |next_node|
      next if true == flag0[next_node]
      return (step / 2) + 1 if true == flag1[next_node]
      queue0.push(next_node)
      flag0[next_node] = true
    end
  }

  step += 1
  queue1.length.times {
    node = queue1.shift
    edges[node].each do |next_node|
      next if true == flag1[next_node]
      return (step / 2) + 1 if true == flag0[next_node]
      queue1.push(next_node)
      flag1[next_node] = true
    end
  }
end
```

```
在上述方法中，我们维护了两个搜索队列，一个队列从 begin_node 开始，一个队列从 end_node 开始。当找到某个点在两个队列中都出现过，那我们就可以说找到了一条最短路径。
```
