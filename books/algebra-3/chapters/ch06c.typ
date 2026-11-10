// 第 6 章（续）§6·5 关于对数的定理、本章提要、复习题六（原书 p.238 中部–248；p.238 页首的习题 6·4 第 7 题属 §6·4，不在本文件）
#import "/common/series.typ": *
#import "/books/algebra-3/figures/fig6C-summary.typ": fig-6-summary, cross-arrows

// 局部辅助：习题 6·5(1) 第 3 题里“公式 + 说明”两栏
#let fl(f, note) = grid(columns: (9em, 1fr), column-gutter: 0.5em, f, note)

// 局部辅助：本章提要表。模板会把表格第一行设成白字配深色表头，这里不用表头底色，显式改回黑字。
#let ptab(columns, ..cells) = align(center, block(width: 100%, breakable: false, {
  set text(size: 9.8pt)
  show table.cell: set text(fill: black)
  table(
    columns: columns,
    align: center + horizon,
    inset: (x: 6pt, y: 7pt),
    fill: none,
    stroke: none,
    ..cells,
  )
}))

// p.238
== 关于对数的定理

*1. 积、商、幂的对数*#h(1em)在 §6·1 里引进了无理数指数以后，对于以任意实数 $alpha, beta$ 为指数的同底数幂有下列的运算法则：

$ a^alpha dot a^beta = a^(alpha + beta) fen \
  a^alpha / a^beta = a^(alpha - beta) fen \
  (a^alpha)^beta = a^(alpha beta) ju $

在这基础上，我们可以导出计算积、商、幂的对数的法则。

*法则 1*#h(1em)两个正因数的积的对数等于这两个正因数的对数的和。

$ log_a M N = log_a M + log_a N ju $

*法则 2*#h(1em)两个正因数的商的对数，等于被除数的对数减去除数的对数。

$ log_a frac(M, N) = log_a M - log_a N ju $

*法则 3*#h(1em)正数的幂的对数，等于幂的指数乘以底数的对数。

$ log_a M^alpha = alpha log_a M ju $

在法则 3 中，如果令 $alpha = frac(1, n)$（$n$ 是大于 1 的整数），那么就得到了方根的对数计算法则：

$ log_a root(n, M) = log_a M^(1/n) = frac(1, n) log_a M ju $

// p.239
这些法则可以这样来证明：根据 §6·3 里的恒等式，命

$ M = a^(log_a M) dou quad N = a^(log_a N) dou $

那么：

#eqno([(1)], $M N &= a^(log_a M) dot a^(log_a N) \
  &= a^(log_a M + log_a N) ju$)

改写成对数等式的形式，就得

$ log_a M N = log_a M + log_a N ju $

#eqno([(2)], $M / N &= a^(log_a M) / a^(log_a N) \
  &= a^(log_a M - log_a N) ju$)

改写成对数等式的形式，就得

$ log_a frac(M, N) = log_a M - log_a N ju $

#eqno([(3)], $M^alpha = (a^(log_a M))^alpha = a^(alpha log_a M) ju$)

改写成对数等式的形式，就得

$ log_a M^alpha = alpha log_a M ju $

#attention[应用上面这些法则的时候，必须注意真数 $M, N$ 是正数这一条件。例如

$ log_10 (-10)(-10) = log_10 100 = 2 fen quad log_10 frac(-10, -10) = log_10 1 = 0 $

是有意义的，但是 $log_10 (-10)$ 是没有意义的，所以下面这些等式都不成立：

$ log_10 (-10)(-10) = log_10 (-10) + log_10 (-10) dou \
  log_10 frac(-10, -10) = log_10 (-10) - log_10 (-10) dou \
  log_10 (-10)^2 = 2 log_10 (-10) ju $]

#ex("例 1")[已知 $log_10 2 = 0.3010$，$log_10 3 = 0.4771$，求：

#cols[(1) $log_10 6$；][(2) $log_10 5$；][(3) $log_10 sqrt(2)$。]]

// 疑似原书错误（p.239，待项目负责人确认）：原书此处第二项印作 log₂ 3（底数 2），应为 log₁₀ 3，现照扫描录入
#sol[$ "(1)" quad log_10 6 &= log_10 (2 times 3) = log_10 2 + log_2 3 \
  &= 0.3010 + 0.4771 = 0.7781 ju $

// p.240
$ "(2)" quad log_10 5 &= log_10 frac(10, 2) = log_10 10 - log_10 2 \
  &= 1 - 0.3010 = 0.6990 ju $

