// 第 6 章（续）§6·4 三元一次方程组
// （原书 p.213–221：§6·4 标题在 p.213 中下部，p.213 上部是习题 6·3 的尾部，不在本文件；
// 到习题 6·4(2) 结束（p.221 上部），“本章提要”见 ch06d.typ）
#import "/common/series.typ": *

// 局部：行列式（竖线括号）。mat 的行用分号分隔：dt(a, b; c, d)
#set math.mat(column-gap: 1.1em, row-gap: 0.6em)
#let dt(..rows) = math.mat(delim: "|", ..rows)
// 局部：分式放在行列式里时按 display 样式排（矩阵单元格默认缩小）
#let fr(a, b) = math.display(math.frac(a, b))
// 局部：含分式的方程组的大括号，每行按 display 样式排
#let cs(..rows) = math.cases(..rows.pos().map(math.display))
#set math.cases(gap: 0.9em)
// 局部：带左标签（如“(I)”）、右序号的方程组
#let sysn(tag, ..rows) = {
  let rs = rows.pos()
  let n = rs.len()
  block(width: 100%, above: 1em, below: 1em, breakable: false, align(center, grid(
    columns: (auto, auto, auto, 3em),
    column-gutter: (0.4em, 0.4em, 4em), row-gutter: 0.7em,
    align: left + horizon,
    grid.cell(rowspan: n, tag),
    grid.cell(rowspan: n, math.equation(block: false, $lr(\{ #v(1.25em * n))$)),
    ..rs.enumerate().map(((i, r)) => (
      grid.cell(x: 2, y: i, math.equation(block: false, r.at(0))),
      grid.cell(x: 3, y: i, r.at(1)))).flatten()
  )))
}

// p.213
== 三元一次方程组

有了上面的基础，现在就可以利用三阶行列式来研究三元一次方程组

#sysn([(I)], ($a_1 x + b_1 y + c_1 z = k_1 dou$, [(1)]), ($a_2 x + b_2 y + c_2 z = k_2 dou$, [(2)]), ($a_3 x + b_3 y + c_3 z = k_3$, [(3)]))

的解法。

首先，应用代数余子式和它的性质，设法从这三个方程里消去 $y$ 和 $z$，导出一个只含有未知数 $x$ 的方程。

行列式

$ D = dt(a_1, b_1, c_1; a_2, b_2, c_2; a_3, b_3, c_3) $

// p.214
中，分别记元素 $a_i, b_i, c_i$ 的代数余子式为

$ A_i, B_i, C_i quad (i = 1, 2, 3) ju $

把 $A_1, A_2, A_3$ 分别乘式 (1)，(2)，(3) 的两边，得

#eqno([(4)], $a_1 A_1 x + b_1 A_1 y + c_1 A_1 z = k_1 A_1 dou$)

#eqno([(5)], $a_2 A_2 x + b_2 A_2 y + c_2 A_2 z = k_2 A_2 dou$)

#eqno([(6)], $a_3 A_3 x + b_3 A_3 y + c_3 A_3 z = k_3 A_3 ju$)

把式 (4)，(5)，(6) 的等号两边分别相加，并应用上节的定理 1 和 2，得

#eqno([(7)], $D x = k_1 A_1 + k_2 A_2 + k_3 A_3 ju$)

类似地，从式 (1)，(2)，(3) 中消去 $x$ 和 $z$，或者 $x$ 和 $y$，可以导出只含有未知数 $y$，或者 $z$ 的方程：

#eqno([(8)], $D y = k_1 B_1 + k_2 B_2 + k_3 B_3 dou$)

#eqno([(9)], $D z = k_1 C_1 + k_2 C_2 + k_3 C_3 ju$)

为了简便起见，分别用记号 $D_x, D_y, D_z$ 来表示 (7)，(8)，(9) 中等号右边的式子，就是

$ D_x &= k_1 A_1 + k_2 A_2 + k_3 A_3 = dt(k_1, b_1, c_1; k_2, b_2, c_2; k_3, b_3, c_3) dou \
  D_y &= k_1 B_1 + k_2 B_2 + k_3 B_3 = dt(a_1, k_1, c_1; a_2, k_2, c_2; a_3, k_3, c_3) dou \
  D_z &= k_1 C_1 + k_2 C_2 + k_3 C_3 = dt(a_1, b_1, k_1; a_2, b_2, k_2; a_3, b_3, k_3) ju $

这就导出了一个方程组

#sysn([(II)], ($D x = D_x dou$, []), ($D y = D_y dou$, []), ($D z = D_z ju$, []))

// p.215
下面将分成三种情况来研究。

*情况一* $D != 0$。这时，方程组 (II) 有唯一的解

$ cs(x = D_x / D dou, y = D_y / D dou, z = D_z / D ju) $

我们来看一下，这组解是否是方程组 (I) 的解。为此，通过检验#footnote[因为，从方程组 (I) 导出方程组 (II) 时，没有附加 $A_i != 0$，$B_i != 0$，$C_i != 0$ 的条件，只能肯定方程组 (I) 的解都是方程组 (II) 的解，但不能保证方程组 (II) 的解都是方程组 (I) 的解，所以还必须通过检验这个步骤。]，例如，把这组解代入式 (1) 的左边，得

$ &a_1 D_x / D + b_1 D_y / D + c_1 D_z / D \
  &= 1 / D (a_1 D_x + b_1 D_y + c_1 D_z) \
  &= 1 / D [a_1 (k_1 A_1 + k_2 A_2 + k_3 A_3) + b_1 (k_1 B_1 + k_2 B_2 + k_3 B_3) \
  &quad quad quad quad quad quad + c_1 (k_1 C_1 + k_2 C_2 + k_3 C_3)] \
  &= 1 / D [k_1 (a_1 A_1 + b_1 B_1 + c_1 C_1) + k_2 (a_1 A_2 + b_1 B_2 + c_1 C_2) \
  &quad quad quad quad quad quad + k_3 (a_1 A_3 + b_1 B_3 + c_1 C_3)] \
  &= 1 / D dot k_1 D = k_1 ju $

所以，这组解满足方程 (1)；类似地，读者可以自己验证这组解也满足方程 (2) 和 (3)。所以，这组解也就是方程组 (I) 的解。

*情况二* $D = 0$，但 $D_x, D_y, D_z$ 中至少有一个不等于零。这时，方程组 (II) 无解，方程组 (I) 当然也无解。

// p.216
*情况三* $D = D_x = D_y = D_z = 0$。这时，方程组 (II) 有无穷多组解，但方程组 (I) 可能有无穷多解，也可能无解#footnote[这种情况的详细研究比较复杂，本书中把它略去了。]。

例如，在方程组

#align(center, grid(columns: 2, column-gutter: 3em, align: horizon,
  $cs(x - y + 2z = 2 dou, 2x - 2y + 4z = 3 dou, 3x - 3y + 6z = 6)$,
  grid(columns: 2, column-gutter: 1em, align: horizon, [和],
    $cs(x - y + 2z = 2 dou, 2x - 2y + 4z = 4 dou, 3x - 3y + 6z = 6)$)))

里，都有 $D = D_x = D_y = D_z = 0$，但是，前面这个方程组无解，而后面这个方程组有无穷多解。

#ex("例 1")[解方程组

$ cs(x + 2y - 4z = 11 dou, 2x - 3y #h(2.6em) = 2 dou, #h(3.5em) y - 4z = 1 ju) $]

#sol[]
$ D &= dt(1, 2, -4; 2, -3, 0; 0, 1, -4) = 12 - 8 + 16 = 20 ju \
  D_x &= dt(11, 2, -4; 2, -3, 0; 1, 1, -4) = 132 - 8 - 12 + 16 = 128 dou \
  D_y &= dt(1, 11, -4; 2, 2, 0; 0, 1, -4) = -8 - 8 + 88 = 72 dou \
  D_z &= dt(1, 2, 11; 2, -3, 2; 0, 1, 1) = -3 + 22 - 4 - 2 = 13 ju $

所以，所求的解是

// p.217
$ cs(x = D_x / D = 128 / 20 = mx(6, 2, 5) dou, y = D_y / D = 72 / 20 = mx(3, 3, 5) dou, z = D_z / D = 13 / 20 ju) $

#exercise("6·4(1)")[
1. 应用三阶行列式，解下列方程组：

#cols[(1) $cs(2x - 3y + z + 1 = 0 dou, x + y + z = 6 dou, 3x + y - 2z = -1 fen)$][(2) $cs(x + 2y + 3z = 6 dou, 2x + 4y - 7 = z dou, 3x + 2y + 9z - 14 = 0 fen)$]
#cols[(3) $cs(2x + y = 5 dou, x - 3z = -14 dou, 5y - z = 10 fen)$][(4) $cs(x - y + z = a dou, x + y - z = b dou, -x + y + z = c ju)$]

#h(5em)（$a, b, c$ 是已知常数。）

2. 应用三阶行列式，确定下列方程组的解的情况：

#cols[(1) $cs(x + y - z = 5 dou, 3x + y + z = 2 dou, 5x + 5y - 5z = 25 fen)$][(2) $cs(2x + y - z = 1 dou, 3x + y + 2z = -3 dou, 10x + 4y + 2z = 4 fen)$]
#cols[(3) $cs(2x - y + 3z = 2 dou, 4x - 2y + 6z = 6 dou, 6x - 3y + 9z = 6 fen)$][(4) $cs(2x - y + 3z = 1 dou, 4x - 2y + 6z = 3 dou, 7x - y + z = 0 fen)$]
#cols[(5) $cs(x - y - z = 0 dou, 2x + y - 3z = 3 dou, 3x - 4z = 3 fen)$][(6) $cs(x - y + z = 1 dou, 2x - 2y + 2z = 2 dou, -3x + 3y - 3z = -3 ju)$]
]

最后，再来研究一类特殊的三元一次方程组

#sysn([(III)], ($a_1 x + b_1 y + c_1 z = 0 dou$, []), ($a_2 x + b_2 y + c_2 z = 0 dou$, []), ($a_3 x + b_3 y + c_3 z = 0 ju$, []))

// p.218
在这个方程组里，各个方程的常数项都等于零，含有未知数的项都是一次项。这个方程组通常称为*三元齐次线性方程组*。

很明显，三元齐次线性方程组都有一组解

$ cs(x = 0 dou, y = 0 dou, z = 0 ju) $

这组解称为三元齐次线性方程组的*零解*。

现在的问题是三元齐次线性方程组是不是还可能有其他不是零的解（即*非零解*）？

因为方程组 (III) 就是方程组 (I) 当 $k_1 = k_2 = k_3 = 0$ 时的一个特例，所以上面得到的结论应该成立。这样，就可以知道：

当系数行列式 $D != 0$ 时，方程组 (III) 有唯一的解，这组解就是 $x = y = z = 0$。

当系数行列式 $D = 0$ 时，方程组 (III) 或是无解，或是有无穷多解。但是，既已知方程组 (III) 有一组解 $x = y = z = 0$，所以这时方程组 (III) 有无穷多组解。

#rule(title: [定理])[
由此，可以得到结论：

*定理 1. 三元齐次线性方程组有非零解的充要条件是它的系数行列式 $D = 0$。*
]

