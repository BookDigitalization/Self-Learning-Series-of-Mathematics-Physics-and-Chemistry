// 第 7 章（续）§7·3 常用对数的求法
// （原书 p.258–267：§7·3 标题在 p.258 中部，p.258 上部是习题 7·2，不在本文件；
// 到习题 7·3(4) 结束（p.267 上部），§7·4 标题在 p.267 中部，不在本文件）
#import "/common/series.typ": *

// 局部：竖式加减乘。每行 (运算符, 数, 其下是否画线, 右侧说明)，运算符、数右对齐。
#let vs(..rows) = {
  let items = ()
  for (i, r) in rows.pos().enumerate() {
    items.push(r.at(0))
    items.push(r.at(1))
    items.push(r.at(3))
    if r.at(2) { items.push(grid.hline(y: i + 1, start: 0, end: 2, stroke: 0.5pt)) }
  }
  align(center, block(breakable: false, above: 0.8em, below: 0.8em, grid(
    columns: (auto, auto, auto), align: (right, right, left),
    column-gutter: 0.5em, inset: (y: 0.3em),
    ..items)))
}

// 局部：竖式除法，如 3 | 3̄.1457 / 1̄.0486。
#let ld(d, n, r) = align(center, block(breakable: false, above: 0.8em, below: 0.8em, grid(
  columns: (auto, auto), align: (right, left), inset: (x: 0.4em, y: 0.3em),
  d, grid.cell(stroke: (left: 0.5pt, bottom: 0.5pt), n),
  [], r)))

// 局部：写成“标签 = 数”的竖式行。每行 (标签, 值, 右侧符号, 其下是否画线)，画线横跨标签和值两列。
#let lc(..rows) = {
  let items = ()
  for (i, r) in rows.pos().enumerate() {
    items.push(r.at(0))
    items.push(r.at(1))
    items.push(r.at(2))
    if r.at(3) { items.push(grid.hline(y: i + 1, start: 0, end: 2, stroke: 0.5pt)) }
  }
  grid(columns: (auto, auto, auto), align: (right, left, left),
    column-gutter: 0.3em, inset: (y: 0.3em), ..items)
}

// 局部：小字块（“注”之类较长说明里的引文用不到，这里只给 lc 外包一层居中、不分页的块）
#let lcb(body) = align(center, block(breakable: false, above: 0.8em, below: 0.8em, body))

// p.258
== 常用对数的求法

*1. 求一个数的常用对数* 从 §7·1 和 §7·2 知道，求一个数 $N$ 的常用对数，可以分成两个步骤：第一步是先通过观察来写出它的首数；第二步是利用对数表找出它的尾数。

#ex("例 1")[求下面这些数的对数：]

#align(center, $280.9 fen quad 33.46 fen quad 0.8317 fen quad 0.0548 ju$)

#sol[$ lg 280.9 &= 2.4486 fen \ lg 33.46 &= 1.5245 fen \ lg 0.8317 &= overline(1).9200 fen \ lg 0.0548 &= overline(2).7388 ju $]

#remark([说明])[同时求几个数的对数的时候，不妨先写下它们的首数，然后再一起查表。在查表时，也可根据真数的第一个有效数字的大小顺序来进行，以免忙乱。例如在解这个题目时，不妨先写下首数 $2, 1, overline(1), overline(2)$，然后再按照 2809，3346，548，8317 的顺序来查表求尾数。]

#note-small[因为要表示 $lg 0.8317$ 中 $overline(1).9200$ 是精确到 0.0001 的近似值，所以小数部分最后两个“0”不要删去。]

// p.259
#exercise("7·3(1)")[
求下面这些数的对数：

1.
#cols[(1) 5；][(2) 7；][(3) 13；]
#cols[(4) 78；][(5) 125；][(6) 240；]
#cols[(7) 749；][(8) 989。][]

2.
#cols[(1) 0.7；][(2) 0.015；][(3) 0.497；]
#cols[(4) 0.0567；][(5) 4.09；][(6) 1.02；]
#cols[(7) 0.0084；][(8) 0.000809。][]

