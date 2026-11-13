// 第 1 章（续）*§1·8 高次不等式、§1·9 不等式的其他一些性质、*§1·10 无理不等式、§1·11 不等式的证明（原书 p.40–59，§1·12 起见后文）
#import "/common/series.typ": *
#import "/books/algebra-3/figures/fig1-19.typ": fig-1-19
#import "/books/algebra-3/figures/fig1-20.typ": fig-1-20
#import "/books/algebra-3/figures/fig1-21.typ": fig-1-21

// 局部辅助：小号说明文字（原书里字号略小的说明、星号证明）
#let small(body) = block(above: 0.7em, below: 0.7em, width: 100%, {
  set par(first-line-indent: 0em)
  set text(size: 9.8pt)
  body
})

// 局部辅助：行首带“又”“就是”“而”等引导词的独立公式
#let lead(w, body) = block(width: 100%, above: 0.8em, below: 0.8em, {
  set par(first-line-indent: 0em)
  grid(columns: (4.5em, 1fr, 4.5em), align: (left + horizon, center + horizon, left), w, body, [])
})

// 局部辅助：一步一行的推理（引导词 | 式子 | 右侧序号或依据）。rows 里每项是 (引导词, 式子, 右侧)
#let prf(tw: 2.5em, ..rows) = block(width: 100%, above: 0.8em, below: 0.8em, breakable: false, {
  set par(first-line-indent: 0em)
  grid(
    columns: (7.5em, 1fr, tw), row-gutter: 0.9em,
    align: (left + horizon, center + horizon, right + horizon),
    ..rows.pos().map(r => (r.at(0), r.at(1), r.at(2))).flatten())
})

// 局部辅助：左边带“(I)”标号的方程组，右边每行带序号
#let eqsysl(lab, ..rows) = {
  let rs = rows.pos()
  let n = rs.len()
  block(width: 100%, above: 1em, below: 1em, breakable: false, grid(
    columns: (1fr, auto, auto, auto, 1fr, auto),
    column-gutter: 0.4em, row-gutter: 0.7em,
    align: left + horizon,
    grid.cell(x: 1, y: 0, rowspan: n, align: right + horizon, lab),
    grid.cell(x: 2, y: 0, rowspan: n, math.equation(block: false, $lr(\{ #v(1.25em * n))$)),
    ..rs.enumerate().map(((i, r)) => (
      grid.cell(x: 3, y: i, math.equation(block: false, r.at(0))),
      grid.cell(x: 5, y: i, align: right + horizon, r.at(1)))).flatten()))
}

// 局部辅助：符号表。heads 为各列表头；rows 为 (左栏, "-++") 形式，每个字符对应一列；prod 为最后一行（积或商）
#let signtab(heads, rows, prod) = {
  let n = heads.len()
  let sg(c) = if c == "+" { $+$ } else { $-$ }
  let cells = ()
  cells.push([])
  // 模板把表格第一行设成白字（配深色表头），这里不用表头底色，显式改回黑字
  for h in heads { cells.push(text(fill: black, h)) }
  for r in rows {
    cells.push(r.at(0))
    for c in r.at(1) { cells.push(sg(c)) }
  }
  cells.push(prod.at(0))
  for c in prod.at(1) { cells.push(sg(c)) }
  let m = rows.len() + 2
  align(center, block(breakable: false, above: 1em, below: 1em, table(
    columns: (auto,) + (1fr,) * n,
    align: center + horizon,
    inset: (x: 5pt, y: 5pt),
    fill: none,
    stroke: (x, y) => (
      left: if x >= 1 { 0.5pt } else { none },
      top: if y == 0 { 1.2pt } else if y == 1 or y == m - 1 { 0.5pt } else { none },
      bottom: if y == m - 1 { 1.2pt } else { none },
    ),
    ..cells)))
}

// p.40
#heading(level: 2, numbering: star-heading-numbering)[高次不等式]

利用解不等式组的方法，我们还可以解一些简单的一元高次不等式。

#ex("例 1")[解不等式 $(x^2 - 1)(x + 2) > 0$。]

#sol[这个不等式可以分成下面的不等式组 (I) 和 (II) 来解：

#eqsysl([(I)], ($x^2 - 1 > 0 dou$, [(1)]), ($x + 2 > 0 ju$, [(2)]))

解不等式 (1) 得 $x < -1$ 或者 $x > 1$。

解不等式 (2) 得 $x > -2$。

因此，不等式组 (I) 的解是 $-2 < x < -1$，或者 $x > 1$（图 1·19）。

#fig("1·19", fig-1-19())[]

#eqsysl([(II)], ($x^2 - 1 < 0 dou$, [(3)]), ($x + 2 < 0 ju$, [(4)]))

解不等式 (3) 得 $-1 < x < 1$。

解不等式 (4) 得 $x < -2$。

因此，不等式组 (II) 没有解（图 1·20）。

#fig("1·20", fig-1-20())[]

由此可知，原不等式的解是

$ -2 < x < -1 dou quad "或者" quad x > 1 ju $]

// p.41
在解上面这种不等式的时候，用列表的方法来找寻所求的解，可以更加方便。现在把解法步骤说明如下：

(1) 先把原不等式变形成 $(x + 1)(x - 1)(x + 2) > 0$。

(2) 求出不等号左边的三次式 $(x + 1)(x - 1)(x + 2)$ 的三个根：$-1, 1, -2$。

(3) 以这三个值为界，把全体实数（除去这三个数）按照数轴上从左到右的顺序顺次地分成 4 个部分。

#fig("1·21", fig-1-21())[]

(4) 分别考察当 $x < -2, -2 < x < -1, -1 < x < 1, x > 1$ 的时候，因式 $x + 2, x + 1, x - 1$ 的值的符号，由此求出在每一个情况下积 $(x + 2)(x + 1)(x - 1)$ 的符号，填入下面的表格。

#signtab(
  ($x < -2$, $-2 < x < -1$, $-1 < x < 1$, $x > 1$),
  (($x + 2$, "-+++"), ($x + 1$, "--++"), ($x - 1$, "---+")),
  ([积], "-+-+"))

