// 第 1 章（续）§1·12 关于绝对值的不等式（原书 p.59–70：§1·12 及习题 1·12(1)、*习题 1·12(2)，本章提要起见后续文件）
#import "/common/series.typ": *
#import "../figures/fig1-22.typ": fig-1-22, fig-1-23, fig-1-24, fig-1-25, fig-1-26

// p.59
== 关于绝对值的不等式

在解决有关不等式的问题中，我们还会遇到一种含有绝/* p.60 */对值符号的不等式。例如，我们看下面的问题：

车间里车制一种圆柱形的零件，规定底面的直径是 10 厘米。如果车制出来的成品，底面直径的误差不超过 0.05 厘米，就认为合乎规格，那么这些合乎规格的零件，底面直径的实际长度可以有怎样的范围？

如果我们用 $x$ 厘米表示直径的实际长度，那么这个问题就可以归结到解下面这个不等式：

$ abs(x - 10) <= 0.05 ju $

为了研究这种含有绝对值符号的不等式，我们先来复习一下绝对值的意义，并讨论一下关于绝对值的几个重要性质。

#definition[
*1. 绝对值的意义* #h(0.5em) 在代数第二册里，我们知道，实数的绝对值的定义和有理数的一样，就是：

#edot[正数的绝对值就是它的本身，负数的绝对值是和它相反的正数，零的绝对值还是零。]

用式子来表示就是

$ abs(a) = cases(
  a dou quad "如果" a > 0 dou,
  0 dou quad "如果" a = 0 dou,
  -a dou quad "如果" a < 0 ju
) $
]

例如，如果 $abs(x) = 2$，那么 $x$ 的值就有两种可能：

#h(2em)如果 $x > 0$，那么 $x = 2$。

#h(2em)如果 $x < 0$，那么 $-x = 2$，$x = -2$。

这个等式表明，在数轴上表示数 $x$ 的点离开原点 2 个单位，而不管这个点在原点的左边还是右边（图 1·22）。

#fig("1·22", fig-1-22())[]

#edot[一般地说：一个实数的绝对值，就表明这个实数在数轴]/* p.61 */#edot[上所对应的点和原点间的距离（不考虑方向）。]

很明显，不等式 $abs(x) < 2$ 就是表明：在数轴上表示数 $x$ 的点离开原点的距离不到 2 个单位。所以 $x$ 可取的值的范围是

$ -2 < x < 2 ju quad "（图 1·23）" $

#fig("1·23", fig-1-23())[]

同样，不等式 $abs(x) > 2$ 就是表明：在数轴上表示数 $x$ 的点离开原点的距离超过 2 个单位。所以 $x$ 可取值的范围是

$ x < -2 quad "和" quad x > 2 ju quad "（图 1·24）" $

#fig("1·24", fig-1-24())[]

#rule(title: [性质])[
#edot[一般地说：如果] $a > 0$，#edot[那么]

#edot[从不等式] $abs(x) < a$，#edot[可以推出] $-a < x < a$。

#edot[从不等式] $abs(x) > a$，#edot[可以推出] $x < -a$ #edot[或者] $x > a$。
]

*2. 含有绝对值符号的不等式的解法* #h(0.5em) 利用上面所说的绝对值的意义，我们很容易解一些简单的含有绝对值符号的不等式。

#ex("例 1")[解不等式：

#cols[(1) $2abs(x) - 3 < 0$；][(2) $2abs(x) - 3 > 0$；]
#cols[(3) $2abs(x) + 3 < 0$；][(4) $2abs(x) + 3 > 0$。]
]

#sol[(1)
$ &because 2abs(x) - 3 < 0 dou \ &therefore abs(x) < 3/2 ju $
所以所求的解是 $-3/2 < x < 3/2$。

// p.62
(2)
$ &because 2abs(x) - 3 > 0 dou \ &therefore abs(x) > 3/2 ju $
所以所求的解是 $x < -3/2$ 或者 $x > 3/2$。

(3)
$ &because 2abs(x) + 3 < 0 dou \ &therefore abs(x) < -3/2 ju $
因为不论 $x$ 是什么实数，$abs(x)$ 总不能是负数，更不能小于任何负数，所以原来的不等式没有解。

(4)
$ &because 2abs(x) + 3 > 0 dou \ &therefore abs(x) > -3/2 ju $
因为不论 $x$ 是什么实数，$abs(x)$ 总大于任何负数，所以原来的不等式是绝对不等式。
]

