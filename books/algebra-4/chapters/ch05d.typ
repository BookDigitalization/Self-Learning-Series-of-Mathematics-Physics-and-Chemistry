// 第 5 章（续）§5·3 一元 n 次方程（原书 p.159 中部–167，到习题 5·3(3) 结束；§5·4 标题在 p.168 页首，见 ch05e.typ）
#import "/common/series.typ": *
#import "/books/algebra-4/figures/fig5-longdiv.typ": syn

// 局部辅助：方程组省略行（原书用一行小点表示）
#let dots-row = $dots.h dots.h dots.h dots.h dots.h dots.h dots.h dots.h dots.h$

// p.159
== 一元 $n$ 次方程

把 $n$ 次多项式

$ f(x) = a_0 x^n + a_1 x^(n-1) + dots.c + a_n $

用等号与 0 连接起来，就得到方程

#eqno([(1)], $a_0 x^n + a_1 x^(n-1) + dots.c + a_n = 0 dou$)

式中 $n$ 是自然数，$a_0, a_1, a_2, dots, a_n$ 是任何复数，$a_0 != 0$。这样的方程称为关于 $x$ 的*一元 $n$ 次方程*。如果 $n > 2$，通常也称之为*高次方程*。

现在，利用 §5·1 里讲过的关于多项式的性质，来研究一般的一元 $n$ 次方程的重要性质。为了方便起见，将方程 (1) 简单地记作

#align(center)[$f(x) = 0$。]

*1. 一元 $n$ 次方程的根* 根据方程的根的意义，我们知道：如果 $f(a) = 0$，那么 $a$ 是方程 $f(x) = 0$ 的根；反过来，如/* p.160 */果 $a$ 是方程 $f(x) = 0$ 的根，那么 $f(a) = 0$。这就是说，方程 $f(x) = 0$ 的根与多项式 $f(x)$ 的根是完全一样的。由此，从多项式 $f(x)$ 的根的性质，可以直接得出：

多项式 $f(x)$ 的每一个一次因式的根，都是方程 $f(x) = 0$ 的根，除此之外，方程 $f(x) = 0$ 不再有其他的根。

多项式 $f(x)$ 的 $k$ 重因式 $x - a$ 的根，称为方程 $f(x) = 0$ 的 *$k$ 重根*。由此，进一步可以得出：

方程 $f(x) = 0$ 有 $k$ 重根 $a$ 的充要条件是多项式 $f(x)$ 能被 $(x - a)^k$ 整除但不能被 $(x - a)^(k+1)$ 整除；

$n$ 次方程 $f(x) = 0$ 有且只有 $n$ 个根（$k$ 重根算作是 $k$ 个根）。

#ex("例 1")[已知方程

$ x^5 - a x^2 - a x + 1 = 0 $

有二重根 $-1$，求系数 $a$ 的值。]

#analysis[既然 $-1$ 是方程的二重根，那么多项式 $f(x) = x^5 - a x^2 - a x + 1$ 必能被 $(x + 1)^2$ 整除，但不能被 $(x + 1)^3$ 整除。因此，$f(x)$ 除以 $x + 1$ 所得的余数 $r_1$ 要等于 0，$(f(x))/(x + 1)$ 再除以 $x + 1$ 所得的余数 $r_2$ 也要等于 0，但 $(f(x))/((x + 1)^2)$ 再除以 $x + 1$ 所得的余数 $r_3$ 不能等于 0。根据以上要求，求出 $r_1$、$r_2$、$r_3$，就可决定 $a$ 应取的值。]

#sol[