3.
#cols[(1) 543.6；][(2) 7132；][(3) 15.08；]
#cols[(4) 2.197；][(5) 0.04536；][(6) 0.9032；]
#cols[(7) 167400；][(8) 638400。][]

4.
#cols[(1) 24868；][(2) 1.7384；][(3) 32.1435；]
#cols[(4) 286.74；][(5) 0.06835；][(6) 3.1416；]
#cols[(7) 1.4142；][(8) 152.95。][]

5.
#cols[(1) $1.34 times 10^5$；][(2) $2.035 times 10^8$；]
#cols[(3) $7.64 times 10^(-3)$；][(4) $4.1356 times 10^(-4)$。]
]

*2. 求积、商、幂的对数* 我们来看下面的例子：

#ex("例 2")[求 $125 times 2.87$ 的对数。]

#analysis[因为 $lg M N = lg M + lg N$，所以这个积的对数，就是 $lg 125$ 与 $lg 2.87$ 的对数的和。]

// 疑似原书错误（p.259，待项目负责人确认）：原书此处印作 x=125×0.287，应为 125×2.87，现照扫描录入
#sol[设 $x = 125 times 0.287$，那么

$ lg x = lg (125 times 2.87) = lg 125 + lg 2.87 ju $

#lcb(lc(
  ($lg 125 =$, $2.0969$, [], false),
  ($lg 2.87 =$, $0.4579$, [$(+$], true),
  ($lg x =$, $2.5548$, [], false)))]

#answer-line[答：所求的对数是 2.5548。]

#ex("例 3")[求 $12.5 div 2.87$ 的对数。]

// p.260
#analysis[因为 $lg M / N = lg M - lg N$，所以这个商的对数就是 $lg 12.5$ 和 $lg 287$ 的差。]
// 疑似原书错误（p.260，待项目负责人确认）：原书此处印作 lg 287，应为 lg 2.87，现照扫描录入

#sol[设 $x = 12.5 div 2.87$，那么

$ lg x = lg 12.5 / 2.87 = lg 12.5 - lg 2.87 ju $

#lcb(lc(
  ($lg 12.5 =$, $1.0969$, [], false),
  ($lg 2.87 =$, $0.4579$, [$(-$], true),
  ($lg x =$, $0.6390$, [], false)))]

#answer-line[答：所求的对数是 0.6390。]

#ex("例 4")[求 $(12.5)^3$ 和 $root(3, 12.5)$ 的对数。]

#analysis[因为 $lg M^alpha = alpha lg M$，所以这里所求的对数可以从 $lg 12.5$ 的对数乘以 3 及 $1/3$ 求得。]

#sol[(1) 设 $x = (12.5)^3$，那么

$ lg x &= lg (12.5)^3 = 3 lg 12.5 \ &= 1.0969 times 3 = 3.2907 ju $

(2) 设 $y = root(3, 12.5)$，那么

$ lg y &= lg root(3, 12.5) = lg (12.5)^(1/3) = 1/3 lg 12.5 \ &= 1/3 times 1.0969 \ &= 0.3656 ju $]

#answer-line[答：$(12.5)^3$ 的对数是 3.2907；$root(3, 12.5)$ 的对数是 0.3656。]

#note-small[尾数部分只要求出四位小数的近似值。]

#exercise("7·3(2)")[
求下列各题中这些积、商、幂及算术根的对数：

1.
#cols[(1) $24.5 times 1.57$；][(2) $1.046 times 2.86$；]
#cols[(3) $4.134 times 15.48$；][(4) $12.78 times 3.392$。]

// p.261
2.
#cols[(1) $41.34 div 15.48$；][(2) $10.46 div 2.86$；]
#cols[(3) $12.78 div 3.392$；][(4) $24.5 div 15.7$。]

3.
#cols[(1) $8.54^2$；][(2) $2.036^3$；]
#cols[(3) $root(3, 15.36)$；][(4) $sqrt(3.1416)$。]
]

