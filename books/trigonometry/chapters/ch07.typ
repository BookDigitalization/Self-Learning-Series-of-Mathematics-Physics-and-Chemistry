// 第 7 章 反三角函数（原书 p.241–272）
#import "/common/series.typ": *
#import "/books/trigonometry/figures/c7-figs.typ": *

// 数值表（三线表）：rows 为若干行，每行第一格是表头
#let c7-vtab(..rows, first: 3em) = {
  let rows = rows.pos()
  let n = rows.first().len()
  let m = rows.len()
  align(center, block(breakable: false, above: 1em, below: 1em, table(
    columns: (first,) + (auto,) * (n - 1),
    align: center + horizon,
    inset: (x: 7pt, y: 6pt),
    fill: none,
    stroke: (x, y) => (
      left: if x >= 1 { 0.5pt } else { none },
      top: if y == 0 { 1.2pt } else { 0.5pt },
      bottom: if y == m - 1 { 1.2pt } else { none },
    ),
    ..rows.enumerate().map(((i, r)) => if i == 0 { r.map(c => text(fill: black, c)) } else { r }).flatten(),
  )))
}

// 带序号的一组公式：公式居中、左对齐，右侧写序号
#let c7-eqs(..rows) = block(width: 100%, above: 1em, below: 1em, breakable: false, {
  set par(first-line-indent: 0em)
  grid(columns: (1fr, auto, 1fr), row-gutter: 0.8em, align: (left, left + horizon, right + horizon),
    ..rows.pos().map(((e, tag)) => ([], math.equation(block: false, e), tag)).flatten())
})
// 左侧带引导语（“就是”“同样，”）的独立公式
#let c7-lead(lead, eq) = block(width: 100%, above: 0.8em, below: 0.8em, {
  set par(first-line-indent: 0em)
  grid(columns: (4em, 1fr, 4em), align: (left + horizon, center + horizon, left), lead, eq, [])
})

// p.241
= 反三角函数

== 反函数

在前面两章中，我们看到，解三角形求未知角的时候，我们总是先求出某一个角的一个三角函数，然后根据这个三角函数的值，求出未知角的度数。例如，已知两边 $a$，$b$ 和角 $A$，应用正弦定理求角 $B$ 时，我们先由 $sin B = (b sin A) / a$ 算出等式右边的值，然后查表得到角 $B$ 的度数。

但是，对某一个问题，要寻求普遍性的解答的时候，我们常常会遇到用字母表示已知的三角函数值的式子，比方说，$sin x = m$，这里 $m$ 代表一个已知的数。这时，要写出角 $x$ 的度数是不可能的，只能用 $m$ 表示角 $x$。下面我们就来研究怎样用 $m$ 表示角 $x$。

我们知道，如果有两个量，当一个量取某一个固定的值的时候，另一个量就相应地取确定的数值，当第一个量变化的时候，第二个量也相应地变化，那么第二个量是第一个量的函数，第一个量是自变量。

但是互相关联的两个量中间，把哪一个看作自变量，并不是绝对的。例如，每立方厘米的铁重 7.8 克。设 $x$ 立方厘米的铁重 $y$ 克，那么

$ y = 7.8 x ju $

用这个公式，知道了铁的体积，可以求得铁的重量。这/* p.242 */时，我们把铁的重量 $y$ 看作是它的体积 $x$ 的函数，$x$ 是自变量。

反过来，知道了铁的重量 $y$，也可以求铁的体积 $x$。它们之间的关系是

$ x = y / 7.8 ju $

这时，我们把铁的体积 $x$ 看作是它的重量 $y$ 的函数，$y$ 是自变量。

从这个例子可以看到，由于考虑问题的出发点不同，不仅可以把铁的重量看作是它的体积的函数，也可以把铁的体积看作是它的重量的函数。

一般地说，对于函数 $y = f(x)$，如果把 $y$ 看作自变量，并且对于 $y$ 的每一个可以取的值，$x$ 有唯一确定的值和它对应时，我们就把新的函数 $x = phi(y)$ 叫作 $y = f(x)$ 的*反函数*。

在上面的例子中，$x = y / 7.8$ 就是 $y = 7.8 x$ 的反函数。

又例如 $y = 2x + 1$ 的反函数是 $x = (y - 1) / 2$。

#fig("7·1", fig-7-1())[]

对于函数 $y = x^2$ 来说，情形有些不同。当 $y$ 取某一个正值的时候，在全体实数中，对应的 $x$ 值不是一个而是两个。我们通常说：在全体实数的范围内，$x$ 不是 $y$ 的函数。但是我们可以缩小 $y = x^2$ 的定义域，使它只包含零和一切正数。这时，无论 $y$ 等于/* p.243 */哪一个正数 $m$，对应的 $x$ 只有一个值 $sqrt(m)$。

函数 $y = x^2$ 在 $x >= 0$ 的范围内的图像是半条抛物线（图 7·1）。从图像上可以看到，一点的纵坐标确定后，横坐标是唯一确定的。这就说明，函数 $y = x^2$ 在缩小了的定义域 $x >= 0$ 的范围内，$x$ 可以看作是 $y$ 的函数。它们之间的关系是

$ x = + sqrt(y) ju $

在这种情形，我们说，$x = + sqrt(y)$ 是函数 $y = x^2$ 在 $x >= 0$ 的区间内的反函数。

#exercise("7·1")[
  1. 已知圆的面积 $A$ 是半径 $r$ 的函数：$A = pi r^2$，$r$ 是 $A$ 的函数吗？为什么？
  2. 把下列各函数写成 $x = phi(y)$ 的形式：
    #cols[(1) $y = sqrt(2) x - pi$；][(2) $y = 3x^3 + 7$；]
    #cols[(3) $y = 2^x + 3$；][(4) $y = lg(x + sqrt(5))$。]
  3. 在 $x <= 0$ 的范围内，求函数 $y = x^2$ 的反函数。
]

== 反正弦

现在来看等式 $sin x = m med (|m| <= 1)$。我们知道，正弦等于某一个已知数 $m$ 的角有无数个。例如当 $sin x = 1/2$ 时，$x$ 可以是 $30°$，$150°$ 以及这两个角加上或者减去 $360°$ 的任何整数倍所得的角。用弧度来表示，就是 $pi/6$，$(5pi)/6$，以及这两个角加上或者减去 $2pi$ 的任何整数倍所得的角。

