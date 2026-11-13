// 第 9 章（续）*§9·5 数列的极限、*§9·6 无穷递缩等比数列（原书 p.333–349）
// （p.333 页首是 §9·4 习题的尾部，不在本文件；*§9·5 标题在 p.333 中部；
//  *§9·7 标题在 p.349 中部，从该标题起不在本文件，习题 9·6 的第 6 题录到 p.349 页首。）
#import "/common/series.typ": *
// 局部：极限记号在分式里也把 n→∞ 排在下方（与原书一致）
#let Lim = math.limits(math.op("lim"))
#import "/books/algebra-3/figures/fig9D-seq.typ": fig-9-7, fig-9-8, fig-9-9, fig-9-10, fig-9-11, fig-9-12, fig-9-13, fig-9-14, fig-q5

// 局部：带左侧引导词的居中公式，如“就是 2, 2, 2, …”“的极限 lim …”
#let lead(word, body) = block(width: 100%, above: 0.9em, below: 0.9em, grid(
  columns: (auto, 1fr), column-gutter: 1em, align: (left + horizon, center + horizon), [#word], body))

// 局部：左侧文字右对齐、右侧公式左对齐的两列罗列（如“当 n=1 的时候，|a₁−1|=…”）；none 画一行点线
#let lst(..rows) = {
  let cells = ()
  for r in rows.pos() {
    if r == none {
      cells.push(grid.cell(colspan: 2, align: center, box(width: 70%, repeat[.#h(0.25em)])))
    } else {
      cells.push(r.at(0))
      cells.push(r.at(1))
    }
  }
  align(center, block(breakable: false, above: 0.9em, below: 0.9em, grid(
    columns: 2, column-gutter: 1.2em, row-gutter: 0.9em,
    align: (right + horizon, left + horizon), ..cells)))
}

// p.333
#heading(level: 2, numbering: star-heading-numbering)[数列的极限]

*1. 数列的极限的意义* 我们来看下面这些数列的特征：

(1) 数列 $0, 1 / 2, 2 / 3, 3 / 4, dots, (n - 1) / n, dots$。

这个数列的图像如图 9·7 所示。

#fig("9·7", fig-9-7())[]

从图上可以看出，随着 $n$ 的增大，表示一对实数 $(n, a_n)$ 的点就逐渐向直线 $a_n = 1$ 接近，但是这些点始终在直线 $a_n = 1$ 的下方。

通过计算可以知道，随着 $n$ 的增大，差 $a_n - 1$ 的绝对值就/* p.334 */逐渐减小，例如

#lst(
  ([当 $n = 1$ 的时候，], $abs(a_1 - 1) = abs(0 - 1) = 1 dou$),
  ([$n = 2$ 的时候，], $abs(a_2 - 1) = abs(1 / 2 - 1) = 1 / 2 dou$),
  none,
  ([$n = 6$ 的时候，], $abs(a_6 - 1) = abs(5 / 6 - 1) = 1 / 6 dou$),
  none,
  ([$n = 100$ 的时候，], $abs(a_100 - 1) = abs(99 / 100 - 1) = 1 / 100 ju$),
)

进一步，我们发现：不管我们事先指定一个怎样小的正数 $epsilon$，总能够找到这个数列的某一项 $a_N$，使在这一项以后，数列的各项 $a_n$ 与常数 1 的差的绝对值都小于 $epsilon$。就是，当 $n > N$ 时，总有

$ abs(a_n - 1) < epsilon ju $

例如，如果我们事先给定了一个很小的正数 $1 / 100$，那么从第 101 项起，数列的各项与 1 的差的绝对值就都小于 $1 / 100$。

再如，如果我们事先给定了一个很小的正数 $1 / 1000$，从

$ abs(a_n - 1) = abs((n - 1) / n - 1) = 1 / n $

容易看到，只要 $n > 1000$，那么 $1 / n$ 就小于 $1 / 1000$。因此从第 1001 项起，数列的各项与 1 的差的绝对值就小于 $1 / 1000$。

我们把数列 (1) 的这一特征，简单地记作

#align(center)[当 $n -> infinity$ 的时候#footnote[记号“$infinity$”读作无穷大，它表示愈来愈大没有止境，而并不表示某一个定数。]，#h(2em)$abs(a_n - 1) -> 0$]

// p.335
（读作当 $n$ 趋向于无穷大的时候，差 $a_n - 1$ 的绝对值趋向于 0），并且说 1 是数列 (1) 的*极限*。

(2) 数列 $2, 3 / 2, 4 / 3, 5 / 4, dots, (n + 1) / n, dots$。

这个数列的图像如图 9·8 所示。

#fig("9·8", fig-9-8())[]

从这个图上可以看到，随着 $n$ 的增大，表示一对实数 $(n, a_n)$ 的点就逐渐向直线 $a_n = 1$ 接近，但是这些点始终在直线 $a_n = 1$ 的上方。

通过计算可以看到，随着 $n$ 的增大，差 $a_n - 1$ 的绝对值就逐渐减小，例如

#lst(
  ([当 $n = 1$ 的时候，], $abs(a_1 - 1) = abs(2 - 1) = 1 dou$),
  ([$n = 2$ 的时候，], $abs(a_2 - 1) = abs(3 / 2 - 1) = 1 / 2 dou$),
  ([$n = 3$ 的时候，], $abs(a_3 - 1) = abs(4 / 3 - 1) = 1 / 3 dou$),
  none,
  ([$n = 6$ 的时候，], $abs(a_6 - 1) = abs(7 / 6 - 1) = 1 / 6 dou$),
  // p.336
  none,
  ([$n = 100$ 的时候，], $abs(a_100 - 1) = abs(101 / 100 - 1) = 1 / 100 ju$),
)

进一步，我们发现：不管我们事前指定一个怎样小的正数 $epsilon$，总能找到这个数列的某一项 $a_N$，使在这一项以后，数列的各项 $a_n$ 与常数 1 的差的绝对值都小于 $epsilon$。就是，当 $n > N$ 时，总有

$ abs(a_n - 1) < epsilon ju $

例如，如果事先给定正数 $1 / 100$，那么数列从第 101 项起，各项与 1 的差的绝对值就小于 $1 / 100$ 等等。

我们把数列 (2) 的这一特征，记作

#align(center)[当 $n -> infinity$ 的时候，#h(2em)$abs(a_n - 1) -> 0 ju$]

并且说 1 是这个数列的极限。

(3) 数列 $1, -1 / 2, 1 / 3, -1 / 4, dots, (-1)^(n + 1) 1 / n, dots$。

这个数列的图像如图 9·9 所示。

#fig("9·9", fig-9-9())[]

从这个图上可以看到，随着 $n$ 的增大，表示一对实数/* p.337 */$(n, a_n)$ 的点就逐渐向直线 $a_n = 0$（$n$ 轴）接近，但是这些点，根据 $n$ 是奇数或者是偶数，时而在这条直线的上方，时而在这条直线的下方。

像上面的两个例子一样，从计算中可以看到：随着 $n$ 的逐渐增大，$abs(a_n - 0)$ 就逐渐减小；并且不管我们事先指定怎样小的一个正数 $epsilon$，总能找到数列的某一项 $a_N$，使在这一项以后，数列的各项 $a_n$ 与常数 0 的差的绝对值都小于 $epsilon$。就是当 $n > N$ 时，总有

$ abs(a_n - 0) < epsilon ju $

我们把数列 (3) 的这一特征，记作

#align(center)[当 $n -> infinity$ 的时候，#h(2em)$abs(a_n - 0) -> 0 ju$]

并且说 0 是这个数列的极限。

#definition[
一般地，对于无穷数列

$ a_1, a_2, a_3, dots, a_n, dots dou $

如果存在一个这样的数 $A$，不管我们事先指定怎样小的正数 $epsilon$，总能找到数列的某一项 $a_N$，使从这一项以后数列的各项 $a_n$ 与常数 $A$ 的差的绝对值都小于 $epsilon$。就是，当 $n > N$ 时，总有

$ abs(a_n - A) < epsilon ju $

那么就说 $A$ 是这个无穷数列的*极限*。
]

数列 $a_1, a_2, a_3, dots, a_n, dots$ 的极限是 $A$，又常简单地记作

#align(center)[$lim_(n -> infinity) a_n = A$#footnote[lim 是拉丁字“limes”的缩写，就是极限的意思。在研究数列极限时，lim 记号下的 $n -> infinity$ 也可省略不写。]。]

读作“当 $n$ 趋于 $infinity$ 时，$a_n$ 的极限等于 $A$”。

#note-small[用我们上面用过的记号，数列极限的上述意义，可以简单地说成：如果当 $n -> infinity$ 的时候，$abs(a_n - A) -> 0$，那么

$ lim_(n -> infinity) a_n = A ju $]

