// 第 6 章 根式（原书 p.213–265）
#import "/common/series.typ": *

// p.213
= 根式

== 根式的意义

在第四章里，我们已经知道，如果 $x^n = a$，$x$ 就叫作 $a$ 的 $n$ 次方根。当 $n$ 是奇数的时候，$a$ 可以是任何实数，并且规定用 $root(n, a)$（$n$ 为奇数）来表示这个方根；当 $n$ 是偶数的时候，$a$ 可以是任何正实数或者零，并且规定用 $root(n, a)$（$n$ 为偶数）表示正的一个方根，用 $-root(n, a)$（$n$ 为偶数）表示负的一个方根。

#definition[
式子 $root(n, a)$ 叫作*根式*。$n$ 叫作*根指数*，$a$ 叫作*被开方数*。例如，$sqrt(3)$，$root(3, -5)$，$root(4, 3/4)$，$sqrt(x)$，$sqrt(a^2+1)$，$root(3, x-y)$ 等都是根式。
]

#note-small[我们也把式子 $b root(n, a)$ 叫作根式，这里，$b$ 叫作根式的系数。]

我们知道，负数的偶次方根没有意义，因此，在式子 $root(n, a)$ 里如果根指数 $n$ 是偶数而被开方数 $a$ 是负数，在实数范围里没有意义。例如，$sqrt(-3)$，$root(4, -3/4)$ 等在实数范围里没有意义。

#ex("例 1")[设 $x, y$ 都是实数，下列各式在什么条件下才有意义？

#cols[(1) $sqrt(x)$；][(2) $root(3, x)$；]

#cols[(3) $sqrt(1-y)$；][(4) $sqrt(1/x)$。]]

#sol[(1) 因为根指数是偶数，所以 $x$ 必须是任何正实数或者零。

(2) 因为根指数是奇数，所以 $x$ 可以是任何实数。

// p.214
(3) 因为根指数是偶数，所以 $1-y$ 必须大于 $0$ 或者等于 $0$，就是 $1-y >= 0$。

解 $1-y>0$，得到 $y<1$；

解 $1-y=0$，得到 $y=1$；

把这两个结果合并起来，得到 $y <= 1$。

(4) 因为根指数是偶数，所以 $1/x$ 必须大于 $0$ 或者等于 $0$。但是，$1/x$ 不可能等于 $0$，只要 $x$ 是任何正数，$1/x$ 就大于 $0$。因此，$x$ 可以是任何正实数。]

#attention[$x=0$ 不在内。]

#ex("例 2")[$x$ 是什么数值的时候，下列各式才有意义：

#cols[(1) $sqrt(1+x^2)$；][(2) $1/root(3, x-1)$。]]

#sol[(1) 因为不论 $x$ 是什么实数，$x^2$ 都不是负数，所以 $1+x^2>0$，因此，当 $x$ 是任何实数时，$sqrt(1+x^2)$ 都有意义。

(2) 就根式 $root(3, x-1)$ 看，$x$ 可以是任何实数，但是，$root(3, x-1)$ 在分母上，如果 $root(3, x-1)=0$，将使这个分式没有意义。所以当 $x=1$ 的时候，虽然根式 $root(3, x-1)$ 有意义，而原分式失去意义，因此 $x=1$ 必须除掉。所以当 $x$ 是不等于 $1$ 的任何实数时，原式才有意义。]

根据方根的意义，当 $root(n, a)$ 有意义的时候，式子 $root(n, a)$ 就表示一个数，它的 $n$ 次方等于 $a$。也就是说，

$ (root(n, a))^n = a ju $

这里，$n$ 是大于 $1$ 的整数。

因为 $root(3, -27) = -root(3, 27) = -3$，$root(5, -2) = -root(5, 2)$，所以任何负数的奇次方根都可以化成和某一个算术根相反的数。这就是说，在求负数的奇次方根时，可以把负号移到根号的前面，/* p.215 */然后求正数的算术根。

由此可知，在根式 $root(3, a)$ 有意义的时候，根式 $root(n, a)$ 都可以改用算术根来表示。因此，我们研究根式的性质的时候，只要研究算术根的性质就可以了。

#ex("例 3")[把下列各式中的根式改用算术根来表示：

#cols[(1) $root(3, -5)$；][(2) $1/2 root(5, -3)$。]]

#sol[(1) $root(3, -5) = -root(3, 5)$；

(2) $1/2 root(5, -3) = 1/2 (-root(5, 3)) = -1/2 root(5, 3)$。]

在本章里，如果没有特别说明，所有的字母都表示正数，所有作为根指数的字母都表示大于 $1$ 的正整数。

#ex("例 4")[当 $2a<3b$ 时，计算：

$ sqrt(4a^2 - 12a b + 9b^2) ju $]

#sol[先把根号里的被开方数 $4a^2-12a b+9b^2$ 化成完全平方式。

$ sqrt(4a^2-12a b+9b^2) = sqrt((2a-3b)^2) = |2a-3b| ju $

$because quad 2a<3b, quad therefore quad 2a-3b<0 dou$

$ therefore quad sqrt(4a^2-12a b+9b^2) &= |2a-3b| \
  &= -(2a-3b) \
  &= 3b-2a ju $]

#exercise("6·1")[
  1. 写出满足下列条件的一个根式：

  (1) 一个正数，它的平方等于 $15$；

  (2) 一个负数，它的平方等于 $15$；

  (3) 一个数，它的立方等于 $9$；

  (4) 一个数，它的立方等于 $-9$。
  // p.216
  2. 判别下列各式哪些是根式？哪些式子在实数范围里没有意义？

  $sqrt(-7)$；$root(3, 3)$；$root(3, -10)$；$root(4, 2/5)$；$root(4, -1/3)$。

  3. 设 $x, y$ 都表示实数，下列各式在什么条件下才有意义：

  #cols[(1) $sqrt(x-3)$；][(2) $sqrt(x-y)$；]

  #cols[(3) $root(3, x-y)$；][(4) $sqrt(2x-5)$；]

  #cols[(5) $root(3, x+1)$；][(6) $sqrt(-2/x)$；]

  #cols[(7) $1/sqrt(x-1)$；][(8) $1/root(3, x)$。]

  4. 把下列各式中的根式改用算术根来表示：

  #cols[(1) $root(3, -15)$；][(2) $2/5 root(5, -6)$。]

  5. 求下列各式的值：

  #cols[(1) $(sqrt(21))^2$；][(2) $(root(3, 123))^3$；]

  #cols[(3) $(sqrt(0.35))^2$；][(4) $root(3, 11^3)$；]

  #cols[(5) $sqrt((1/2)^2)$；][(6) $(root(3, -3/5))^3$。]

  6. 根据括号里的条件，计算下列各式：

  (1) $sqrt((5a-2b)^2)$　$(5a<2b)$；

  (2) $sqrt(x^2-2x+1)$　$(x>1)$；

  (3) $sqrt(x^2-2x+1)$　$(x<1)$；

  (4) $sqrt(a^2-2a b+b^2)$　$(a>b)$；

  (5) $sqrt(a^2-2a b+b^2)$　$(a<b)$。
]
== 根式的基本性质

我们看下面的两个例子：

(1) 不求方根的值，判断 $root(4, 3^2)$ 和 $sqrt(3)$ 是否相等？根据上一节里的公式：$(root(n, a))^n = a$，可以得到：

$ (root(4, 3^2))^4 = 3^2 dou $
// p.217
$ (sqrt(3))^4 = [(sqrt(3))^2]^2 = 3^2 dou $

$therefore quad root(4, 3^2)$ 和 $sqrt(3)$ 都是 $3^2$ 的 $4$ 次算术根。

但是 $3^2$ 的 $4$ 次算术根只有一个，

$ therefore quad root(4, 3^2) = sqrt(3) ju $

(2) $root(6, a^4)$ 和 $root(3, a^2)$ 是否相等？

$ because quad (root(6, a^4))^6 = a^4 dou $

$ (root(3, a^2))^6 = [(root(3, a^2))^3]^2 = (a^2)^2 = a^4 dou $

$therefore quad root(6, a^4)$ 和 $root(3, a^2)$ 都是 $a^4$ 的 $6$ 次算术根。

但是 $a^4$ 的 $6$ 次算术根只有一个，

$ therefore quad root(6, a^4) = root(3, a^2) ju $

一般地说，

$ because quad (root(n p, a^(m p)))^(n p) = a^(m p) dou $

$ (root(n, a^m))^(n p) = [(root(n, a^m))^n]^p = (a^m)^p = a^(m p) dou $

$therefore quad root(n p, a^(m p))$ 和 $root(n, a^m)$ 都是 $a^(m p)$ 的 $n p$ 次算术根。

#rule(title: [性质])[
但是 $a^(m p)$ 的 $n p$ 次算术根只有一个，所以得到下面的公式：

$ root(n p, a^(m p)) = root(n, a^m) ju $

这就是说，#edot[一个根式（算术根）的根指数和被开方数的指数都乘以或者除以同一个正整数，根式的值不变]。

这个性质，叫作*根式的基本性质*。
]

对于根式的基本性质，应该特别注意算术根这个条件。如果不是算术根，那么这个性质就不一定成立。例如，$root(3, -8) = -2$，而 $root(6, (-8)^2) = root(6, 64) = 2$，所以 $root(3, -8) != root(6, (-8)^2)$。

#rule(title: [公式])[
用同样的方法，我们也可以证明下面公式（幂的算术根）：

$ root(p, a^(m p)) = a^m ju $

在这个公式里，如果 $m=1$，那么 $root(p, a^p) = a$。所以我们知道，在 $a$ 是正数或者零的时候，

// p.218
$ root(n, a^n) = a ju $

这里，$a >= 0$，$n$ 是大于 $1$ 的整数。
]

#rule(title: [性质])[
根据根式的基本性质，可以知道：

#edot[一个算术根，当它的被开方数的指数和根指数有公约数时，可以约去这个公约数；反过来，也可以把被开方数的指数和根指数都扩大相同的倍数]。
]

这个性质，在以后根式的运算中经常要用到，应该牢固掌握。

#ex("例 1")[约简下列各根式中被开方数的指数和根指数：

#cols[(1) $root(4, a^8)$；][(2) $root(15, x^10)$；]

#cols[(3) $root(9, 27x^6 y^3)$；][(4) $root(4n, a^n b^(2n) c^(3n))$。]]

#sol[(1) $root(4, a^8) = a^2$；

(2) $root(15, x^10) = root(3, x^2)$；

(3) $root(9, 27x^6 y^3) = root(9, (3x^2 y)^3) = root(3, 3x^2 y)$；

(4) $root(4n, a^n b^(2n) c^(3n)) = root(4n, (a b^2 c^3)^n) = root(4, a b^2 c^3)$。]

#ex("例 2")[计算 $root(6, 27)$ 精确到 $0.001$ 的值。]

#sol[$root(6, 27) = root(6, 3^3) = sqrt(3) approx 1.732$。]

#attention[在根式运算中，应该特别注意不要漏写根指数。]

#exercise("6·2")[
  1. 下列各题的计算有没有错误？如果有错误，应当怎样改正？

  #cols[(1) $root(6, 8a^3) = sqrt(8a)$；][(2) $root(6, (-3a b^2)^2) = root(3, -3a b^2)$；]

  (3) $root(3, -2) = root(6, (-2)^2) = root(6, 4)$；　(4) $sqrt(a+b) = root(4, a^2+b^2)$。

  2. 约简下列根式中被开方数的指数和根指数：

  #cols[(1) $root(3, x^9)$；][(2) $root(6, y^2)$；]

  #cols[(3) $root(18, x^12)$；][(4) $root(n, a^(2n))$；]

  #cols[(5) $root(6, 9a^4)$；][(6) $root(8, 81x^4)$；]

  #cols[(7) $root(4, 25x^2 y^2)$；][(8) $root(8, 16x^2 y^4)$；]

  // p.219
  #cols[(9) $root(9, 8a^3 b^6)$；][(10) $root(6, 27x^9 y^12)$；]

  #cols[(11) $root(16, a^(4m) b^(8m))$；][(12) $root(6n, a^(2n) b^(3n) c^(4n))$；]

  #cols[(13) $root(4, 36(x+y)^2)$；][(14) $root(6, 27(a+b)^3)$；]

  #cols[(15) $root(12, 256(x+y)^8)$；][(16) $root(4, a^4+2a^2 b^2+b^4)$。]

  3. (1) 计算 $root(6, 8)$ 精确到 $0.001$ 的近似值；

  (2) 计算 $root(8, 81)$ 精确到 $0.001$ 的近似值。
]

== 同次根式

#definition[
两个或者几个根式，如果它们的根指数相同，这些根式就叫作*同次根式*。例如，$root(3, 2)$ 和 $root(3, 3)$ 是同次根式。
]

两个或者几个根式，如果根指数不相同，这些根式就叫作*异次根式*。例如，$sqrt(2)$ 和 $root(3, 2)$ 是异次根式。异次根式可以根据根式的基本性质化为同次根式。把异次根式化为同次根式的方法和分数里的通分很相像，就是，#edot[先求出各个根式的根指数的最小公倍数，然后应用根式的基本性质，把各个根式的根指数都化成这个最小公倍数]。

#ex("例 1")[把 $root(3, 5)$，$sqrt(3)$ 化成同次根式。]

#analysis[这里，两个根式的根指数一个是 $3$，一个是 $2$，它们的最小公倍数是 $6$。应用根式的基本性质，把这两个根式化成 $6$ 次的同次根式。]