我们可以画出 $y = sin x$ 的图像来看这个事实。在图 7·2 中，作和 $x$ 轴平行的直线 $y = 1/2$。这条直线将和 $y = sin x$ 的图/* p.244 */像相交于无数个点，每一个交点的横坐标都是满足 $sin x = 1/2$ 的 $x$ 的值。

#fig("7·2", fig-7-2())[]

由于 $y = sin x$ 的图像是波浪式的曲线，因此，平行于 $x$ 轴的直线如果和它相交，那就必然有无数个交点。但是，我们可以把全体实数划分成许多区间，使每一个区间内 $sin x$ 的值递增或者递减，如图 7·2 中竖的虚线所表示的。这样，在每一个区间内，直线 $y = 1/2$ 和函数 $y = sin x$ 的图像就只有一个交点。这也就是说，在这样的每一个区间内，我们都可以求出函数 $sin x$ 的反函数。

因为，我们最常用到的角是 0 到 $pi/2$ 间的角。所以在求三角函数的反函数的时候，我们通常都选取包含着 0 到 $pi/2$ 的这个区间。

我们可以看到，对于正弦函数来说，这样的区间就是闭区间 $[-pi/2, pi/2]$。在这个区间内，直线 $y = 1/2$ 和函数 $y = sin x$ /* p.245 */的图像只有一个交点，这个交点的横坐标是 $pi/6$。这说明，当 $sin x = 1/2$ 时，从 $-pi/2$ 到 $pi/2$ 的 $x$ 的值是 $pi/6$。我们把 $x$ 的这个值写作 $arcsin 1/2$。换句话说，$arcsin 1/2$ 是从 $-pi/2$ 到 $pi/2$ 的一个角，它的正弦等于 $1/2$。

一般地说，当 $sin x = m med (|m| <= 1)$ 时，从 $-pi/2$ 到 $pi/2$ 的 $x$ 的值叫作 $m$ 的*反正弦*，用 $arcsin m$ 来表示。这也就是说，$arcsin m$（$|m| <= 1$）表示从 $-pi/2$ 到 $pi/2$ 的一个角，它的正弦等于 $m$。用式子来表示，就是

$ sin(arcsin m) = m, quad -pi/2 <= arcsin m <= pi/2 med (|m| <= 1) ju $

#ex("例")[求下列反正弦的值：

#cols[(1) $arcsin 0.6536$；][(2) $arcsin 1$；]
#cols[(3) $arcsin(-sqrt(3)/2)$；][(4) $arcsin(-0.4189)$。]]

#sol[(1) $arcsin 0.6536$ 表示从 $-90°$ 到 $90°$ 的一个角，它的正弦等于 0.6536。查表得

$ sin 40°49' = 0.6536, \ therefore quad arcsin 0.6536 = 40°49'. $

(2) 从 $-pi/2$ 到 $pi/2$ 正弦等于 1 的角是 $pi/2$。因此，

$ arcsin 1 = pi/2 ju $

(3) 正弦等于 $sqrt(3)/2$ 的锐角是 $pi/3$。因为

$ sin(-pi/3) = - sin pi/3 = - sqrt(3)/2, $

// p.246
所以从 $-pi/2$ 到 $pi/2$ 正弦等于 $-sqrt(3)/2$ 的角是 $-pi/3$。因此，

$ arcsin(-sqrt(3)/2) = -pi/3 ju $

(4) 查表得 $sin 24°46' = 0.4189$。因为 $sin(-24°46') = -sin 24°46' = -0.4189$，所以从 $-90°$ 到 $90°$ 正弦等于 $-0.4189$ 的角是 $-24°46'$。

$ therefore quad arcsin(-0.4189) = -24°46'. $
]

由于三角函数 $y = sin x$ 当 $y$ 取 $-1$ 到 $+1$ 的一个值的时候，对应的 $x$ 值有无数个，所以我们也只能考虑它在某一个区间内的反函数。

从上面所说的，如果把 $y = sin x$ 的定义域缩小成 $-pi/2$ 到 $pi/2$ 的一个区间。那么在这个区间内，当 $y$ 取某一个值 $m$（$|m| <= 1$）的时候，对应的 $x$ 的值只有一个，并且这个值可以用反正弦 $arcsin m$ 来表示（图 7·3）。因此，对于 $y$ 的任意一个从 $-1$ 到 $+1$ 的值来说，

$ x = arcsin y ju $

这就是说，函数 $y = sin x$ 在 $[-pi/2, pi/2]$ 这个区间内的反函数是

$ x = arcsin y dou $

我们把它叫作*反正弦函数*。

#fig("7·3", fig-7-3())[]

在反正弦函数 $x = arcsin y$ 中，自变量 $y$ 是从 $-1$ 到 $+1$ 间的任意一个数，函数 $x$ /* p.247 */是正弦等于 $y$ 并且在 $[-pi/2, pi/2]$ 这个区间内的角。因此，反正弦函数的定义域是

$ -1 <= y <= 1 fen $

函数值所在的范围是

$ -pi/2 <= x <= pi/2 ju $

因为在反正弦函数 $x = arcsin y$ 中，$x$ 和 $y$ 的关系是

$ y = sin x med (-pi/2 <= x <= pi/2), $

所以 $y = sin x$ 从 $-pi/2$ 到 $pi/2$ 的一段图像同时也是 $x = arcsin y$ 的图像（图 7·3）。但是曲线上的点的横坐标对于正弦函数 $y = sin x$ 来说是自变量，对于反正弦函数 $x = arcsin y$ 来说是函数；曲线上的点的纵坐标对于正弦函数来说是函数，对于反正弦函数来说是自变量。

习惯上，我们总是用字母 $x$ 表示自变量，用字母 $y$ 表示函数的。观察图像的时候，也习惯于把点的横坐标看作是自变量的值，纵坐标看作是函数的值。

为了符合习惯，我们把反正弦函数写成

$ y = arcsin x ju $

这样一来，$y$ 就是正弦等于 $x$ 并且在 $[-pi/2, pi/2]$ 这个区间内的角。换句话说，$x$ 和 $y$ 间的关系是

$ x = sin y med (-pi/2 <= y <= pi/2). $