#ex("例 2")[已知方程组 (III) 有非零解，求证

$ cs(x = k A_1 dou, y = k B_1 dou quad (k "是任意常数"), z = k C_1) $

是这个方程组的解。]

#sol(label: [证])[因为方程组 (III) 有非零解，所以 $D = 0$。因此有

$ a_1 (k A_1) + b_1 (k B_1) + c_1 (k C_1) &= k (a_1 A_1 + b_1 B_1 + c_1 C_1) \
  &= k D = 0 dou $

// p.219
$ a_2 (k A_1) + b_2 (k B_1) + c_2 (k C_1) = k (a_2 A_1 + b_2 B_1 + c_2 C_1) = 0 dou \
  a_3 (k A_1) + b_3 (k B_1) + c_3 (k C_1) = k (a_3 A_1 + b_3 B_1 + c_3 C_1) = 0 ju $

所以 $x = k A_1$，$y = k B_1$，$z = k C_1$（$k$ 是任意常数）是方程组 (III) 的解。]

#note-small[同样，可以证明：

#align(center, grid(columns: 2, column-gutter: 3em, align: horizon,
  $cs(x = k' A_2 dou, y = k' B_2 dou, z = k' C_2)$,
  grid(columns: 2, column-gutter: 1em, align: horizon, [和],
    $cs(x = k'' A_3 dou, y = k'' B_3 dou, z = k'' C_3)$)))