#sol[$ root(3, 5) &= root(6, 5^2) = root(6, 25) dou \
  sqrt(3) &= root(6, 3^3) = root(6, 27) ju $]

#ex("例 2")[把下列根式化成同次根式：

$ sqrt(x y), quad root(3, 2x y^2), quad root(4, 3x^3 y) ju $]

#sol[$ sqrt(x y) &= root(12, x^6 y^6) fen \
  root(3, 2x y^2) &= root(12, (2x y^2)^4) = root(12, 16x^4 y^8) fen \
  root(4, 3x^3 y) &= root(12, (3x^3 y)^3) = root(12, 27x^9 y^3) ju $]

// p.220
#ex("例 3")[比较 $root(3, -5)$ 和 $-sqrt(3)$ 的大小。]

#sol[$ root(3, -5) = -root(3, 5) = -root(6, 5^2) = -root(6, 25) dou \
  -sqrt(3) = -root(6, 3^3) = -root(6, 27) ju $

$because quad -root(6, 25) > -root(6, 27) dou$

$therefore quad root(3, -5) > -sqrt(3) ju$]

#exercise("6·3")[
  1. 把下列根式化成同次根式：

  #cols[(1) $sqrt(5)$，$root(3, 7)$；][(2) $root(4, 2x)$，$sqrt(3y)$；]

  #cols[(3) $root(3, 2x^2)$，$sqrt(5x)$；][(4) $root(5, 3x y^2)$，$sqrt(2x y)$；]

  #cols[(5) $root(3, 2m n)$，$sqrt(7m^2 n^3)$；][(6) $root(4, 2x^3 y)$，$root(3, 3x^2 y^2)$；]

  #cols[(7) $sqrt(x)$，$root(3, x^2)$，$root(4, x^3)$；][(8) $root(3, 2x)$，$root(4, x^2/(3y))$，$root(6, (5x)/y^3)$；]

  (9) $sqrt(x+y)$，$root(3, (x+y)^2)$，$root(6, (x+y)^5)$；

  (10) $root(6, a-b)$，$root(4, a^2-b^2)$，$root(3, a^2+b^2)$　$(a>b)$。

  2. 不求方根的值，比较下列根式的大小：

  #cols[(1) $sqrt(0.8)$ 和 $root(3, 0.7)$；][(2) $sqrt(1/3)$ 和 $root(4, 1/10)$；]

  #cols[(3) $root(3, -3)$ 和 $-sqrt(2)$；][(4) $sqrt(5)$，$root(3, 11)$，$root(6, 123)$。]
]
== 乘积的算术根

我们看下面两个例子：

(1) 不求方根的值，判断 $sqrt(16 times 9)$ 和 $sqrt(16) times sqrt(9)$ 是否相等？

$ because quad (sqrt(16 times 9))^2 = 16 times 9 dou $

$ (sqrt(16) times sqrt(9))^2 = (sqrt(16))^2 times (sqrt(9))^2 = 16 times 9 dou $

$therefore quad sqrt(16 times 9)$ 和 $sqrt(16) times sqrt(9)$ 都是 $16 times 9$ 的算术平方根。

// p.221
但是 $16 times 9$ 的算术平方根只有一个，

$ therefore quad sqrt(16 times 9) = sqrt(16) times sqrt(9) ju $

(2) $root(3, 4 times 13)$ 和 $root(3, 4) times root(3, 13)$ 是否相等？

$ because quad (root(3, 4 times 13))^3 = 4 times 13 dou $

$ (root(3, 4) times root(3, 13))^3 = (root(3, 4))^3 times (root(3, 13))^3 = 4 times 13 dou $

$therefore quad root(3, 4 times 13)$ 和 $root(3, 4) times root(3, 13)$ 都是 $4 times 13$ 的算术立方根。

但是 $4 times 13$ 的算术立方根只有一个，

$ therefore quad root(3, 4 times 13) = root(3, 4) times root(3, 13) ju $

一般地说，

$ because quad (root(n, a b))^n = a b dou $

$ (root(n, a) dot root(n, b))^n = (root(n, a))^n dot (root(n, b))^n = a b dou $

$therefore quad root(n, a b)$ 和 $root(n, a) dot root(n, b)$ 都是 $a b$ 的 $n$ 次算术根。

#rule(title: [公式])[
但是 $a b$ 的 $n$ 次算术根只有一个，所以得到下面的公式，

$ root(n, a b) = root(n, a) dot root(n, b) ju $

应该特别注意，这个公式只能适用于算术根。
]

根据这个公式，我们还可以推导出

$ root(n, a b c) = root(n, a) dot root(n, b) dot root(n, c) $

等等。

这就是说，#edot[乘积的算术根，等于乘积中各个因式的同次算术根的乘积]。

#ex("例 1")[计算：$sqrt(169 times 225)$。]

#sol[$sqrt(169 times 225) = sqrt(169) times sqrt(225) = 13 times 15 = 195$。]

#ex("例 2")[计算：(1) $sqrt(0.16)$；　(2) $root(3, 27000)$；

(3) $sqrt(0.0367)$；　(4) $sqrt(573.9)$。]

#sol[(1) $ sqrt(0.16) &= sqrt(16 times 0.01) = sqrt(16) times sqrt(0.01) \
  &= 4 times 0.1 = 0.4 ju $

// p.222
(2) $ root(3, 27000) &= root(3, 27 times 1000) = root(3, 27) times root(3, 1000) \
  &= 3 times 10 = 30 ju $

(3) $ sqrt(0.0367) &= sqrt(3.67 times 0.01) = sqrt(3.67) times sqrt(0.01) \
  &approx 1.916 times 0.1 = 0.1916 ju $

(4) $ sqrt(573.9) &= sqrt(5.739 times 100) = sqrt(5.739) times sqrt(100) \
  &approx 2.396 times 10 = 23.96 ju $]

从这两个例子可以看出，第四章里所学过的，在查平方根表时，为什么数目 $N$ 的小数点向左或向右每移动 $2$ 位，它的平方根的小数点要相应地向左或向右移动 $1$ 位；查立方根表时，为什么数目 $N$ 的小数点向左或向右每移动 $3$ 位，它的立方根的小数点要相应地向左或向右移动 $1$ 位。

#ex("例 3")[计算：

#cols[(1) $sqrt(65^2-16^2)$；][(2) $root(3, -60 times 18 times 25)$。]]

#sol[(1) 应用两数平方差的公式来计算，可以简便。

$ sqrt(65^2-16^2) &= sqrt((65+16)(65-16)) \
  &= sqrt(81 times 49) = sqrt(81) times sqrt(49) \
  &= 9 times 7 = 63 ju $

#attention[把这个式子化成 $sqrt(65^2) - sqrt(16^2) = 65-16 = 49$ 是错误的。]

(2) 如果利用公式计算，乘积中的三个因数开立方都开不尽，所以先作因数分解，再行计算。

$ root(3, -60 times 18 times 25) &= -root(3, 2^2 dot 3 dot 5 times 2 dot 3^2 times 5^2) \
  &= -root(3, 2^3 times 3^3 times 5^3) = -root(3, 2^3) times root(3, 3^3) times root(3, 5^3) \
  &= -(2 times 3 times 5) = -30 ju $

#attention[遇到求负数的奇次方根时，先把负号提到根号的前面。]]

#exercise("6·4")[
  1. 下列计算有没有错误？为什么？

  // p.223
  #cols[(1) $root(3, 6a^3) = 2a$；][(2) $sqrt(4^2+3^2) = 4+3 = 7$。]

  2. 计算下列各题：

  #cols[(1) $sqrt(36a^4)$；][(2) $root(3, 125x^6 y^3)$；]

  #cols[(3) $root(3, 8 times (-27))$；][(4) $root(5, -32x^10 y^5)$；]

  #cols[(5) $root(3, 64a^(3n) b^(3n))$；][(6) $root(n, a^(2n) b^n c^(3n))$；]

  #cols[(7) $sqrt(121 times 169)$；][(8) $sqrt(16 times 121 times 144)$；]

  #cols[(9) $root(3, -343 times 512 times 729)$；][(10) $root(4, 81 times 16 times 625)$。]

  3. 计算下列各题：

  #cols[(1) $sqrt(17^2-8^2)$；][(2) $sqrt(26^2-10^2)$；]

  #cols[(3) $sqrt(1.7^2-0.26^2)$；][(4) $sqrt((a^2+b^2)^2-(a^2-b^2)^2)$；]

  #cols[(5) $sqrt(15^2-12^2)$；][(6) $sqrt(21 times 6 times 7 times 8)$；]

  #cols[(7) $sqrt(45 times 10 times 98)$；][(8) $sqrt(96 times 56 times 189)$；]

  #cols[(9) $root(3, 12x^4 y dot (-18x^2 y^2))$；][(10) $sqrt(2a^m b^n dot 3a^m dot 6b^n)$。]
]

== 分式的算术根

和乘积的算术根一样，我们可以用同样的方法来证明分式的算术根的公式。

$ because quad (root(n, a/b))^n = a/b dou $

$ (root(n, a)/root(n, b))^n = (root(n, a))^n/(root(n, b))^n = a/b dou $

$therefore quad root(n, a/b)$ 和 $root(n, a)/root(n, b)$ 都是 $a/b$ 的 $n$ 次算术根。

#rule(title: [公式])[
但是 $a/b$ 的 $n$ 次算术根只有一个，所以得到下面的公式：

$ root(n, a/b) = root(n, a)/root(n, b) ju $

应该注意，这个公式只能适用于算术根。
]

// p.224
这就是说，#edot[分式的算术根，等于分子的同次算术根除以分母的同次算术根]。

#ex("例 1")[计算：

#cols[(1) $sqrt(4/25)$；][(2) $root(3, -4 17/27)$。]]

#sol[(1) $sqrt(4/25) = sqrt(4)/sqrt(25) = 2/5$；

(2) $root(3, -4 17/27) = -root(3, 125/27) = -root(3, 125)/root(3, 27) = -5/3 = -mx(1, 2, 3)$。]

#ex("例 2")[计算：

#cols[(1) $root(3, (8a^3 b^6)/(27c^9 d^12))$；][(2) $root(n+1, (a^(n+1) b^(5n+5))/c^(2(n+1)))$。]]

#sol[(1) $root(3, (8a^3 b^6)/(27c^9 d^12)) = root(3, 2^3 a^3 b^6)/root(3, 3^3 c^9 d^12) = (2a b^2)/(3c^3 d^4)$；

(2) $root(n+1, (a^(n+1) b^(5n+5))/c^(2(n+1))) = root(n+1, a^(n+1) b^(5n+5))/root(n+1, c^(2(n+1))) = (a b^5)/c^2$。]

#ex("例 3")[计算：$sqrt((3a^2-12a+12)/(12a^2-12a+3))$　$(a>2)$。]

#sol[$ sqrt((3a^2-12a+12)/(12a^2-12a+3)) &= sqrt((3(a-2)^2)/(3(2a-1)^2)) \
  &= sqrt((a-2)^2)/sqrt((2a-1)^2) = (a-2)/(2a-1) ju $

#attention[要根据已知条件 $a>2$ 做。]]

#exercise("6·5")[
  计算下列各题（1～3）：

  #cols[1\. (1) $sqrt(144/289)$；][(2) $sqrt(2 23/49)$；]

  // p.225
  #cols[(3) $root(3, -64/27)$；][(4) $root(4, 5 1/16)$。]

  #cols[2\. (1) $sqrt(a^4/196)$；][(2) $sqrt((a^2 b^4)/25)$；]

  #cols[(3) $sqrt((4a^6 b^4)/(9c^2))$；][(4) $root(3, (27x^3 y^6)/(125a^9 b^3))$；]

  #cols[(5) $root(3, -(8x^12)/(27a^6 b^9))$；][(6) $root(n, (a^n b^(3n))/(x^(2n) y^n))$；]

  #cols[(7) $sqrt((49a^2)/(a+b)^2)$；][(8) $root(3, -(a-b)^3/(x+y)^6)$。]

  #cols[3\. (1) $sqrt((a^2+6a b+9b^2)/(a^4+10a^2 b^2+25b^4))$；][(2) $root(3, (x^3-3x^2+3x-1)/(x^3+6x^2+12x+8))$。]

  4. 计算 $sqrt((a^2-2a b+b^2)/(a^2+2a b+b^2))$ 的值：

  #cols[(1) $a>b$；][(2) $a=b$；][(3) $a<b$。]
]

== 根号里面和外面的因式的移动

根据乘积的算术根公式，可以得到，

(1) $ sqrt(a b^2) = sqrt(a dot b^2) = sqrt(a) dot sqrt(b^2) = b sqrt(a) fen $

(2) $ root(3, a^4 b^5) &= root(3, a^3 dot b^3 dot a b^2) = root(3, a^3) dot root(3, b^3) dot root(3, a b^2) \
  &= a b root(3, a b^2) ju $

从上面两个例子可以看出，如果被开方数中有的因式开方能够开得尽，那么这些因式可以用它们算术根来代替而移到根号外面，开不尽的因式仍旧保留在根号里面。这样，就可以使被开方数的每一个因式的指数都低于根指数，而使被开方数比较简单。

#ex("例 1")[把下列各式中根号里可以移到根号外面的因式移到根号外面：

// p.226
#cols[(1) $sqrt(2a^3)$；][(2) $sqrt(18a^2 b c^3)$；]

#cols[(3) $root(3, 27x^8 y^5)$；][(4) $root(3, 54)$。]]