#small[例如取比 $-2$ 小的数 $-3$ 来考察。可以看到 $x + 2, x + 1, x - 1$ 的值都是负数，所以在表格中第二直行的中间一栏里都填入“$-$”号，然后根据三个负数的积应该是负数，在第二直行最后一栏里也填入“$-$”号。]

(5) 现在要求的是 $x$ 取什么值的时候，积

$ (x + 2)(x + 1)(x - 1) $

的值是正数。从表中可以看出所求的值就是 $-2 < x < -1$，或者 $x > 1$。这就是所求的解。

// p.42
#ex("例 2")[解不等式 $(2x + 1)(2x - 1)(x + 2) < 0$。]

#sol[$(2x + 1)(2x - 1)(x + 2)$ 的三个根是 $-1/2, 1/2$ 和 $-2$。

#signtab(
  ($x < -2$, $-2 < x < -1/2$, $-1/2 < x < 1/2$, $x > 1/2$),
  (($x + 2$, "-+++"), ($2x + 1$, "--++"), ($2x - 1$, "---+")),
  ([积], "-+-+"))

$therefore$ 原不等式的解是

$ x < -2 quad "或者" quad -1/2 < x < 1/2 ju $]

#remark([注])[第一直行里各个一次因式的次序，最好能按照根从小到大的顺序来排列，就是把有最小的根的一次式排在最上面，依次排下去，这样考察起来就更方便。（读者可考虑一下，这样安排以后将有怎样的规律出现？）]

#ex("例 3")[解不等式 $(x^2 - 4)(9 - x^2) > 0$。]

#sol[原不等式就是

$ (x^2 - 4)(x^2 - 9) < 0 dou $

#lead([也就是], $(x + 3)(x + 2)(x - 2)(x - 3) < 0 ju$)

#signtab(
  ($x < -3$, $-3 < x < -2$, $-2 < x < 2$, $2 < x < 3$, $x > 3$),
  (($x + 3$, "-++++"), ($x + 2$, "--+++"), ($x - 2$, "---++"), ($x - 3$, "----+")),
  ([积], "+-+-+"))

// p.43
$therefore$ 原不等式的解是

$ -3 < x < -2 dou quad "或者" quad 2 < x < 3 ju $]

仿照上面这种列表方法来解某些分式不等式，也可以带来许多方便，举例如下。

#ex("例 4")[解不等式

$ (x - 1)/((x + 1)(x - 2)) > 0 ju $]

#sol[当 $x = 1$ 的时候，分式 $(x - 1)/((x + 1)(x - 2))$ 的值是 0，当 $x = -1$ 或者 $x = 2$ 的时候，分式 $(x - 1)/((x + 1)(x - 2))$ 失去意义。我们以这三个数 $-1, 1$ 和 $2$ 为界把全体实数（除去这三个数）划分成 4 个部分，列成下表来考察。

