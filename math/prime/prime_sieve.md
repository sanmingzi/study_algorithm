# 素数筛法

```
素数筛法，用来求取某个范围内所有素数。
该范围一般不大于 5 * 10^6。
```

## 埃氏筛法

```ruby
is_prime = Array.new(n, true)
primes = []
for i in 2..n
  if is_prime[i]
    primes.push(i)
    num = i * i
    while num <= n
      is_prime[num] = false
      num += i
    end
  end
end
```

```
埃氏筛法原理比较简单。
如果某个数为质数，那么该数的倍数一定也为质数。
该方法的缺点就是效率稍微慢点，有些数会被标记两次。
举例：
i = 2, is_prime[12] = false
i = 3, is_prime[12] = false
当 i = 2 或者 i = 3 的时候，12 都会被标记一次。
```

## 欧拉筛法

```ruby
is_prime = Array.new(n, true)
primes = []
for i in 2..n
  primes.push(i) if is_prime[i]
  primes.each do |prime|
    num = prime * i
    break if num > n
    is_prime[num] = false
    break if 0 == i % prime
  end
end
```

```
欧拉筛法的原理稍微复杂。
对于任意数字 i，一定有：i 与质数数组任意元素的乘积为合数。
同时要特别注意下面这个条件：

break if 0 == i % prime

如果当前数字 i 能被某个质数整除，那么我们不会再将当前数字 i 与其他质数去做筛法了。

证明如下：
i % prime[j] == 0, 那么，i = prime[j] * x
num = i * prime[k]
num 能够被 prime[k] 筛除，一定也能够被 prime[j] 筛除。
为了保证 num 只被其最小的质因数筛除，我们可以在 i % prime[j] == 0 的时候跳出循环。

我们这样做，是为了确保每个合数都只会被筛一遍，并且只会被其最小的质因数筛一遍。
12 有质因数 [2, 3]，我们必须确保 12 是被 6 * 2筛掉的。
30 有质因数 [2, 3, 5]，我们必须确保 30 是被 15 * 2 筛掉的。

欧拉筛法的时间复杂度为 O(n)。
```