#sol[(1) $sqrt(2a^3) = sqrt(a^2 dot 2a) = sqrt(a^2) dot sqrt(2a) = a sqrt(2a)$；

(2) $sqrt(18a^2 b c^3) = sqrt(9a^2 c^2 dot 2b c) = 3a c sqrt(2b c)$；

(3) $root(3, 27x^8 y^5) = root(3, 27x^6 y^3 dot x^2 y^2) = 3x^2 y root(3, x^2 y^2)$；

(4) $root(3, 54) = root(3, 27 times 2) = 3 root(3, 2)$。]

在根式的变形过程中，有时需要把根号外面的因式移到根号里面，这时应该先把这个因式乘方，使它的乘方指数等于根指数，然后把这乘方后的式子写在根号里面。

很明显，把根号里面的因式移到根号外面，和把根号外面的因式移到根号里面，是根据根式的基本性质而进行的两种相反的变形过程。

#ex("例 2")[把下列各式中根号外面的因式移到根号里面：

#cols[(1) $3sqrt(2)$；][(2) $a sqrt(a b)$；]

#cols[(3) $2x y^2 root(3, 2x^2 y)$；][(4) $x root(n, 1/x)$。]]

#sol[(1) $3sqrt(2) = sqrt(3^2) dot sqrt(2) = sqrt(18)$；

(2) $a sqrt(a b) = sqrt(a^2) dot sqrt(a b) = sqrt(a^3 b)$；

(3) $2x y^2 root(3, 2x^2 y) &= root(3, (2x y^2)^3 dot 2x^2 y) = root(3, 8x^3 y^6 dot 2x^2 y) \
  &= root(3, 16x^5 y^7) fen$

(4) $x root(n, 1/x) = root(n, x^n/x) = root(n, x^(n-1)) ju$]

#ex("例 3")[如果要把根式的系数移到根号里面，下列计算对不对？如果错误，应该怎样改正？

$ -3sqrt(2) = sqrt((-3)^2 dot 2) = sqrt(18) ju $]

#sol[不对。正确的计算应该是：

$ -3sqrt(2) = -sqrt(3^2 dot 2) = -sqrt(18) ju $]

// p.227
#ex("例 4")[不求方根的值，比较 $3sqrt(5)$ 和 $2sqrt(11)$ 的大小。]

#sol[$ 3sqrt(5) &= sqrt(3^2 dot 5) = sqrt(45) dou \
  2sqrt(11) &= sqrt(2^2 dot 11) = sqrt(44) ju $

$because quad sqrt(45) > sqrt(44) dou$

$therefore quad 3sqrt(5) > 2sqrt(11) ju$]

#exercise("6·6")[
  1. 下列计算对不对？如果不对，应当怎样改正？

  #cols[(1) $2a sqrt(b) = sqrt(2a^2 b)$；][(2) $3sqrt(a/3) = sqrt(a)$；]

  (3) $root(3, 16) = 2sqrt(2)$。

  2. 把根号里面可以移到根号外面的因式移到根号外面：

  #cols[(1) $root(3, 2m^4)$；][(2) $sqrt(27a^2)$；]

  #cols[(3) $3sqrt(4a^3 b^2 c)$；][(4) $2/3 root(3, 27a^11 b c^5)$；]

  #cols[(5) $(3x)/4 root(4, 16x^6 y^5)$；][(6) $root(n, a^(3n) b^(n+1))$；]

  #cols[(7) $sqrt(8(x+y)^3)$；][(8) $root(3, x^6-x^3 y^3)$；]

  ［解法举例：$root(3, x^6-x^3 y^3) = root(3, x^3(x^3-y^3)) = x root(3, x^3-y^3)$。］

  #cols[(9) $sqrt(2a^3+20a^2+50a)$；][(10) $sqrt((a^2-b^2)(a^4-b^4))$　$(a>b)$。]

  ［提示：第 (9)，(10) 题先分解因式。］

  3. 把根号外面的因式移到根号里面：

  #cols[(1) $4sqrt(3)$；][(2) $3root(3, 3)$；]

  #cols[(3) $1/2 root(4, 8)$；][(4) $3a sqrt(b/(3a))$；]

  #cols[(5) $x/3 root(3, 9/x)$；][(6) $2a^2 b root(3, 3a b c^2)$；]

  #cols[(7) $a b sqrt(1/a+1/b)$；][(8) $(x+2y)/(2x+y) sqrt((2y^2+8x y+8x^2)/(2y+x))$。]

  ［提示：第 (8) 题先把 $2y^2+8x y+8x^2$ 分解因式。］

  // p.228
  4. 不求方根的值，比较下列根式的大小：

  #cols[(1) $6sqrt(3)$ 和 $4sqrt(7)$；][(2) $root(4, 63)$ 和 $2sqrt(2)$；]

  (3) $-3sqrt(2)$ 和 $-2root(3, 3)$。

  ［提示：第 (2)，(3) 题要化成同次根式然后比较。］
]

== 化去根号里的分母

根据分式的算术根的性质，可以得到：

$ sqrt(3/4) = sqrt(3)/sqrt(4) = sqrt(3)/2 fen $

$ root(3, (b^2 c)/a^3) = root(3, b^2 c)/root(3, a^3) = root(3, b^2 c)/a ju $

一般地说，

$ root(n, b/a^n) = root(n, b)/root(n, a^n) = root(n, b)/a ju $

这就是说，如果被开方数是一个分母开方开得尽的分式，那么这个分式的分母可以用它的算术根来代替而移到根号外面，这样就化去了根号里的分母。

因为分式的分子和分母同乘以一个不等于零的代数式，它的值不变，所以如果被开方数是一个分母开方开不尽的分式，我们可以把分子和分母同乘以一个适当的代数式，使分母开方开得尽。这样，仍旧可以用它的算术根来代替而移到根号外面。

#ex("例 1")[化去下列各式中根号里的分母：

#cols[(1) $sqrt(b/a)$；][(2) $root(3, -1/3)$。]]

#sol[(1) $sqrt(b/a) = sqrt((b dot a)/(a dot a)) = sqrt(a b)/sqrt(a^2) = 1/a sqrt(a b)$；

// p.229
(2) $root(3, -1/3) = -root(3, 1/3) = -root(3, (1 times 9)/(3 times 9)) = -root(3, 9)/root(3, 3^3) \
  = -1/3 root(3, 9) ju$]

#ex("例 2")[化去根式 $sqrt(3/8)$ 里的分母。]

#sol[$ sqrt(3/8) = sqrt((3 times 2)/(8 times 2)) = sqrt(6/16) = sqrt(6)/4 = 1/4 sqrt(6) ju $]

#note-small[这个题目也可以这样来做。

$ sqrt(3/8) &= sqrt((3 times 8)/(8 times 8)) = sqrt(24)/sqrt(8^2) = 1/8 sqrt(24) = 1/8 sqrt(4 times 6) \
  &= 1/8 times 2sqrt(6) = 1/4 sqrt(6) ju $

这样做法，第一步虽然化去了根号里的分母，但是得到的根式 $sqrt(24)$，还可以移因子到根号外面，再进行约分，所以增加了一些麻烦。]

从这个例子可以看出，所谓适当的代数式，首先要把分母化成质因数或质因式的幂的积，然后找出一个代数式，用它同乘分子和分母，使分母能以最低次的形式开得尽。

#ex("例 3")[化去下列各式中根号里的分母：

#cols[(1) $root(3, n^2/(9m^2))$；][(2) $root(3, 5/18)$；]

(3) $sqrt((a-b)/(a+b))$。]

#sol[(1) $ root(3, n^2/(9m^2)) = root(3, (n^2 dot 3m)/(9m^2 dot 3m)) = root(3, 3m n^2)/root(3, 27m^3) \
  = 1/(3m) root(3, 3m n^2) fen $

// p.230
(2) $ root(3, 5/18) = root(3, 5/(2 times 3^2)) = root(3, (5 times 2^2 times 3)/(2^3 times 3^3)) = root(3, 60)/root(3, 2^3 times 3^3) \
  = 1/6 root(3, 60) fen $

(3) $ sqrt((a-b)/(a+b)) = sqrt(((a-b)(a+b))/(a+b)^2) = sqrt(a^2-b^2)/(a+b) \
  = 1/(a+b) sqrt(a^2-b^2) ju $]

#attention[把根号里的分母移到根号外面时，必须仍旧写在分母的位置上。例如 (1) 中，不能错误地写成 $3m root(3, 3m n^2)$。]

#exercise("6·7")[
  1. 下列的计算对不对？如果不对，应该怎样改正？

  (1) $root(3, x/y^2) = root(3, (x y)/y^3) = y root(3, x y)$；

  (2) $sqrt(a/b^2 + b/a^2) = (1/b + 1/a) sqrt(a+b)$。

  化去根号里的分母（2～4）：

  #cols[2\. (1) $sqrt(5/2)$；][(2) $sqrt(7/12)$；]

  #cols[(3) $sqrt(2 1/8)$；][(4) $root(3, 1/4)$；]

  #cols[(5) $root(3, -2/9)$；][(6) $root(3, -5/16)$。]

  #cols[3\. (1) $sqrt(1/(3x))$；][(2) $sqrt(a/50)$；]

  #cols[(3) $sqrt((3y)/(98x))$；][(4) $root(3, m^2/n)$；]

  #cols[(5) $root(3, y^2/(25x^2))$；][(6) $root(3, (3b)/(4a^2))$；]

  // p.231
  #cols[(7) $root(4, x^2/(27a^2 b^3))$；][(8) $sqrt((a+b)/(a-b))$　$(a>b)$；]

  #cols[(9) $root(3, (x-y)/(x+y)^2)$；][(10) $root(3, (m+n)^2/(4(m-n)))$。]

  4. (1) $(a-b) sqrt((a-b)/(a+b))$　$(a>b)$；

  (2) $(m^2-n^2) root(3, (m+n)/(m-n)^2)$；

  #cols[(3) $1/a root(n, 2/a^(n-1))$；][(4) $root(n, (a^2 b)/(a+b)^(n-2))$。]

  ［解法举例：(3) $1/a root(n, 2/a^(n-1)) = 1/a root(n, (2a)/(a^(n-1) dot a)) = 1/a root(n, (2a)/a^n) = 1/a dot 1/a root(n, 2a) = 1/a^2 root(n, 2a)$。］
]

== 最简根式

我们看下面的例子：

$ 3root(4, 36) = 3root(4, 6^2) = 3sqrt(6) fen $

$ sqrt(54) = sqrt(3^3 dot 2) = 3sqrt(6) fen $

$ 9sqrt(2/3) = 9sqrt(6/9) = 9 times 1/3 sqrt(6) = 3sqrt(6) ju $

以上三个根式，有的是约简被开方数的指数和根指数，有的把根号里开方能开得尽的因式移到根号外面，有的能化去根号里的分母。

同样可以看到，

$ a root(4, a^2 b^2) = a root(4, (a b)^2) = a sqrt(a b) fen $

$ sqrt(a^3 b) = sqrt(a^2 dot a b) = a sqrt(a b) fen $

$ a^2 sqrt(b/a) = a^2 sqrt((a b)/a^2) = a^2 sqrt(a b)/a = a sqrt(a b) ju $

// p.232
根式 $3root(4, 36)$，$sqrt(54)$ 和 $9sqrt(2/3)$ 的形式虽然不同，但是它们都可以变形成根式 $3sqrt(6)$；同样，三个不同形式的根式 $a root(4, a^2 b^2)$，$sqrt(a^3 b)$ 和 $a^2 sqrt(b/a)$，也都可以变形成根式 $a sqrt(a b)$。

观察一下根式 $3sqrt(6)$ 和 $a sqrt(a b)$，可以看出，它们都有这样的特点：被开方数的指数和根指数没有公约数，被开方数的每一个因式的指数都小于根指数，并且被开方数不含有分母。

#definition[
如果一个根式适合下面三个条件：

(1) 被开方数的指数和根指数没有公约数；

(2) 被开方数的每一个因式的指数都小于根指数；

(3) 被开方数不含有分母；

这样的根式就叫作*最简根式*。例如，根式 $3sqrt(6)$，$a sqrt(a b)$，$1/a^2 root(6, x^2 y^3)$ 等都是最简根式，而根式 $3root(4, 36)$，$sqrt(54)$，$9sqrt(2/3)$，$a root(4, a^2 b^2)$，$sqrt(a^3 b)$，$a^2 sqrt(b/a)$ 等都不是最简根式。
]

一个根式，如果不是最简根式，可以经过约简被开方数的指数和根指数，把根号里能开得尽的因式移到根号外面，化去根号里的分母以后，把它化成最简根式。

应该特别注意，在进行根式运算时，如果没有特别说明，最后结果中的根式，都要化成最简根式。

#ex("例 1")[把下列根式化成最简根式：

#cols[(1) $root(6, 8a^3 b^9)$；][(2) $x root(3, y^4/x^5)$；]

(3) $root(6, (x^10 y^8)/(9a^4))$。]

#sol[(1) $root(6, 8a^3 b^9) = root(6, (2a b^3)^3) = sqrt(2a b^3) = b sqrt(2a b)$；

#remark([说明])[化简到 $sqrt(2a b^3)$，只做了符合最简根式的条件 (1)，必须再移/* p.233 */因式到根号外面。]

(2) $x root(3, y^4/x^5) = x dot y/x root(3, y/x^2) = y root(3, y/x^2) = y root(3, (x y)/x^3) = y/x root(3, x y)$；