所以，要画出 $y = arcsin x$ 的图像，只要作 $x = sin y$ 从 $-pi/2$ 到/* p.248 */ $pi/2$ 的一段图像就可以了。我们列出下面的数值表：

#c7-vtab(
  ($y$, $-pi/2$, $-pi/3$, $-pi/6$, $0$, $pi/6$, $pi/3$, $pi/2$),
  ($x$, $-1$, $-0.87$, $-0.50$, $0$, $0.50$, $0.87$, $1$),
)

把每一组值作为点的坐标，得到图 7·4 的曲线。它就是函数 $y = arcsin x$ 的图像。

#fig("7·4", fig-7-4())[]

#exercise("7·2")[
  1. 求下列反正弦的值：
    #cols[(1) $arcsin sqrt(2)/2$；][(2) $arcsin 0$；]
    #cols[(3) $arcsin(-1)$；][(4) $arcsin(-0.2672)$。]
  2. 用反正弦表示满足下列各式的角 $x$ $(-pi/2 <= x <= pi/2)$：
    #cols[(1) $sin x = sqrt(3)/4$；][(2) $sin x = 0.8715$；]
    #cols[/* p.249 */(3) $2 sin x = -3/5$；][(4) $sin x = (a^2 - b^2) / (a^2 + b^2)$。]
  3. 计算下列各式的值：
    #cols[(1) $2 arcsin 1/2$；][(2) $pi/4 + arcsin(-sqrt(2)/2)$；]
    (3) $1/3 arcsin sqrt(3)/2$；\
    (4) $arcsin 0.3144 + arcsin(-0.3144)$；\
    (5) $-arcsin(-1)$；\
    (6) $arcsin(-sqrt(2)/2) - arcsin(-1/2)$。
  4. 写出下列各式的值：
    #cols[(1) $sin(arcsin 0.8239)$；][(2) $sin(arcsin sqrt(7)/5)$；]
    #cols[(3) $sin[arcsin(-0.1221)]$；][(4) $sin[arcsin(-sqrt(3)/4)]$。]
  5. $arcsin sqrt(2)$ 有没有意义？为什么？
  6. 在直角三角形 $A B C$ 中，斜边是 $c$，两条直角边是 $a$ 和 $b$。用反正弦表示锐角 $A$ 和 $B$。
  7. 写出下列各函数的定义域：
    #cols[(1) $y = arcsin 2x$；][(2) $y = arcsin sqrt(x)$；]
    #cols[(3) $y = sqrt(arcsin x)$；][(4) $y = arcsin 1/x$。]
  8. 作出 $y = arcsin 2x$ 的图像，并与 $y = arcsin x$ 的图像作比较，它们的区别在哪里？
]

== 反余弦

从余弦函数 $y = cos x$ 的图像（图 7·5）可以看到，当 $cos x$ 等于某一个已知数 $m$ 的时候，对应的 $x$ 值有无数个。例如，作和 $x$ 轴平行的直线 $y = 1/2$，这条直线将与 $y = cos x$ 的图像相/* p.250 */交于无数个点。这说明当 $cos x = 1/2$ 时，对应的 $x$ 值有无数个。

但是，如果将全体实数划分成许多区间，使每一个区间内余弦函数的值递增或者递减，如图 7·5 中竖的虚线所表示的。那么，在每一个区间内，直线 $y = 1/2$ 和函数 $y = cos x$ 的图像就只有一个交点。

#fig("7·5", fig-7-5())[]

注意从 0 到 $pi$ 的一个区间，在这个区间内，满足 $cos x = 1/2$ 的 $x$ 的值是 $pi/3$。我们把 $x$ 的这个值写作 $arccos 1/2$。换句话说，$arccos 1/2$ 是从 0 到 $pi$ 的一个角，它的余弦等于 $1/2$。

一般地说，当 $cos x = m med (|m| <= 1)$ 时，从 0 到 $pi$ 的 $x$ 的值叫作 $m$ 的*反余弦*，用 $arccos m$ 来表示。这就是说，$arccos m$（$|m| <= 1$）表示从 0 到 $pi$ 的一个角，它的余弦等于 $m$。用式子来表示，就是

$ cos(arccos m) = m, quad 0 <= arccos m <= pi med (|m| <= 1). $

// p.251
#ex("例")[求下列反余弦的值：

#cols[(1) $arccos 3/4$；][(2) $arccos 0$；]
#cols[(3) $arccos(-1/2)$；][(4) $arccos(-0.1543)$。]]

#sol[(1) 查表得 $cos 41°25' = 0.7500 = 3/4$。所以从 $0°$ 到 $180°$ 之间，余弦等于 $3/4$ 的角是 $41°25'$。因此，

$ arccos 3/4 = 41°25'. $

(2) 从 0 到 $pi$ 余弦等于 0 的角是 $pi/2$。因此，

$ arccos 0 = pi/2 ju $

(3) 余弦等于 $1/2$ 的锐角是 $pi/3$。因为 $cos(pi - pi/3) = -cos pi/3 = -1/2$，所以从 0 到 $pi$ 余弦等于 $-1/2$ 的角是 $pi - pi/3$，就是 $(2pi)/3$。因此，

$ arccos(-1/2) = (2pi)/3 ju $

(4) 查表得 $cos 81°6' = 0.1543$。因为 $cos(180° - 81°6') = -cos 81°6' = -0.1543$，所以从 $0°$ 到 $180°$ 余弦等于 $-0.1543$ 的角是 $180° - 81°6'$，就是 $98°54'$。因此，

$ arccos(-0.1543) = 98°54'. $
]

因为余弦函数 $y = cos x$ 中当 $y$ 取从 $-1$ 到 $+1$ 的某一个值 $m$ 的时候，在 $[0, pi]$ 这个区间内，$x$ 有确定的值，并且这个值可以记作 $arccos m$（图 7·6），所以对于 $y$ 的每一个从 $-1$ 到/* p.252 */ $+1$ 的值，在 $[0, pi]$ 这个区间内，都有

$ x = arccos y, $

#grid(columns: (1fr, 1fr), align: bottom,
  fig("7·6", fig-7-6())[],
  fig("7·7", fig-7-7())[])

这就是说，$x = arccos y$ 是余弦函数 $y = cos x$ 在 $[0, pi]$ 这个区间内的反函数。我们把它叫作*反余弦函数*。它的定义域是