// p.338
#ex("例 1")[画出下面这个数列的图像，并且从图像上说明这些数列没有极限。

(1) 数列 $1, 2, 3, 4, 5, dots, n, dots$；

(2) 数列 $1, -1, 1, -1, dots, (-1)^(n + 1), dots$。]

#sol[这两个数列的图像如图 9·10 和图 9·11 所示。]

#fig("9·10", fig-9-10())[]

#fig("9·11", fig-9-11())[]

在第 1 个数列里，当 $n$ 愈来愈大的时候，$a_n = n$ 也愈来愈大，点 $(n, a_n)$ 并不向某一条平行于 $n$ 轴的直线接近，所以这个数列没有极限。

在第 2 个数列里，按照 $n$ 是奇数或者是偶数，$a_n = (-1)^(n + 1)$ 忽而是 1 忽而是 $-1$，点 $(n, a_n)$ 也并不向某一条平行于 $n$ 轴的固定直线接近，所以这个数列也没有极限。

#ex("例 2")[画出下面这两个数列的图像，并且从图像上说明这两个数列的极限都是 0。

(1) 数列 $1, 1 / 2, 1 / 3, 1 / 4, dots, 1 / n, dots$；

(2) 数列 $1 / 2, 1 / 4, 1 / 8, dots, (1 / 2)^n, dots$。]