#remark([说明])[化简到 $y root(3, y/x^2)$，只做了符合条件 (2)，必须再化去根号里的分母。]

(3) $ root(6, (x^10 y^8)/(9a^4)) &= root(6, ((x^5 y^4)/(3a^2))^2) = root(3, (x^5 y^4)/(3a^2)) = x y root(3, (x^2 y)/(3a^2)) \
  &= x y root(3, (x^2 y dot 9a)/(27a^3)) = (x y)/(3a) root(3, 9a x^2 y) ju $

#remark([说明])[化简到 $root(3, (x^5 y^4)/(3a^2))$，只做了符合条件 (1)；化简到 $x y root(3, (x^2 y)/(3a^2))$，只做了符合条件 (1) 和 (2)；必须再化去根号里的分母。]]

#ex("例 2")[化简根式：$sqrt(8)$；$root(6, 8)$；$sqrt(1/8)$。]

#sol[$ sqrt(8) &= sqrt(2^3) = 2sqrt(2) fen \
  root(6, 8) &= root(6, 2^3) = sqrt(2) fen \
  sqrt(1/8) &= sqrt(1/2^3) = sqrt(2/2^4) = 1/4 sqrt(2) ju $]

#ex("例 3")[化简下列根式：

(1) $a sqrt(1/a^2 - 1/b^2)$　$(a<b)$；

#cols[(2) $3x sqrt(a^2/x^5 - a^3/x^6)$　$(x>a)$；][(3) $root(3, c^(n+3)/(a^(3n) b^(3n+2)))$。]]

#sol[(1) $ a sqrt(1/a^2 - 1/b^2) = a sqrt((b^2-a^2)/(a^2 b^2)) = a/(a b) sqrt(b^2-a^2) \
  = 1/b sqrt(b^2-a^2) fen $

// p.234
(2) $ 3x sqrt(a^2/x^5 - a^3/x^6) = 3x sqrt((a^2 x - a^3)/x^6) = 3x sqrt((a^2 (x-a))/x^6) \
  = 3x dot a/x^3 sqrt(x-a) = (3a)/x^2 sqrt(x-a) fen $

#attention[最简公分母是 $x^6$，而不是 $x^30$。]

(3) $ root(3, c^(n+3)/(a^(3n) b^(3n+2))) = root(3, (c^n dot c^3)/(a^(3n) b^(3n) dot b^2)) = c/(a^n b^n) root(3, c^n/b^2) \
  = c/(a^n b^n) root(3, (c^n dot b)/b^3) = c/(a^n b^(n+1)) root(3, b c^n) ju $]

#exercise("6·8")[
  1. 下列根式中哪些是最简根式？哪些不是？为什么？

  $sqrt(50)$；$root(4, 9)$；$sqrt(2)/3$；$sqrt(2/3)$；$root(3, 4a^2)$；$sqrt(b/a)$；$root(6, a^2 b^4)$。

  把下列根式化成最简根式（2～3）：

  #cols[2\. (1) $sqrt(45)$；][(2) $sqrt(12)$；]

  #cols[(3) $root(3, 16a^4)$；][(4) $root(4, 9a^6 b^4)$；]

  #cols[(5) $root(3, 108a^3 b^10)$；][(6) $root(3, (81y)/(4x^2))$；]

  #cols[(7) $sqrt((32x^5)/(9a^3 b))$；][(8) $x^2/y root(3, y/(3x^2))$。]

  #cols[3\. (1) $sqrt(16a^3+32a^2)$；][(2) $sqrt(4x^6 y^2+12x^4 y^3)$；]

  #cols[(3) $(m-n) root(3, (m+n)^4/(m-n)^5)$；][(4) $m root(4, 1/m^2 + 1/m^4)$；]

  #cols[(5) $(2a)/(3b) sqrt(b^3/a^4 - b^5/a^6)$；][(6) $root(n, a^(n+1) b^(3n+2) c^(4n))$；]

  (7) $a/(a-b) sqrt(a^3 - 2a^2 b + a b^2)$　$(a<b)$。

  ［提示：第 (7) 题根号里，先提取公因式 $a$，再分解因式。］
]

== 同类根式

我们来化简下列的根式：

$ sqrt(18) dou quad root(8, 16) dou quad sqrt(1/98) ju $

应用上节讲过的方法，可以得到：

// p.235
$ sqrt(18) &= sqrt(3^2 times 2) = 3sqrt(2) fen \
  root(8, 16) &= root(8, 2^4) = sqrt(2) fen \
  sqrt(1/98) &= sqrt(1/(49 times 2)) = 1/7 sqrt(1/2) = 1/14 sqrt(2) ju $

观察上面化简后的三个根式 $3sqrt(2)$，$sqrt(2)$ 和 $1/14 sqrt(2)$，它们都已经是最简根式，而它们的被开方数相同（都是 $2$），根指数也相同（都是 $2$）。

#definition[
像上面所说的，几个根式化成最简根式以后，如果被开方数相同，根指数也相同，那么这几个根式就叫作*同类根式*。例如，$sqrt(18)$，$root(8, 16)$，$sqrt(1/98)$ 就是同类根式。但是像 $sqrt(x)$ 和 $root(3, x)$，$2root(3, a)$ 和 $2root(3, a^2)$ 就不是同类根式，因为这些根式都是最简根式，但是 $sqrt(x)$ 和 $root(3, x)$ 的根指数不同，$2root(3, a)$ 和 $2root(3, a^2)$ 的被开方数不同。
]

应该注意，要判别几个根式是不是同类根式，必须先把各个根式化成最简根式。

#ex("例 1")[下列各式中哪些是同类根式？

$ sqrt(2x^3) dou quad root(3, 2x^2) dou quad sqrt(1/(2x)) dou quad root(6, 4/x^2) dou quad root(6, 4x^4) ju $]

#sol[$ sqrt(2x^3) = sqrt(2x dot x^2) = x sqrt(2x) fen $

// p.236
$ sqrt(1/(2x)) = sqrt((2x)/(2x)^2) = 1/(2x) sqrt(2x) fen $

$ root(6, 4/x^2) = root(3, 2/x) = root(3, (2x^2)/x^3) = 1/x root(3, 2x^2) fen $

$ root(6, 4x^4) = root(6, (2x^2)^2) = root(3, 2x^2) ju $

$therefore quad sqrt(2x^3)$ 和 $sqrt(1/(2x))$ 是同类根式，

$root(3, 2x^2)$，$root(6, 4/x^2)$ 和 $root(6, 4x^4)$ 是同类根式。]

#ex("例 2")[下列根式是不是同类根式？

$ sqrt(a^4/b^4 - a^2/b^2) quad "和" quad sqrt((a c^2 + b c^2)/(a-b)) quad (a>b) ju $]

#sol[$ sqrt(a^4/b^4 - a^2/b^2) &= sqrt((a^4 - a^2 b^2)/b^4) = sqrt((a^2 (a^2-b^2))/b^4) \
  &= a/b^2 sqrt(a^2-b^2) fen $

$ sqrt((a c^2 + b c^2)/(a-b)) &= sqrt((c^2 (a+b)(a-b))/(a-b)^2) \
  &= c/(a-b) sqrt((a+b)(a-b)) \
  &= c/(a-b) sqrt(a^2-b^2) ju $

$therefore quad sqrt(a^4/b^4 - a^2/b^2)$ 和 $sqrt((a c^2 + b c^2)/(a-b))$ 是同类根式。]

#exercise("6·9")[
  下列各组根式是不是同类根式（1～2）：

  #cols[1\. (1) $3sqrt(54)$ 和 $5sqrt(24)$；][(2) $1/2 sqrt(75)$ 和 $3sqrt(1/27)$；]

  // p.237
  #cols[(3) $1/4 sqrt(32)$ 和 $sqrt(0.5)$；][(4) $root(3, 2 2/3)$ 和 $root(3, 1.125)$；]

  #cols[(5) $root(4, 4)$，$sqrt(18)$ 和 $sqrt(12)$；][(6) $4root(6, 27)$，$2root(4, 9)$ 和 $sqrt(1 1/3)$。]

  ［提示：第 (3)，(4) 题中，$0.5$ 和 $1.125$ 先化成分数；$2 2/3$ 先化成假分数。］

  2. (1) $root(3, a^8 b)$，$root(3, a^2 b^4)$ 和 $root(6, a^10 b^8)$；

  (2) $root(3, x/y)$，$root(3, 1/(x^2 y))$ 和 $root(6, y^4/x^4)$；

  (3) $sqrt(a b^3 c^5)$，$2root(4, a^6 b^6 c)$ 和 $3sqrt(c/(a b))$；

  (4) $root(n, a^(n+1) b^(n+2))$ 和 $root(n, b^(2n+2)/a^(n-1))$。
]

== 根式的加减法

在代数第一册里，我们知道，几个单项式相加减，只要把它们写成代数和的形式，再合并同类项。计算根式的加减，和计算单项式的加减一样，只要把它们先写成代数和的形式，再合并同类根式（把各根式的系数相加，根式的其余部分不变）。例如，

计算：$2sqrt(2) - 1/2 sqrt(3) + 1/3 sqrt(2) - sqrt(2) + sqrt(3)$。

这里，$2sqrt(2)$，$1/3 sqrt(2)$ 和 $-sqrt(2)$ 是同类根式，$-1/2 sqrt(3)$ 和 $sqrt(3)$ 也是同类根式。

$ therefore quad & 2sqrt(2) - 1/2 sqrt(3) + 1/3 sqrt(2) - sqrt(2) + sqrt(3) \
  &= 2sqrt(2) + 1/3 sqrt(2) - sqrt(2) + sqrt(3) - 1/2 sqrt(3) \
  // p.238
  &= (2 + 1/3 - 1) sqrt(2) + (1 - 1/2) sqrt(3) \
  &= 4/3 sqrt(2) + 1/2 sqrt(3) ju $

#remark([说明])[根式的系数如果是假分数，通常不化成带分数形式。例如 $4/3 sqrt(2)$ 不写成 $mx(1, 1, 3) sqrt(2)$。]

又如，计算：

$ sqrt(2) + sqrt(8) ju $

首先把 $sqrt(8)$ 化成最简根式 $2sqrt(2)$。那么可以得到

$ sqrt(2) + sqrt(8) = sqrt(2) + 2sqrt(2) = 3sqrt(2) ju $

这里我们可以看出，为了合并同类根式，应当先把各个根式化成最简根式。

#rule(title: [法则])[
因此，根式加减法的法则是：

#edot[根式相加减，先把各个根式化成最简根式，再把同类根式分别合并]。
]

#ex("例 1")[计算：$9sqrt(3) + 7sqrt(12) - 5sqrt(48)$。]

#sol[$ 9sqrt(3) + 7sqrt(12) - 5sqrt(48) &= 9sqrt(3) + 14sqrt(3) - 20sqrt(3) \
  &= 3sqrt(3) ju $]

#ex("例 2")[计算：$1/2 x sqrt(4x) + 6x sqrt(x/9) - 2x^2 sqrt(1/x)$。]

#sol[$ 1/2 x sqrt(4x) + 6x sqrt(x/9) - 2x^2 sqrt(1/x) &= x sqrt(x) + 2x sqrt(x) - 2x sqrt(x) \
  &= x sqrt(x) ju $]

#ex("例 3")[计算：$(root(4, 0.25) - 2root(4, 9) + 5sqrt(8)) - (sqrt(1/3) - sqrt(27))$。]

// p.239
#sol[$ & (root(4, 0.25) - 2root(4, 9) + 5sqrt(8)) - (sqrt(1/3) - sqrt(27)) \
  &= root(4, 1/4) - 2root(4, 9) + 5sqrt(8) - sqrt(1/3) + sqrt(27) \
  &= 1/2 sqrt(2) - 2sqrt(3) + 10sqrt(2) - 1/3 sqrt(3) + 3sqrt(3) \
  &= 21/2 sqrt(2) + 2/3 sqrt(3) ju $]

#ex("例 4")[计算：

$ 1/a sqrt(x^3) - (a-b) sqrt(1/(b-a)) + 2/3 root(4, a^2-2a b+b^2) - sqrt(1/x) quad (a<b) ju $]

#sol[$ & 1/a sqrt(x^3) - (a-b) sqrt(1/(b-a)) + 2/3 root(4, a^2-2a b+b^2) - sqrt(1/x) \
  &= x/a sqrt(x) - (a-b)/(b-a) sqrt(b-a) + 2/3 root(4, (b-a)^2) - 1/x sqrt(x) \
  &= x/a sqrt(x) + sqrt(b-a) + 2/3 sqrt(b-a) - 1/x sqrt(x) \
  &= (x/a - 1/x) sqrt(x) + (1 + 2/3) sqrt(b-a) \
  &= (x^2-a)/(a x) sqrt(x) + 5/3 sqrt(b-a) ju $

#attention[由于已知条件 $a<b$，$root(4, a^2-2a b+b^2)$ 不能错误地写成 $sqrt(a-b)$。]]