#syn(6,
  (c: "1|+0|+0|-a|-a|+1", r: "-1"),
  (c: "|-1|+1|-1|+(a+1)|-1", rule: "s"),
  (c: "1|-1|+1|-(a+1)|+1,|0", r: "therefore quad r_1 = 0 \"，\""),
  (c: "|-1|+2|-3|+(a+4)|", rule: "s"),
  (c: "1|-2|+3|-(a+4),|+(a+5)|", r: "therefore quad r_2 = a + 5 \"，\""),
  (c: "|-1|+3|-6||", rule: "s"),
  (c: "1|-3|+6,|-(a+10)||", r: "therefore quad r_3 = -(a + 10) \"。\""),
  vr: (0, 5))
]

// p.161
令

#eqsys(($r_2 = a + 5 = 0 dou$, [(1)]), ($r_3 = -(a + 10) != 0 ju$, [(2)]))

从 (1) 得 $a = -5$，代入 (2) 适合。

由此可知，要使原方程有二重根 $-1$，必须并且只须 $a = -5$。

#exercise("5·3(1)")[
1. 求证：

(1) 各项系数都是正数的一元 $n$ 次方程没有正根；

(2) 偶次项的系数是正数，奇次项的系数是负数的一元 $n$ 次方程没有负根。

［解法举例：(1) 设这个一元 $n$ 次方程是

$ f(x) = a_0 x^n + a_1 x^(n-1) + dots.c + a_(n-1) x + a_n = 0 dou $

式中 $a_0, a_1, dots, a_(n-1), a_n$ 都是正数。

再设 $alpha$ 为任一正数，根据正数的积必为正数，正数的和必为正数，可知：

$ f(alpha) = a_0 alpha^n + a_1 alpha^(n-1) + dots.c + a_(n-1) alpha + a_n > 0 ju $

所以 $alpha$ 不可能是方程 $f(x) = 0$ 的根。这就是说，方程 $f(x) = 0$ 没有正根。］

2. 已知方程

$ f(x) = x^3 + 8x^2 + 5x - 50 = 0 dou $

(1) 求证 $-5$ 是这个方程的二重根；

(2) 求这个方程的另一个根。

3. 已知方程

$ f(x) = x^5 - 5x^4 + 7x^3 - 2x^2 + 4x - 8 = 0 dou $

(1) 求证 2 是这个方程的三重根；

(2) 求这个方程的另外两个根。

4. 已知方程

$ f(x) = 2x^4 - 11x^3 + 18x^2 - a x - 2a = 0 $

有三重根 2，/* p.162 */

(1) 求 $a$ 的值；

(2) 解这个方程。
]

*2. 一元 $n$ 次方程根与系数间的关系* 对于一元二次方程，我们已经知道，存在如下的性质：如果一元二次方程

$ a x^2 + b x + c = 0 $

的两个根是 $x_1$ 和 $x_2$，那么

#eqsys(($x_1 + x_2 = -b/a dou$, []), ($x_1 x_2 = c/a ju$, []))

现在把方程的这一性质推广到一般的一元 $n$ 次方程。

*定理* 如果方程

$ f(x) = a_0 x^n + a_1 x^(n-1) + dots.c + a_(n-1) x + a_n = 0 quad (a_0 != 0) $

的 $n$ 个根是 $x_1, x_2, dots, x_(n-1), x_n$，那么

#eqsys(
  ($x_1 + x_2 + dots.c + x_(n-1) + x_n = -a_1/a_0 dou$, []),
  ($x_1 x_2 + x_1 x_3 + dots.c + x_(n-1) x_n = a_2/a_0 dou$, []),
  (dots-row, []),
  ($x_1 x_2 dots.c x_(n-1) x_n = (-1)^n a_n/a_0 ju$, []))

#sol(label: [证])[因为 $x_1, x_2, dots, x_(n-1), x_n$ 是方程 $f(x) = 0$ 的根，所以多项式 $f(x)$ 必定含有 $n$ 个一次因式：

#align(center)[$x - x_1, quad x - x_2, quad dots, quad x - x_(n-1), quad x - x_n$。]

于是

$ a_0 x^n + a_1 x^(n-1) + dots.c + a_(n-1) x + a_n \ = a_0 (x - x_1)(x - x_2) dots.c (x - x_(n-1))(x - x_n) ju $