$ "(3)" quad log_10 sqrt(2) &= log_10 2^(1/2) = frac(1, 2) log_10 2 \
  &= frac(1, 2) times 0.3010 = 0.1505 ju $
]

*2. 取式子的对数*#h(1em)应用上面的法则，我们可以把几个正数的幂或算术根相乘除所得的式子，用式子里的各个数的对数来表示。这叫作*取式子的对数*。下面举例说明。

#ex("例 2")[已知 $x, y, z$ 都是正数，且

$ S = frac(x^2 sqrt(y), z^3) $

求 $log_a S$。]

#sol[$ log_a S &= log_a frac(x^2 sqrt(y), z^3) \
  &= log_a x^2 + log_a sqrt(y) - log_a z^3 \
  &= 2 log_a x + frac(1, 2) log_a y - 3 log_a z ju $
]

#ex("例 3")[设 #h(1em)$x = frac((-3)^5 root(3, -2), (-4)^2) ju$

求 $log_a x$。]

#sol[因为等号右边这些幂的底数和根式的被开方数中有负数，不能直接取对数。先把这个等式进行变换，得

$ x = frac((-3^5)(-root(3, 2)), 4^2) = frac(3^5 dot root(3, 2), 2^4) ju $

$ therefore quad log_a x &= log_a frac(3^5 dot root(3, 2), 2^4) \
  &= log_a 3^5 + log_a root(3, 2) - log_a 2^4 \
  /* p.241 */ &= 5 log_a 3 + frac(1, 3) log_a 2 - 4 log_a 2 \
  &= 5 log_a 3 - frac(11, 3) log_a 2 ju $
]

#ex("例 4")[如果三角形 $A B C$ 的三条边分别是 $a, b, c$，那么它的面积 $A$ 可以用公式

$ A = sqrt(s(s - a)(s - b)(s - c)) $

来表示，这里 $s = frac(1, 2)(a + b + c)$。

求 $log_10 A$。]

#analysis[只要取式子 $sqrt(s(s - a)(s - b)(s - c))$ 的对数，但是为了要应用定理，首先要证明，$s, s - a, s - b, s - c$ 都是正数。]

#sol[因为三角形中任意两边的和大于第三边，所以

$ b + c - a > 0 dou quad c + a - b > 0 dou quad a + b - c > 0 ju $

又

$ s = frac(1, 2)(a + b + c) > 0 dou $

$ therefore quad s - a = frac(1, 2)(a + b + c) - a = frac(1, 2)(b + c - a) > 0 ju $

同理，$s - b > 0, s - c > 0$。因此我们可以取式子

$ sqrt(s(s - a)(s - b)(s - c)) $

的对数，得

$ log_10 A &= log_10 sqrt(s(s - a)(s - b)(s - c)) \
  &= frac(1, 2) log_10 s(s - a)(s - b)(s - c) \
  &= frac(1, 2) [log_10 s + log_10 (s - a) \
  &quad quad + log_10 (s - b) + log_10 (s - c)] ju $
]

#attention[$log_10 (s - a)$ 等是不能再化简的，把 $log_10 (s - a)$ 写成等于 $log_10 s - log_10 a$ 是错误的。]

// p.242
#exercise("6·5(1)")[
1. 已知 $log_10 2 = 0.3010$，$log_10 3 = 0.4771$，求

#cols[(1) $log_10 8$；][(2) $log_10 0.125$；]
#cols[(3) $log_10 1.5$；][(4) $log_10 (2/3)^(2/3)$；]
#cols[(5) $log_10 0.3$；][(6) $log_10 frac(1, 5)$；]
#cols[(7) $log_10 root(3, 5)$；][(8) $log_10 2000$。]

2. 求下列各式以 $n$ 为底的对数，式中 $a > 0, b > 0, c > 0$，且 $a > b$。

#cols[(1) $x = frac(a b, c)$；][(2) $x = 2a - 2b$；]
#cols[(3) $x = a^2 - b^2$；][(4) $x = a^3 - b^3$；]
#cols[(5) $x = root(4, frac(a^3, b))$；][(6) $x = sqrt(frac(5a + 5b, 3a - 3b))$。]

3. 求下列各式以 10 为底的对数：