$ -1 <= y <= 1, $

它的函数值的范围是

$ 0 <= x <= pi ju $

如果自变量用 $x$ 来表示，函数用 $y$ 来表示，那么反余弦函数可以写成

$ y = arccos x ju $

这里，$y$ 是余弦等于 $x$ 并且在 $[0, pi]$ 这个区间内的角，就是

$ x = cos y med (0 <= y <= pi). $

因此，要作 $y = arccos x$ 的图像，只要作 $x = cos y$ 从 0 到 $pi$ 的一段图像就可以了（图 7·7）。

// p.253
#exercise("7·3")[
  1. 求下列反余弦的值：
    #cols[(1) $arccos sqrt(2)/2$；][(2) $arccos 0.5125$；]
    #cols[(3) $arccos(-0.8617)$；][(4) $arccos(-sqrt(2)/2)$。]
  2. 用反余弦表示满足下列各式的角 $x$ $(0 <= x <= pi)$：
    #cols[(1) $cos x = 1/3$；][(2) $cos x = 0.3179$；]
    #cols[(3) $cos x = -sqrt(2)/4$；][(4) $3 cos x = -2$；]
    (5) $cos x = (2 a b) / (a^2 + b^2)$。
  3. 写出下列各式的值：
    #cols[(1) $cos(arccos 0.7717)$；][(2) $cos(arccos 12/13)$；]
    #cols[(3) $cos(arccos 1)$；][(4) $cos[arccos(-sqrt(2)/3)]$；]
    (5) $cos[arccos(-0.5)]$。
  4. 计算下列各式的值：\
    (1) $3 arccos(-sqrt(2)/2)$；\
    (2) $arccos 0.2157 + arccos(-0.2157)$；
    #cols[(3) $-arccos(-1/2)$；][(4) $pi - arccos(-1)$；]
    (5) $pi/2 + arccos 0$。
  5. 求下列各式的值：
    #cols[(1) $arcsin 1 + arccos 1$；][(2) $arcsin(-1) + arccos 0$；]
    (3) $2 arcsin(-sqrt(2)/2) + arccos(-1)$；\
    (4) $arcsin(-1/2) + arccos sqrt(3)/2$。
  6. /* p.254 */证明下列各等式：
    #cols[(1) $arcsin(sin 2/3 pi) = pi/3$；][(2) $arccos(cos (9pi)/4) = pi/4$；]
    (3) $4 arcsin sqrt(2)/2 = 3 arccos 1/2$。
  7. $arccos 2$ 有没有意义？为什么？
  8. $a$ 在什么区间内，$arccos(1 - a)$ 才有意义？
  9. 写出下列各函数的定义域和函数值的范围：
    #cols[(1) $y = arccos x/3$；][(2) $y = 2 arccos sqrt(x - 1)$；]
    (3) $y = 1/3 arccos(-x^2)$。
  10. 作出 $y = 2 arccos x/2$ 的图像。
  11. 作出 $y = -arccos x$ 的图像，并与 $y = arccos(-x)$ 的图像作比较，它们有什么区别？
]

== 反正切

当 $tan x$ 等于某一个已知数 $m$ 的时候，对应的 $x$ 的值也有无数个。从正切函数 $y = tan x$ 的图像上可以看到，和 $x$ 轴平行的任意一条直线 $y = m$ 与 $y = tan x$ 的图像相交于无数个点（图 7·8）。

但是在正切函数的每一个单调区间，例如 $(-(3pi)/2, -pi/2)$，$(-pi/2, pi/2)$，$(pi/2, (3pi)/2)$ 内，直线 $y = m$ 与 $y = tan x$ 的图像都只相交一次。所以在正切函数的每一个单调区间内，满足 $tan x = m$ 的 $x$ 有唯一确定的值。我们把满足 $tan x = m$ 并且在 $(-pi/2, pi/2)$ 这个区间内的 $x$ 的值叫作 $m$ 的*反正切*，用 $arctan m$ 来表示。换句话说，$arctan m$ 是正切等于 $m$ 并且在/* p.255 */ $-pi/2$ 和 $pi/2$ 间的一个角。用式子来表示，就是

$ tan(arctan m) = m, quad -pi/2 < arctan m < pi/2 ju $

#fig("7·8", fig-7-8())[]

#ex("例")[求下列反正切的值：

#cols[(1) $arctan 1$；][(2) $arctan 3.471$；]
(3) $arctan(-0.5348)$。]

#sol[(1) 在 $-pi/2$ 和 $pi/2$ 间，正切等于 1 的角是 $pi/4$。因此，

$ arctan 1 = pi/4 ju $

(2) 查表得 $tan 73°56' = 3.471$。所以在 $-90°$ 和 $90°$ 之间，正切等于 3.471 的角是 $73°56'$。因此，

$ arctan 3.471 = 73°56'. $

(3) 查表得 $tan 28°8' = 0.5348$。因为 $tan(-28°8') = -tan 28°8' = -0.5348$，所以在 $-90°$ 和 $90°$ 之间正切等于/* p.256 */ $-0.5348$ 的角是 $-28°8'$。因此，

$ arctan(-0.5348) = -28°8'. $
]

因为正切函数 $y = tan x$ 取某一个值 $m$ 的时候，在 $(-pi/2, pi/2)$ 这个区间内，$x$ 有确定的值，并且这个值可以记作 $arctan m$（图 7·9），所以对于 $y$ 的任何一个值，在 $(-pi/2, pi/2)$ 这个区间内，

$ x = arctan y ju $

因此，$x = arctan y$ 是正切函数 $y = tan x$ 在 $(-pi/2, pi/2)$ 区间内的反函数。我们把它叫作*反正切函数*。它的定义域是一切实数，也就是

$ -oo < y < oo, $

它的函数值的范围是

$ -pi/2 < x < pi/2 ju $

#fig("7·9", fig-7-9())[]

// p.257
#fig("7·10", fig-7-10())[]

如果自变量用 $x$ 来表示，函数用 $y$ 来表示，那么反正切函数可以写成

$ y = arctan x ju $

这里，$y$ 是正切等于 $x$ 并且在 $(-pi/2, pi/2)$ 区间内的角，就是

$ x = tan y med (-pi/2 < y < pi/2). $