把上式的右边按照 $x$ 的幂展开，得

// p.163
$ a_0 x^n + a_1 x^(n-1) + dots.c + a_(n-1) x + a_n \ = a_0 x^n - a_0 (x_1 + x_2 + dots.c + x_(n-1) + x_n) x^(n-1) \ + a_0 (x_1 x_2 + x_1 x_3 + dots.c + x_(n-1) x_n) x^(n-2) - dots.c \ + (-1)^n a_0 x_1 x_2 dots.c x_(n-1) x_n ju $

这是一个恒等式，根据 §5·1 定理 4 的推论，可得

// 原书最后一式作 a_n = (-1)^n x_1 x_2 ... x_n（漏了 a_0；疑原书错误，仅登记，照录）
#eqsys(
  ($a_1 = -a_0 (x_1 + x_2 + dots.c + x_(n-1) + x_n) dou$, []),
  ($a_2 = a_0 (x_1 x_2 + x_1 x_3 + dots.c + x_(n-1) x_n) dou$, []),
  (dots-row, []),
  ($a_n = (-1)^n x_1 x_2 dots.c x_(n-1) x_n ju$, []))

#grid(columns: (auto, auto), column-gutter: 1em, align: horizon, $therefore$, eqsys(
  ($x_1 + x_2 + dots.c + x_n = -a_1/a_0 dou$, []),
  ($x_1 x_2 + x_1 x_3 + dots.c + x_(n-1) x_n = a_2/a_0 dou$, []),
  (dots-row, []),
  ($x_1 x_2 dots.c x_(n-1) x_n = (-1)^n a_n/a_0 ju$, [])))
]

#ex("例 2")[已知方程 $2x^3 + 5x^2 - 4x - 12 = 0$ 有重根，解这个方程。]

#analysis[既然这个方程有重根，它至少要有两个根相同。因此，可设这个方程的三个根是 $alpha, alpha, beta$，利用根与系数的关系，即可确定 $alpha$ 和 $beta$ 的值。]

#sol[设这个方程的根是 $alpha, alpha, beta$，那么

#eqsys(
  ($alpha + alpha + beta = -5/2 dou$, [(1)]),
  ($alpha^2 + alpha beta + alpha beta = -2 dou$, [(2)]),
  ($alpha^2 beta = 6 ju$, [(3)]))

从 (1)，得

#eqno([(4)], $beta = -5/2 - 2alpha ju$)

代入 (2)，得

// p.164
$ alpha^2 + 2alpha (-5/2 - 2alpha) = -2 dou $

#eqno([], $"就是" quad 3alpha^2 + 5alpha - 2 = 0 ju$)

$ therefore quad alpha_1 = -2, quad alpha_2 = 1/3 ju $

#eqno([], $"代入 (4)，得" quad beta_1 = 3/2, quad beta_2 = -19/6 ju$)

把 $cases(alpha_1 = -2, beta_1 = 3/2)$ 代入 (3) 是适合的，所以它是列出的方程组的解。

把 $cases(alpha_2 = 1/3, beta_2 = -19/6)$ 代入 (3) 不适合，所以它不是列出的方程组的解。

所以，原方程的三个根是 $-2$，$-2$ 和 $3/2$。]

#ex("例 3")[已知方程

$ x^4 - 4x^3 - 24x^2 + 56x + 52 = 0 $

的四个根成等差数列，解这个方程。]

#sol[设这个方程的四个根是

#align(center)[$a - 3b, quad a - b, quad a + b, quad a + 3b,$]

那么，根据根与系数的关系，可得方程组：