#exercise("6·10")[
  1. 下列计算是否正确？如果有错误，指出错在哪里？

  // p.240
  #cols[(1) $sqrt(2) + sqrt(3) = sqrt(5)$；][(2) $2 + sqrt(2) = 2sqrt(2)$；]

  (3) $a sqrt(x) - b sqrt(x) = a - b sqrt(x)$；

  (4) $2sqrt(a) + 5sqrt(b) = 7sqrt(a b)$。

  计算下列各题（2～3）：

  2. (1) $sqrt(18) - sqrt(98) + 2sqrt(75) - sqrt(27)$；

  (2) $sqrt(6) - sqrt(3/2) - sqrt(2/3)$；

  (3) $sqrt(8) + root(4, 8) + root(6, 8)$；

  (4) $sqrt(12) + 3sqrt(1 1/3) - sqrt(5 1/3) - 2/3 sqrt(48)$；

  (5) $5root(3, 81) + 2root(3, -24) - 5sqrt(12) - 3root(3, -3) + 4sqrt(4/3)$；

  (6) $(sqrt(12) - sqrt(1/2) - 2sqrt(1/3)) - (sqrt(1/8) - sqrt(18))$。

  3. (1) $(sqrt(9x) - root(3, 8x^2)) - (root(3, 27x) - sqrt(16x)) + (root(3, 64x^2) - root(3, 8x))$；

  (2) $7b root(3, a) + 5sqrt(a^2 x) - b^2 root(3, (27a)/b^3) - 6sqrt((b^2 x)/9)$；

  (3) $(4b root(3, a^2/b^2) + 2/a root(3, a^5 b)) - (3a root(3, b/a) + root(3, a^2 b^4))$；

  (4) $sqrt(4b^2-4a^2) + sqrt((a+b)^2) - sqrt(9b^2-9a^2) - sqrt((a-b)^2)$　$(a<b)$。

  4. 已知 $x=25, y=15$，计算：

  $ sqrt(x^2 + x^2 y + 1/4 x y^2) + sqrt(1/4 x^3 + x^2 y + x y^2) ju $

  ［提示：先把原式化简，再行代入计算。］
]

== 根式的乘法

我们把乘积的算术根的公式

$ root(n, a b) = root(n, a) dot root(n, b) $

// p.241
反过来，就得到

$ root(n, a) dot root(n, b) = root(n, a b) ju $

#rule(title: [法则])[
从这个结果，可以得出同次根式相乘的法则：

#edot[同次根式相乘，把被开方数相乘，根指数不变]。
]

如果根号前面有系数，那么把各个系数相乘，仍旧作为根号前的系数。

应该注意，在计算根式的乘法时，最后结果必须化成最简根式。

#ex("例 1")[计算：

#cols[(1) $sqrt(6a) dot sqrt(2a)$；][(2) $root(3, 4x^2) dot root(3, x^2/2)$。]]

#sol[(1) $sqrt(6a) dot sqrt(2a) = sqrt(6a dot 2a) = sqrt(12a^2) = 2a sqrt(3)$；

(2) $root(3, 4x^2) dot root(3, x^2/2) = root(3, 4x^2 dot x^2/2) = root(3, 2x^4) = x root(3, 2x)$。]

#ex("例 2")[计算：

#cols[(1) $a sqrt(2x) dot b/a sqrt(5x)$；][(2) $6sqrt(3) dot 3sqrt(6)$。]]

#sol[(1) $a sqrt(2x) dot b/a sqrt(5x) = a dot b/a sqrt(10x^2) = b x sqrt(10)$；

(2) $6sqrt(3) dot 3sqrt(6) = 18sqrt(18) = 18 dot 3sqrt(2) = 54sqrt(2)$。]

如果是异次根式，怎样计算呢？我们看下面的例子。

#ex("例 3")[计算：

#cols[(1) $sqrt(a) dot root(3, a)$；][(2) $root(3, a) dot root(4, a)$。]]

#analysis[这里，$sqrt(a)$ 和 $root(3, a)$ 与 $root(3, a)$ 和 $root(4, a)$ 都不是同次根式，就不能直接应用上面的法则，必须先把它们化成同次根式后，再根据同次根式相乘的法则进行计算。]

#sol[(1) 因为

$ sqrt(a) = root(6, a^3) dou quad root(3, a) = root(6, a^2) dou $

// p.242
所以 $ sqrt(a) dot root(3, a) = root(6, a^3) dot root(6, a^2) = root(6, a^5) fen $

(2) 因为

$ root(3, a) = root(12, a^4) dou quad root(4, a) = root(12, a^3) dou $

所以 $ root(3, a) dot root(4, a) = root(12, a^4) dot root(12, a^3) = root(12, a^7) ju $]

#rule(title: [法则])[
从这个例子，可以得出*异次根式相乘的法则*：

#edot[异次根式相乘，先化成同次根式，再行相乘]。
]

#ex("例 4")[计算：$root(3, a^2) dot root(6, a^5) dot root(4, 2/a^3)$。]

#sol[$ & root(3, a^2) dot root(6, a^5) dot root(4, 2/a^3) \
  &= root(12, a^8) dot root(12, a^10) dot root(12, 8/a^9) = root(12, (8a^8 dot a^10)/a^9) \
  &= root(12, 8a^9) = root(4, 2a^3) ju $]

#exercise("6·11(1)")[
  1. 计算下列各题：

  #cols[(1) $root(3, 2) dot root(3, 5)$；][(2) $root(3, 15) dot root(3, 1 2/3)$；]

  #cols[(3) $sqrt(3x) dot sqrt(6x)$；][(4) $root(3, 3a^2) dot root(3, 9a)$；]

  #cols[(5) $6root(4, x^3) dot 1/2 root(4, x)$；][(6) $2sqrt(2x) dot sqrt(24a x)$；]

  #cols[(7) $5root(3, 16x^2) dot 1/2 root(3, 5x^2)$；][(8) $3root(4, 2a x^3) dot root(4, 16a^3 x^2)$。]

  2. 下列各题计算是否正确？如果有错误，指出错在哪里？

  #cols[(1) $root(3, 2) dot root(4, 3) = root(12, 6)$；][(2) $3sqrt(2) dot 4sqrt(3) = 12sqrt(6)$；]

  (3) $sqrt(2x) dot root(3, x) = root(6, 2x^3) dot root(6, x^2) = root(6, 2x^5)$。

  计算下列各题：

  #cols[3\. (1) $sqrt(2) dot root(4, 3)$；][(2) $root(6, 2x) dot sqrt(x)$；]

  #cols[(3) $sqrt(2/3) dot root(3, 3/2)$；][(4) $root(3, x^2) dot root(4, x^3)$。]

  // p.243
  #cols[4\. (1) $3sqrt(20) dot 3/2 sqrt(2 2/3)$；][(2) $3/4 root(3, 9) dot 4root(3, 2 2/3)$；]

  #cols[(3) $root(6, a^3 b) dot root(4, a^5 b^3)$；][(4) $root(5, 3x^2 y^3) dot root(3, x^4 y^5)$。]

  5. (1) $3sqrt(12) dot 2sqrt(10) dot 5sqrt(50)$；

  (2) $a/b root(3, x^2) dot b sqrt(x y^2) dot b/a^2 root(6, 2x^4 y)$。
]

#ex("例 5")[计算：$(sqrt(6) - sqrt(2))(sqrt(6) + sqrt(2))$。]

#analysis[本题应用乘法公式计算，比较简便。]

#sol[$ & (sqrt(6) - sqrt(2))(sqrt(6) + sqrt(2)) \
  &= (sqrt(6))^2 - (sqrt(2))^2 = 6 - 2 = 4 ju $]

#ex("例 6")[求证：

$ (sqrt(x) + sqrt(x-1))(sqrt(x) - sqrt(x-1)) = 1 quad (x>1) ju $]

#sol(label: [证])[$ & (sqrt(x) + sqrt(x-1))(sqrt(x) - sqrt(x-1)) \
  &= (sqrt(x))^2 - (sqrt(x-1))^2 \
  &= x - (x-1) = 1 ju $]

#ex("例 7")[计算：

(1) $(sqrt(a b) + 2sqrt(b/a) - sqrt(a/b) + sqrt(1/(a b))) dot sqrt(a b)$；

(2) $(2sqrt(3) - 3sqrt(2) + sqrt(6))(sqrt(6) - 5sqrt(3))$。]

#sol[(1) $ & (sqrt(a b) + 2sqrt(b/a) - sqrt(a/b) + sqrt(1/(a b))) dot sqrt(a b) \
  &= sqrt(a b) dot sqrt(a b) + 2sqrt(b/a) dot sqrt(a b) - sqrt(a/b) dot sqrt(a b) \
  &quad + sqrt(1/(a b)) dot sqrt(a b) \
  &= sqrt(a^2 b^2) + 2sqrt(b^2) - sqrt(a^2) + 1 \
  &= a b + 2b - a + 1 fen $

// p.244
(2) $ & (2sqrt(3) - 3sqrt(2) + sqrt(6))(sqrt(6) - 5sqrt(3)) \
  &= 2sqrt(3) dot sqrt(6) - 3sqrt(2) dot sqrt(6) + sqrt(6) dot sqrt(6) \
  &quad - 2sqrt(3) dot 5sqrt(3) + 3sqrt(2) dot 5sqrt(3) - sqrt(6) dot 5sqrt(3) \
  &= 2sqrt(18) - 3sqrt(12) + 6 - 30 + 15sqrt(6) - 5sqrt(18) \
  &= -24 + 15sqrt(6) - 3sqrt(18) - 3sqrt(12) \
  &= -24 + 15sqrt(6) - 9sqrt(2) - 6sqrt(3) ju $]

#ex("例 8")[计算：

$ (sqrt(5) - sqrt(3) + sqrt(2))(sqrt(5) + sqrt(3) - sqrt(2)) ju $]

#analysis[本题应用乘法公式计算，比较简便。]

#sol[$ & (sqrt(5) - sqrt(3) + sqrt(2))(sqrt(5) + sqrt(3) - sqrt(2)) \
  &= [sqrt(5) - (sqrt(3) - sqrt(2))][sqrt(5) + (sqrt(3) - sqrt(2))] \
  &= (sqrt(5))^2 - (sqrt(3) - sqrt(2))^2 \
  &= 5 - (3 - 2sqrt(6) + 2) = 2sqrt(6) ju $]

#exercise("6·11(2)")[
  计算下列各题（1～5）：

  1. (1) $(sqrt(10) - 2sqrt(15)) dot sqrt(5)$；

  (2) $(1/2 sqrt(a) + 3/4 sqrt(a^3) - 7/8 sqrt(a^5)) dot (-16sqrt(a^3))$。

  2. (1) $(sqrt(2) - root(3, 4) + root(4, 8)) dot sqrt(2)$；

  (2) $(2sqrt(3x^3) - 3root(3, x)) dot sqrt(x)$。

  3. (1) $(sqrt(5) + sqrt(3))(sqrt(5) - sqrt(3))$；

  (2) $(4 - 3sqrt(5))(4 + 3sqrt(5))$；

  (3) $(7sqrt(3) + 2sqrt(6))(2sqrt(6) - 7sqrt(3))$；

  (4) $(sqrt(3x+2) + sqrt(5x))(sqrt(3x+2) - sqrt(5x))$。

  #cols[4\. (1) $(3sqrt(5) - 2sqrt(3))^2$；][(2) $((-1+sqrt(3))/2)^2$；]

  // p.245
  (3) $(sqrt(a/b) - sqrt(b/a))^2$。

  5. (1) $(1+sqrt(2)-sqrt(3))(1-sqrt(2)+sqrt(3))$；

  (2) $(sqrt(2)-sqrt(3)+sqrt(6))(sqrt(2)+sqrt(3)-sqrt(6))$。

  6. 求证下列恒等式：

  (1) $(root(3, a) + root(3, b))(root(3, a^2) - root(3, a b) + root(3, b^2)) = a + b$；

  ［解法举例：应用乘法公式 $(A+B)(A^2-A B+B^2) = A^3+B^3$，如果把 $root(3, a)$ 看作公式里的 $A$，$root(3, b)$ 看作 $B$，那么 $root(3, a^2) = A^2$，$root(3, b^2) = B^2$，所以

  $ & (root(3, a) + root(3, b))(root(3, a^2) - root(3, a b) + root(3, b^2)) \
    &= (root(3, a))^3 + (root(3, b))^3 = a + b ju "］" $

  (2) $(root(3, m) - root(3, n))(root(3, m^2) + root(3, m n) + root(3, n^2)) = m - n$。

  7. 下列各恒等式里，写出 $F$ 应该是怎样的代数式？

  (1) $(a + sqrt(b)) dot F = a^2 - b$；

  ［解法举例：

  $ because quad (a + sqrt(b))(a - sqrt(b)) = a^2 - b dou $

  $ therefore quad F = a - sqrt(b) ju "］" $

  #cols[(2) $(sqrt(a) - sqrt(b)) dot F = a - b$；][(3) $(root(3, a) - root(3, b)) dot F = a - b$；]

  (4) $(root(3, m^2) - root(3, m n) + root(3, n^2)) dot F = m + n$。
]

#attention[第 6，7 题中所列的恒等式，是从乘法公式推导出来，在以后的根式运算中，应用较广，必须熟练掌握。]

== 根式的乘方

我们知道，乘方就是求相同因数的积的运算，所以计算根式的乘方，同样可以根据方幂的意义和根式乘法的法则进行。例如，计算 $(root(4, 2))^3$，可以得到，

$ (root(4, 2))^3 &= root(4, 2) dot root(4, 2) dot root(4, 2) \
  &= root(4, 2 dot 2 dot 2) = root(4, 8) ju $

一般地说，计算 $(root(n, a))^m$，得到，

// p.246
$ (root(n, a))^m &= underbrace(root(n, a) dot root(n, a) dot dots.c dot root(n, a), m "个") \
  &= root(n, underbrace(a dot a dot dots.c dot a, m "个")) \
  &= root(n, a^m) ju $