#sol[这两个数列的图像如图 9·12 和图 9·13 所示。]

// p.339
#fig("9·12", fig-9-12())[]

#fig("9·13", fig-9-13())[]

对于数列 (1)，当 $n -> infinity$ 时，$1 / n -> 0$，就是 $abs(1 / n - 0) -> 0$，所以 $lim_(n -> infinity) 1 / n = 0$；

对于数列 (2)，当 $n -> infinity$ 时，$(1 / 2)^n -> 0$，就是 $abs((1 / 2)^n - 0) -> 0$，所以 $lim_(n -> infinity) (1 / 2)^n = 0$。

#note-small[用同样的方法，我们可以说明当 $abs(q) < 1$ 的时候，$lim_(n -> infinity) q^n = 0$。]

*2. 关于数列极限的一些定理* 在研究数列极限的时候，常常要用到下面这些定理，现在我们不加证明地加以采用#footnote[这些定理的证明，超出了本书的范围，以后在学习高等数学的时候，将会学到。]。

#rule(title: [定理])[
*定理 1.* 如果一个数列有极限，那么它只能有一个极限。
]

例如，由 §9·5 的 (2)，数列 $2, 3 / 2, 4 / 3, 5 / 4, dots, (n + 1) / n, dots$ 的极限只能是 1。

#rule(title: [定理])[
*定理 2.* 如果一个数列是递增有界数列，或者是递减有界数列，那么它一定有极限。
]

例如，上面讨论过的数列 (1) 是递增有界数列，因为各项/* p.340 */的值愈来愈大，但总不大于 1，所以它有一个极限。同样，上面讨论过的数列 (2) 是递减有界数列，因为各项的值，愈来愈小，但总不小于 1，所以它也有一个极限。

#attention[1. 不是所有有极限的数列都是递增有界数列或递减有界数列。例如上面讨论过的数列 (3) 既不是递增数列，也不是递减数列，但它却是一个有极限的数列。

2. 有极限的数列，一定是有界数列，但有界数列却不一定有极限，例如数列

$ 1, -1, 1, -1, dots, (-1)^(n + 1), dots $

是一个有界数列，但它却没有极限。]

#rule(title: [定理])[
*定理 3.* 如果两个数列都有极限，就是