#eqsys(
  ($(a - 3b) + (a - b) + (a + b) + (a + 3b) = 4 dou$, []),
  ($(a - 3b)(a - b) + (a - 3b)(a + b) + (a - 3b)(a + 3b) \ quad + (a - b)(a + b) + (a - b)(a + 3b) + (a + b)(a + 3b) = -24 dou$, []),
  ($(a - 3b)(a - b)(a + b) + (a - 3b)(a - b)(a + 3b) \ quad + (a - 3b)(a + b)(a + 3b) + (a - b)(a + b)(a + 3b) = -56 dou$, []),
  ($(a - 3b)(a - b)(a + b)(a + 3b) = 52 ju$, []))

// p.165
就是

// 原书方程 (4) 右边印作 25（应为 52；疑原书错误，仅登记，照录）
#eqsys(
  ($4a = 4 dou$, [(1)]),
  ($3a^2 - 5b^2 = -12 dou$, [(2)]),
  ($a (a^2 - 5b^2) = -14 dou$, [(3)]),
  ($(a^2 - 9b^2)(a^2 - b^2) = 25 ju$, [(4)]))

从 (1) 得 $a = 1$。代入 (2)，得

$ 3 - 5b^2 = -12 dou quad therefore quad b^2 = 3 dou quad therefore quad b = plus.minus sqrt(3) ju $

以 $cases(a = 1, b = sqrt(3))$ 或 $cases(a = 1, b = -sqrt(3))$ 代入 (3) 和 (4) 都适合，所以它们都是列出的方程组的解。由此可知，原方程的四个根是

#align(center)[$1 plus.minus 3 sqrt(3), quad 1 plus.minus sqrt(3)$。]]

#remark([说明])[1\. 已知四个根成等差数列，虽也可设成这四个根是 $a, a + b, a + 2b, a + 3b$，但这样列出的方程组在求解时就比较繁。上面解法里采取这样假设，可以从一个等式中求出一个未知数，计算也就比较简单。解这类问题时，应该善于掌握这种技巧。

2. 本题中列出的方程组只有 2 个未知数 $a$ 和 $b$，但是有四个方程。求 $a$ 和 $b$ 只需选取较易计算的两个方程（一般，可取次数较低的两个方程）即可，但这样求出的解还必须代入其他两个方程中进行检验，经验算后能适合的才是方程组的解。]

#exercise("5·3(2)")[
1. 已知方程 $2x^3 - 5x^2 - 4x + 12 = 0$ 有二重根，解这个方程。

2. 已知方程 $12x^3 - 8x^2 - 3x + 2 = 0$ 有两个根互为相反数，解这个方程。

3. 已知方程 $x^4 - 4x^3 + 10x^2 - 12x + 9 = 0$ 的根两两相等，解这个方程。

4. 已知方程 $x^3 - (2 + 3i) x^2 - (1 - 5i) x + 2(1 - i) = 0$ 的三根成等比数列，解这个方程。

5. $k$ 是什么数时，方程 $x^3 + 6x^2 + 7x + k = 0$ 的三个根成等差数列？/* p.166 */这些根是什么？
]

在学习一元二次方程时，曾利用根与系数的关系，不通过解一元二次方程

$ a x^2 + b x + c = 0 dou $

而直接计算它的两个根 $x_1$ 与 $x_2$ 的某些特殊代数式，如

$ 1/x_1 + 1/x_2, quad x_1^2 + x_2^2 $

等等的值；以及作出另一个新的方程，使它的两个根与原方程的两个根间有某种指定的关系，如为原根的倒数，原根的平方，等等。这类问题也可推广到一元 $n$ 次方程。

#ex("例 4")[已知方程 $x^3 + p x^2 + q x + r = 0$ 的三个根是 $alpha, beta, gamma$，求 $alpha^2 + beta^2 + gamma^2$ 的值。]

#analysis[从 $(alpha + beta + gamma)^2 = alpha^2 + beta^2 + gamma^2 + 2(alpha beta + beta gamma + gamma alpha)$ 可以推得 $alpha^2 + beta^2 + gamma^2 = (alpha + beta + gamma)^2 - 2(alpha beta + beta gamma + gamma alpha)$，所以只需先应用根与系数的关系求出 $alpha + beta + gamma$ 和 $alpha beta + beta gamma + gamma alpha$ 的值，代入即得。]