#ex("例 2")[解不等式
$ abs(x - 3) < 5 ju $
]

#sol[从不等式

#eqno([(1)], $abs(x - 3) < 5$)

可以推出

#eqno([(2)], $-5 < x - 3 < 5 ju$)

也就是

#eqno([(3)], $cases(x - 3 > -5 dou, x - 3 < 5 ju)$)

解不等式组(3)得

#eqno([(4)], $-2 < x < 8 ju$)

这就是不等式(1)的解。
]

// p.63
#fig("1·25", fig-1-25())[]

#remark([注])[比较(2)和(4)可以看到，在(2)的不等号的各边都加上数 3，就得到了(4)，所以我们也可以把上面解答的过程，叙述得更简单一些如下。]

#sol[
$ &because abs(x - 3) < 5 dou \ &therefore -5 < x - 3 < 5 dou \ &therefore -5 + 3 < x < 5 + 3 dou $
就是
$ -2 < x < 8 ju $
]

从这个例子里可以看到，不等式 $abs(x - 3) < 5$ 就是表明：数轴上表示数 $x$ 的点和表示数 3 的点间的距离小于 5 个单位（图 1·25）。

#ex("例 3")[解不等式
$ abs(x + 3) > 5 ju $
]

#sol[从不等式

#eqno([(1)], $abs(x + 3) > 5$)

可以推出两个不等式

#eqno([(2)], $x + 3 < -5$)

和

#eqno([(3)], $x + 3 > 5$)

分别解这两个不等式得

$ x < -8 dou quad x > 2 ju $

这就是不等式(1)的解。
]

#fig("1·26", fig-1-26())[]

// p.64
#remark([注])[这里只要不等式(2)或者不等式(3)中有一个成立，不等式(1)就成立，所以不等式(2)或者(3)的解都是不等式(1)的解。]

从这个例子可以看到，不等式 $abs(x + 3) > 5$ 就是表明：数轴上表示数 $x$ 的点和表示数 $-3$ 的点之间的距离大于 5 个单位（图 1·26）。

#ex("例 4")[解不等式
$ abs(3 - 2x) <= 4 ju $
]

#sol[因为 $abs(3 - 2x) = abs(2x - 3)$，原不等式可以写成
$ &abs(2x - 3) <= 4 dou \ therefore quad &-4 <= 2x - 3 <= 4 ju \ therefore quad &-1 <= 2x <= 7 ju \ therefore quad &-1/2 <= x <= 7/2 ju $
]

#attention[在 $abs(a x + b)$ 中如果 $a$ 是负数，那么可以先用负数的绝对值与这个负数的相反数的绝对值相同这一性质，把它化成正数，就是
$ abs(a x + b) = abs(-(a x + b)) = abs((-a)x - b) dou $
这样，解的时候比较方便，而且不易发生错误。例如，上例的解答中，如果不先作这种变换，那么解的过程应该是这样的：]

#eqno([(1)], $because abs(3 - 2x) <= 4 dou$)
#eqno([(2)], $therefore -4 <= 3 - 2x <= 4 dou$)
#eqno([(3)], $therefore -7 <= -2x <= 1 dou$)
#eqno([(4)], $therefore 7/2 >= x >= -1/2 dou$)

就是

#eqno([(5)], $-1/2 <= x <= 7/2 ju$)

这里必须注意，从(3)式变换成(4)式时，因为不等号各边都除以负数 $-2$，变换以后不等号要换向。另外，把几个代数式用不等号串联起来的时候，通常总是顺次地利用“<”号，所以在得到了(4)式以后还要改写成(5)的形式。

// p.65
#exercise("1·12(1)")[
1. 比较下面各组里两个绝对值的大小：

(1) $abs(4)$ 和 $abs(-4)$；

(2) $abs(-1/2)$ 和 $abs(1/2)$；

(3) $abs(sqrt(2))$ 和 $abs(-sqrt(2))$。

从这几个例子中，你可以归纳出什么结论？

2. 比较下列各组里两个式子的大小：

(1) $abs(4) + abs(3)$ 和 $abs(4 + 3)$；

(2) $abs(-4) + abs(-3)$ 和 $abs((-4) + (-3))$；

(3) $abs(4) + abs(-3)$ 和 $abs(4 + (-3))$；

(4) $abs(-4) + abs(3)$ 和 $abs((-4) + 3)$；

(5) $abs(4) + abs(0)$ 和 $abs(4 + 0)$；

(6) $abs(0) + abs(-3)$ 和 $abs(0 + (-3))$；