因此，要作 $y = arctan x$ 的图像，只要作 $x = tan y$ 在 $-pi/2$ 和 $pi/2$ 间的一段图像就可以了（图 7·10）。

#exercise("7·4")[
  1. 求下列反正切的值：
    #cols[(1) $arctan sqrt(3)$；][(2) $arctan(-sqrt(3)/3)$；]
    #cols[(3) $arctan(-1)$；][(4) $arctan 0$；]
    #cols[(5) $arctan 2.134$；][(6) $arctan(-0.9752)$。]
  2. 用反正切表示满足下列各式的角 $x$ $(-pi/2 < x < pi/2)$：
    #cols[/* p.258 */(1) $tan x = 7/5$；][(2) $tan x = sqrt(2)$；]
    #cols[(3) $tan x = -pi$；][(4) $a tan x = b$；]
    (5) $tan x = -(a + b) / (sqrt(a) + sqrt(b))$。
  3. 写出下列各式的值：
    #cols[(1) $tan(arctan 1.412)$；][(2) $tan(arctan sqrt(5)/2)$；]
    #cols[(3) $tan[arctan(-2)]$；][(4) $tan[arctan(-1.142)]$；]
    (5) $tan(arctan (2a)/b)$。
  4. 计算下列各式的值：
    #cols[(1) $3 arctan 1/sqrt(3)$；][(2) $2 arctan 1 + arccos 0$；]
    (3) $arccos 1 + 2 arcsin 1/2 + arctan(-sqrt(3))$；\
    (4) $arctan 0.8195 + arctan(-0.8195)$；\
    (5) $3 arctan(-1) + (3pi)/4$。
  5. 在 $△A B C$ 中，已知三边为 $a, b, c$。试用反正切表示 $A/2$，$B/2$，$C/2$。
  6. 证明下列各等式：
    #cols[(1) $arctan(tan (3pi)/4) = -pi/4$；][(2) $arctan(tan (7pi)/6) = pi/6$；]
    (3) $arctan(tan (2pi)/3) = 2 arcsin(-1/2)$；\
    (4) $arctan(tan (7pi)/4) = arcsin(sin (5pi)/4)$。
  7. 求下列各函数的定义域：
    #cols[(1) $y = arctan sqrt(x - 5)$；][(2) $y = arctan 1/(x - 1)$；]
    (3) $y = arcsin 2/x + arctan 2/x$。
  8. \*$y = abs(arctan x)$ 的图像和 $y = arctan abs(x)$ 的图像有区别吗？为什么？
]

// p.259
== 反余切

当 $cot x$ 等于某一个值 $m$ 的时候，$x$ 也有无数个值和它对应（图 7·11）。

#fig("7·11", fig-7-11())[]

但是在余切函数的每一个单调区间 $dots.c$，$(-pi, 0)$，$(0, pi)$，$(pi, 2pi)$，$dots.c$ 内，对于 $cot x$ 的每一个值，$x$ 都只有一个确定的值和它对应。我们把满足 $cot x = m$ 并且在 $(0, pi)$ 这个区间内的 $x$ 的值叫作 $m$ 的*反余切*，用 $arccot m$ 来表示。换句话说，$arccot m$ 是余切等于 $m$ 并且在 0 和 $pi$ 间的一个角。用式子来表示，就是

$ cot(arccot m) = m, quad 0 < arccot m < pi ju $

#ex("例")[求下列反余切的值：

#cols[(1) $arccot 0.5820$；][(2) $arccot(-2.835)$。]]

#sol[(1) 查表得 $cot 59°48' = 0.5820$。所以在 $0°$ 和 $180°$ 之间，余切等于 0.5820 的角是 $59°48'$。因此，

// p.260
$ arccot 0.5820 = 59°48'. $

(2) 查表得 $cot 19°26' = 2.835$。因为 $cot(180° - 19°26') = -cot 19°26' = -2.835$，所以在 $0°$ 和 $180°$ 之间，余切等于 $-2.835$ 的角是 $180° - 19°26' = 160°34'$。因此，

$ arccot(-2.835) = 160°34'. $
]

因为在 $(0, pi)$ 这个区间内，函数 $y = cot x$ 取某一个值 $m$ 的时候，$x$ 有确定的值 $arccot m$ 和它对应（图 7·12），所以

$ x = arccot y $

是余切函数 $y = cot x$ 在 $(0, pi)$ 这个区间内的反函数。我们把它叫作*反余切函数*。它的定义域是

$ -oo < y < oo, $

它的函数值的范围是

$ 0 < x < pi ju $

#grid(columns: (1fr, 1.4fr), align: bottom,
  fig("7·12", fig-7-12())[],
  fig("7·13", fig-7-13())[])

如果自变量用 $x$ 来表/* p.261 */示，函数用 $y$ 来表示，那么反余切函数可以写成

$ y = arccot x ju $

要作 $y = arccot x$ 的图像，只要作 $x = cot y$ 在 0 和 $pi$ 间的一段图像就可以了（图 7·13）。