#signtab(
  ($x < -1$, $-1 < x < 1$, $1 < x < 2$, $x > 2$),
  (($x + 1$, "-+++"), ($x - 1$, "--++"), ($x - 2$, "---+")),
  ([#text(size: 8pt)[$(x - 1)/((x + 1)(x - 2))$]], "-+-+"))

$therefore$ 原不等式的解是

$ -1 < x < 1 quad "或者" quad x > 2 ju $]

#exercise("1·8", star: true)[
1. 解不等式：

#cols[(1) $(x - 1)(x - 3)(x - 5) > 0$；][(2) $(x - 1)(x - 3)(x - 5) < 0$；]
#cols[(3) $(x^2 - 1)(x^2 - 4) > 0$；][(4) $(1 - x^2)(4 - x^2) < 0$。]

2. 解不等式：

#cols[(1) $x/(x^2 - 9) > 0$；][(2) $(x^2 - 25)/(16 - x^2) > 0$；]
// p.44
#cols[(3) $1/(x + 3) + 2/(x - 3) > 0$；][(4) $x/(x + 2) + 1/(x - 3) > 1$；]
#cols[(5) $(x^2 - 2)/(x^2 - 4) < 0$；][(6) $2 + 2/(x - 1) < 5/(4 - x)$。]
]

== 不等式的其他一些性质

在研究等式的时候，有时我们需要把两个等式的等号两边分别相加、相减、相乘、相除，或者把一个等式的两边分别自乘同次方、开同次方。我们知道，通过这些运算，结果还是得到一个等式，就是：

如果 $a = b$，$c = d$，那么一定有

(1) $a + c = b + d$；

(2) $a - c = b - d$；

(3) $a c = b d$；

(4) $a/c = b/d$ （这里 $c != 0$，$d != 0$）；

(5) $a^n = b^n$ （这里 $n$ 是自然数）；

(6) $root(n, a) = root(n, b)$ （这里 $a > 0$，$b > 0$，$n$ 是大于 1 的整数）。

同样地，在研究不等式的时候，有时我们也需要把两个不等式的左右两边分别相加、相减、相乘、相除，或者把一个不等式的左右两边分别自乘同次方、开同次方。

现在，我们来研究这些运算在什么情况下才能够进行，并且通过这些运算，将会产生怎样的结果。

*1. 不等式两边分别相加和分别相减* 很明显，两个大的数的和总比两个小的数的和大。例如：

$ 5 > 3 dou quad 4 > 2 dou $

#lead([而], $5 + 4 > 3 + 2 fen$)

// p.45
$ -3 > -5 dou quad -2 > -4 dou $

#lead([而], $(-3) + (-2) > (-4) + (-5) ju$)

这个事实指出了不等式有下面的性质：

#rule(title: [性质])[
*性质 5.* 如果 $a > b$，$c > d$，那么 $a + c > b + d$。
]

#small[\*这个性质，我们可以从不等式的基本性质 3 和 2 中推导出来，证法如下：

#prf(
  ("", $because a > b dou quad therefore a + c > b + c ju quad "（性质 3）"$, [(1)]),
  ([又], $because c > d dou quad therefore b + c > b + d ju quad "（性质 3）"$, [(2)]),
  ([从 (1) 和 (2) 得], $a + c > b + d ju quad "（性质 2）"$, []))]

很明显，不等式的这个性质可以推广到任意多个（有限的）同向不等式两边分别相加的情形。这就是说：

#edot[两个或者几个同向不等式两边分别相加，仍得同向不等式]。

注意，把两个异向不等式两边分别相加，就不能作出一般的结论。例如：

$ 5 > 3 dou quad 2 < 3 dou quad & "这时" quad 5 + 2 > 3 + 3 fen \
  5 > 3 dou quad 2 < 4 dou quad & "这时" quad 5 + 2 = 3 + 4 fen \
  5 > 3 dou quad 2 < 5 dou quad & "这时" quad 5 + 2 < 3 + 5 ju $

所以仅知 $a > b$，$c < d$，就不能判断 $a + c$ 和 $b + d$ 中哪一个大。

但是，如果把两个异向不等式，两边分别相减，那么就可以断定得到的一定是和被减的不等式同向的不等式。这就是说，不等式有下面的性质：

#rule(title: [性质])[
*性质 6.* 如果 $a > b$，$c < d$，那么 $a - c > b - d$。
]

#small[\*这个性质可以从不等式的性质 4 和 5 推导出来。证法如下：

#prf(
  ("", $because c < d dou quad therefore -c > -d ju quad "（性质 4）"$, []),
  ([又], $because a > b dou quad -c > -d fen quad therefore a + (-c) > b + (-d) ju quad "（性质 5）"$, []),
  ([就是], $a - c > b - d ju$, []))]

// p.46
不等式的这个性质也就是说：

#edot[两个异向不等式两边分别相减，得到的是和被减的不等式同向的不等式]。

注意，两个同向不等式两边分别相减，就不能作出一般的结论。

#ex("例 1")[已知 $sqrt(2)$ 的值比 1.4 大而比 1.5 小，$sqrt(3)$ 的值比 1.7 大而比 1.8 小。问 $sqrt(2) + sqrt(3)$ 的值比什么数大，比什么数小？]

#sol[$ because quad sqrt(2) &> 1.4 dou \ sqrt(3) &> 1.7 dou $