$ lim_(n -> infinity) a_n = A dou quad quad lim_(n -> infinity) b_n = B dou $

那么，由这两个数列各对应项的和、差、积、商所组成的数列，也有极限，并且

$ lim_(n -> infinity) (a_n + b_n) &= lim_(n -> infinity) a_n + lim_(n -> infinity) b_n = A + B dou \
  lim_(n -> infinity) (a_n - b_n) &= lim_(n -> infinity) a_n - lim_(n -> infinity) b_n = A - B dou \
  lim_(n -> infinity) (a_n dot b_n) &= lim_(n -> infinity) a_n dot lim_(n -> infinity) b_n = A dot B dou \
  lim_(n -> infinity) a_n / b_n &= (Lim_(n -> infinity) a_n) / (Lim_(n -> infinity) b_n) = A / B dou quad "这里" B != 0 ju $
]

例如，数列

$ 0, 1 / 2, 2 / 3, 3 / 4, dots, (n - 1) / n, dots $

的极限是 1。

数列

$ 2 / 1, 3 / 2, 4 / 3, 5 / 4, dots, (n + 1) / n, dots $

的极限也是 1。

// p.341
以这两个数列各对应项的和作数列：

$ 0 + 2 / 1, quad 1 / 2 + 3 / 2, quad 2 / 3 + 4 / 3, quad 3 / 4 + 5 / 4, quad dots, quad (n - 1) / n + (n + 1) / n, quad dots $

#lead[就是][$2, 2, 2, 2, dots, 2, dots ju$]

很明显，它的极限是 2，也就是原来这两个数列的极限的和。

以这两个数列各对应项的差作数列：

$ 0 - 2 / 1, quad 1 / 2 - 3 / 2, quad 2 / 3 - 4 / 3, quad 3 / 4 - 5 / 4, quad dots, quad (n - 1) / n - (n + 1) / n, quad dots dou $

#lead[就是][$-2, -1, -2 / 3, -2 / 4, dots, -2 / n, dots ju$]

当 $n -> infinity$ 的时候，

$ abs(-2 / n - 0) = 2 / n -> 0 ju $

所以它的极限是 0，也就是原来这两个数列的极限的差。

以这两个数列各对应项的积作数列：

$ 0 dot 2 / 1, quad 1 / 2 dot 3 / 2, quad 2 / 3 dot 4 / 3, quad 3 / 4 dot 5 / 4, quad dots, quad (n - 1) / n dot (n + 1) / n, quad dots dou $

#lead[就是][$0, (2^2 - 1) / 2^2, (3^2 - 1) / 3^2, (4^2 - 1) / 4^2, dots, (n^2 - 1) / n^2, dots ju$]

当 $n -> infinity$ 的时候，

$ abs((n^2 - 1) / n^2 - 1) = 1 / n^2 -> 0 ju $

所以它的极限是 1，也就是原来这两个数列的极限的积。

以这两个数列各对应项的商作数列：

$ 0 / (2 / 1), quad (1 / 2) / (3 / 2), quad (2 / 3) / (4 / 3), quad (3 / 4) / (5 / 4), quad dots, quad ((n - 1) / n) / ((n + 1) / n), quad dots dou $

#lead[就是][$0, 1 / 3, 2 / 4, 3 / 5, dots, (n - 1) / (n + 1), dots ju$]

// p.342
当 $n -> infinity$ 的时候，

$ abs((n - 1) / (n + 1) - 1) = 2 / (n + 1) -> 0 ju $

所以它的极限是 1，也就是原来这两个数列的极限的商。

#ex("例 3")[已知

$ lim_(n -> infinity) a_n = 1 / 2 dou quad lim_(n -> infinity) b_n = 2 / 3 ju $

求：

#cols[(1) $lim_(n -> infinity) (a_n + b_n)$；][(2) $lim_(n -> infinity) (a_n - b_n)$；]
#cols[(3) $lim_(n -> infinity) (a_n dot b_n)$；][(4) $lim_(n -> infinity) a_n / b_n$。]]