(7) $abs(0) + abs(0)$ 和 $abs(0 + 0)$。

从这几个例子中，你可以归纳出什么结论？

3. 比较下列各组里两个式子的大小：

(1) $abs(4) - abs(3)$ 和 $abs(4 + 3)$；

(2) $abs(-4) - abs(-3)$ 和 $abs((-4) + (-3))$；

(3) $abs(4) - abs(-3)$ 和 $abs(4 + (-3))$；

(4) $abs(-4) - abs(3)$ 和 $abs((-4) + 3)$；

(5) $abs(4) - abs(0)$ 和 $abs(4 + 0)$；

(6) $abs(0) - abs(-3)$ 和 $abs(0 + (-3))$；

(7) $abs(0) - abs(0)$ 和 $abs(0 + 0)$。

从这些例子中，你可以归纳出什么结论？

4. 解下列不等式：

#cols[(1) $abs(x) + 3 > 0$；][(2) $abs(x) - 3 > 0$；]
#cols[(3) $abs(x) + 3 < 0$；][(4) $abs(x) - 3 < 0$。]

5. 解下列不等式：

#cols[(1) $abs(x - 3) < 7$；][(2) $abs(x + 2) > 5$；]
// p.66
#cols[(3) $2abs(x + 1) - 3 < 0$；][(4) $3abs(x - 2) + 1 > 0$。]

6. 解下列不等式：

#cols[(1) $abs(2x - 1) > 1/2$；][(2) $abs(1 - 3x) <= 1/4$；]
#cols[(3) $abs(1/x) < 4/5$；][(4) $abs(2/x) >= 1/2$。]
]

*\*3. 绝对值的和、差、积、商的性质* #h(0.5em) 在习题 1·12(1) 里，我们曾比较过两个数的绝对值的和、差与这两个数的和的绝对值间的大小，发现它们之间存在着一定的关系。现在我们来证明那里所获得的结论。

#rule(title: [性质])[
*性质 1* #h(2em) $abs(a) + abs(b) >= abs(a + b) ju$
]

#sol(label: [证明])[根据加法的法则：

(1) 如果 $a, b$ 都是正数，或者都是负数，那么它们的和的绝对值就等于它们的绝对值的和，所以
$ abs(a + b) = abs(a) + abs(b) ju $
也就是
$ abs(a) + abs(b) = abs(a + b) ju $

(2) 如果 $a$ 和 $b$ 中一个是正数，另一个是负数，那么它们的和的绝对值就等于绝对值较大的数的绝对值减去绝对值较小的数的绝对值，所以一定小于它们的绝对值的和，就是
$ abs(a + b) < abs(a) + abs(b) dou $
也就是
$ abs(a) + abs(b) > abs(a + b) ju $

(3) 如果 $a$ 和 $b$ 中有一个是零，或者两个都是零，这时很明显地有
$ abs(a + b) = abs(a) + abs(b) ju $
就是
$ abs(a) + abs(b) = abs(a + b) ju $

综合上面这三种情况，就得到
$ abs(a) + abs(b) >= abs(a + b) ju $
]

// p.67
应用这个性质，我们可以直接推出关于绝对值的差的性质。

#rule(title: [性质])[
*性质 2* #h(2em) $abs(a) - abs(b) <= abs(a + b) ju$
]

#sol(label: [证明])[根据性质 1，有
$ abs(a + b) + abs(-b) >= abs(a + b - b) dou $
就是
$ abs(a + b) + abs(b) >= abs(a) ju $
$ therefore quad abs(a) - abs(b) <= abs(a + b) ju $
]

另外，根据乘法和除法的法则，直接可以得出关于绝对值的积和商的下面这两个性质：

#rule(title: [性质])[
*性质 3* #h(2em) $abs(a) dot abs(b) = abs(a b) ju$

*性质 4* #h(2em) $abs(a) / abs(b) = abs(a / b) quad (b != 0) ju$
]

在证明含有绝对值的不等式时，我们经常要用到上面这些性质。

#ex("例 5")[求证：
$ abs(a) - abs(b) <= abs(a - b) <= abs(a) + abs(b) ju $
]

#sol(label: [证明])[先证：$abs(a - b) <= abs(a) + abs(b)$。

根据性质 1，
$ abs(a) + abs(-b) >= abs(a + (-b)) ju $
但是 $abs(-b) = abs(b)$，所以
$ abs(a) + abs(b) >= abs(a - b) dou $
就是