#rule(title: [公式])[
所以得到下面的公式：

$ (root(n, a))^m = root(n, a^m) ju $

应该注意，这个公式只适用于 $root(n, a)$ 有意义的时候。
]

#rule(title: [法则])[
从这个公式，可以得到*根式乘方的法则*：

#edot[根式乘方，把被开方数乘方，根指数不变]。
]

如果根式的乘方指数和根指数有公约数，则应该先行约简，再行计算。

#ex("例 1")[计算：

#cols[(1) $(root(3, 5))^6$；][(2) $(root(3, 3a^2 b))^2$；]

#cols[(3) $(-root(4, x^2 y))^6$；][(4) $(root(3, a/(1+a)))^2$。]]

#sol[(1) $(root(3, 5))^6 = root(3, 5^6) = 5^2 = 25$；

(2) $(root(3, 3a^2 b))^2 = root(3, (3a^2 b)^2) = root(3, 9a^4 b^2) = a root(3, 9a b^2)$；

(3) $(-root(4, x^2 y))^6 = (root(4, x^2 y))^6 = sqrt((x^2 y)^3) = x^2 y sqrt(x^2 y)$；

(4) $ (root(3, a/(1+a)))^2 = root(3, (a/(1+a))^2) = root(3, a^2/(1+a)^2) \
  = 1/(1+a) root(3, a^2 (1+a)) ju $]

#ex("例 2")[计算：

#cols[(1) $(-a/b sqrt(b/a))^3$；][(2) $(root(n, a))^(n+1)$。]]

// p.247
#sol[(1) $ (-a/b sqrt(b/a))^3 &= -a^3/b^3 sqrt((b/a)^3) \
  &= -a^3/b^3 sqrt(b^3/a^3) = -a^3/b^3 dot b/a^2 sqrt(a b) \
  &= -a/b^2 sqrt(a b) ju $

#remark([说明])[如果根式前有系数，把系数乘方，仍旧作系数。]

(2) $(root(n, a))^(n+1) = root(n, a^(n+1)) = root(n, a^n dot a) = a root(n, a) ju$]

#ex("例 3")[计算：

(1) $sqrt(10 + sqrt(2)) dot sqrt(10 - sqrt(2))$；

(2) $(sqrt(1 - sqrt(x)) - sqrt(1 + sqrt(x)))^2$　$(0<x<1)$。]

#sol[(1) $ & sqrt(10 + sqrt(2)) dot sqrt(10 - sqrt(2)) \
  &= sqrt((10 + sqrt(2))(10 - sqrt(2))) \
  &= sqrt(10^2 - (sqrt(2))^2) = sqrt(100 - 2) \
  &= sqrt(98) = 7sqrt(2) fen $

(2) $ & (sqrt(1 - sqrt(x)) - sqrt(1 + sqrt(x)))^2 \
  &= 1 - sqrt(x) - 2sqrt((1 - sqrt(x))(1 + sqrt(x))) \
  &quad + 1 + sqrt(x) = 2 - 2sqrt(1 - x) ju $

#remark([说明])[根据已知条件，$0<x<1$，所以 $sqrt(x) < 1$，因此，$(sqrt(1 - sqrt(x)))^2$ 取算术根 $1 - sqrt(x)$，不能错误地写成 $sqrt(x) - 1$。]]

#exercise("6·12")[
  计算下列各题（1～3）：

  #cols[1\. (1) $(sqrt(5))^3$；][(2) $(-3root(4, x^3 y))^3$；]

  #cols[(3) $(0.1root(4, a^2 b^3))^3$；][(4) $(-2/3 root(6, a^5 b^2))^4$；]

  #cols[(5) $(2x sqrt(x y))^3$；][(6) $(root(2n, x))^(2n+1)$。]

  // p.248
  #cols[2\. (1) $(root(3, a) + root(3, b))^3$；][(2) $(root(4, a/b) - root(4, b/a))^2$。]

  3. (1) $sqrt(x + sqrt(x^2+1)) dot sqrt(sqrt(x^2+1) - x)$；

  (2) $sqrt(a + b + 2sqrt(a b)) dot sqrt(a + b - 2sqrt(a b))$　$(a<b)$；

  (3) $(sqrt(2 + sqrt(3)) + sqrt(2 - sqrt(3)))^2$。

  4. 求证：

  $ (sqrt((a + sqrt(a^2-4b))/2) + sqrt((a - sqrt(a^2-4b))/2))^2 = a + 2sqrt(b) quad (a^2 > 4b) ju $
]

== 根式的除法

我们把分式的算术根的公式

$ root(n, a/b) = root(n, a)/root(n, b) $

反过来，就得到

$ root(n, a)/root(n, b) = root(n, a/b) quad (b != 0) ju $

#rule(title: [法则])[
从这个结果，可以得出*同次根式相除的法则*：

#edot[同次根式相除，把被开方数相除，根指数不变]。
]

和根式的乘法一样，如果根号前面有系数，那么把各个系数相除，仍旧作为根号前的系数；并且应该注意，最后结果必须化成最简根式。

#ex("例 1")[计算：

#cols[(1) $root(3, 5x^2) div root(3, x)$；][(2) $b/a root(4, b^3/a^3) div b root(4, b/a)$。]]

#sol[(1) $root(3, 5x^2) div root(3, x) = root(3, (5x^2)/x) \
  = root(3, 5x) fen$

// p.249
(2) $ b/a root(4, b^3/a^3) div b root(4, b/a) &= b/a dot 1/b root(4, b^3/a^3 dot a/b) = 1/a root(4, b^2/a^2) \
  &= 1/a sqrt(b/a) = 1/a dot sqrt(a b)/a \
  &= 1/a^2 sqrt(a b) ju $]

如果是异次根式相除，和根式的乘法一样，必须先把它们化成同次根式后，再按照同次根式相除的法则进行计算。

#ex("例 2")[计算：

#cols[(1) $sqrt(a) div root(3, a)$；][(2) $root(3, x^2) dot root(6, x^5) div root(4, x^3)$。]]

#sol[(1) $sqrt(a) div root(3, a) = root(6, a^3) div root(6, a^2) = root(6, a)$；

(2) $ root(3, x^2) dot root(6, x^5) div root(4, x^3) &= root(12, x^8) dot root(12, x^10) div root(12, x^9) \
  &= root(12, (x^8 dot x^10)/x^9) = root(12, x^9) = root(4, x^3) ju $]

#exercise("6·13")[
  1. 计算下列各题：

  #cols[(1) $root(3, 15) div root(3, 3)$；][(2) $sqrt(1 2/3) div sqrt(1 1/3)$；]

  #cols[(3) $root(3, 12a^2) div root(3, 4a)$；][(4) $root(4, 9a^3) div root(4, a/9)$；]

  #cols[(5) $3/4 root(3, 9) div 0.25 root(3, 2 2/3)$；][(6) $4root(3, a b^2 x) div 1/2 root(3, a/(b x^2))$。]

  2. 下列各题计算是否正确？如果不对，错误在哪里？

  #cols[(1) $root(3, 4)/sqrt(2) = root(3, 4/2) = root(3, 2)$；][(2) $sqrt(6) div 3 = sqrt(2)$。]

  计算下列各题（3～4）：

  #cols[3\. (1) $root(3, 4) div root(6, 2)$；][(2) $2root(3, x^2) div 3sqrt(x)$；]

  #cols[(3) $25a^2 x div 5a sqrt(x)$；][(4) $3a^2 b div 2root(3, a b^2)$；]

  // p.250
  #cols[(5) $6root(3, a^2 b x^2) div 3root(4, a x)$；][(6) $a/b root(5, a^3/b^3) div a root(3, a^2/b^2)$；]

  (7) $root(3, 20b^2) dot sqrt(2a b) div root(6, 5a^4)$；

  (8) $root(4, x^3/y) dot 5root(6, x^2/y^5) div 2sqrt(x/y)$。

  4. (1) $(10sqrt(48) - 6sqrt(27) + 4sqrt(12)) div sqrt(3)$；

  (2) $(sqrt(x^3 y) + sqrt(x y^3) - 3x y) div sqrt(x y)$；

  (3) $(4sqrt(8) - 6root(3, 2)) div sqrt(2)$；

  (4) $(root(3, x^2 y) - root(3, x y^2)) div (root(3, a x) - root(3, a y))$。

  ［提示：先提取公因式。］
]

== 把分母有理化

在根式的乘法里，我们学过，当两个根式相乘，有时候它们的积可以不含有根式。例如，

$ root(5, 8) dot root(5, 4) = root(5, 32) = 2 fen $

$ (a + sqrt(b))(a - sqrt(b)) = a^2 - b fen $

$ (sqrt(a) + sqrt(b))(sqrt(a) - sqrt(b)) = a - b fen $

$ (root(3, a) + root(3, b))(root(3, a^2) - root(3, a b) + root(3, b^2)) = a + b $

等等。这个事实，提供了我们这样一个方法：如果需要的话，对某些含有根式的代数式可乘以另一个含根式的代数式，使它们的积变成不含有根式的代数式。

这个方法究竟有什么用处？我们来看下面的问题。

计算 $1/sqrt(2)$ 的近似值，精确到 $0.001$。

如果先求出 $sqrt(2) approx 1.4142$，再计算 $1/1.4142$，得到

$ 1/sqrt(2) approx 1/1.4142 approx 0.707 ju $

// p.251
这里，除数是 $1.4142$，显然做除法比较麻烦。

如果先把分母中的根号化去再来计算，得到

$ 1/sqrt(2) = sqrt(2)/(sqrt(2) dot sqrt(2)) = sqrt(2)/2 approx 1.4142/2 approx 0.707 ju $

这里，虽然也是除法，但除数是 $2$，计算就比较简便。

又如，计算 $1/(sqrt(3) - sqrt(2))$ 的近似值，精确到 $0.001$。

如果先求出 $sqrt(3) approx 1.7321$，$sqrt(2) approx 1.4142$，直接计算，得到

$ 1/(sqrt(3) - sqrt(2)) &approx 1/(1.7321 - 1.4142) = 1/0.3179 \
  &approx 3.1456 approx 3.146 ju $

如果先把分母中的根号化去再来计算，得到

$ 1/(sqrt(3) - sqrt(2)) &= (sqrt(3) + sqrt(2))/((sqrt(3) - sqrt(2))(sqrt(3) + sqrt(2))) \
  &= (sqrt(3) + sqrt(2))/(3 - 2) = sqrt(3) + sqrt(2) \
  &approx 1.7321 + 1.4142 approx 3.146 ju $

这样，计算中省去了比较麻烦的除法，结果就比较简便。

#definition[
把分母中的根号化去，叫作*把分母有理化*。
]

把分母有理化的方法是：#edot[把分子和分母都乘以同一个适当的代数式，使分母不含有根号]。像上面把 $1/sqrt(2)$ 变成 $sqrt(2)/2$，$1/(sqrt(3) - sqrt(2))$ 变成 $sqrt(3) + sqrt(2)$ 都是把分母有理化。

#definition[
两个含有根式的代数式相乘，如果它们的积不含有根式，那么这两个代数式相互叫作*有理化因式*。
]

上面所说的，$sqrt(2)$ 和 $sqrt(2)$，$sqrt(3) + sqrt(2)$ 和 $sqrt(3) - sqrt(2)$，/* p.252 */$root(5, 8)$ 和 $root(5, 4)$，$a + sqrt(b)$ 和 $a - sqrt(b)$，$sqrt(a) + sqrt(b)$ 和 $sqrt(a) - sqrt(b)$，$root(3, a) + root(3, b)$ 和 $root(3, a^2) - root(3, a b) + root(3, b^2)$ 等都相互叫作有理化因式。

应该特别注意，把分母有理化的时候，要把分子和分母同时乘以一个适当的代数式。

#ex("例 1")[把下列各式的分母有理化：

#cols[(1) $14/(5sqrt(7))$；][(2) $3/sqrt(50)$；]

#cols[(3) $4/root(5, 9)$；][(4) $a/root(3, a^2)$。]]

#sol[(1) $14/(5sqrt(7)) = (14sqrt(7))/(5sqrt(7) dot sqrt(7)) = (14sqrt(7))/35 = 2/5 sqrt(7)$；

(2) $3/sqrt(50) = 3/(5sqrt(2)) = (3sqrt(2))/(5sqrt(2) dot sqrt(2)) = 3/10 sqrt(2)$；

#remark([说明])[先把 $sqrt(50)$ 化成最简根式 $5sqrt(2)$，因此有理化因式是 $sqrt(2)$。]

(3) $4/root(5, 9) = 4/root(5, 3^2) = (4root(5, 3^3))/(root(5, 3^2) dot root(5, 3^3)) = (4root(5, 3^3))/root(5, 3^5) = 4/3 root(5, 27)$；

#remark([说明])[先把 $root(5, 9)$ 化成 $root(5, 3^2)$，由此可以判定它的有理化因式是 $root(5, 3^3)$。]

(4) $a/root(3, a^2) = (a root(3, a))/(root(3, a^2) dot root(3, a)) = (a root(3, a))/root(3, a^3) = a/a root(3, a) = root(3, a)$。]

从上面的例子可以看出，最简根式 $root(n, a^m)$ $(n>m)$ 的有理化因式是 $root(n, a^(n-m))$。

#ex("例 2")[把下列各式的分母有理化：

#cols[(1) $3/(2 - sqrt(3))$；][(2) $sqrt(2)/(sqrt(6) + 2sqrt(5))$；]