两边分别相加得

$ sqrt(2) + sqrt(3) > 3.1 ju $

#lead([又], $ because quad sqrt(2) &< 1.5 dou \ sqrt(3) &< 1.8 ju $)

两边分别相加得

$ sqrt(2) + sqrt(3) < 3.3 ju $

所以 $sqrt(2) + sqrt(3)$ 一定比 3.1 大而比 3.3 小。这个结果可以写作 $3.1 < sqrt(2) + sqrt(3) < 3.3$。]

#ex("例 2")[问 $sqrt(3) - sqrt(2)$ 的值一定介于哪两个数之间（精确到 0.1）。]

#sol[$ because quad sqrt(3) > 1.7 dou $

#lead([而], $sqrt(2) < 1.5 dou$)

两边分别相减得

#eqno([(1)], $sqrt(3) - sqrt(2) > 0.2 ju$)

#lead([又], $ because quad sqrt(3) < 1.8 dou $)

#lead([而], $sqrt(2) > 1.4 dou$)

两边分别相减得

// p.47
#eqno([(2)], $sqrt(3) - sqrt(2) < 0.4 ju$)

把 (1) 和 (2) 结合起来，就得到

$ 0.2 < sqrt(3) - sqrt(2) < 0.4 ju $

这就是说 $sqrt(3) - sqrt(2)$ 的值一定介于 0.2 和 0.4 之间。]

#exercise("1·9(1)")[
1. 已知 $sqrt(5)$ 的值介于 2.23 和 2.24 之间，$sqrt(2)$ 的值介于 1.41 和 1.42 之间，求

(1) $sqrt(5) + sqrt(2)$ 的值介于哪两个数之间？

(2) $sqrt(5) - sqrt(2)$ 的值介于哪两个数之间？

（精确到 0.01）。

2. 已知 $a^2 + b^2 > 2a b$，$b^2 + c^2 > 2b c$，$c^2 + a^2 > 2c a$，求证

$ a^2 + b^2 + c^2 > a b + b c + c a ju $

3. 已知 $a < b$，$c < d$，能不能作出下面的判断？为什么？

(1) $a - d < b - c$；

(2) $a - c < b - d$。

4. 已知 $a - b < c$，$c < b$，求证

$ a - 2b < 0 ju $
]

*2. 不等式两边分别相乘和相除* 我们先来看下面的例子：

$ 5 > 3 dou quad 4 > 2 dou quad & "而" quad 5 times 4 > 3 times 2 fen \
  4 > 3 dou quad 6 > 5 dou quad & "而" quad 4 times 6 > 3 times 5 ju $

在这两个例子里我们看到：两个两边都是正数的同向不等式，如果把它们的两边分别相乘，可以得到一个和原不等式同向的不等式。

现在，我们来证明这个结论。

#rule(title: [性质])[
*性质 7.* 如果 $a > b$，$c > d$，并且 $a, b, c, d$ 都是正数，那么 $a c > b d$。
]

// p.48
#remark([分析])[仿照性质 5 的证法，先证出 $a c > b c$，$b c > b d$，由此证出 $a c > b d$。]

#sol(label: [证明])[#prf(
  ("", $because a > b dou quad c > 0 dou quad therefore a c > b c ju quad "（性质 4）"$, [(1)]),
  ([又], $because c > d dou quad b > 0 dou quad therefore b c > b d ju quad "（性质 4）"$, [(2)]),
  ([从 (1) 和 (2) 得], $a c > b d ju quad "（性质 2）"$, []))]

注意，这里如果没有 $b > 0$，$d > 0$ 这一条件，就不能作出一般的结论。例如：

$ 5 > -3 dou quad 1 > -2 dou quad & "这时" quad 5 times 1 < (-3) times (-2) fen \
  5 > -2 dou quad 1 > -2 dou quad & "这时" quad 5 times 1 > (-2) times (-2) ju $

所以只知道 $a > b$，$c > d$，就不能肯定 $a c$ 与 $b d$ 哪一个大。

对于两个异向不等式 $a > b$，$c < d$，即使知道了 $a, b, c, d$ 都是正数，一般也不能判断出 $a c$ 和 $b d$ 之间哪一个大。例如 $5 > 3$，$2 < 4$，这时 $5 times 2 < 3 times 4$；而 $5 > 3$，$2 < 3$，这时却有 $5 times 2 > 3 times 3$。

很明显，不等式的这个性质可以推广到任意多个（有限的）两边都是正数的同向不等式的情形。这就是说：

#edot[两个或者几个两边都是正数的同向不等式两边分别相乘，仍得同向不等式]。

#ex("例 3")[已知 $a > b > 0$，求证 $a^3 > b^3$。]

#sol(label: [证明])[因为 $a, b$ 都是正数，把下面这三个不等式：