也是方程组 (III) 的解。在 $A_i, B_i, C_i (i = 1, 2, 3)$ 不全为零时，方程组 (III) 的非零解就可以用上面的一组解一般地表示出来。]

#ex("例 3")[解下列方程组：

#cols[(1) $cs(4x - 3y + 5z = 0 dou, 3x #h(0.5em) + y - 2z = 0 dou, #h(1.2em) x - 4y - 3z = 0 fen)$][(2) $cs(x - y + z = 0 dou, x + y - z = 0 dou, 5x + y - z = 0 ju)$]]

#sol[]
(1) $because$ $D = dt(4, -3, 5; 3, 1, -2; 1, -4, -3)$

$ &= 4 dt(1, -2; -4, -3) - 3 dt(-3, 5; -4, -3) + dt(-3, 5; 1, -2) \
  &= -44 - 87 + 1 \
  &= -130 != 0 dou $

所以，原方程组有唯一的一组解：

$ x = 0 dou quad y = 0 dou quad z = 0 ju $

(2) $because$ $D = dt(1, -1, 1; 1, 1, -1; 5, 1, -1) = dt(1, 0, 1; 1, 0, -1; 5, 0, -1) = 0 fen$

// p.220
$ A_1 = dt(1, -1; 1, -1) = 0 dou quad quad B_1 = -dt(1, -1; 5, -1) = -4 dou \
  C_1 = dt(1, 1; 5, 1) = -4 ju $