// p.253
(3) $(3sqrt(5) + 4sqrt(2))/(3sqrt(5) - 4sqrt(2))$。]

#sol[(1) $ 3/(2 - sqrt(3)) &= (3(2 + sqrt(3)))/((2 - sqrt(3))(2 + sqrt(3))) \
  &= (3(2 + sqrt(3)))/1 = 3(2 + sqrt(3)) fen $

(2) $ sqrt(2)/(sqrt(6) + 2sqrt(5)) &= (sqrt(2)(2sqrt(5) - sqrt(6)))/((2sqrt(5) + sqrt(6))(2sqrt(5) - sqrt(6))) \
  &= (2sqrt(10) - 2sqrt(3))/(20 - 6) \
  &= (2(sqrt(10) - sqrt(3)))/14 \
  &= 1/7 (sqrt(10) - sqrt(3)) fen $

(3) $ (3sqrt(5) + 4sqrt(2))/(3sqrt(5) - 4sqrt(2)) &= (3sqrt(5) + 4sqrt(2))^2/((3sqrt(5) - 4sqrt(2))(3sqrt(5) + 4sqrt(2))) \
  &= (45 + 24sqrt(10) + 32)/(45 - 32) \
  &= 1/13 (77 + 24sqrt(10)) ju $]

从这个例子中的 (1) 可以看出，$a + sqrt(b)$ 和 $a - sqrt(b)$ 互为有理化因式；从这可以推导出，$a + n sqrt(b)$ 和 $a - n sqrt(b)$ 互为有理化因式。从 (2) 和 (3) 中可以看出，$sqrt(a) + sqrt(b)$ 和 $sqrt(a) - sqrt(b)$ 互为有理化因式，$m sqrt(a) + n sqrt(b)$ 和 $m sqrt(a) - n sqrt(b)$ 互为有理化因式。

#ex("例 3")[把下式的分母有理化：

$ 2/(1 - sqrt(2) + sqrt(3)) ju $]

// p.254
#sol[$ & 2/(1 - sqrt(2) + sqrt(3)) \
  &= (2(1 - sqrt(2) - sqrt(3)))/([(1 - sqrt(2)) + sqrt(3)][(1 - sqrt(2)) - sqrt(3)]) \
  &= (2(1 - sqrt(2) - sqrt(3)))/((1 - sqrt(2))^2 - 3) = (2(1 - sqrt(2) - sqrt(3)))/(-2sqrt(2)) \
  &= -(1 - sqrt(2) - sqrt(3))/sqrt(2) = ((sqrt(3) + sqrt(2) - 1) dot sqrt(2))/(sqrt(2) dot sqrt(2)) \
  &= 1/2 (sqrt(6) + 2 - sqrt(2)) ju $

#remark([说明])[本题把分母有理化要分两步进行。也可以把 $1 - sqrt(2) + sqrt(3)$ 看作 $[(1 + sqrt(3)) - sqrt(2)]$，用它的有理化因式 $[(1 + sqrt(3)) + sqrt(2)]$ 去同乘分子和分母，或者看作 $[1 - (sqrt(2) - sqrt(3))]$，用它的有理化因式 $[1 + (sqrt(2) - sqrt(3))]$ 去同乘分子和分母，但是运算上都比较繁一些。读者可以自行练习，以作比较。]]

#ex("例 4")[把下式的分母有理化：

$ 6/(root(3, 7) - root(3, 4)) ju $]

#sol[$ & 6/(root(3, 7) - root(3, 4)) \
  &= (6(root(3, 7^2) + root(3, 7 times 4) + root(3, 4^2)))/((root(3, 7) - root(3, 4))(root(3, 7^2) + root(3, 7 times 4) + root(3, 4^2))) \
  &= (6(root(3, 49) + root(3, 28) + root(3, 16)))/(7 - 4) \
  &= 2(root(3, 49) + root(3, 28) + root(3, 16)) \
  &= 2(root(3, 49) + root(3, 28) + 2root(3, 2)) ju $]

从这个例子可以看出，$root(3, a) - root(3, b)$ 和 $root(3, a^2) + root(3, a b) + root(3, b^2)$ /* p.255 */互为有理化因式；同样，$root(3, a) + root(3, b)$ 和 $root(3, a^2) - root(3, a b) + root(3, b^2)$ 互为有理化因式。

#exercise("6·14")[
  1. 写出下列各式的有理化因式：

  #cols[(1) $root(3, a+b)$；][(2) $sqrt(40)$；]

  #cols[(3) $sqrt(5) + sqrt(3)$；][(4) $3sqrt(2) - 4sqrt(3)$。]

  把下列各式的分母有理化（2～6）：

  #cols[2\. (1) $9/(2sqrt(3))$；][(2) $(a b)/root(3, 2a^2 b)$；]

  #cols[(3) $(3x)/root(4, x^3)$；][(4) $(4a^2 b)/(3root(4, 8a^3 b^2))$。]

  #cols[3\. (1) $sqrt(3)/(5 - sqrt(7))$；][(2) $12/(2sqrt(3) + sqrt(8))$；]

  #cols[(3) $(3sqrt(3))/(sqrt(27) - sqrt(18))$；][(4) $(7sqrt(3) - 5sqrt(6))/(8sqrt(3) - 7sqrt(6))$。]

  #cols[4\. (1) $(a^2-b^2)/sqrt(a+b)$；][(2) $(a-b)/(sqrt(a) - sqrt(b))$；]

  #cols[(3) $1/(a - sqrt(1+a^2))$；][(4) $(sqrt(a+b) + sqrt(a-b))/(sqrt(a+b) - sqrt(a-b))$　$(a>b)$；]

  (5) $sqrt(x^2+1)/(sqrt(x^2+1) - sqrt(x^2-1))$　$(x>1)$。

  #cols[5\. (1) $1/(sqrt(2) + sqrt(5) - sqrt(7))$；][(2) $(1 - sqrt(2) + sqrt(3))/(1 + sqrt(2) - sqrt(3))$。]

  #cols[6\. (1) $1/(root(3, 2) + 1)$；][(2) $5/(root(3, 6) + root(3, 4))$。]

  化简下列各式（7～8）：

  7. $1/(sqrt(3) + sqrt(2)) + 2/(sqrt(2) + 1) - 2/(sqrt(3) + 1)$。

  8. $(sqrt(x+1) - sqrt(x))/(sqrt(x+1) + sqrt(x)) - (sqrt(x+1) + sqrt(x))/(sqrt(x+1) - sqrt(x))$。

  // p.256
  ［提示：第 (7)，(8) 题先把分母有理化。］

  9. 检验 $sqrt(3)$ 是不是方程 $(x+3)/(x-1) - 3/x = 2$ 的根。
]

== 根式的开方

现在我们来研究根式开方的法则。例如我们来计算 $sqrt(root(3, a))$。

$ because quad (sqrt(root(3, a)))^6 = [(sqrt(root(3, a)))^2]^3 = (root(3, a))^3 = a dou $

$ (root(2 times 3, a))^6 = a dou $

$therefore quad sqrt(root(3, a))$ 和 $root(2 times 3, a)$ 都是 $a$ 的 $6$ 次算术根。

但是 $a$ 的 $6$ 次算术根只有一个，

$ therefore quad sqrt(root(3, a)) = root(2 times 3, a) ju $

#rule(title: [公式])[
一般地说，可以得到下面的公式：

$ root(m, root(n, a)) = root(m n, a) ju $

应该注意，这个公式只适用于算术根。
]

#rule(title: [法则])[
从这个公式，可以得到*单项根式开方的法则*：

#edot[单项根式开方，被开方数不变，把根指数相乘]。
]

#ex("例")[计算：

#cols[(1) $root(3, sqrt(5))$；][(2) $root(3, root(4, x^3))$；]

(3) $sqrt(2a root(3, a))$。]

#sol[(1) $root(3, sqrt(5)) = root(6, 5)$；

(2) $root(3, root(4, x^3)) = root(12, x^3) = root(4, x)$；

(3) $sqrt(2a root(3, a)) = sqrt(root(3, 8a^3 dot a)) = root(6, 8a^4)$。]

#remark([说明])[1. 根式最后结果必须化成最简根式，如第 (2) 题中把 $root(12, x^3)$ 化成 $root(4, x)$。

// p.257
2. 如果根式前面有系数，先把这系数移到根式里面，然后再按法则计算，如第 (3) 题中把 $2a root(3, a)$ 化成 $root(3, 8a^3 dot a) = root(3, 8a^4)$。]

#exercise("6·15")[
  计算下列各题（1～3）：

  #cols[1\. (1) $sqrt(root(3, 4))$；][(2) $sqrt(root(3, x^4))$；]

  #cols[(3) $root(5, root(3, a^10 b^5))$；][(4) $sqrt(root(5, a^6 b^4 c^8))$。]

  #cols[2\. (1) $root(3, 3sqrt(5))$；][(2) $root(4, x root(3, x))$；]

  #cols[(3) $sqrt(x/y sqrt(y/x))$；][(4) $sqrt(a^2/b sqrt(b^2/a))$。]

  #cols[3\. (1) $root(7, 3sqrt(3sqrt(3)))$；][(2) $sqrt(a/b sqrt(b/a sqrt(a/b)))$。]

  4. 利用平方根表和立方根表，计算下列各式的近似值：

  #cols[(1) $root(4, 5236)$；][(2) $root(6, 0.38)$。]

  ［提示：第 (1) 题连续求两次算术平方根；第 (2) 题连续求它的算术平方根和立方根。］
]

== $a plus.minus 2sqrt(b)$ 的算术平方根

根据根式的乘方法则，我们知道，

$ (sqrt(3) + sqrt(2))^2 = 3 + 2sqrt(6) + 2 = 5 + 2sqrt(6) dou $

$therefore quad sqrt(3) + sqrt(2)$ 是 $5 + 2sqrt(6)$ 的算术平方根。

但是 $5 + 2sqrt(6)$ 的算术平方根只有一个，所以

$ sqrt(5 + 2sqrt(6)) = sqrt(3) + sqrt(2) ju $

同样，

$ because quad (sqrt(3) - sqrt(2))^2 = 3 - 2sqrt(6) + 2 = 5 - 2sqrt(6) dou $

$ therefore quad sqrt(5 - 2sqrt(6)) = sqrt(3) - sqrt(2) ju $

观察上面这两个结果，可以看出，$5$ 是 $3$ 与 $2$ 的和，$6$ 是/* p.258 */$3$ 与 $2$ 的积。

一般地说，

$ (sqrt(x) + sqrt(y))^2 &= x + 2sqrt(x y) + y = (x+y) + 2sqrt(x y) dou \
  (sqrt(x) - sqrt(y))^2 &= x - 2sqrt(x y) + y = (x+y) - 2sqrt(x y) ju $

如果设 $x+y=a$，$x y=b$，那么

$ (sqrt(x) + sqrt(y))^2 = a + 2sqrt(b) dou $

$ therefore quad sqrt(a + 2sqrt(b)) = sqrt((sqrt(x) + sqrt(y))^2) = sqrt(x) + sqrt(y) ju $

$ (sqrt(x) - sqrt(y))^2 = a - 2sqrt(b) dou $

$ therefore quad sqrt(a - 2sqrt(b)) &= sqrt((sqrt(x) - sqrt(y))^2) \
  &= sqrt(x) - sqrt(y) quad (x>y) ju $

这里必须注意，当 $x<y$ 时，

$ sqrt(a - 2sqrt(b)) = sqrt((sqrt(x) - sqrt(y))^2) = sqrt(y) - sqrt(x) quad (x<y) ju $

从这个结果，可以看到，如果要求 $a plus.minus 2sqrt(b)$ 的算术平方根，只要找到两个数 $x$ 与 $y$，使 $x+y=a$，$x y=b$。

#rule(title: [法则])[
根据这个道理，得到求 $a plus.minus 2sqrt(b)$ 的算术平方根的法则：

求 $a plus.minus 2sqrt(b)$ 的算术平方根，#edot[可以找出两个数，使它们的和等于 $a$，并且它们的积等于 $b$。那么这两个数的算术平方根的和或者差就是所要求的算术平方根]#footnote[如果找不到这样的两个有理数，那么 $a plus.minus 2sqrt(b)$ 的算术平方根就不能用两个有理数的平方根的和或者差来表示。]。
]

#note-small[1. 一定要符合 $a plus.minus 2sqrt(b)$ 的形式，特别是 $sqrt(b)$ 前面有系数 $2$。

2. 求 $sqrt(a - 2sqrt(b))$ 时，两个数中的大数的算术平方根写在前面，小数的算术平方根写在后面。]

#ex("例 1")[计算：$sqrt(6 + 2sqrt(5))$。]

#analysis[要使两个数的和等于 $6$，并且它们的积等于 $5$，这两个数应该是 $5$ 与 $1$。]

// p.259
#sol[$ sqrt(6 + 2sqrt(5)) = sqrt((sqrt(5) + sqrt(1))^2) = sqrt(5) + 1 ju $]

#ex("例 2")[计算：$sqrt(9 - 2sqrt(14))$。]

#sol[$ sqrt(9 - 2sqrt(14)) = sqrt((sqrt(7) - sqrt(2))^2) = sqrt(7) - sqrt(2) ju $]

#remark([说明])[不能错误地写成 $sqrt(9 - 2sqrt(14)) = sqrt(2) - sqrt(7)$。]

如果 $sqrt(b)$ 前面的系数不是 $2$，又应该怎样计算呢？下面分三种情况来研究：