*3. 首数是负数的对数的运算* 从上面的例子看到，求积、商、幂的对数，可归结为对数的加法、减法，或者对数与一个数的乘（或者除）法。当对数的首数是正数或零的时候，这些运算是通常的运算，但是我们常会遇到对数的首数是负数的情形，所以我们还要学会首数是负数的对数的运算。举例如下：

(1) 对数的加法：例如，我们要求对数 $overline(2).0969$ 与 $overline(1).4579$ 的和，这就是要求 $-2 + 0.0969$ 与 $-1 + 0.4579$ 的和。这时，我们应把加数的首数和尾数分别相加，再把结果合并起来，列成直式，就是

#vs(
  ([], $overline(2).0969$, false, []),
  ($+$, $overline(1).4579$, true, []),
  ([], $overline(3).5548$, false, []))

又如，我们要求对数 $overline(2).0969$，$overline(1).4579$ 与 $1.6789$ 的和，仍和上面一样，先把各个加数中首数和尾数分别相加，再把结果合并起来，但是这里各个尾数十分位上的和超过了 10，要进位到首数上去，列成直式，就是

#vs(
  ([], $overline(2).0969$, false, []),
  ([], $overline(1).4579$, false, []),
  ($+$, $1.6789$, true, []),
  ([], $overline(1).2337$, false, [（注意，$overline(2) + overline(1) + 1 + 1 = overline(1)$）]))

(2) 对数的减法：例如，我们要求对数 $overline(2).9969$ 减去对数 $overline(1).4579$ 的差，这就是要求

$ (-2 + 0.9969) - (-1 + 0.4579) $

// p.262
的差，根据有理数减法的性质，我们可以把首数、尾数分别做减法，再把结果合并起来，就是求

$ [(-2) - (-1)] + (0.9969 - 0.4579) dou $

于是得出结果是 $-1 + 0.5390$ 就是 $overline(1).5390$。列成直式，就是

#vs(
  ([], $overline(2).9969$, false, []),
  ($-$, $overline(1).4579$, true, []),
  ([], $overline(1).5390$, false, [（注意，$overline(2) - overline(1) = overline(1)$）]))

又如，要求对数 $overline(2).0969$ 减去对数 $overline(3).4579$ 的差，仍照上面方法来做，但是因为这里被减数的尾数比减数的尾数小，先要从首数退下 1 来再减，列成直式，就是

#vs(
  ([], $overline(2).0969$, false, []),
  ($-$, $overline(3).4579$, true, []),
  ([], $0.6390$, false, [（注意，$overline(2) - 1 - overline(3) = 0$）]))

(3) 对数的乘法：例如，我们要求对数 $overline(1).4579$ 乘以数 3 的积，这就是要求

$ (-1 + 0.4579) times 3 ju $

应用乘法对加法的分配律，得到

$ overline(1).4579 times 3 &= (-1 + 0.4579) times 3 \ &= (-1 times 3) + (0.4579 times 3) \ &= -3 + 1.3737 \ &= (-3 + 1) + 0.3737 \ &= -2 + 0.3737 \ &= overline(2).3737 ju $

为了简便，我们仍把它写成直式，就是

#vs(
  ([], $overline(1).4579$, false, []),
  ($times$, $3$, true, []),
  ([], $overline(2).3737$, false, []))

// p.263
（注意，尾数十分位上的数乘以 3 超过 10 要进位到首数上去，#h(0.3em) $overline(1) times 3 + 1 = overline(3) + 1 = overline(2)$。）

又如，我们要求对数 $overline(3).4579$ 乘以 24 的积，可以这样来算。

// 疑似原书错误（p.263，待项目负责人确认）：原书末行印作 62̄.9869，按 −72+10.9896=−61.0104 应为 62̄.9896，现照扫描录入
$ overline(3).4579 times 24 &= (-3 + 0.4579) times 24 \ &= -72 + 10.9896 \ &= overline(62).9869 ju $

(4) 对数的除法：例如我们要求 $overline(3).1457 div 3$，应用除法的运算性质，得到

$ overline(3).1457 div 3 &= (-3 + 0.1457) div 3 \ &= (-3 div 3) + (0.1457 div 3) \ &= -1 + 0.0486 \ &= overline(1).0486 ju $