#fl[(1) $C = 2 pi r$；][（圆周长的公式）]
#fl[(2) $A = pi r^2$；][（圆面积的公式）]
#fl[(3) $V = frac(4, 3) pi r^3$；][（球体积的公式）]
#fl[(4) $A = 2 pi r h$；][（直圆柱侧面积公式）]
#fl[(5) $V = pi r^2 h$。][（直圆柱体积公式）]

4. 在上题中，分别用 $C, A, V, h$ 的对数来表示 $r$ 的对数，以 10 为底。

5. 利用恒等式 $N = a^(log_a N)$ 证明：

$ log_a N_1 N_2 N_3 = log_a N_1 + log_a N_2 + log_a N_3 ju $

这里真数 $N_1, N_2, N_3$ 都是正数。
]

*3. 从式子的对数求原式*#h(1em)把第 238 页的法则反过来，就是

$ log_a M + log_a N = log_a M N dou \
  log_a M - log_a N = log_a M \/ N dou \
  alpha log_a M = log_a M^alpha ju $

// p.243
利用这些关系，我们可以从某一个式子的对数求出这个式子，这种方法叫作*从式子的对数求原式*。举例如下：

#ex("例 5")[已知 $log_a x = frac(1, 2) [log_a (m + n) + log_a (m - n)] ju$

求 $x$。]

#sol[$ log_a x &= frac(1, 2) [log_a (m + n) + log_a (m - n)] \
  &= frac(1, 2) log_a (m + n)(m - n) \
  &= frac(1, 2) log_a (m^2 - n^2) \
  &= log_a sqrt(m^2 - n^2) ju \
  therefore quad x &= sqrt(m^2 - n^2) ju $
]

#ex("例 6")[已知

$ log_10 y = 3 log_10 (a - b) + frac(1, 2) log_10 c - frac(2, 5) log_10 (a + b) dou $

求 $y$。]

#sol[$ log_10 y &= 3 log_10 (a - b) + frac(1, 2) log_10 c - frac(2, 5) log_10 (a + b) \
  &= log_10 (a - b)^3 + log_10 sqrt(c) - log_10 (a + b)^(2/5) \
  &= log_10 frac((a - b)^3 sqrt(c), root(5, (a + b)^2)) ju \
  therefore quad y &= frac((a - b)^3 sqrt(c), root(5, (a + b)^2)) ju $
]

#exercise("6·5(2)")[
1. 求证：

(1) $log_10 (n^2 + n + 1) + log_10 (n - 1) = log_10 (n^3 - 1)$；

// p.244
(2) $log_a (x + sqrt(x^2 - 1)) = -log_a (x - sqrt(x^3 - 1)) ju$ // 原书作 x³（疑为 x²，下面的提示里是 x²）

［提示：$log_a (x + sqrt(x^2 - 1)) = log_a frac((x + sqrt(x^2 - 1))(x - sqrt(x^2 - 1)), x - sqrt(x^2 - 1)) ju$］

2. 在下列各式中，求 $x$（答案中不用分指数或负指数）：

(1) $log_a x = 5 log_a m + frac(2, 3) log_a n - frac(log_a p, 3)$；

(2) $log_10 x = log_10 (a + b) - frac(3, 4)(log_10 c - 2 log_10 d) ju$

3. 在下列各式中求 $x$：

$ "(1)" quad log x &= 5 log m + frac(1, 2) \
  &quad times [log (m + n) + frac(1, 3) log (m - n) - log m - log n] fen $

$ "(2)" quad log x &= -frac(1, 2) log a + frac(1, 4) \
  &quad times [log b - frac(2, 3) log a + frac(2, 3) log (a - b) - frac(4, 3) log (a + b)] ju $

这里 $log x$ 表示以任意不等于 1 的正数为底的对数。
]

#summary[
#block(breakable: false)[
*1. 指数和对数*

#ptab((auto, 1fr, 1fr),
  table.hline(stroke: 1.2pt),
  [式#h(2em)子], table.vline(x: 1, stroke: 0.5pt), [$a^b = N$], table.vline(x: 2, stroke: 0.5pt), [$log_a N = b$],
  table.hline(stroke: 0.5pt),
  [名#h(2em)称],
  align(left, [$a$——幂的底数 \ $b$——幂的指数 \ $N$——幂]),
  align(left, [$a$——对数的底数 \ $N$——真数 \ $b$——以 $a$ 为底、$N$ 的对数]),
  table.hline(stroke: 0.5pt),
  [运算法则],
  [$a^alpha dot a^beta = a^(alpha + beta)$ \ $a^alpha / a^beta = a^(alpha - beta)$ \ $(a^alpha)^beta = a^(alpha beta)$],
  [$log_a M N = log_a M + log_a N$ \ $log_a frac(M, N) = log_a M - log_a N$ \ $log_a M^alpha = alpha log_a M$],
  table.hline(stroke: 0.5pt),
  [基本恒等式], table.cell(colspan: 2)[$N = a^(log_a N) quad (a > 0, a != 1, N > 0)$],
  table.hline(stroke: 1.2pt),
)
]