$ a > b dou \ a > b dou \ a > b $

的两边分别相乘，就得到

$ a^3 > b^3 ju $]

为了研究两个不等式两边分别相除的问题，我们先引进不等式的下面这个性质。

// p.49
#rule(title: [性质])[
*性质 8.* 如果 $a > b$，$a, b$ 都是正数，那么 $1/a < 1/b$。
]

#sol(label: [证明])[因为 $a, b$ 都是正数，所以 $a b > 0$，因此 $1/(a b) > 0$。在不等式 $a > b$ 的两边同乘以正数 $1/(a b)$，得

$ a (1/(a b)) > b (1/(a b)) dou $

#lead([就是], $1/b > 1/a ju$)

$ therefore quad 1/a < 1/b ju quad "（性质 1）" $]

应用这个性质和性质 7，容易得出不等式的下面这个性质。

#rule(title: [性质])[
*性质 9.* 如果 $a > b$，$c < d$，$a, b, c, d$ 都是正数，那么

$ a/c > b/d ju $
]

#sol(label: [证明])[#prf(
  ("", $because c < d dou quad c, d "都是正数" dou$, []),
  ("", $therefore quad 1/c > 1/d ju quad "（性质 8）"$, []),
  ([又], $because a > b dou quad 1/c > 1/d dou quad a, b, 1/c, 1/d "都是正数" dou$, []),
  ("", $therefore quad a (1/c) > b (1/d) ju quad "（性质 7）"$, []),
  ([就是], $a/c > b/d ju$, []))]

不等式的这个性质就是说：#edot[两个两边都是正数的异向不等式两边分别相除，得到和被除的不等式同向的不等式]。

#ex("例 4")[已知一个圆和一个正方形有同样的周长，求证这个圆的面积大于这个正方形的面积。]

#sol(label: [证明])[设圆和正方形的周长都是 $p$。那么

// p.50
圆的半径 $r = p/(2 pi)$，圆的面积 $S = (p/(2 pi))^2 pi = p^2/(4 pi)$；

又，正方形一边的长 $a = p/4$，正方形的面积 $A = (p/4)^2$。

#prf(
  ("", $because pi < 4 dou quad "并且" pi "和" 4 "都是正数" dou$, []),
  ("", $therefore quad 1/pi > 1/4 ju quad "（性质 8）"$, []),
  ([又], $p^2/4 > 0 ju$, []),
  ("", $therefore quad p^2/4 dot 1/pi > p^2/4 dot 1/4 ju quad "（性质 4）"$, []),
  ([就是], $S > A ju$, []))

这就证明了有同样周长的圆的面积大于正方形的面积。]

#exercise("1·9(2)")[
1. 已知 $a + b > 2 sqrt(a b)$，$b + c > 2 sqrt(b c)$，$c + a > 2 sqrt(c a)$，且 $a, b, c$ 都是正数，求证：

$ (a + b)(b + c)(c + a) > 8a b c ju $

2. 如果 $a > b$，$c > d$，并且 $b > 0$，$d > 0$，能不能作出判断 $a c > b d$？为什么？

3. 如果 $a > b$，$c < d$，并且 $c, d$ 都不等于零，能不能作出判断 $a/c > b/d$？为什么？

4. $a > b$，$a, b$ 同号，那么 $1/a$ 和 $1/b$ 之间有怎样的关系？
]

*3. 不等式两边分别自乘同次方和开同次方* 在例 3 里我们曾看到，如果 $a > b$，$a$ 和 $b$ 都是正数，那么一定有 $a^3 > b^3$。很明显，这个结论可以推广到把不等式 $a > b$（$a > 0$，$b > 0$）的两边分别自乘 $n$ 次方的情形。这就是说，不等式有下面的性质：

// p.51
#rule(title: [性质])[
*性质 10.* 如果 $a > b$，$a, b$ 都是正数，$n$ 是自然数，那么

$ a^n > b^n ju $
]

现在，我们来看如果把不等式 $a > b$（$a > 0$，$b > 0$）两边分别开 $n$ 次方，将会有怎样的结果。先来看几个具体的例子：

$ 8 > 1 dou quad & "而" quad root(3, 8) > root(3, 1) fen \
  16 > 4 dou quad & "而" quad sqrt(16) > sqrt(4) ju $

从这两个例子可以看到，把两边都是正数的不等式两边分别开同次方，得到和原来不等式同向的不等式。就是说，不等式有下面的性质：

#rule(title: [性质])[
*性质 11.* 如果 $a > b$，$a, b$ 都是正数，$n$ 是大于 1 的整数，那么

$ root(n, a) > root(n, b) ju $
]

现在我们来证明这个性质。这个性质不容易直接证明，我们改用间接证法，就是证明：如果这个结论不对，那么就会引出矛盾。我们可以这样想：

