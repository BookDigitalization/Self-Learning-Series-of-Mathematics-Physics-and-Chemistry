// 第 1 章（续）本章提要、复习题一（原书 p.70–76）
#import "/common/series.typ": *

// 局部：分式方程组、不等式组的大括号，每行按 display 样式排（同代数第二册）
#let cs(..rows) = math.cases(..rows.pos().map(math.display))

// p.70
#summary[
*1. 等式和不等式*

#align(center, table(
  columns: (auto, 1fr, 1fr),
  align: (center + horizon, left + top, left + top),
  inset: 6pt,
  [名称], align(center)[等式], align(center)[不等式],
  [定义], [用符号“=”把两个代数式连接起来所构成的式子叫作等式。], [用符号“>”或者“<”把两个代数式连接起来所构成的式子叫作不等式。],
  table.cell(rowspan: 2)[性质],
  [
    (1) 如果 $a = b$，那么

    #align(center, $b = a ju$)

    (2) 如果 $a = b, b = c$，那么

    #align(center, $a = c ju$)

    (3) 如果 $a = b$，那么

    #align(center, $a + c = b + c ju$)

    (4) 如果 $a = b$，那么

    #align(center, $a c = b c ju$)
  ],
  [
    (1) 如果 $a > b$，那么

    #align(center, $b < a ju$)

    (2) 如果 $a > b, b > c$，那么

    #align(center, $a > c ju$)

    (3) 如果 $a > b$，那么

    #align(center, $a + c > b + c ju$)

    (4) 如果 $a > b$，那么

    #align(center, $a c cs(> b c quad (c > 0) fen, = b c quad (c = 0) fen, < b c quad (c < 0) ju)$)
  ],
  /* p.71 */
  [
    (5) 如果 $a = b, c = d$，那么

    #align(center, $a + c = b + d ju$)

    (6) 如果 $a = b, c = d$，那么

    #align(center, $a - c = b - d ju$)

    (7) 如果 $a = b, c = d$，那么

    #align(center, $a c = b d ju$)

    (8) 如果 $a = b != 0$，那么

    #align(center, $1/a = 1/b ju$)

    (9) 如果 $a = b, c = d != 0$，那么

    #align(center, $a/c = b/d ju$)

    (10) 如果 $a = b$，$n$ 为自然数，那么

    #align(center, $a^n = b^n ju$)

    (11) 如果 $a = b$，$a, b$ 是正数，$n$ 为大于 1 的整数，那么

    #align(center, $root(n, a) = root(n, b) ju$)
  ],
  [
    (5) 如果 $a > b, c > d$，那么

    #align(center, $a + c > b + d ju$)

    (6) 如果 $a > b, c < d$，那么

    #align(center, $a - c > b - d ju$)

    (7) 如果 $a > b, c > d, a, b, c, d$ 都是正数，那么

    #align(center, $a c > b d ju$)

    (8) 如果 $a > b$，$a, b$ 都是正数，那么

    #align(center, $1/a < 1/b ju$)

    (9) 如果 $a > b, c < d, a, b, c, d$ 都是正数，那么

    #align(center, $a/c > b/d ju$)

    (10) 如果 $a > b$，$a, b$ 都是正数，$n$ 为自然数，那么

    #align(center, $a^n > b^n ju$)

    (11) 如果 $a > b$，$a, b$ 都是正数，$n$ 为大于 1 的整数，那么

    #align(center, $root(n, a) > root(n, b) ju$)
  ],
))

*2. 不等式的证明*

(1) 应用比较法则

$ "如果" a - b cs(> 0 dou, = 0 dou, < 0 fen) quad "那么" a cs(> b dou, = b dou, < b ju) $

（逆命题也成立）

(2) 应用不等式的性质。

(3) 应用一些已知的重要不等式：

#cols[(i) $a^2 >= 0 dou$][(ii) $(a - b)^2 > 0 dou$]
#cols[(iii) $a^2 + b^2 >= 2 a b dou$][(iv) $a + b >= 2 sqrt(a b)$ ($a, b$ 为正数)，]
(v) $b/a + a/b >= 2$ ($a, b$ 同号)。

// p.72
(4) 应用绝对值的性质：

#cols[(i) $|a| + |b| >= |a + b| dou$][(ii) $|a| - |b| <= |a + b| dou$]
#cols[(iii) $|a| dot |b| = |a b| dou$][(iv) $abs(a)/abs(b) = abs(a/b)$ ($b != 0$)。]

*3. 不等式的解*

(1) 一元一次不等式的解

$ a x > b dou quad x cs(> display(b/a) quad "（如果 " a > 0 ") " fen, < display(b/a) quad "（如果 " a < 0 ") " ju) $

(2) 一元一次不等式组的解的几种基本情况 ($alpha < beta$)