#exercise("7·5")[
  1. 求下列反余切的值：
    #cols[(1) $arccot sqrt(3)$；][(2) $arccot(-1)$；]
    #cols[(3) $arccot 0$；][(4) $arccot 0.8215$；]
    #cols[(5) $arccot(-1.956)$；][(6) $arccot(-sqrt(3)/3)$。]
  2. 用反余切表示满足下列各等式的角 $x$ $(0 < x < pi)$：
    #cols[(1) $cot x = sqrt(5)/7$；][(2) $3 cot x + 1 = 0$；]
    #cols[(3) $cot(x + pi/3) = 1/5$；][(4) $cot(2x + pi/4) = -sqrt(2)$；]
    (5) $tan(pi/2 - x/2) - 2/3 = 0$。
  3. 计算下列各式的值：
    #cols[(1) $2 arccos 0 + arccot 0$；][(2) $arctan 0 + arccot 0$；]
    (3) $arctan(-1) + arccot(-1)$；\
    (4) $arctan sqrt(3) + arccot(-sqrt(3))$；\
    (5) $arctan(-1/sqrt(3)) + arccot 1/sqrt(3)$。
  4. 证明下列各等式：
    #cols[(1) $2 arccot 1 = 3 arccos sqrt(3)/2$；][(2) $3 arctan sqrt(3) = 4 arccot 1$；]
    (3) $arccot(cot (7pi)/4) = 3 arctan(tan (5pi)/4)$；\
    (4) $arccos(cos 9pi) = arccot(cot (2pi)/3) - arctan(tan (2pi)/3)$。
  5. 求下列各式的值：\
    (1) $arcsin 0.5125 + arccos 0.5125$；\
    /* p.262 */(2) $arcsin(-0.5125) + arccos(-0.5125)$；\
    (3) $arctan 0.5125 + arccot 0.5125$；\
    (4) $arctan(-0.5125) + arccot(-0.5125)$。
  6. 角 $2 arctan m$ 和 $2 arccot m$ 可以在什么范围内？
  7. 下列各式，哪些有值？并求出值来。哪些不存在？
    #cols[(1) $tan(arctan 1.3)$；][(2) $tan(arcsin 1)$；]
    #cols[(3) $tan[arcsin(-sqrt(2)/2)]$；][(4) $cot[arccos(-1)]$；]
    (5) $cot(arctan 0)$。
  8. $m$ 等于什么值时，$arcsin m = arccos m$ 和 $arctan m = arccot m$？
  9. 求下列各函数的定义域：
    #cols[(1) $y = arccot 1/sqrt(x)$；][(2) $y = sqrt(arccot sqrt(x))$。]
  10. \*作出 $y = arccot abs(x)$ 的图像和 $y = abs(arccot x)$ 的图像，它们是否一样？为什么？
]

== 反三角函数的三角运算

我们把反正弦函数，反余弦函数，反正切函数和反余切函数总起来叫作*反三角函数*。它们都表示某一个区间内的角。求角的三角函数，通常叫作*三角运算*。所以反三角函数的三角运算指的就是求出用反正弦，反余弦，反正切和反余切所表示的角的三角函数。

根据反正弦，反余弦，反正切，反余切的定义，我们知道

$ sin(arcsin m) &= m quad (|m| <= 1) fen \
  cos(arccos m) &= m quad (|m| <= 1) fen \
  tan(arctan m) &= m fen \
  cot(arccot m) &= m ju $

现在我们要研究的是怎样求反三角函数的其他三角函/* p.263 */数。下面我们用例子来说明：

#ex("例 1.")[求 $sin[arctan(-sqrt(3))]$ 的值。]

#sol[因为正切等于 $sqrt(3)$ 的锐角是 $60°$，在 $-90°$ 和 $90°$ 之间，正切等于 $-sqrt(3)$ 的角是 $-60°$，所以

$ sin[arctan(-sqrt(3))] &= sin(-60°) = -sin 60° \
  &= -sqrt(3)/2 ju $
]

#ex("例 2.")[求 $cos(arcsin 8/17)$ 的值。]

#sol[设 $arcsin 8/17 = alpha med (-pi/2 <= alpha <= pi/2)$，那么

$ sin alpha = sin(arcsin 8/17) = 8/17 ju $

因为 $sin alpha$ 的值是正的，所以 $alpha$ 的终边在第一象限内，它的余弦的值是正的。

$ therefore quad cos alpha = sqrt(1 - sin^2 alpha) = sqrt(1 - (8/17)^2) = 15/17 ju $

#c7-lead([就是], $ cos(arcsin 8/17) = 15/17 ju $)
]

#ex("例 3.")[求 $tan[arccos(-0.8)]$ 的值。]

#sol[设 $arccos(-0.8) = alpha med (0 <= alpha <= pi)$，那么

$ cos alpha = -0.8. $

因为 $cos alpha$ 的值是负的，所以 $alpha$ 的终边在第二象限内。

$ therefore quad sin alpha = sqrt(1 - cos^2 alpha) = sqrt(1 - (-0.8)^2) = 0.6. \
  tan alpha = (sin alpha) / (cos alpha) = 0.6 / (-0.8) = -0.75. $

#c7-lead([就是], $ tan[arccos(-0.8)] = -0.75. $)
]

// p.264
#ex("例 4.")[求 $sin(arcsin 1/sqrt(82) + arcsin 4/sqrt(41))$ 的值。]

#sol[设 $arcsin 1/sqrt(82) = alpha$，那么

$ sin alpha = 1/sqrt(82), \
  cos alpha = sqrt(1 - sin^2 alpha) = sqrt(1 - (1/sqrt(82))^2) = 9/sqrt(82) ju $

又设 $arcsin 4/sqrt(41) = beta$，那么

$ sin beta = 4/sqrt(41), \
  cos beta = sqrt(1 - sin^2 beta) = sqrt(1 - (4/sqrt(41))^2) = 5/sqrt(41) ju $

$ therefore quad sin(alpha + beta) &= sin alpha cos beta + cos alpha sin beta \
  &= 1/sqrt(82) dot 5/sqrt(41) + 9/sqrt(82) dot 4/sqrt(41) = 41/(sqrt(82) dot sqrt(41)) \
  &= 1/sqrt(2) = sqrt(2)/2 ju $

#c7-lead([就是], $ sin(arcsin 1/sqrt(82) + arcsin 4/sqrt(41)) = sqrt(2)/2 ju $)
]

#ex("例 5.")[求 $tan(2 arctan a)$ 的值。]

#sol[设 $arctan a = alpha$，那么

$ tan alpha = a. \
  tan 2 alpha = (2 tan alpha) / (1 - tan^2 alpha) = (2a) / (1 - a^2) ju $

#c7-lead([就是], $ tan(2 arctan a) = (2a) / (1 - a^2) ju $)
]