#sol[因为 $lim_(n -> infinity) a_n$ 和 $lim_(n -> infinity) b_n$ 都存在，而且 $lim_(n -> infinity) b_n = 2 / 3 != 0$，所以可应用定理 3，得

$ "(1)" quad & lim_(n -> infinity) (a_n + b_n) = lim_(n -> infinity) a_n + lim_(n -> infinity) b_n = 1 / 2 + 2 / 3 = 7 / 6 = mx(1, 1, 6) fen \
  "(2)" quad & lim_(n -> infinity) (a_n - b_n) = lim_(n -> infinity) a_n - lim_(n -> infinity) b_n = 1 / 2 - 2 / 3 = -1 / 6 fen \
  "(3)" quad & lim_(n -> infinity) (a_n dot b_n) = lim_(n -> infinity) a_n dot lim_(n -> infinity) b_n = 1 / 2 dot 2 / 3 = 1 / 3 fen \
  "(4)" quad & lim_(n -> infinity) a_n / b_n = (Lim_(n -> infinity) a_n) / (Lim_(n -> infinity) b_n) = (1 / 2) / (2 / 3) = 3 / 4 ju $]

#ex("例 4")[求 $lim_(n -> infinity) n / (2n + 1)$。]

#sol[$ lim_(n -> infinity) n / (2n + 1) = lim_(n -> infinity) 1 / (2 + 1 / n) ju $

// p.343
因为 1 的极限就是 1，而 2 的极限就是 2。而 $1 / n$ 的极限是 0，所以我们可以应用定理 3，得

$ lim_(n -> infinity) n / (2n + 1) &= lim_(n -> infinity) 1 / (2 + 1 / n) = (Lim_(n -> infinity) 1) / (Lim_(n -> infinity) (2 + 1 / n)) \
  &= 1 / (Lim_(n -> infinity) 2 + Lim_(n -> infinity) 1 / n) = 1 / (2 + 0) \
  &= 1 / 2 ju $]

#attention[因为 $lim_(n -> infinity) n$ 和 $lim_(n -> infinity) (n + 1)$ 都不存在，所以如果不先把 $n / (2n + 1)$ 化作 $1 / (2 + 1 / n)$ 就不能用定理 3 来解。]

#exercise("9·5", star: true)[
1. 把等于 1 个单位长的线段 $O S$ 用 $A_1$ 点平分，再把 $A_1 S$ 用 $A_2$ 点平分，把 $A_2 S$ 用 $A_3$ 点平分，这样无限地进行下去，

(1) 写出线段 $O A_1, O A_2, O A_3, dots$ 的长组成的无穷数列；

(2) 应用定理 2 证明这个数列必定有极限。

2. 已知 $lim x = 1 / 3$，$lim y = 2 / 3$，求

#cols[(1) $lim (x + y)$；][(2) $lim (x - y)$；]
#cols[(3) $lim x y$；][(4) $lim x / y$；]
#cols[(5) $lim (2x + 3y)$；][(6) $lim (1 / x + 1 / y)$；]
#cols[(7) $lim (3x^2 + 2x - 1) / (y + 1)$；][(8) $lim x^2 y^3$。]

3. 已知无穷数列/* p.344 */

$ 5 / 3, 10 / 4, 15 / 5, dots, (5n) / (n + 2), dots dou \
  1 / 3, 2 / 4, 3 / 5, dots, n / (n + 2), dots ju $

(1) 求这两个数列的极限；

(2) 作出每一项等于这两个数列的对应项的和的数列，并验证这个数列的极限等于原来两个数列极限的和。
]

#heading(level: 2, numbering: star-heading-numbering)[无穷递缩等比数列]

我们来考察下面的问题：

图 9·14 的 $triangle A B C$ 是一个等腰直角三角形，它的一条直角边 $A C$ 的长是 1 个长度单位。从 $C$ 点作 $A B$ 的垂直线交 $A B$ 于 $D$，得到一个等腰直角三角形 $B C D$，设它的面积是 $S_1$ 个平方单位；再从 $D$ 点作 $A C$ 的垂线，得到一个等腰直角三角形 $C D E$，设它的面积是 $S_2$ 个平方单位。用同样的方法作等腰直角三角形 $E D F, F E G, G F H, dots$ 它们的面积分别是 $S_3, S_4, S_5, dots$ 平方单位。现在来求这些三角形面积的和的极限。