#eqno([(1)], $abs(a - b) <= abs(a) + abs(b) ju$)

其次，证明 $abs(a) - abs(b) <= abs(a - b)$。

根据性质 2，
$ abs(a) - abs(-b) <= abs(a + (-b)) dou $
所以
// p.68
#eqno([(2)], $abs(a) - abs(b) <= abs(a - b) ju$)

把不等式(1)和(2)串联起来就得到
$ abs(a) - abs(b) <= abs(a - b) <= abs(a) + abs(b) ju $
]

#ex("例 6")[求证：
$ abs(a) + abs(b) + abs(c) >= abs(a + b + c) ju $
]

#sol(label: [证明])[
$ &because abs(a) + abs(b) >= abs(a + b) dou \ &therefore abs(a) + abs(b) + abs(c) >= abs(a + b) + abs(c) ju $
但是
$ abs(a + b) + abs(c) >= abs(a + b + c) dou \ therefore quad abs(a) + abs(b) + abs(c) >= abs(a + b + c) ju $
]

#remark([注])[上面的证明过程，可以简单地叙述如下：
$ abs(a) + abs(b) + abs(c) &>= abs(a + b) + abs(c) \ &>= abs(a + b + c) ju \ therefore quad abs(a) + abs(b) + abs(c) &>= abs(a + b + c) ju $
]

#ex("例 7")[已知
$ abs(x - a) < c/2 dou \ abs(y - b) < c/2 ju $
求证：$abs((x + y) - (a + b)) < c ju$
]

#sol(label: [证明])[
#eqno([(1)], $abs((x + y) - (a + b)) &= abs((x - a) + (y - b)) \ &<= abs(x - a) + abs(y - b) ju$)

$ &because abs(x - a) < c/2 dou quad abs(y - b) < c/2 dou \ &therefore abs(x - a) + abs(y - b) < c/2 + c/2 ju $

就是

#eqno([(2)], $abs(x - a) + abs(y - b) < c ju$)

从(1)和(2)，根据不等的传递性，得
$ abs((x + y) - (a + b)) < c ju $
]

// p.69
#remark([注])[简单地叙述，可以写成：
$ abs((x + y) - (a + b)) &= abs((x - a) + (y - b)) \ &<= abs(x - a) + abs(y - b) \ &< c/2 + c/2 \ &= c dou \ therefore quad abs((x + y) - (a + b)) &< c ju $
]

#attention[应用这种写法，在推导过程中，只能应用同一方向的不等号。否则就不能判断第一个式子和最后一个式子间的关系。]

#ex("例 8")[已知 $abs(x) < a/4$，$abs(y) < a/6$，求证：
$ abs(2x - 3y) < a ju $
]

#sol(label: [证明])[
$ abs(2x - 3y) <= abs(2x) + abs(3y) ju $
但是
$ abs(2x) &= abs(2) dot abs(x) = 2abs(x) dou \ abs(3y) &= abs(3) dot abs(y) = 3abs(y) ju \ therefore quad abs(2x - 3y) &<= 2abs(x) + 3abs(y) ju $
$ &because abs(x) < a/4 dou quad therefore 2abs(x) < a/2 fen \ &because abs(y) < a/6 dou quad therefore 3abs(y) < a/2 fen \ &therefore 2abs(x) + 3abs(y) < a dou \ &therefore abs(2x - 3y) < a ju $
]

#remark([注])[简单地叙述，可以写成
$ abs(2x - 3y) &<= abs(2x) + abs(3y) \ &= abs(2) dot abs(x) + abs(3) dot abs(y) \ &= 2abs(x) + 3abs(y) \ &< 2 dot a/4 + 3 dot a/6 \ &= a/2 + a/2 = a ju \ therefore quad abs(2x - 3y) &< a ju $
]

// p.70
#exercise("1·12(2)", star: true)[
1. 已知 $abs(A - a) < c/2$，$abs(B - b) < c/2$，求证：
$ abs((A - B) - (a - b)) < c ju $

2. 已知 $abs(A - a) < d/3$，$abs(B - b) < d/3$，$abs(C - c) < d/3$，求证：

(1) $abs((A + B + C) - (a + b + c)) < d$；

(2) $abs((A + B - C) - (a + b - c)) < d$。

3. 已知 $abs(x) < sqrt(a)$，$abs(y) < sqrt(a)$，求证：
$ abs(x y) < a ju $

4. 已知 $abs(x) < c h$，$abs(y) > c > 0$，求证：
$ abs(x / y) < h ju $
]