// p.265
#exercise("7·6")[
  1. 求下列各式的值：
    #cols[(1) $cos(arcsin sqrt(3)/2)$；][(2) $tan[arccos(-sqrt(3)/2)]$；]
    (3) $cos[2 arcsin(-sqrt(2)/2)]$；\
    (4) $sin(arcsin 1/2 + arccos 1/2)$；\
    (5) $sin(1/2 arccos sqrt(3)/2)$。
  2. 证明下列各等式：
    #cols[(1) $sin(arccos 12/13) = 5/13$；][(2) $tan(arccos 8/17) = 15/8$；]
    (3) $tan(arctan 1/sqrt(2) + arctan 1/sqrt(3)) = (sqrt(3) + sqrt(2)) / (sqrt(6) - 1)$；
    #cols[(4) $sin(2 arcsin 3/5) = 24/25$；][(5) $cot(2 arccot a) = (a^2 - 1) / (2a)$。]
  3. \*矩形的面积等于 $S$，它的最大的边等于 $a$，求两对角线所夹的锐角的正切。

    ［提示：先用反正切表示这个锐角的一半，再取它的二倍角的正切。］
  4. 计算 $tan(arctan m/n - arctan (m - n)/(m + n))$ 的值。
  5. 计算 $cos(arccos 4/5 + arccos 12/13)$ 的值。
  6. \*计算 $cos(arcsin 4/5 + arcsin 5/13 + arcsin 16/65)$ 的值。
  7. \*计算 $cot[2(arcsin sqrt(2)/2 + arccot sqrt(3))]$ 的值。
  8. 求证 $tan(arctan (a - b)/(1 + a b) + arctan (b - c)/(1 + b c) + arctan c) = a$。
]

// p.266
== 反三角函数间的基本关系

反三角函数间的基本关系可以分为下面两类：

*1. $bold(m)$ 和 $bold(-m)$ 的反三角函数间的关系*

在 §7·2 的例题中，我们看到：$arcsin(-sqrt(3)/2) = -pi/3$。但是 $arcsin sqrt(3)/2 = pi/3$。所以

$ arcsin(-sqrt(3)/2) = -arcsin sqrt(3)/2 ju $

在 §7·3 的例题中，我们看到：$arccos(-1/2) = pi - pi/3$。但 $arccos 1/2 = pi/3$。所以

$ arccos(-1/2) = pi - arccos 1/2 ju $

现在我们来证明一般的公式：

#c7-eqs(
  ($arcsin(-m) = -arcsin m fen$, [(1)]),
  ($arccos(-m) = pi - arccos m fen$, [(2)]),
  ($arctan(-m) = -arctan m fen$, [(3)]),
  ($arccot(-m) = pi - arccot m ju$, [(4)]),
)

公式 (1) 的证明可以分为两步：

1) 先证明等式两边的角有同一个正弦值。

根据反正弦的定义，得

$ sin[arcsin(-m)] = -m ju $

利用诱导公式，得

$ sin(-arcsin m) = -sin(arcsin m) = -m ju $

这就是说，在公式 (1) 中，两边的角的正弦都等于 $-m$。

2) 其次，证明等式两边的角都在 $[-pi/2, pi/2]$ 这个区间内。

根据反正弦的定义，知道

// p.267
$ -pi/2 <= arcsin(-m) <= pi/2 ju $

#c7-lead([同样，], $ -pi/2 <= arcsin m <= pi/2 ju $)

用 $-1$ 乘第二个不等式的每一项，不等号都要改变方向，所以得

$ pi/2 >= -arcsin m >= -pi/2, $

#c7-lead([就是], $ -pi/2 <= -arcsin m <= pi/2 ju $)

因此，$arcsin(-m)$ 和 $-arcsin m$ 都在 $[-pi/2, pi/2]$ 这个区间内。

但在 $[-pi/2, pi/2]$ 这个区间内，正弦等于 $-m$ 的角只有一个。这就证明了

$ arcsin(-m) = -arcsin m ju $

用同样的方法可以证明公式 (3)。

现在我们来证明公式 (2)。证明也分为两步：

1) 根据反余弦的定义，得

$ cos[arccos(-m)] = -m ju $

利用诱导公式，得

$ cos(pi - arccos m) = -cos(arccos m) = -m ju $

所以公式 (2) 的两边的角的余弦都等于 $-m$。

2) 根据反余弦的定义，

$ 0 <= arccos(-m) <= pi, $

#c7-lead([同样，], $ 0 <= arccos m <= pi ju $)

从 $pi$ 分别减去第二个不等式的每一项。根据“等量减去不等量，减去较大的量，所得的差反而小”的性质，可以知道，

$ pi - 0 >= pi - arccos m >= pi - pi, $

#c7-lead([就是], $ 0 <= pi - arccos m <= pi ju $)

因此，公式 (2) 两边的角都在 $[0, pi]$ 这个区间内。

但在 $[0, pi]$ 这个区间内，余弦等于 $-m$ 的角只有一个。所以

$ arccos(-m) = pi - arccos m ju $

用同样的方法可以证明公式 (4)。

// p.268
*2. 同一个自变量的反三角函数间的关系*

我们先来看这样一个例子：$arcsin 1/2 = 30°$，$arccos 1/2 = 60°$，所以，

$ arcsin 1/2 + arccos 1/2 = 90° ju $

一般地说，我们可以证明

#c7-eqs(
  ($arcsin m + arccos m = pi/2 fen$, [(5)]),
  ($arctan m + arccot m = pi/2 ju$, [(6)]),
)

为了证明公式 (5)，我们只要证明

$ arcsin m = pi/2 - arccos m $

就可以了。

1) 根据反正弦的定义，

$ sin(arcsin m) = m ju $

利用诱导公式，得

$ sin(pi/2 - arccos m) = cos(arccos m) = m ju $

#c7-lead([所以], $ sin(arcsin m) = sin(pi/2 - arccos m) ju $)

2) 根据反正弦的定义，

$ -pi/2 <= arcsin m <= pi/2 ju $

根据反余弦的定义，

$ 0 <= arccos m <= pi ju $

#c7-lead([因此], $ pi/2 - 0 >= pi/2 - arccos m >= pi/2 - pi, $)

#c7-lead([就是], $ -pi/2 <= pi/2 - arccos m <= pi/2 ju $)

所以 $arcsin m$ 和 $pi/2 - arccos m$ 都在 $[-pi/2, pi/2]$ 这个区间内。

但是在 $[-pi/2, pi/2]$ 这个区间内正弦等于 $m$ 的角只有一个。因此

// p.269
$ arcsin m = pi/2 - arccos m, $

移项，就得到

$ arcsin m + arccos m = pi/2 ju $

用同样的方法可以证明公式 (6)。

从上面所讲的可以看到，证明反三角函数间的关系一般分为两步：第一步证明等式两边的角的某一个同名三角函数值相等；第二步证明两个角在同一个区间内。如果在这个区间内，对应于已知的三角函数值的角只有一个，那么，就可以知道等式两边的角是相等的。