$root(n, a)$ 和 $root(n, b)$ 只能有下面三种关系之一：

#cols[(1) 或者 $root(n, a) > root(n, b)$；][(2) 或者 $root(n, a) = root(n, b)$；]

(3) 或者 $root(n, a) < root(n, b)$。

要证明第 1 种关系成立，只需证明后面这两种关系都不成立。也就是要证明：如果后面这两种关系成立，就会引出矛盾。

#sol(label: [证明])[$root(n, a)$ 和 $root(n, b)$ 之间的关系，只可能是下面这三种情况之一：

#cols[(1) 或者 $root(n, a) > root(n, b)$；][(2) 或者 $root(n, a) = root(n, b)$；]

(3) 或者 $root(n, a) < root(n, b)$。

因为 $a, b$ 是正数，所以 $root(n, a)$，$root(n, b)$ 都是正数，如果 $root(n, a) = root(n, b)$，那么就有

// p.52
$ (root(n, a))^n = (root(n, b))^n dou $

#lead([就是], $a = b ju$)

这和已知条件 $a > b$ 矛盾，所以是不可能的。

如果 $root(n, a) < root(n, b)$，那么就有

$ (root(n, a))^n < (root(n, b))^n dou $

#lead([就是], $a < b ju$)

这也和已知条件 $a > b$ 矛盾，所以也是不可能的。

既然这两种关系都不能成立，所以一定有

$ root(n, a) > root(n, b) ju $]

#ex("例 5")[求证 $sqrt(6) + sqrt(7) > 2 sqrt(2) + sqrt(5)$。]

#sol(label: [证明])[$ (sqrt(6) + sqrt(7))^2 &= 13 + 2 sqrt(42) fen \ (2 sqrt(2) + sqrt(5))^2 &= 13 + 2 sqrt(40) ju $

#prf(tw: 5.5em,
  ("", $because 42 > 40 dou quad therefore sqrt(42) > sqrt(40) ju$, [（性质 11）]),
  ("", $therefore quad 2 sqrt(42) > 2 sqrt(40) dou$, [（性质 4）]),
  ("", $therefore quad 13 + 2 sqrt(42) > 13 + 2 sqrt(40) dou$, [（性质 3）]),
  ("", $therefore quad sqrt(13 + 2 sqrt(42)) > sqrt(13 + 2 sqrt(40)) dou$, [（性质 11）]),
  ([就是], $sqrt(6) + sqrt(7) > 2 sqrt(2) + sqrt(5) ju$, []))]

#exercise("1·9(3)")[
1. 如果 $a > b$，$n$ 是自然数，能不能作出判断 $a^n > b^n$？为什么？得到的结论和性质 10 中所讲的有什么不同？

2. 比较 $(-2)^n$ 和 $(-3)^n$ 的大小，这里 $n$ 是自然数。

［提示：分 $n$ 是偶数和奇数两种情况来研究。］

3. 求证：

#cols[(1) $sqrt(3) + sqrt(5) < 4$；][(2) $sqrt(2) + sqrt(3) < sqrt(10)$。]

4. 如果 $a > b$，$a, b$ 都是正数，$n$ 是自然数，求证：

$ a^(-n) < b^(-n) ju $

// p.53
5. 如果 $a > b$，$a, b$ 都是正数，$m, n$ 是自然数，并且 $n > 1$，求证：

$ a^(m/n) > b^(m/n) ju $
]

#heading(level: 2, numbering: star-heading-numbering)[无理不等式]

在代数第二册里，我们知道被开方数中有未知数的方程叫作无理方程。类似地，被开方数中有未知数的不等式就叫作*无理不等式*。例如：

$ sqrt(x - 2) < 2 dou \ sqrt(2 - x) > 3 dou \ sqrt(3x - 5) - sqrt(x - 4) > 0 dou $

等等，都是无理不等式。

一些简单的无理不等式，可以根据算术根的意义，和把不等式变形成有理不等式的方法，归结到解一元一次或二次不等式组来解。下面我们举几个例子来说明这种不等式的解法。

#ex("例 1")[解不等式

#eqno([(1)], $sqrt(x - 2) < 2 ju$)]

#remark([分析])[根据算术根的意义，要使 $sqrt(x - 2)$ 有意义，必须 $x - 2 >= 0$。在这种情况下，$sqrt(x - 2)$ 的值总不是负数。因此可以用两边同时平方的方法，把原不等式变形成一个有理不等式 $x - 2 < 4$。这样，解由不等式 $x - 2 >= 0$ 和 $x - 2 < 4$ 组成的不等式组，就可以得到原不等式的解。]

#sol[不等式 (1) 成立的条件是

$ cases(x - 2 >= 0 dou, x - 2 < 4 fen) $

#lead([就是], $cases(x >= 2 dou, x < 6 ju)$)