(i) $sqrt(b)$ 前面的系数是 $2$ 的倍数：把 $sqrt(b)$ 前面 $2$ 以外的因数移到根号里面，使 $sqrt(b)$ 的系数变成 $2$。

#ex("例 3")[计算：$sqrt(8 + 4sqrt(3))$。]

#analysis[这里 $sqrt(3)$ 前面的系数是 $4$，把因数 $2$ 移到根号里面，得

$ sqrt(8 + 4sqrt(3)) = sqrt(8 + 2sqrt(12)) dou $

于是就可用上面的方法来解。]

#sol[$ sqrt(8 + 4sqrt(3)) &= sqrt(8 + 2sqrt(12)) = sqrt((sqrt(6) + sqrt(2))^2) \
  &= sqrt(6) + sqrt(2) ju $]

(ii) $sqrt(b)$ 前面的系数是 $1$：为了使 $sqrt(b)$ 的系数变成 $2$，把各项乘以 $2$，整个式子再除以 $2$。

#ex("例 4")[计算：$sqrt(5 - sqrt(21))$。]

#sol[$ sqrt(5 - sqrt(21)) &= sqrt((10 - 2sqrt(21))/2) = sqrt((2(10 - 2sqrt(21)))/4) \
  &= sqrt(2)/2 sqrt((sqrt(7) - sqrt(3))^2) \
  &= sqrt(2)/2 (sqrt(7) - sqrt(3)) \
  &= 1/2 (sqrt(14) - sqrt(6)) ju $]

(iii) $sqrt(b)$ 前面的系数既不是 $1$，又不是 $2$ 的倍数：先把/* p.260 */$sqrt(b)$ 前面的系数移到根号里面，再按照第 (2) 种情况计算。

#ex("例 5")[计算：$sqrt(6 - 3sqrt(3))$。]

#sol[$ sqrt(6 - 3sqrt(3)) &= sqrt(6 - sqrt(27)) = sqrt((12 - 2sqrt(27))/2) \
  &= sqrt((2(12 - 2sqrt(27)))/4) \
  &= sqrt(2)/2 sqrt((sqrt(9) - sqrt(3))^2) \
  &= sqrt(2)/2 (3 - sqrt(3)) = 1/2 (3sqrt(2) - sqrt(6)) ju $]

#rule(title: [公式])[
如果 $a$，$b$ 两数的数字比较大，凭观察，找不出两个数，使它们的和等于 $a$，并且积等于 $b$，那么可以用下面的公式求得。

如果 $a>0$，$b>0$，$a^2 - b > 0$，那么 $a plus.minus sqrt(b)$ 的算术平方根是：

(1) $ sqrt(a + sqrt(b)) = sqrt((a + sqrt(a^2-b))/2) + sqrt((a - sqrt(a^2-b))/2) fen $

(2) $ sqrt(a - sqrt(b)) = sqrt((a + sqrt(a^2-b))/2) - sqrt((a - sqrt(a^2-b))/2) ju $
]

#sol(label: [证])[$because quad (sqrt(a + sqrt(b)))^2 = a + sqrt(b) dou$

$ & (sqrt((a + sqrt(a^2-b))/2) + sqrt((a - sqrt(a^2-b))/2))^2 \
  &= (a + sqrt(a^2-b))/2 + 2sqrt((a + sqrt(a^2-b))/2 dot (a - sqrt(a^2-b))/2) \
  &quad + (a - sqrt(a^2-b))/2 \
  &= a + sqrt(b) dou $

// p.261
而 $sqrt(a + sqrt(b))$ 和 $sqrt((a + sqrt(a^2-b))/2) + sqrt((a - sqrt(a^2-b))/2)$ 都是正数；所以 $sqrt(a + sqrt(b))$ 和 $sqrt((a + sqrt(a^2-b))/2) + sqrt((a - sqrt(a^2-b))/2)$ 都是 $a + sqrt(b)$ 的算术平方根。

但是 $a + sqrt(b)$ 的算术平方根只有一个，

$ therefore quad sqrt(a + sqrt(b)) = sqrt((a + sqrt(a^2-b))/2) + sqrt((a - sqrt(a^2-b))/2) ju $

同样，我们可以证明：

$ sqrt(a - sqrt(b)) = sqrt((a + sqrt(a^2-b))/2) - sqrt((a - sqrt(a^2-b))/2) ju $

只须把已知的 $a$，$b$ 的值代入上面的公式，就可以求得 $a plus.minus sqrt(b)$ 的算术平方根。]

#exercise("6·16")[
  计算下列各题：

  #cols[1\. $sqrt(3 + 2sqrt(2))$。][2. $sqrt(7 - 2sqrt(10))$。]

  #cols[3\. $sqrt(9 + 4sqrt(5))$。][4. $sqrt(22 - 8sqrt(6))$。]

  #cols[5\. $sqrt(4 + sqrt(12))$。][6. $sqrt(6 - sqrt(20))$。]

  #cols[7\. $sqrt(3 + sqrt(5))$。][8. $sqrt(4 - sqrt(15))$。]
]

#summary[
  *1. 根式 $root(n, a)$ 成立的条件*

  (1) 当 $n$ 是奇数时，$a$ 可以是任何实数；

  (2) 当 $n$ 是偶数时，$a >= 0$。

  *2. 关于根式 $root(n, a)$ 的恒等式*

  (1) $(root(n, a))^n = a$　$(n$ 是大于 $1$ 的整数$)$；

  // p.262
  (2) $root(n, a^n) = a$　$(n$ 是大于 $1$ 的整数，$a >= 0)$。

  *3. 对于算术根说，根式有下面的性质*

  (1) $root(n p, a^(m p)) = root(n, a^m)$　$(a >= 0)$；

  (2) $root(n, a b) = root(n, a) dot root(n, b)$　$(a >= 0, b >= 0)$；

  (3) $root(n, a/b) = root(n, a)/root(n, b)$　$(a >= 0, b > 0)$；

  (4) $(root(n, a))^m = root(n, a^m)$　$(a >= 0)$；

  (5) $root(m, root(n, a)) = root(m n, a)$　$(a >= 0)$。

  *4. 最简根式的条件*

  (1) 被开方数的指数和根指数没有公约数；

  (2) 被开方数的每一个因式的指数都小于根指数；

  (3) 被开方数不含有分母。

  *5. 同次根式和同类根式的定义*

  同次根式：根指数相同的两个或几个根式；

  同类根式：根指数和被开方数都相同（或者能够化成相同）的两个或几个根式。

  *6. 根式的运算*

  (1) 根式的加减法：把各个根式化成最简根式，再合并同类根式；

  (2) 根式的乘除法：把各个根式化成同次根式，再应用下列公式进行运算：

  $ root(n, a) dot root(n, b) = root(n, a b) dou \
    root(n, a)/root(n, b) = root(n, a/b) quad (b != 0) fen $

  (3) 根式的乘方：应用下列公式进行运算：

  $ (root(n, a))^m = root(n, a^m) fen $

  (4) 根式的开方：应用下列公式进行运算：

  $ root(m, root(n, a)) = root(m n, a) ju $

  *7. $a plus.minus 2sqrt(b)$ 的算术平方根*　应用下列公式进行运算：

  $ sqrt(a plus.minus 2sqrt(b)) = sqrt(x) plus.minus sqrt(y) quad (x>y) ju $

  这里，$x+y=a$，$x y=b$，而 $x$ 和 $y$ 可以从观察求得。

  // p.263
  *8. 把分母有理化*　把分母有理化的法则是把分子和分母都乘以分母的有理化因式。

  $root(n, a^m)$ 和 $root(n, a^(n-m))$ 互为有理化因式$(n>m)$；

  $a + sqrt(b)$ 和 $a - sqrt(b)$ 互为有理化因式；

  $a + n sqrt(b)$ 和 $a - n sqrt(b)$ 互为有理化因式；

  $sqrt(a) + sqrt(b)$ 和 $sqrt(a) - sqrt(b)$ 互为有理化因式；

  $m sqrt(a) + n sqrt(b)$ 和 $m sqrt(a) - n sqrt(b)$ 互为有理化因式；

  $root(3, a) + root(3, b)$ 和 $root(3, a^2) - root(3, a b) + root(3, b^2)$ 互为有理化因式；

  $root(3, a) - root(3, b)$ 和 $root(3, a^2) + root(3, a b) + root(3, b^2)$ 互为有理化因式。
]

#review(title: [复习题六])[
  1. 如果 $a$ 是任何实数，等式 $root(3, a^3) = a$ 总能成立吗？等式 $sqrt(a^2) = a$ 总能成立吗？在什么条件下，等式 $root(n, a^n) = a$ 能够成立？

  2. (1) 在什么条件下，$root(n, a)$ 在实数范围内有意义？

  (2) 在什么条件下，$root(n, a-1)$ 不是实数？

  3. 在实数范围内，下列各式中的 $x$ 允许取哪些数值？

  #cols[(1) $sqrt(x-4)$；][(2) $sqrt(x^2-4)$；]

  #cols[(3) $1/sqrt(4-x^2)$；][(4) $sqrt(x) dot sqrt(x-1)$。]

  4. (1) 下面的计算错在什么地方？

  $ -2sqrt(5) = sqrt((-2)^2 dot 5) = sqrt(20) = 2sqrt(5) ju $

  (2) $sqrt(9a^2+4b^2) = 3a+2b$ 对吗？为什么？

  5. 甲、乙两同学计算 $sqrt(9-6x+x^2)$ $(x>3)$，甲的演算是

  $ sqrt(9-6x+x^2) = sqrt((3-x)^2) = 3-x dou $

  乙的演算是

  $ sqrt(9-6x+x^2) = sqrt(x^2-6x+9) = sqrt((x-3)^2) = x-3 ju $

  究竟哪一个对？为什么？

  6. 计算下列各题：

  (1) $sqrt(x^2-10x+25)$；

  // p.264
  ［解题举例：本题分三种情况来计算：

  (i) 当 $x>5$ 时，$sqrt(x^2-10x+25) = sqrt((x-5)^2) = x-5$；

  (ii) 当 $x=5$ 时，$sqrt(x^2-10x+25) = 0$；

  (iii) 当 $x<5$ 时，$sqrt(x^2-10x+25) = sqrt((5-x)^2) = 5-x$。］

  (2) $sqrt(x^4-2x^2 y^2+y^4)$。

  7. 当 $x$ 是什么数值时，下列各式的值最小？这个最小值是多少？

  #cols[(1) $sqrt(9+x)$；][(2) $sqrt(9-x)$；]

  #cols[(3) $sqrt(1+x^2)$；][(4) $sqrt(1-x^2)$。]

  8. 不求方根的值，决定下列各式的结果是正的，还是负的？

  #cols[(1) $3/2 sqrt(5) - sqrt(13)$；][(2) $root(4, 65) - 2sqrt(2)$；]

  #cols[(3) $root(3, -12) + sqrt(5)$；][(4) $1/(sqrt(3) - sqrt(2)) - 4/sqrt(2)$。]

  ［提示：先化成同次根式，或者把分母有理化，再比较它们的大小。］

  9. $a$ 和 $b$ 都是正数，求证：

  $ a + b > sqrt(a^2+b^2) ju $

  ［提示：把不等式两边平方。］

  10. 在实数范围内，分解下列各式的因式：

  #cols[(1) $x^2-5$；][(2) $4a^4-1$；][(3) $a^4-6a^2+9$。]

  化简下列各式（11～19）：

  #cols[11\. (1) $root(5, (3a)/(8b^3))$；][(2) $root(3, (x^2-x+1)/(9(x+1)^2))$。]

  #cols[12\. (1) $sqrt(72) - sqrt(50) + sqrt(98)$；][(2) $sqrt(1/2) + sqrt(1/8) - sqrt(1/32)$。]

  #cols[13\. (1) $root(n, a^(3n) b^(n+1) c^(n+2))$；][(2) $root(n+1, a^(3n+3) b^(n^2+n) c^(n^2-1))$。]

  14. (1) $(-b + sqrt(b^2-4a c))/(2a) + (-b - sqrt(b^2-4a c))/(2a)$；

  (2) $((-b + sqrt(b^2-4a c))/(2a)) dot ((-b - sqrt(b^2-4a c))/(2a))$　$(b^2 >= 4a c)$。

  15. $(x-1+sqrt(2))(x+2+sqrt(3))(x-1-sqrt(2))(x+2-sqrt(3))$。

  // p.265
  16. $sqrt(a b) - sqrt(a/b) - sqrt(b/a) + sqrt(a/b + b/a + 2)$。

  17. $(sqrt(8) - sqrt(12) + sqrt(32))/(sqrt(8) + sqrt(12) - sqrt(32))$。

  ［提示：先提出公因式 $sqrt(2)$。］

  18. $((3-sqrt(2))(2+sqrt(3)))/((2-sqrt(3))(3+sqrt(2)))$。

  ［提示：分子和分母都乘以分母的有理化因式。］

  19. $1/(root(3, 2) - 1) + 1/(root(3, 2) + 1)$。

  ［提示：先把分母有理化。］

  20. 求证下列恒等式：

  (1) $a((-b + sqrt(b^2-4a c))/(2a))^2 + b((-b + sqrt(b^2-4a c))/(2a)) + c = 0$　$(b^2 - 4a c >= 0)$；

  (2) $a((-b - sqrt(b^2-4a c))/(2a))^2 + b((-b - sqrt(b^2-4a c))/(2a)) + c = 0$　$(b^2 - 4a c >= 0)$。
]