#align(center, table(
  columns: 5,
  align: center + horizon,
  inset: 6pt,
  [类型],
  $cs(x > alpha, x > beta)$, $cs(x < alpha, x < beta)$, $cs(x > alpha, x < beta)$, $cs(x < alpha, x > beta)$,
  [解],
  $x > beta$, $x < alpha$, $alpha < x < beta$, [没有解],
))

(3) 一元二次不等式 $(x - alpha)(x - beta) > 0$ 或者 $(x - alpha)(x - beta) < 0$ 的解法

#align(center, table(
  columns: (auto, 1fr, 1fr),
  align: center + horizon,
  inset: 6pt,
  [类型], $(x - alpha)(x - beta) > 0$, $(x - alpha)(x - beta) < 0$,
  [归结成不等式组],
  [$cs(x - alpha > 0, x - beta > 0)$ 和 $cs(x - alpha < 0, x - beta < 0)$],
  [$cs(x - alpha > 0, x - beta < 0)$ 和 $cs(x - alpha < 0, x - beta > 0)$],
  [解],
  [$x < alpha$ 或 $x > beta$ \ （这里 $alpha < beta$）],
  [$alpha < x < beta$ \ （这里 $alpha < beta$）],
))

(4) 一元分式不等式的解法

#align(center, table(
  columns: (auto, 1fr, 1fr),
  align: center + horizon,
  inset: 6pt,
  [类型], $P(x)/Q(x) > 0$, $P(x)/Q(x) < 0$,
  [归结成不等式组],
  [$cs(P(x) > 0, Q(x) > 0)$ 和 $cs(P(x) < 0, Q(x) < 0)$],
  [$cs(P(x) > 0, Q(x) < 0)$ 和 $cs(P(x) < 0, Q(x) > 0)$],
))

表中 $P(x), Q(x)$ 分别表示 $x$ 的某一整式。

// p.73
(5) 几个简单无理不等式的解法

#align(center, table(
  columns: (auto, 1fr, 1fr),
  align: center + horizon,
  inset: 6pt,
  [类型], $sqrt(P(x)) > a quad (a > 0)$, $sqrt(P(x)) > sqrt(Q(x))$,
  [归结成不等式组],
  $cs(P(x) >= 0, P(x) > a^2)$,
  $cs(P(x) >= 0, Q(x) >= 0, P(x) > Q(x))$,
))

(6) 含有绝对值符号的不等式的解法

#align(center, table(
  columns: 6,
  align: center + horizon,
  inset: 6pt,
  [类型], [], $|x| > a$, $|x| < a$, $|x - b| > a$, $|x - b| < a$,
  table.cell(rowspan: 3)[解],
  $a > 0$, [$x < -a$ 或 $x > a$], $-a < x < a$, [$x < b - a$ 或 \ $x > b + a$], $b - a < x < b + a$,
  $a = 0$, $x != 0$, [没有解], $x != b$, [没有解],
  $a < 0$, [全体实数], [没有解], [全体实数], [没有解],
))
]