#fig("9·14", fig-9-14())[]

从图中可以直观地看出，当这种三角形愈来愈多的时候，它们面积的和就接近于原来这个等腰直角三角形 $A B C$ 的面积，就是 $1 / 2$ 个平方单位。

现在，我们来证明这个事实。

从平面几何知道 $triangle B C D tilde.equiv triangle C D A$，所以 $triangle B D C$ 的面积是 $triangle A B C$ 面积的一半，由此可知

// p.345
$ S_1 = 1 / 4 dou $

同理可知

$ S_2 = 1 / 8 dou quad S_3 = 1 / 16 dou quad S_4 = 1 / 32 dou quad S_5 = 1 / 64 dou quad dots ju $

所以这些三角形的面积的量数组成无穷等比数列

#eqno([(1)], $1 / 4, quad 1 / 8, quad 1 / 16, quad 1 / 32, quad 1 / 64, quad dots ju$)

这个数列的第 1 项 $a_1 = 1 / 4$，公比 $q = 1 / 2$，它的通项是

$ a_n = 1 / 4 (1 / 2)^(n - 1) ju $

现在的问题就是要求数列 (1) 所有项的和。

根据等比数列前 $n$ 项的和的公式，我们知道

$ s_n &= (a_1 (1 - q^n)) / (1 - q) \
  &= (1 / 4 [1 - (1 / 2)^n]) / (1 - 1 / 2) \
  &= 1 / 2 [1 - (1 / 2)^n] ju $

这样，我们的问题也就是要求当 $n -> infinity$ 的时候 $s_n$ 的极限，就是求

$ lim_(n -> infinity) s_n = lim_(n -> infinity) 1 / 2 [1 - (1 / 2)^n] ju $

因为当 $n -> infinity$ 的时候 $(1 / 2)^n -> 0$，就是

$ lim_(n -> infinity) (1 / 2)^n = 0 ju $

我们可以应用上节的定理 3，得

// p.346
$ lim_(n -> infinity) s_n &= lim_(n -> infinity) 1 / 2 [1 - (1 / 2)^n] \
  &= 1 / 2 lim_(n -> infinity) [1 - (1 / 2)^n] \
  &= 1 / 2 [1 - lim_(n -> infinity) (1 / 2)^n] \
  &= 1 / 2 [1 - 0] = 1 / 2 ju $

这就是所要证明的。

上面这个数列 (1) 的公比 $q$ 的绝对值 $abs(q)$ 小于 1。我们把这样的数列叫作无穷递缩等比数列。当 $n$ 无限增大的时候，无穷递缩等比数列前 $n$ 项的和的极限，我们就叫作这个无穷递缩等比数列的和。一般地说：

#definition[
设在无穷等比数列

$ a_1, a_1 q, a_1 q^2, dots, a_1 q^(n - 1), dots $

中，$abs(q) < 1$，这个数列就叫作*无穷递缩等比数列*。当 $n$ 无穷增大的时候，它的前 $n$ 项的和

$ s_n = (a_1 (1 - q^n)) / (1 - q) $

#lead[的极限][$lim_(n -> infinity) s_n = lim_(n -> infinity) (a_1 (1 - q^n)) / (1 - q)$]

就叫作这个*无穷递缩等比数列各项的和*，记作

$ s = lim_(n -> infinity) s_n = lim_(n -> infinity) (a_1 (1 - q^n)) / (1 - q) ju $
]

因为当 $abs(q) < 1$ 的时候，$lim_(n -> infinity) q^n = 0$，所以

$ s = lim_(n -> infinity) (a_1 (1 - q^n)) / (1 - q) = lim_(n -> infinity) [a_1 / (1 - q) - (a_1 q^n) / (1 - q)] \
  = a_1 / (1 - q) - a_1 / (1 - q) lim_(n -> infinity) q^n = a_1 / (1 - q) ju $

// p.347
#rule(title: [公式])[
这就是说，第 1 项是 $a_1$，公比是 $q (abs(q) < 1)$ 的无穷等比数列各项的和是