列成直式，就是

#ld($3$, $overline(3).1457$, $overline(1).0486$)

但是，如果遇到被除数的首数不能被除数整除的时候，那就要先把被除数化成能被除数整除的一个负数与一个正数的和的形式，然后再做。例如

$ overline(3).1457 div 8 &= (-8 + 5.1457) div 8 \ &= -1 + 0.6432 \ &= overline(1).6432 $

我们也可用直式来做，写成

#ld($8$, $overline(3).1457$, $overline(1).6432$)

#align(center)[（注意，$overline(1) times 8 = overline(8)$，$overline(3) - overline(8) = 5$，把 5 并到尾数部分再除）]

#exercise("7·3(3)")[
计算：

1.
#cols[(1) $overline(1).5436 + 2.3892$；][(2) $overline(1).1546 + overline(2).9835$；]
// p.264
#cols[(3) $0.7658 - overline(1).3456$；][(4) $overline(1).2396 - 0.7459$；]
#cols[(5) $0.1548 - overline(1).2836$；][(6) $overline(1).1631 - overline(1).9448$；]
#cols[(7) $overline(2).1271 - overline(3).2348$；][(8) $1 - overline(1).2812$。]

2.
#cols[(1) $overline(1).2432 times 3$；][(2) $overline(1).9272 times 2$；]
#cols[(3) $overline(2).2817 div 2$；][(4) $overline(1).1536 div 3$；]
#cols[(5) $overline(1).7235 div 4$；][(6) $overline(2).6483 div 3$；]
#cols[(7) $overline(2).1562 times 2/3$；][(8) $overline(1).5678 times 3/4$。]
]

#ex("例 5")[求下列这些式子的对数：]

#cols[(1) $x = 0.1357 times 0.086 times 14.58$；][(2) $y = 0.1357 / 14.58$；]
#cols[(3) $z = (0.086)^3$；][(4) $t = sqrt(0.1357)$。]

#sol[(1) 取对数：$lg x = lg 0.1357 + lg 0.086 + lg 14.58$。列出直式：

#align(center, block(breakable: false, above: 0.8em, below: 0.8em, stroke: (dash: "dotted", thickness: 0.6pt), inset: (x: 1.2em, y: 0.6em), lc(
  ($lg 0.1357 =$, $overline(1).$, [], false),
  ($lg 0.086 =$, $overline(2).$, [], false),
  ($lg 14.58 =$, $1.$, [$(+$], true),
  ($lg x =$, [], [], false))))

查表，把各个对数尾数填上去，然后再做加法

#lcb(lc(
  ($lg 0.1357 =$, $overline(1).1326$, [], false),
  ($lg 0.086 =$, $overline(2).9345$, [], false),
  ($lg 14.58 =$, $1.1638$, [$(+$], true),
  ($therefore lg x =$, $overline(1).2309$, [], false)))

(2) 取对数：$lg y = lg 0.1357 - lg 14.58$。

// p.265
列式，计算：

#lcb(lc(
  ($lg 0.1357 =$, $overline(1).1326$, [], false),
  ($lg 14.58 =$, $1.1638$, [$(-$], true),
  ($therefore lg y =$, $overline(3).9688$, [], false)))

(3) $lg z = 3 times lg 0.086$。

#lcb(lc(
  ($lg 0.086 =$, $overline(2).9345$, [], false),
  ([], align(right, $3$), [$(times$], true),
  ($therefore lg z =$, $overline(4).8035$, [], false)))

(4) $lg t = 1/2 lg 0.1357$。

#lcb(lc(
  ($2 bar.v lg 0.1357 =$, $overline(1).1326$, [], true),
  ($therefore lg t =$, $overline(1).5663$, [], false)))]

#note-small[在熟练以后，第一步取对数的横式可以不写出来，直接写成直式来计算。解题时最好像 (1) 那样先列出直式，把对数的首数写好，再一起查表，填上尾数，然后进行计算。这样有计划地进行，不但可以省事，而且也不易发生错误。]

#ex("例 6")[求下式的对数：]