// p.54
这个不等式组的解是

$ 2 <= x < 6 ju $

所以原不等式的解是

$ 2 <= x < 6 ju $]

#ex("例 2")[解不等式

#eqno([(1)], $sqrt(3x - 5) - sqrt(x - 4) > 0 ju$)]

#sol[由 (1) 得

#eqno([(2)], $sqrt(3x - 5) > sqrt(x - 4) ju$)

这个不等式成立的条件是

#eqsys(($3x - 5 >= 0 dou$, [(3)]), ($x - 4 >= 0 dou$, [(4)]), ($3x - 5 > x - 4 fen$, [(5)]))

就是

#eqsys(($x >= 5/3 dou$, [(6)]), ($x >= 4 dou$, [(7)]), ($x > 1/2 ju$, [(8)]))

这个不等式组的解是

$ x >= 4 ju $

所以原不等式的解是

$ x >= 4 ju $]

#remark([注])[从这个例子可以看到，如果不考虑 $x$ 在什么条件下式子 $sqrt(3x - 5)$，$sqrt(x - 4)$ 有意义，仅仅从 $sqrt(3x - 5)$ 和 $sqrt(x - 4)$ 都不是负数，把不等式 (2) 的两边同时平方，再解不等式 (5)，就会引进增解。]

#exercise("1·10", star: true)[
解下列不等式：

// p.55
#cols[1. $sqrt(3x - 5) < 1/2$；][2. $sqrt(2 - x) - 3 > 0$；]
#cols[3. $sqrt(3x - 5) > sqrt(x + 4)$；][4. $sqrt(x - 4) - sqrt(3x - 5) > 0$；]
#cols[5. $sqrt(x^2 - x) < sqrt(2)$；][6. $sqrt(x^2 + 8x) - 3 > 0$。]
]

== 不等式的证明

我们来看下面这个问题：

一个系数是实数的一元二次方程

$ a x^2 + b x + c = 0 quad (a > 0) dou $

如果 $c$ 是负数，求证它一定有不相等的实数根。

解这个问题，只须证明不论 $a, b, c$ 表示什么实数，只要 $a > 0$，$c < 0$，方程的判别式

$ b^2 - 4a c $

总是正数，也就是不等式

$ b^2 - 4a c > 0 $

总能成立。这里要用到不等式的证明。

下面我们举例说明证明不等式的一些常用的方法。

#ex("例 1")[如果 $a > 0$，$c < 0$，求证

$ b^2 - 4a c > 0 ju $]

#sol(label: [证明])[因为

#prf(
  ("", $a > 0 dou quad c < 0 dou$, []),
  ("", $therefore quad 4a c < 0 dou$, []),
  ("", $therefore quad -4a c > 0 ju$, [(1)]))

又因不论 $b$ 是什么实数，$b^2$ 总不会是负数，就是

#eqno([(2)], $b^2 >= 0$)

把不等式 (1) 和 (2) 两边分别相加，得

// p.56
$ b^2 - 4a c > 0 ju $

这样就得到了证明。]

#remark([注])[一个代数式的各项的值如果都不是负数，而且其中至少有一项的值不是零，那么这个代数式的值总大于零。我们常常利用这个性质来证明不等式。]

#ex("例 2")[求证：不等式 $x^2 + x + 1 > 0$ 是绝对不等式。]

#sol(label: [证明])[$ x^2 + x + 1 &= x^2 + 2 dot x dot 1/2 + (1/2)^2 - (1/2)^2 + 1 \
  &= (x + 1/2)^2 + 3/4 ju $

#prf(
  ("", $because (x + 1/2)^2 >= 0 dou$, []),
  ("", $therefore quad (x + 1/2)^2 + 3/4 > 0 ju$, []))

所以，不论 $x$ 取什么实数值，不等式

$ x^2 + x + 1 > 0 $

都能成立。这也就是说：这个不等式是绝对不等式。]

#ex("例 3")[已知 $a$ 和 $b$ 是不相等的正数，求证：

$ (a + b)/2 > sqrt(a b) ju $]

#small[我们用几种不同的方法来证明。

(1) 第一种证法：把不等式左边的代数式减去右边的代数式，根据已知条件证明这个差总大于零。]

#sol(label: [证明 1])[#eqno([(1)], $(a + b)/2 - sqrt(a b) = (a + b - 2 sqrt(a b))/2 ju$)

因为已知 $a, b$ 都是正数，我们可以把 $a$ 和 $b$ 分别写作 $(sqrt(a))^2$ 和 $(sqrt(b))^2$。由此得

// p.57
#eqno([(2)], $ a + b - 2 sqrt(a b) &= (sqrt(a))^2 + (sqrt(b))^2 - 2 sqrt(a b) \
  &= (sqrt(a) - sqrt(b))^2 ju $)