#eqno([(VII)], $s = a_1 / (1 - q) quad (abs(q) < 1) ju$)

这个公式叫作*无穷递缩等比数列各项的和的公式*。
]

#ex("例 1")[求无穷递缩等比数列

$ 3, 1, 1 / 3, dots $

各项的和。]

#sol[这里 $q = 1 / 3$，

$ therefore quad s = a_1 / (1 - q) = 3 / (1 - 1 / 3) = 3 / (2 / 3) = 9 / 2 = mx(4, 1, 2) ju $]

#ex("例 2")[求无穷递缩等比数列

$ 0.9, 0.09, 0.009, dots $

各项的和，并且求这个和与这个等比数列前 5 项的和的差。]

#sol[这里 $q = (0.09) / (0.9) = 1 / 10$，

$ therefore quad s = a_1 / (1 - q) = 0.9 / (1 - 1 / 10) = 0.9 / 0.9 = 1 ju $

又

$ s_5 &= 0.9 + 0.09 + 0.009 + 0.0009 + 0.00009 \
  &= 0.99999 ju \
  therefore quad s - s_5 &= 1 - 0.99999 = 0.00001 ju $]

#note-small[求 $s_5$ 当然也可以应用公式 (IV)，但直接算反而简单。]

#exercise("9·6", star: true)[
1. 判别下列各无穷数列中哪些是无穷递缩等比数列，哪些不是：/* p.348 */

#cols[(1) $4 / 3, 1, 3 / 4, 9 / 16, dots$；][(2) $10, 9, 8, 7, dots$；]
#cols[(3) $1, 3 / 2, 9 / 4, 27 / 8, dots$；][(4) $3, -1, 1 / 3, -1 / 9, dots$；]
#cols[(5) $mx(6, 2, 3), mx(1, 1, 3), 4 / 15, 4 / 75, dots$；][(6) $sqrt(3 / 2), sqrt(2 / 3), 2 / 3 sqrt(2 / 3), dots$；]

(7) $(sqrt(3) + 1) / (sqrt(3) - 1), 1, (sqrt(3) - 1) / (sqrt(3) + 1), dots$；

// 原书作“1, −x, x²; −x², …”（p.348；疑似印刷错误：第四项应为 −x³，x² 后的分号应为逗号，书末答案 1/(1+x) 只有这样才成立，已订正，见 REVISIONS.md）
(8) $1, -x, x^2, -x^3, dots quad (abs(x) < 1)$；

(9) $1 / (a - 1)^2, 1 / (a^2 - 1), 1 / (a + 1)^2, dots quad (a > 1)$；

(10) $1, -1 / x, 1 / x^2, -1 / x^3, dots quad (abs(x) < 1)$。

2. 求上题中各无穷递缩等比数列的和。

3. 求下列无穷递缩等比数列的和，并且求这个和与这个等比数列前 3 项的和的差：

(1) $0.1, 0.01, 0.001, dots$；

(2) $0.12, 0.0012, 0.000012, dots$。

4. 在无穷递缩等比数列里：

#cols[(1) $a_1 = 66, s = 110$，求 $q$；][(2) $s = 14.4, q = 3 / 8$，求 $a_1$；]
#cols[(3) $q = 0.4, s = mx(33, 1, 3)$，求 $a_4$；][(4) $a_2 = mx(1, 2, 3), q = 2 / 3$，求 $s$；]
#cols[(5) $a_2 = 162, s = 729$，求 $a_1$；][(6) $s_4 = mx(33, 3, 4), s = 36$，求 $a_1$。]

5. 在每边等于 $a$ 的正方形里，用连接各边中点的方法，作一个内接正方形，在这个正方形里再用同样的方法作新的内接正方形，这样无限地继续下去。

#plainfig((fig-q5(), [（第 5 题）]))

(1) 求这些正方形（包括原来的正方形）周长的和的极限；

(2) 求这些正方形（包括原来的正方形）面积的和的极限。

6. 一个皮球，由高处落下，每次跳起/* p.349 */的高度是原来下落距离的 $1 / 3$，如果皮球由 6.0 米高的地方落下，到停在地面上为止，这个球上下运动的距离的总和是多少米？
]