$ x = (0.1357 times sqrt(0.086)) / (14.58)^3 ju $

#sol[第一步，先取对数，得到

$ lg x &= lg (0.1357 times sqrt(0.086)) / (14.58)^3 \ &= (lg 0.1357 + lg sqrt(0.086)) - lg (14.58)^3 \ &= (lg 0.1357 + 1/2 lg 0.086) - 3 lg 14.58 ju $

第二步，列出直式

// p.266
#lcb(grid(
  columns: (auto, auto),
  stroke: (x, y) => if x == 1 { (left: (dash: "dashed", thickness: 0.5pt)) },
  inset: (x: 1.2em, y: 0.2em),
  lc(
    ($lg 0.1357 =$, $overline(1).$, [], false),
    ($1/2 lg 0.086 =$, [], [$(+$], true),
    ([], [], [], false),
    ($3 lg 14.58 =$, [], [$(-$], true),
    ($lg x =$, [], [], false)),
  lc(
    ($2 bar.v lg 0.086 =$, $overline(2).$, [], true),
    ($1/2 lg 0.086 =$, [], [], false),
    ([], [], [], false),
    ($lg 14.58 =$, $1.$, [], false),
    ([], align(right, $3$), [$(times$], true),
    ($3 lg 14.58 =$, [], [], false))))

（这里虚线右边是中间步骤的计算）。

第三步，查对数表，求出尾数，填到写出首数的各行中去，得到下面的式子：

#lcb(grid(
  columns: (auto, auto),
  stroke: (x, y) => if x == 1 { (left: (dash: "dashed", thickness: 0.5pt)) },
  inset: (x: 1.2em, y: 0.2em),
  lc(
    ($lg 0.1357 =$, $overline(1).1326$, [], false),
    ($1/2 lg 0.086 =$, [], [$(+$], true),
    ([], [], [], false),
    ($3 lg 14.58 =$, [], [$(-$], true),
    ($lg x =$, [], [], false)),
  lc(
    ($2 bar.v lg 0.086 =$, $overline(2).9345$, [], true),
    ($1/2 lg 0.086 =$, [], [], false),
    ($lg 14.58 =$, $1.1638$, [], false),
    ([], align(right, $3$), [$(times$], true),
    ($3 lg 14.58 =$, [], [], false))))

第四步，做中间步骤的计算，把结果填到左边的相应地方，最后算出如下式表示的结果：

#lcb(grid(
  columns: (auto, auto),
  stroke: (x, y) => if x == 1 { (left: (dash: "dashed", thickness: 0.5pt)) },
  inset: (x: 1.2em, y: 0.2em),
  lc(
    ($lg 0.1357 =$, $overline(1).1326$, [], false),
    ($1/2 lg 0.086 =$, $overline(1).4673$, [$(+$], true),
    ([], $overline(2).5999$, [], false),
    ($3 lg 14.58 =$, $3.4914$, [$(-$], true),
    ($therefore lg x =$, $overline(5).1085$, [], false)),
  lc(
    ($2 bar.v lg 0.086 =$, $overline(2).9345$, [], true),
    ($1/2 lg 0.086 =$, $overline(1).4673$, [], false),
    ($lg 14.58 =$, $1.1638$, [], false),
    ([], align(right, $3$), [$(times$], true),
    ($3 lg 14.58 =$, $3.4914$, [], false))))]

#answer-line[答：所求的对数是 $overline(5).1085$。]

#note-small[实际做这个题目的时候，当然只需应用第四步最后的那种式子。]

// p.267
#exercise("7·3(4)")[
求下列这些式子的对数：

1.
#cols[(1) $0.046 times 2.86$；][(2) $4.134 div 0.1548$；]
#cols[(3) $root(3, 0.1536)$；][(4) $(0.273)^5$。]

2.
#cols[(1) $(103.8 times 20.97) / (5.174 times 13.62)$；][(2) $(9.738 times 21.09) / (48.72 times 0.8478)$；]
#cols[(3) $0.156 times root(5, 35.74)$；][(4) $root(3, (0.1532^2) / 2.74)$。]
]