#review(title: [复习题一])[
  1. 回答下面的问题：

  (1) 如果 $a < b, c < d$，能不能断定：

  #cols[(i) $a + c < b + d$；][(ii) $a - c < b - d$；]
  #cols[(iii) $a c < b d$；][(iv) $a/c < b/d$；]
  (v) $a^n < b^n$ ($n$ 是自然数)；

  (vi) $root(n, a) < root(n, b)$ ($n$ 是大于 1 的整数)。

  如果再加上一个条件 $a > 0, b > 0$ 呢？

  (2) 如果 $a < b < 0, c < d < 0$，那么可以断定：

  (i) $a c$ 和 $b c$ 间有什么关系？

  (ii) $a/d$ 和 $b/c$ 间有什么关系？

  (iii) $a^n$ 和 $b^n$ 间有什么关系？($n$ 是自然数)

  (iv) $root(n, |a|)$ 和 $root(n, |b|)$ 间有什么关系？($n$ 是大于 1 的整数)。

  // p.74
  2. 比较下面各题中两个代数式的值的大小：

  (1) $x^2$ 和 $x^2 - x + 1$；

  (2) $x^2 + x + 1$ 和 $(x + 1)^2$。

  3. 已知 $a > b > 0$。把下列各式依照从小到大的顺序用不等号“<”连接起来（要说明理由）：

  #align(center, $a, quad b, quad (a + b)/2, quad sqrt(a b), quad sqrt((a^2 + b^2)/2) ju$)

  4. 设 $a != b$，求证：

  (1) $a^2 + 3 b^2 > 2 b (a + b)$；

  (2) $a^4 + 6 a^2 b^2 + b^4 > 4 a b (a^2 + b^2)$。

  5. 设 $a, b, c$ 是互不相等的正数，求证：

  (1) $(b + c - a)/a + (c + a - b)/b + (a + b - c)/c > 3$；

  (2) $a^3 + b^3 + c^3 > 3 a b c$。

  [提示：$a^3 + b^3 + c^3 - 3 a b c = (a + b + c)(a^2 + b^2 + c^2 - a b - b c - c a)$。]

  6. 解下列关于 $x$ 的不等式：

  (1) $x/a - b > x/b - a quad (a > 0, b > 0)$；

  (2) $(a + x)/b < (x - b)/a + 2 quad (a, b "同符号")$。

  7. 解下列各不等式组：

  (1) $cs((x - 3)(x - 4) < (x + 1)(x + 2) dou, x(x + 1) + x(x + 2) > (2x - 1)(x + 3) fen)$

  (2) $cs(2 - (5 + x)/7 > 1 - (9 - x)/14 dou, 12 - 1/3 (47 - 60/x) > 3 ju)$

  8. 解下列各不等式：

  (1) $(x - 3)(x - 7) < 5(x - 3)$；

  (2) $x^2 - 5x > 3x + 4$；

  (3) $(2x - sqrt(2))(2x + sqrt(2)) > 1$；

  (4) $(x - sqrt(2))^2 < 1$；

  (5) $(x - 1)^3 > (x + 1)^3$；

  // p.75
  (6) $(1 + sqrt(2) x)(1 - sqrt(2) x) > 4x ju$

  9. 解下列各不等式：

  #cols[(1) $(x + 1)/(x + 4) > 1$；][(2) $(y + 1)/(y^2 + 4) > 0$；]
  #cols[(3) $(x - sqrt(2))/(x + sqrt(2)) < 0$；][(4) $(y^2 + 4)/(y - 2) < y^2 + 4 ju$]

  10. 解下列各不等式组：

  #cols[(1) $cs(x - 1 > 0 dou, 2x + 1 > 0 dou, 3x - 2 > 0 fen)$][(2) $cs(x - 2 < 0 dou, x - 3 < 0 dou, x + 4 < 0 ju)$]
  #cols[(3) $cs(2x - 1 > 0 dou, 3x + 1 > 0 dou, 3x - 2 < 0 fen)$][(4) $cs(x - 2 < 0 dou, x - 3 > 0 dou, x + 4 > 0 ju)$]

  \*11. 解下列各不等式：

  (1) $(x - sqrt(2))(x - sqrt(3))(x - sqrt(5)) > 0$；

  (2) $(2x + 1)(3x + 1)(4x + 1) < 0 ju$

  \*12. 解下列各不等式：

  (1) $((3x + 2)(2x + 3))/((3x - 2)(2x - 3)) >= 0$；

  (2) $(x + 1)/(x - 1) < (x - 5)/(x - 3)$；

  (3) $7/(x^2 + x) + 1/(x^2 - x) > 6/((x + 1)(x - 1))$；

  (4) $(1 - 3x)/(1 + 3x) + (3x + 1)/(3x - 1) < 12/(1 - 9x^2) ju$

  \*13. 解下列各不等式组：

  #cols[(1) $cs((x - 2)(x + 3) > 0 dou, (x + 2)(x - 3) < 0 fen)$][(2) $cs((x + 2)^2 > 1 dou, (x - 2)^2 < 1 ju)$]

  \*14. 已知 $|a| < 1, |b| < 1$，求证：

  #align(center, $abs((a + b)/(1 + a b)) < 1 ju$)

  15. 解下列各不等式：

  #cols[(1) $|2x - 3| > 5$；][(2) $3|2x + 1| - 4 <= 0$；]
  // p.76
  #cols[(3) $2|1 - 3x| - 1 <= 0$；][(4) $abs(1 - 1/x) > 2 ju$]

  16. 一个两位数，它的十位上的数比个位上的数小 2。已知它大于 21 而小于 38，求这个数。

  17. 把一个两位数加上它的一半，所得到的数大于 128 而小于 130，求这个数。

  18. 学生若干人，住若干间宿舍。如果每间住 4 个人，那么还余 19 人，如果每间住 6 个人，那么有一间宿舍不空也不满，求宿舍间数和学生人数。

  \*19. $m$ 取什么值的时候，下列二次方程有两个不相等的实根：

  (1) $(m - 1) x^2 - 2(m + 1) x + m - 2 = 0$；

  [提示：注意条件 $m - 1 != 0$。]

  (2) $(5m + 1) x^2 + (7m + 3) x + 3m = 0 ju$

  20. 已知 $k$ 是一个整数，问 $k$ 取什么数值的时候，

  (1) 方程组 $cs(3x + 7y = k dou, 2x + 5y = 20)$ 的解 $x, y$ 都是正数；

  (2) 方程组 $cs(3x - 6y = 1 dou, 5x - k y = 2)$ 的解 $x, y$ 都是负数。
]
