# 固定半径的圆最多能覆盖的点的数量

- [LeetCode 1453](https://leetcode-cn.com/problems/maximum-number-of-darts-inside-of-a-circular-dartboard/)
- [POJ 1981](http://poj.org/problem?id=1981)


## 题目大意

给定平面上n个点的坐标，问半径为r的圆最多能覆盖多少个点？


## 方法1

假设圆C能够覆盖最多个点，那么我们通过移动圆C，必定能够使得至少两个点落在圆周上。

这种做法就是任意枚举两个不同的点，并且这两个点都在圆周上，此时圆是固定的。再枚举其他点，计算这种情况下覆盖的点的数量。算法复杂度 n * n * n。

## 方法2

- [思路](https://www.hankcs.com/program/algorithm/poj-1981-circle-and-points.html)

以任意点A为圆心，以r为半径画圆。如果圆心落在圆上或者圆内，那么A点必然会被覆盖。

先固定一个点i，该点的单位圆与其他点j的单位元相交，形成圆i上的一段弧。如果最终圆心在该弧上，那么i点和j点必然都可以被覆盖到。

可以用两个极角表示一段弧，分别为起点和终点。固定i点，枚举其他点j，最多可以得到n - 1个区间。对极角进行排序，如果极角弧度相同，则起点在前。遇到起点，计数器加1，遇到终点，计数器-1，记录计数器的最大值。

## 核心代码

```ruby
def dist(p1, p2)
  return ((p1.first - p2.first) ** 2 + (p1.last - p2.last) ** 2) ** (1.0 / 2)
end

class PolarAngel
  attr_accessor :is_begin, :angle
  
  def initialize(is_begin: false, angle: 0)
    @is_begin = is_begin
    @angle = angle
  end
end
```

```ruby
points.each do |center|
  angles = []
  
  points.each do |point|
    d = dist(center, point)
    next if point == center || d > 2 * r
    theta = Math.atan2(point.last - center.last, point.first - center.first)
    phi = Math.acos(d / (2.0 * r))
    angles.push(PolarAngel.new(is_begin: true, angle: theta - phi))
    angles.push(PolarAngel.new(is_begin: false, angle: theta + phi))
  end

  angles.sort! { |angle1, angle2|
    if angle1.angle == angle2.angle
      angle1.is_begin ? -1 : 1
    else
      angle1.angle <=> angle2.angle
    end
  }
end
```