#sol[$because quad alpha^2 + beta^2 + gamma^2 = (alpha + beta + gamma)^2 - 2(alpha beta + beta gamma + gamma alpha) dou$

根据根与系数的关系，有

$ alpha + beta + gamma &= -p dou \ alpha beta + beta gamma + gamma alpha &= q ju $

$ therefore quad alpha^2 + beta^2 + gamma^2 = (-p)^2 - 2q = p^2 - 2q ju $
]

#ex("例 5")[已知方程 $x^3 + p x^2 + q x + r = 0$ 的三个根是 $alpha, beta, gamma$，求作一个以 $alpha^2, beta^2, gamma^2$ 为其根的新方程。]

#analysis[设所求的方程是

#align(center)[$x^3 + l x^2 + m x + n = 0$。]

那么，应有

#eqsys(
  ($-l = alpha^2 + beta^2 + gamma^2 dou$, []),
  ($m = alpha^2 beta^2 + beta^2 gamma^2 + gamma^2 alpha^2 dou$, []),
  ($-n = alpha^2 beta^2 gamma^2 ju$, []))

因此，只需先仿照例 4 计算出 $alpha^2 + beta^2 + gamma^2$，$alpha^2 beta^2 + beta^2 gamma^2 + gamma^2 alpha^2$ 和 $alpha^2 beta^2 gamma^2$/* p.167 */的值，代入上式即得所求的方程。为了方便起见，不妨把所求的方程假设成

#align(center)[$x^3 - l x^2 + m x - n = 0$。]]

#sol[设所求的方程是

#align(center)[$x^3 - l x^2 + m x - n = 0 dou$]

那么

$ l &= alpha^2 + beta^2 + gamma^2 = (alpha + beta + gamma)^2 - 2(alpha beta + beta gamma + gamma alpha) \ &= p^2 - 2q dou \ m &= alpha^2 beta^2 + beta^2 gamma^2 + gamma^2 alpha^2 \ &= (alpha beta + beta gamma + gamma alpha)^2 - 2 alpha beta gamma (alpha + beta + gamma) = q^2 - 2p r dou \ n &= alpha^2 beta^2 gamma^2 = (alpha beta gamma)^2 = r^2 ju $

所以，所求的方程是

$ x^3 - (p^2 - 2q) x^2 + (q^2 - 2p r) x - r^2 = 0 ju $
]

#exercise("5·3(3)")[
1. 已知方程 $2x^3 - 3x - 5 = 0$ 的三个根是 $alpha, beta, gamma$，求下列各式的值：

#cols[(1) $1/alpha + 1/beta + 1/gamma$；][(2) $alpha^2 + beta^2 + gamma^2$；]

#cols[(3) $1/(beta gamma) + 1/(gamma alpha) + 1/(alpha beta)$；][(4) $beta^2 gamma^2 + gamma^2 alpha^2 + alpha^2 beta^2$。]

2. 已知方程 $x^3 + p x^2 + q x + r = 0$ 的三个根是 $alpha, beta, gamma$，求作三次方程 $phi(y) = 0$，使它的三个根是：

#cols[(1) $-alpha, -beta, -gamma$；][(2) $1/alpha, 1/beta, 1/gamma$；]

#cols[(3) $k alpha, k beta, k gamma$；][(4) $-1/alpha, -1/beta, -1/gamma$。]

3. 已知方程 $2x^3 - 3x^2 + x + 1 = 0$ 的三个根是 $alpha, beta, gamma$，求作一个三次方程，使它的根是：

(1) $alpha - 3, beta - 3, gamma - 3$；

(2) $1/(alpha - 3), 1/(beta - 3), 1/(gamma - 3)$。

［提示：(2) 可以应用 (1) 求得的方程来作。］
]