因为 $a != b$，所以 $sqrt(a) - sqrt(b)$ 是不等于零的实数，

#eqno([(3)], $therefore quad (sqrt(a) - sqrt(b))^2 > 0 ju$)

从 (1)，(2) 和 (3) 得

#eqno([(4)], $(a + b)/2 - sqrt(a b) > 0 ju$)

#lead([由此可知], $(a + b)/2 > sqrt(a b) ju$)]

#remark([注])[这种证法，通常把它叫作*比较法*。]

#small[(2) 第二种证法：我们可以这样想，假定不等式

#eqno([(1)], $(a + b)/2 > sqrt(a b)$)

能够成立，那么就有

$ ((a + b)/2)^2 &> a b dou \ (a + b)^2 &> 4a b dou \ a^2 + 2a b + b^2 &> 4a b dou \ a^2 - 2a b + b^2 &> 0 dou $

#eqno([(2)], $(a - b)^2 > 0 ju$)

因为 $a, b$ 是不相等的正数，不等式 (2) 是能够成立的。所以如果能够从不等式 (2) 反过来推出不等式 (1)，那么问题就解决了。]

#sol(label: [证明 2])[因为 $a, b$ 是不相等的正数，所以

$ (a - b)^2 > 0 dou $

#lead([就是], $a^2 - 2a b + b^2 > 0 ju$)

在上式的两边各加上 $4a b$ 得

$ a^2 + 2a b + b^2 > 4a b dou $

#lead([就是], $(a + b)^2 > 4a b ju$)

两边同除以正数 4，得

// p.58
$ (a + b)^2/4 > a b ju $

因为不等式两边都是正数，我们分别取它们的算术平方根，得

$ (a + b)/2 > sqrt(a b) ju $]

#remark([\*注])[这个证法通常叫作综合法。应用这种证法，我们先要设法找出一个已知能够成立的不等式，然后逐步推出所要证明的不等式。

在这个例子里，为了找出作为出发点的不等式 $(a - b)^2 > 0$，我们在证明前，先假定所要证明的不等式能够成立，然后逐步推出这个所需要的不等式，这一思考过程叫作“分析”。

比较上面的“分析”和“证明”这两个步骤，可以看到，在这两个步骤里，我们思考的顺序恰巧是相反的。

在应用综合法的时候，如果作为出发点的不等式能够直接观察出来，那么“分析”的步骤就可略去。]

#ex("例 4")[(1) 求证：$a^2 + b^2 + c^2 >= a b + b c + c a$。

#h(2.2em)\(2) 上式等号在什么时候成立？]

#sol(label: [证明])[因为任何实数的平方都不是负数，所以

$ (a - b)^2 >= 0 dou quad (b - c)^2 >= 0 dou quad (c - a)^2 >= 0 ju $

等号仅在 $a = b = c$ 时成立。

因此，$a^2 + b^2 >= 2a b$，$b^2 + c^2 >= 2b c$，$c^2 + a^2 >= 2c a$。

把这三个不等式的两边分别相加，得

$ 2a^2 + 2b^2 + 2c^2 >= 2a b + 2b c + 2c a ju $

两边都除以正数 2，得

$ a^2 + b^2 + c^2 >= a b + b c + c a ju $

等号仅在 $a = b = c$ 时成立。]

#ex("例 5")[如果 $a$ 和 $b$ 都是正数，或者都是负数。求证：

$ a/b + b/a >= 2 ju $]

// p.59
#sol(label: [证明])[不论 $a$ 和 $b$ 是什么实数，都有

$ (a - b)^2 >= 0 dou $

#lead([就是], $a^2 + b^2 >= 2a b ju$)

因为两个正数或者两个负数的积总是正数，所以 $a b > 0$。以正数 $a b$ 除上式的两边，得

$ (a^2 + b^2)/(a b) >= 2 dou $

#lead([就是], $a/b + b/a >= 2 ju$)]

#remark([注])[这个例子里如果再加上一个条件 $a != b$，那么有 $a/b + b/a > 2$。]

#exercise("1·11")[
1. 已知 $a != 1$，求证：

#cols[(1) $a^2 > 2a - 1$；][(2) $(2a)/(1 + a^2) < 1$。]

2. 已知 $x$ 是不等于 1 的正数，求证：

$ x + 1/x > 2 ju $

3. 已知 $a, b$ 是不相等的正数，求证：

(1) $(a + b)(a^(-1) + b^(-1)) > 4$；

(2) $a^3 + b^3 > a^2 b + a b^2$；

(3) $(a + b)(a^2 + b^2)(a^3 + b^3) > 8a^3 b^3$。

4. 求证：

#cols[(1) $x^2 - x + 1 >= 3/4$；][(2) $1 - x - x^2 <= mx(1, 1, 4)$。]
]