// p.245
#block(breakable: false)[
*2. 指数函数和对数函数*

#ptab((auto, auto, 1fr, 1.5cm, 1fr),
  table.hline(stroke: 1.2pt),
  table.cell(colspan: 2)[名#h(2em)称], [指#h(2em)数#h(2em)函#h(2em)数], [], [对#h(2em)数#h(2em)函#h(2em)数],
  table.hline(stroke: 0.5pt),
  table.cell(colspan: 2)[一般形式], [$y = a^x$ \ $(a > 0, a != 1)$], [], [$y = log_a x$ \ $(a > 0, a != 1)$],
  table.hline(stroke: 0.5pt),
  table.cell(colspan: 2)[定义域], [$-infinity < x < +infinity$],
  table.cell(rowspan: 2, cross-arrows()),
  [$0 < x < +infinity$],
  table.hline(start: 0, end: 3, stroke: 0.5pt),
  table.hline(start: 4, end: 5, stroke: 0.5pt),
  table.cell(colspan: 2)[值#h(2em)域], [$0 < y < +infinity$], [$-infinity < y < +infinity$],
  table.hline(stroke: 0.5pt),
  table.cell(rowspan: 2)[性 \ \ \ \ 质], [1],
  align(left, [(1) 当 $a > 1$ 时 \
    #h(2em)$a^x cases(>1 quad (x > 0), =1 quad (x = 0), <1 quad (x < 0))$ \
    (2) 当 $0 < a < 1$ 时， \
    #h(2em)$a^x cases(<1 quad (x > 0), =1 quad (x = 0), >1 quad (x < 0))$]),
  [],
  align(left, [(1) 当 $a > 1$ 时 \
    #h(2em)$log_a x cases(>0 quad (x > 1), =0 quad (x = 1), <0 quad (x < 1))$ \
    (2) 当 $0 < a < 1$ 时 \
    #h(2em)$log_a x cases(<0 quad (x > 1), =0 quad (x = 1), >0 quad (x < 1))$]),
  table.hline(start: 1, stroke: 0.5pt),
  [2],
  align(left, [(1) 当 $a > 1$ 时 \ #h(3em)$a^x$ 是增函数 \ (2) 当 $0 < a < 1$ 时 \ #h(3em)$a^x$ 是减函数]),
  [],
  align(left, [(1) 当 $a > 1$ 时 \ #h(3em)$log_a x$ 是增函数 \ (2) 当 $0 < a < 1$ 时 \ #h(3em)$log_a x$ 是减函数]),
  table.hline(stroke: 1.2pt),
  table.cell(colspan: 5)[图#h(3em)像],
  table.hline(stroke: 0.5pt),
  table.cell(colspan: 5, fig-6-summary()),
  table.hline(stroke: 1.2pt),
)
]
]

// p.246
#review(title: [复习题六])[
1. (1) 是不是对于 $x$ 的一切实数值，等式

$ x = a^(log_a x) quad (a > 0, a != 1) $

都能成立？为什么？

(2) 作函数 $y = x$ 和函数 $y = 2^(log_2 x)$ 的图像。比较一下它们是不是相同？

2. 下列各式是不是恒等的？（式中 $x, y$ 都是正数）

#cols[(1) $log_a (x + y)$ 和 $log_a x + log_a y$；][(2) $log_a x^2$ 和 $(log_a x)^2$；]
#cols[(3) $frac(log_a x, log_a y)$ 和 $log_a frac(x, y)$；][(4) $frac(log_a x, n)$ 和 $log_a root(n, x)$。]

［提示：如果要说明它们不恒等，可给 $x, y$ 以任意数值，再来比较。例如，要说明 (1) 中两个式子不恒等，可令 $x = frac(1, 2)$，$y = frac(1, 2)$，于是

$ log_2 (frac(1, 2) + frac(1, 2)) = log_2 1 = 0 dou quad log_2 frac(1, 2) = log_2 2^(-1) = -log_2 2 = -1 dou $

$ therefore quad log_2 (frac(1, 2) + frac(1, 2)) != log_2 frac(1, 2) + log_2 frac(1, 2) ju $

由此即可说明 $log_a (x + y)$ 和 $log_a x + log_a y$ 是不恒等的。］

3. (1) 设有指数函数 $y = a^x$，当 $a > 1$ 和 $0 < a < 1$ 时，函数的增减性有什么不同？

(2) 如果 $a^sqrt(2) > a^sqrt(3)$，$a$ 应该是怎样的数？如果 $a^sqrt(2) < a^sqrt(3)$ 呢？

(3) 已知 $a^(2x^2 - 3) < a^(3x - 1)$，求 $x$ 可取值的范围。// 原书“3x”的 3 印得像 8（据书末答案：a>1 时 −1/2<x<2，即 2x²−3<3x−1，取 3）

4. (1) 设有对数函数 $y = log_a x$，当 $0 < a < 1$ 及 $a > 1$ 时，函数的增减性有什么不同？

(2) 如果 $log_a 0.2 > log_a 0.3$，$a$ 应该是怎样的数？如果 $log_a 0.2 < log_a 0.3$ 呢？

(3) 已知 $log_a 3x^2 < log_a (2x + 1)$，求 $x$ 可取值的范围。

5. 从下面的条件中，确定底数 $a$ 应该是怎样的数：

#cols[(1) $a^(1/2) > 1$；][(2) $a^(1/2) < 1$；]
#cols[(3) $log_a frac(1, 2) > 0$；][(4) $log_a frac(1, 2) < 0$。]

// p.247
6. 下面这些式子是不是恒等？如果不恒等，那么在什么条件下才相等？

(1) $log_a x^2$ 和 $2 log_a x$；

(2) $log_a (x^2 - y^2)$ 和 $log_a (x + y) + log_a (x - y)$。

7. 已经知道了函数 $y = 3^x$ 的图像，用什么方法可以作出函数 $y = log_3 x$ 的图像？为什么可以这样作？

8. 在同一坐标系里作出函数 $y = log_10 x$ 和 $y = log_(1/10) x$ 的图像。比较它们有哪些相同的地方？哪些不同的地方？

9. 三角形内切圆的半径 $r$ 可以用公式

$ r = sqrt(frac((s - a)(s - b)(s - c), s)) $

来计算，式中 $a, b, c$ 是三角形三边的长，$s = frac(a + b + c, 2)$。

求 $log_10 r$。

10. 以任意不等于 1 的正数做底，取下面这些式子的对数：

(1) $x = frac(c root(3, a), b^2 sqrt(d)) quad (a, b, c, d "都是正数") fen$

(2) $x = frac(s(s - a)(s - b)(s - c), 4 a b c)$

#h(6em)［$a, b, c$ 为三角形的三边，$s = frac(1, 2)(a + b + c)$］；

(3) $x = sqrt(frac((-a)^3 (-b)^2, root(3, -c))) quad (a > 0, b > 0, c > 0) fen$

(4) $x = frac(2, 5) root(3, m sqrt(n)) quad (m > 0, n > 0) ju$ // 根指数是一个看不清的黑点，印得像 3 或 8，按 3 取；书末答案无此题

11. 从下列各式求 $x$（$n, m$ 为大于 1 的正数）：

(1) $log x = log a + n log (a + b) - frac(1, n) log (a - b)$；

(2) $log x = log b + m log (b - c) - frac(1, m) log (b + c)$；

$ "(3)" quad log x &= -log (a + b) \
  &quad + frac(2, 5) [2 log a + frac(1, 2) log b - frac(1, 3)(log a - log b) - frac(5, 6) log a] fen $

// p.248
(4) $log x = frac(2, 3) [log a + frac(1, 3) log (a + b) - 2 log (a - b) - frac(1, 2) log b] ju$

12. 求证：

(1) $log (a^3 + 3a^2 + 3a + 1) - log (a^3 - 3a^2 + 3a - 1) = 3 log frac(a + 1, a - 1)$；

(2) $frac(log (sqrt(a^2 + 1) + a), log (sqrt(a^2 + 1) - a)) = -1 quad (a != 0) ju$

#line(length: 30%, stroke: 0.6pt)

#par(first-line-indent: 0em)[［注］这里“log”表示以任意不等于 1 的正数为底的对数。]
]