所以，这个方程组有无穷多组解：

$ cs(x = 0 dou, y = -4k dou quad ("这里" k "为任意常数") ju, z = -4k) $

#note-small[本题的解的过程中，如果计算代数余子式 $A_2, B_2, C_2$，可得

$ A_2 = 0 dou quad B_2 = -6 dou quad C_2 = -6 ju $

由此得方程组的解是

$ cs(x = 0 dou, y = -6k dou, z = -6k ju) $

很明显，这与上面所求得的解事实上是一样的。如果在前面这组解里令/* 原书作“命” */ $-4k = m$，后面这组解里令/* 原书作“命” */ $-6k = m$，那么它们都变成了

$ cs(x = 0 dou, y = m dou quad (m "为任意常数"), z = m) $

的形式。因此，便可把前后任一组解作为方程组的解的一般形式。]

#exercise("6·4(2)")[
1. 解下列各方程组：

#cols[(1) $cs(x + y + z = 0 dou, 2x + 3y + 2z = 0 dou, 4x + 5y + 4z = 0 fen)$][(2) $cs(x + 5y - 10z = 0 dou, 2x - 3y + 6z = 0 dou, 3x + 2y - 4z = 0 fen)$]
#cols[(3) $cs(x - 2y + z = 0 dou, x + 2y - z = 0 dou, 5x + 2y - z = 0 fen)$][(4) $cs(6x - y - 7z = 0 dou, 5x + 10y + 5z = 0 dou, 4x - 3y - 7z = 0 ju)$]

// p.221
2. 证明下面这些方程组都没有非零解：

#cols[(1) $cs(x + y + 2z = 0 dou, 2x + y + z = 0 dou, x + 2y + z = 0 fen)$][(2) $cs(-x + 2y + 2z = 0 dou, 2x - y + 2z = 0 dou, 2x + 2y - z = 0 fen)$]
#cols[(3) $cs(2x + z = 0 dou, x - 4y - z = 0 dou, -x + 8y + 3z = 0 fen)$][(4) $cs(4x - 2y + 4z = 0 dou, 10x + 2y + 12z = 0 dou, x + 2y + 2z = 0 ju)$]
]