#ex("例")[证明 $arctan 1/2 + arctan 1/3 = pi/4$。]

#sol(label: [证])[1) $tan(arctan 1/2 + arctan 1/3)$

$ = (tan(arctan 1/2) + tan(arctan 1/3)) / (1 - tan(arctan 1/2) tan(arctan 1/3)) = (1/2 + 1/3) / (1 - 1/2 dot 1/3) = 1. $

$ tan pi/4 = 1. $

$ therefore quad tan(arctan 1/2 + arctan 1/3) = tan pi/4 ju $

2)

$ 0 < arctan 1/2 < pi/4, \ 0 < arctan 1/3 < pi/4 ju \ therefore quad 0 < arctan 1/2 + arctan 1/3 < pi/2 ju $

#c7-lead([同时], $ 0 < pi/4 < pi/2 ju $)

所以 $arctan 1/2 + arctan 1/3$ 和 $pi/4$ 都在 $(0, pi/2)$ 这个区间内。

但是在 $(0, pi/2)$ 这个区间内，正切等于 1 的角只有一个。因此，

$ arctan 1/2 + arctan 1/3 = pi/4 ju $
]

// p.270
#exercise("7·7")[
  1. 求下列各式的值：
    #cols[(1) $arcsin m + arcsin(-m)$；][(2) $arccos m + arccos(-m)$。]
  2. 证明下列各等式：\
    (1) $sin(2 arcsin m) = 2m sqrt(1 - m^2)$；\
    (2) $tan(arcsin m) dot cos(arcsin m) = m$；
    #cols[(3) $cos(2 arccos m) = 2m^2 - 1$；][(4) $sin(2 arctan m) = (2m) / (1 + m^2)$。]
  3. 求证 $arctan n + arccot(n + 1) = arctan(n^2 + n + 1)$。
  4. 设 $arctan a + arctan b + arctan c = pi$，求证 $a + b + c = a b c$。
  5. 求证 $2 arctan a = arccos (1 - a^2)/(1 + a^2) med (a >= 0)$。
  6. 求证 $arccot 3/4 + arccot 1/7 = (3pi)/4$。
  7. 求证 $cos(1/2 arccos m) = sqrt((1 + m)/2)$。
  8. 求证 $arcsin 1/sqrt(5) + arccot 3 = pi/4$。
  9. 求证 $arcsin 3/5 - arccos 12/13 = arcsin 16/65$。
]

#summary[
  *1. 反三角函数的概念*

  #c7-vtab(
    ([函#h(1em)数], [定#h(1em)义], [定义域], [函数值域]),
    ($y = arcsin x$, $sin(arcsin x) = x$, $-1 <= x <= 1$, $-pi/2 <= y <= pi/2$),
    ($y = arccos x$, $cos(arccos x) = x$, $-1 <= x <= 1$, $0 <= y <= pi$),
    ($y = arctan x$, $tan(arctan x) = x$, $-oo < x < +oo$, $-pi/2 < y < pi/2$),
    ($y = arccot x$, $cot(arccot x) = x$, $-oo < x < +oo$, $0 < y < pi$),
    first: auto,
  )

  // p.271
  *2. 反三角函数间的关系*

  (1) 第一类关系：

  1) $arcsin(-x) = -arcsin x$；\
  2) $arccos(-x) = pi - arccos x$；\
  3) $arctan(-x) = -arctan x$；\
  4) $arccot(-x) = pi - arccot x$。

  (2) 第二类关系：

  1) $arcsin x + arccos x = pi/2$；\
  2) $arctan x + arccot x = pi/2$。

  *3. 证明反三角函数恒等式的一般步骤*

  (1) 证明等式两边的角的某一同名三角函数值相等；\
  (2) 证明两边的角同在某一个区间内。
]

#review(title: [复习题七])[
  1. 计算下列各式的值：
    #cols[(1) $tan(1/2 arctan 2)$；][(2) $cos(2 arctan 1/2)$；]
    #cols[(3) $sin(1/2 arcsin 3/5)$；][(4) $cos(arccos 3/5 + arccos 4/5)$。]
  2. 菱形的周长等于 $p$，它的较小的对角线等于 $d$，求菱形的锐角。
  3. 三角形的三边为 $a$，$b$ 和 $c$，求角 $C$。
  4. 求证 $arccos 4/5 + arctan 3/5 = arctan 27/11$。
  5. 求证 $2 arctan 2/3 = arctan 12/5$。
  6. 求证 $arcsin 3/5 + arcsin 8/17 = arcsin 77/85$。
  7. \*试证 $tan(arctan x + arctan 1/x)$ 不存在。
  8. \*试证 $3 arcsin x = arcsin(3x - 4x^3)$。
  9. 求证 $arcsin 4/5 + arcsin 5/13 + arcsin 16/65 = pi/2$。
  10. /* p.272 */求证 $arctan 1/3 + arctan 1/5 + arctan 1/7 + arctan 1/8 = pi/4$。
  11. 求下列各式的值：\
    (1) $arctan 1/2 + arctan 1/3 + arctan(-1)$；\
    (2) $tan 1/2 (arcsin 3/5 - arccos 63/65)$。
  12. 求满足下列各等式的 $x$：\
    (1) $arcsin(-4/5) = -arccos x$；\
    (2) $arctan sqrt(3) = arccot x$；\
    (3) $arctan(-1/sqrt(3)) = -arccot x$。
  13. 已知 $arcsin x = arcsin 2x$，求 $x$。
  14. \*求满足等式 $arctan (x - 1)/(x + 2) + arctan (x + 1)/(x + 2) = pi/4$ 的 $x$。
  15. \*求满足等式 $arcsin x + arcsin 2x = pi/3$ 的 $x$。
  16. \*已知 $arccos x + arccos y + arccos z = pi$，求证 $x^2 + y^2 + z^2 + 2 x y z = 1$。
  17. \*求证
    $ arctan sqrt((a(a + b + c)) / (b c)) + arctan sqrt((b(a + b + c)) / (c a)) \
      + arctan sqrt((c(a + b + c)) / (a b)) = pi ju $
  18. \*求证
    $ tan(pi/4 + 1/2 arccos a/b) + tan(pi/4 - 1/2 arccos a/b) = (2b)/a ju $
]
