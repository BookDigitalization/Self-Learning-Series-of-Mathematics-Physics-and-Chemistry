// 第 2 章 任意角的三角函数（续）：§2·8–§2·12、本章提要、复习题二（原书 p.66–92）
#import "/common/series.typ": *
#import "/books/trigonometry/figures/c2b-figs.typ": fig-c2b-2-25, fig-c2b-2-26

// 局部辅助：原书用粗体排的公式组、整段粗体（含公式）
#let c2b-b(body) = {
  set text(weight: "bold")
  body
}
// 局部辅助：原书小号字的说明段
#let c2b-small(body) = block(above: 0.8em, below: 0.8em, width: 100%, {
  set text(size: 9.8pt)
  body
})
// 局部辅助：诱导公式表（左上角斜线表头“函数／角”，六种函数各一列）
#let c2b-diag = box(width: 4.6em, height: 2.6em, {
  place(top + left, line(start: (0pt, 0pt), end: (4.6em, 2.6em), stroke: 0.5pt))
  place(top + right, dx: -0.2em, dy: 0.2em, text(size: 9pt)[函数])
  place(bottom + left, dx: 0.3em, dy: -0.2em, text(size: 9pt)[角])
})
#let c2b-ftable(..rows) = {
  let rs = rows.pos()
  let n = rs.len()
  block(width: 100%, breakable: false, above: 1em, below: 1em, align(center, text(size: 9.5pt, table(
    columns: 7,
    align: (x, y) => if y == 0 { center + horizon } else if x == 0 { right + horizon } else { right + horizon },
    inset: (x, y) => if x == 0 and y == 0 { 0pt } else { (x: 0.5em, y: 0.45em) },
    stroke: (x, y) => (
      top: if y == 0 { 1.2pt } else if y == 1 { 0.6pt } else { none },
      bottom: if y == n { 1.2pt } else { none },
      left: if x > 0 { 0.5pt } else { none },
    ),
    c2b-diag, [正#h(1em)弦], [余#h(1em)弦], [正#h(1em)切], [余#h(1em)切], [正#h(1em)割], [余#h(1em)割],
    ..rs.flatten(),
  ))))
}

// p.66
== $-alpha$ 与任意角 $alpha$ 的三角函数间的关系

我们已经解决了求任意正角的三角函数值的问题。剩下来的问题是：怎样求负角的三角函数值？

在这一节中，我们要对于任意角 $alpha$，推出 $-alpha$ 与 $alpha$ 的三角函数间的关系，然后应用所得的公式，化负角的三角函数为正角的三角函数。

我们知道，不论 $alpha$ 是正角还是负角，$-alpha$ 和 $alpha$ 是射线按两个相反方向旋转同样的角度所产生的。因此，当 $alpha$ 和 $-alpha$ 有公共顶点并且取它们的公共始边为 $x$ 轴的正方向时，它们的终边一定对称于 $x$ 轴，如图 2·25 中所画的。

在 $alpha$ 的终边和 $-alpha$ 的终边上分别取点 $P$ 和 $P_1$，使 $O P = O P_1 = r$。经过 $P$ 和 $P_1$ 作 $x$ 轴的垂线 $M P$ 和 $M_1 P_1$。那么，/* p.67 */$M$ 和 $M_1$ 必定重合。因此，设点 $P$ 的坐标是 $(x, y)$，点 $P_1$ 的坐标就是 $(x, -y)$。

#fig("2·25", fig-c2b-2-25())[]

根据三角函数的定义，得

$ sin alpha &= y/r dou & quad sin(-alpha) &= (-y)/r = -y/r fen \
  /* p.68 */cos alpha &= x/r dou & quad cos(-alpha) &= x/r fen \
  tan alpha &= y/x dou & quad tan(-alpha) &= (-y)/x = -y/x fen \
  cot alpha &= x/y dou & quad cot(-alpha) &= x/(-y) = -x/y fen \
  sec alpha &= r/x dou & quad sec(-alpha) &= r/x fen \
  csc alpha &= r/y dou & quad csc(-alpha) &= r/(-y) = -r/y ju $

所以

#c2b-b($ sin(-alpha) &= -sin alpha dou \
  cos(-alpha) &= cos alpha dou \
  tan(-alpha) &= -tan alpha dou \
  cot(-alpha) &= -cot alpha dou \
  sec(-alpha) &= sec alpha dou \
  csc(-alpha) &= -csc alpha ju $)

#ex("例")[查表求 $cot(-1596°)$。]

#sol[(1) 先化成正角的三角函数，得
  $ cot(-1596°) = -cot 1596° ju $

  (2) 其次，化成小于 $360°$ 的正角的三角函数，得
  $ -cot 1596° = -cot(4 times 360° + 156°) = -cot 156° ju $

  (3) 再化成锐角的三角函数，得
  $ -cot 156° &= -cot(180° - 24°) \
    &= -(-cot 24°) = cot 24 ju $

  (4) 查表得
  $ cot 24° = 2.246 ju $
  $ therefore quad cot(-1596°) = 2.246 ju $
]

// p.69
在 §2·7，§2·8 和本节中，我们得到了五组公式。这些公式可以列成下表：

#c2b-ftable(
  ($n dot 360° + alpha$, $sin alpha$, $cos alpha$, $tan alpha$, $cot alpha$, $sec alpha$, $csc alpha$),
  ($180° - alpha$, $sin alpha$, $-cos alpha$, $-tan alpha$, $-cot alpha$, $-sec alpha$, $csc alpha$),
  ($180° + alpha$, $-sin alpha$, $-cos alpha$, $tan alpha$, $cot alpha$, $-sec alpha$, $-csc alpha$),
  ($360° - alpha$, $-sin alpha$, $cos alpha$, $-tan alpha$, $-cot alpha$, $sec alpha$, $-csc alpha$),
  ($-alpha$, $-sin alpha$, $cos alpha$, $-tan alpha$, $-cot alpha$, $sec alpha$, $-csc alpha$),
)

为了便于记忆，从这张表可以归纳出下面这句话：

#c2b-b[$n dot 360° + alpha$，$180° plus.minus alpha$，$360° - alpha$，$-alpha$ 的三角函数，等于角 $alpha$ 的同函数的值，放上 $alpha$ 是锐角时，原来的函数在相应象限内的符号。]

#exercise("2·8")[
1. 求下列各式的值：

(1) $sin 420° cos 390° + cos(-300°) sin(-330°)$；

(2) $tan(-840°) sec(-900°) + sin(-405°) cot(-510°)$；

(3) $sin^2(-990°) + csc^2(-300°)$。

2. 化简 $((a^2 - b^2) cot(180° - x))/cos(180° + x) + ((a^2 + b^2) tan(90° - x))/cot(180° - x)$。

3. 化简 $sin(-A)/sin(A - 180°) - tan(A - 90°)/cot(A - 360°) + cos(-A - 180°)/sin(A - 90°)$。

4. 查表求下列各三角函数的值：

(1) $sin(-837°)$；#gap (2) $cos(-791°)$；#gap (3) $cot(-1112°31')$。

5. 设 $alpha = -240°$，验证下列等式：

#cols[(1) $tan 2 alpha = (2 tan alpha)/(1 - tan^2 alpha)$；][(2) $2 cos^2 alpha/2 = 1 + cos alpha$；]

(3) $tan alpha/2 = (1 - cos alpha)/(sin alpha)$。

// p.70
6. 求证 $cos beta + sqrt(3) sin beta$
$ = 2[sin(-210°) cos(-beta) + cos(-210°) sin(-beta)] ju $

7. 如果 $-360° < alpha < 0°$，求满足下列等式的 $alpha$：

(1) $sin alpha = -1/2$；#gap (2) $tan alpha = sqrt(3)$；#gap (3) $sec(-alpha) = sqrt(2)$。
]

== 已知一个三角函数的值，求角

我们已经能够求任意的正角或者负角的三角函数值。现在研究相反的问题：怎样求得具有已知三角函数值的一切角。

*1. 已知的三角函数值是正数*

#ex("例 1.")[已知 $sin x = 0.2385$，求 $x$。]

#sol[因为已知 $sin x$ 的值是正的，所以 $x$ 的终边在第一象限或者第二象限内。]

先求正弦等于 $0.2385$ 的 $0°$ 到 $360°$ 的角。

查表得 $sin 13°48' = 0.2385$。

所以第一个角是 $x_1 = 13°48'$。

因为 $sin(180° - 13°48') = sin 13°48' = 0.2385$，所以第二个角是 $x_2 = 180° - 13°48' = 166°12'$。

要写出和这两个角终边相同的一切角，只要每一个都加上 $n dot 360°$（$n$ 是整数）。因此，正弦等于 $0.2385$ 的一切角是

$ x &= n dot 360° + 13°48' dou \
  x &= n dot 360° + 166°12' ju $

#ex("例 2.")[已知 $cos x = 2/3$，求 $x$。]

#sol[因为已知 $cos x$ 的值是正的，所以 $x$ 的终边在第一/* p.71 */象限或者第四象限内。]

先求余弦等于 $2/3$ 的 $0°$ 到 $360°$ 的角。

查表得 $cos 48°11' = 0.6667 = 2/3$。

所以第一个角是 $x_1 = 48°11'$。

因为 $cos(360° - 48°11') = cos 48°11' = 2/3$，所以第二个角是 $x_2 = 360° - 48°11' = 311°49'$。

因此，余弦等于 $2/3$ 的一切角是

$ x &= n dot 360° + 48°11' dou \
  x &= n dot 360° + 311°49' ju $

#ex("例 3.")[已知 $tan x = 2$，求 $x$。]

#sol[因为已知 $tan x$ 的值是正的，所以 $x$ 的终边在第一象限或者第三象限内。]

先求正切等于 2 的 $0°$ 到 $360°$ 的角。

查表得 $tan 63°26' = 2$。

所以第一个角是 $x_1 = 63°26'$。

因为 $tan(180° + 63°26') = tan 63°26' = 2$，所以第二个角是 $x_2 = 180° + 63°26' = 243°26'$。

因此，正切等于 2 的一切角是

$ x &= n dot 360° + 63°26' dou \
  x &= n dot 360° + 243°26' ju $

*2. 已知的三角函数值是负数*

#ex("例 4.")[已知 $sin x = -0.6372$，求 $x$。]

#sol[因为已知 $sin x$ 的值是负的，所以 $x$ 的终边在第三/* p.72 */象限或者第四象限内。]

先求正弦等于 $-0.6372$ 的 $0°$ 到 $360°$ 的角。

查表得 $sin 39°35' = +0.6372$。

因为 $sin(180° + 39°35') = -sin 39°35' = -0.6372$，所以第一个角是 $x_1 = 180° + 39°35' = 219°35'$。

又因为 $sin(360° - 39°35') = -sin 39°35' = -0.6372$，所以第二个角是 $x_2 = 360° - 39°35' = 320°25'$。

因此满足 $sin x = -0.6372$ 的一切角是

$ x &= n dot 360° + 219°35' dou \
  x &= n dot 360° + 320°25' ju $

#ex("例 5.")[已知 $cot x = -5/3$，求 $x$。]

#sol[因为已知 $cot x$ 的值是负的，所以 $x$ 的终边在第二象限或者第四象限内。]

先求余切等于 $-5/3$ 的 $0°$ 到 $360°$ 的角。

查表得 $cot 30°58' = 1.6667 = 5/3$。

因为 $cot(180° - 30°58') = -cot 30°58' = -5/3$，所以第一个角是 $x_1 = 180° - 30°58' = 149°2'$。

又因为 $cot(360° - 30°58') = -cot 30°58' = -5/3$，所以第二个角是 $x_2 = 360° - 30°58' = 329°2'$。

// 原书此处分母印得模糊，似“8”，按上文与题设作 3
因此，满足 $cot x = -5/3$ 的一切角是

$ x &= n dot 360° + 149°2' dou \
  x &= n dot 360° + 329°2' ju $

// p.73
#exercise("2·9")[
1. 求满足下列各等式的角 $x$ 的一切值：

#cols[(1) $cos x = 0$；][(2) $sin x = sin 33°50'$；]

#cols[(3) $tan x = -1$；][(4) $cot x = tan 54°15'$。]

2. 查表求满足下列各等式中的角 $x$ 的一切值：

#cols[(1) $sin x = -0.1532$；][(2) $cos x = -0.8342$；]

#cols[(3) $tan x = -sin 82°35'$；][(4) $cot x = -cos 201°43'$。]

3. 将下列各式化成锐角 $alpha$ 的函数：

#cols[(1) $sin(900° + alpha)$；][(2) $sin(1080° - alpha)$；]

#cols[(3) $cos(990° - alpha)$；][(4) $tan(1620° + alpha)$；]

#cols[(5) $cot(1800° - alpha)$；][(6) $sec(alpha - 810°)$。]

\*4. 查表求下列各式中的角 $x$ 的一切值：

(1) $sin 2x = 0.8351$；

(2) $sin x = sin(180° + x) - sin 771°10'$；

(3) $tan x = lr(|2 sin 492° + cos 850°|)$；

(4) $lr(|cot x|) = 1.1255$。
]

== $90° + alpha$，$270° - alpha$，$270° + alpha$ 与锐角 $alpha$ 的三角函数间的关系

在 §2·7 中，我们曾推出，当 $alpha$ 是锐角时，$180° - alpha$，$180° + alpha$ 和 $360° - alpha$ 与角 $alpha$ 的三角函数间的关系，得到了三组公式。利用这些公式，可以把 $90°$ 到 $360°$ 间的角的三角函数化成锐角的三角函数。

利用这三组公式，我们还可以推出 $90° + alpha$，$270° - alpha$，$270° + alpha$ 与锐角 $alpha$ 的三角函数间的关系。

*1. $bold(90° + alpha)$ 与锐角 $bold(alpha)$ 的三角函数间的关系*#h(1em)我们把 $90°$ 写成 $180° - 90°$，得

// p.74
$ sin(90° + alpha) &= sin(180° - 90° + alpha) \
  &= sin[180° - (90° - alpha)] ju $

已知的公式 $sin(180° - theta) = sin theta$ 对于任意的锐角都是正确的。我们知道，当 $alpha$ 是锐角时，$90° - alpha$ 也是锐角。因此，

$ sin[180° - (90° - alpha)] = sin(90° - alpha) ju $

但从 §1·3 知道

$ sin(90° - alpha) = cos alpha ju $

由此可知，

#c2b-b($ sin(90° + alpha) = cos alpha ju $)

同样，

// 原书第二行末多印一个“.”，按上下文略去
$ cos(90° + alpha) &= cos(180° - 90° + alpha) \
  &= cos[180° - (90° - alpha)] \
  &= -cos(90° - alpha) = -sin alpha ju $

这就是说，

#c2b-b($ cos(90° + alpha) = -sin alpha ju $)

$90° + alpha$ 的其他四个三角函数，都可以仿照上面的方法化成锐角 $alpha$ 的三角函数。我们有

#c2b-b($ tan(90° + alpha) &= -cot alpha dou \
  cot(90° + alpha) &= -tan alpha dou \
  sec(90° + alpha) &= -csc alpha dou \
  csc(90° + alpha) &= sec alpha ju $)

*2. $bold(270° - alpha)$ 与锐角 $bold(alpha)$ 的三角函数间的关系*#h(1em)我们可以把 $270°$ 写成 $180° + 90°$，然后仿照上面的方法，推得

$ sin(270° - alpha) &= sin(180° + 90° - alpha) \
  &= sin[180° + (90° - alpha)] \
  &= -sin(90° - alpha) = -cos alpha ju $

就是

#c2b-b($ sin(270° - alpha) = -cos alpha ju $)

// p.75
同样可以推得 $270° - alpha$ 的其他三角函数与锐角 $alpha$ 的三角函数间的关系

#c2b-b($ cos(270° - alpha) &= -sin alpha dou \
  tan(270° - alpha) &= cot alpha dou \
  cot(270° - alpha) &= tan alpha dou \
  sec(270° - alpha) &= -csc alpha dou \
  csc(270° - alpha) &= -sec alpha ju $)

*3. $bold(270° + alpha)$ 与锐角 $bold(alpha)$ 的三角函数间的关系*#h(1em)我们可以把 $270° + alpha$ 写成 $360° - (90° - alpha)$，并且应用 $360° - theta$ 与锐角 $theta$ 的三角函数间的关系和 §1·3 的公式，推得 $270° + alpha$ 和锐角 $alpha$ 的三角函数间有下面的关系：

#c2b-b($ sin(270° + alpha) &= -cos alpha dou \
  cos(270° + alpha) &= sin alpha dou \
  tan(270° + alpha) &= -cot alpha dou \
  cot(270° + alpha) &= -tan alpha dou \
  sec(270° + alpha) &= csc alpha dou \
  csc(270° + alpha) &= -sec alpha ju $)

#ex("例")[把 $cos 235°$ 化成锐角的正弦。]

#sol[$cos 235° = cos(270° - 35°) = -sin 35°$。]

#c2b-small[我们知道，要把 $cos 235°$ 化成锐角的三角函数，可以利用 $180° + alpha$ 与锐角 $alpha$ 的三角函数间的关系。从这个例子可以看到，利用 $270° - alpha$ 与锐角 $alpha$ 的三角函数间的关系也可以达到目的。但本题要求化得的锐角的三角函数是原来函数的余函数，我们就不能用关于 $180° + alpha$ 的公式。如果用 $180° + alpha$ 的公式，所得的锐角的函数，将仍是原来函数的名称。]

本节所讲的三组公式，和 §1·3 中互为余角的三角函数间的关系公式很相像。现在把它们一起列成下表：

// p.76
#c2b-ftable(
  ($90° - alpha$, $cos alpha$, $sin alpha$, $cot alpha$, $tan alpha$, $csc alpha$, $sec alpha$),
  ($90° + alpha$, $cos alpha$, $-sin alpha$, $-cot alpha$, $-tan alpha$, $-csc alpha$, $sec alpha$),
  ($270° - alpha$, $-cos alpha$, $-sin alpha$, $cot alpha$, $tan alpha$, $-csc alpha$, $-sec alpha$),
  ($270° + alpha$, $-cos alpha$, $sin alpha$, $-cot alpha$, $-tan alpha$, $csc alpha$, $-sec alpha$),
)

为了便于记忆，从这张表可以归纳出下面这句话：

#c2b-b[$90° plus.minus alpha$，$270° plus.minus alpha$ 的三角函数值，等于角 $alpha$ 的相应的余函数的值，放上 $alpha$ 是锐角时，原来的函数在相应象限内的符号。]

#exercise("2·10")[
1. 将下列各三角函数化成小于 $45°$ 的正锐角的三角函数：

#cols[(1) $sin 317°$；][(2) $cot 659°$；][(3) $sin 289°16'$；]

#cols[(4) $cos 333°$；][(5) $tan 700°$；][(6) $sin(-400°)$；]

#cols[(7) $tan(-842°)$；][(8) $sec(-700°)$；][(9) $cos 1000°$；]

(10) $cot(-1090°)$。

2. 已知 $sin(180° + alpha) = -1/2$，计算：

(1) $cos(270° + alpha)$；#gap (2) $sin(180° - alpha)$；#gap (3) $cos(90° + alpha)$。

3. 化简下列各式：

(1) $sin(450° - alpha) - sin(270° - alpha) + sin(alpha - 450°) + sin(270° + alpha)$；

(2) $tan(alpha - 360°) - 2 sin(180° + alpha) sin(90° + alpha) + cot(270° + alpha)$；

(3) $sin(alpha - 180°) + tan(alpha - 180°) - cos(90° + alpha)$。

4. 分别求 $sin(90° + 210°)$ 和 $cos 210°$ 的值，验证下列等式成立：
$ sin(90° + 210°) = cos 210° ju $

5. 求证 $cos(-999°) sin 99° + sin(-171°) sin(-261°)$
$ - cot 1089° cot(-630°) = 0 ju $

6. 已知 $sin 18° = (sqrt(5) - 1)/4$，求：

(1) $sin 198°$；#gap (2) $cos 252°$；#gap (3) $cos 1008°$。
]

// p.77
== 诱导公式的一般性

在 §2·8 的表中列出的是 $n dot 360° + alpha$，$180° - alpha$，$180° + alpha$，$360° - alpha$ 和 $-alpha$ 的三角函数与 $alpha$ 的三角函数间的关系。§2·10 的表中列出的是 $90° - alpha$，$90° + alpha$，$270° - alpha$ 和 $270° + alpha$ 的三角函数与 $alpha$ 的三角函数间的关系。表示这些关系的公式一共有九组，每组六个公式。它们都叫作*诱导公式*。在这九组公式中，我们以前已经指出，关于 $n dot 360° + alpha$ 和 $-alpha$ 的两组公式对于任意角 $alpha$ 都是正确的。而其他的七组公式（就是关于 $180° - alpha$，$180° + alpha$，$360° - alpha$，$90° - alpha$，$90° + alpha$，$270° - alpha$，$270° + alpha$ 的公式），仅在 $alpha$ 是锐角的条件下证明了它们的正确性。其实，这七组公式和另外两组一样，对于任意角 $alpha$ 也都是正确的。为了将来应用起来不受 $alpha$ 是锐角的限制，我们来证明它们的*一般性*。

(1) 关于 $90° + alpha$ 公式的一般性：在图 2·26 中，我们看到，不论 $alpha$ 是什么值，如果射线从角 $alpha$ 的终边起，按逆时针方向旋转 $90°$，就可以转成 $90° + alpha$ 的角。在角 $alpha$ 的终边上取一点 $P$，$90° + alpha$ 的终边上取一点 $P_1$，并且使 $O P_1 = O P = r$。过 $P$ 和 $P_1$ 分别作 $M P$ 和 $M_1 P_1$ 垂直于 $x$ 轴。这样所组成的直角三角形 $O P_1 M_1$ 和 $O P M$ 显然是全等的。因此，它们对应的直角边的长相等。

设点 $P$ 的坐标是 $(x, y)$。在每一张图中，按绝对值和符号仔细比较一下点 $P_1$ 和点 $P$ 的坐标，就可以发现，点 $P_1$ 的坐标总是 $(-y, x)$。换句话说，点 $P_1$ 的横坐标按绝对值来说，等于点 $P$ 的纵坐标，但符号相反；点 $P_1$ 的纵坐标无论按绝对值和符号来说，都和点 $P$ 的横坐标相同。

// p.78
#fig("2·26", fig-c2b-2-26())[]

// p.79
因此，对于 $alpha$ 的任何值，都有

$ sin(90° + alpha) = x/r = cos alpha dou $
$ cos(90° + alpha) = (-y)/r = -sin alpha dou $

等等。这就证明了关于 $90° + alpha$ 公式的一般性。

(2) 关于 $90° - alpha$ 公式的一般性：关于 $-alpha$ 和 $90° + alpha$ 的公式既然已经证明它们的一般性，我们就可以利用它们，推得对于 $alpha$ 的任何值，

$ sin(90° - alpha) &= sin[90° + (-alpha)] = cos(-alpha) = cos alpha dou \
  cos(90° - alpha) &= cos[90° + (-alpha)] = -sin(-alpha) \
  &= -(-sin alpha) = sin alpha dou $

等等。这就证明了关于 $90° - alpha$ 公式的一般性。

(3) 关于 $180° + alpha$ 公式的一般性：利用关于 $90° + alpha$ 公式的一般性，我们也可以推得对于 $alpha$ 的任何值，

$ sin(180° + alpha) &= sin[90° + (90° + alpha)] \
  &= cos(90° + alpha) = -sin alpha dou \
  cos(180° + alpha) &= cos[90° + (90° + alpha)] \
  &= -sin(90° + alpha) = -cos alpha dou $

等等。这就证明了关于 $180° + alpha$ 公式的一般性。

(4) 关于 $180° - alpha$ 公式的一般性：利用关于 $180° + alpha$ 公式的一般性和关于 $-alpha$ 公式的一般性，我们又可以推得对于 $alpha$ 的任何值，

$ sin(180° - alpha) &= sin[180° + (-alpha)] = -sin(-alpha) \
  &= -(-sin alpha) = sin alpha dou \
  cos(180° - alpha) &= cos[180° + (-alpha)] = -cos(-alpha) = -cos alpha dou $

等等。这就证明了关于 $180° - alpha$ 公式的一般性。

// p.80
(5) 关于 $270° + alpha$ 公式的一般性：利用关于 $180° + alpha$ 公式的一般性和关于 $90° + alpha$ 公式的一般性，我们可以推得对于 $alpha$ 的任何值，

$ sin(270° + alpha) &= sin[180° + (90° + alpha)] \
  &= -sin(90° + alpha) = -cos alpha dou \
  cos(270° + alpha) &= cos[180° + (90° + alpha)] \
  &= -cos(90° + alpha) \
  &= -(-sin alpha) = sin alpha dou $

等等。这就证明了关于 $270° + alpha$ 公式的一般性。

(6) 关于 $270° - alpha$ 公式的一般性：利用关于 $270° + alpha$ 公式的一般性和关于 $-alpha$ 公式的一般性，我们可以推得对于 $alpha$ 的任何值，

$ sin(270° - alpha) &= sin[270° + (-alpha)] \
  &= -cos(-alpha) = -cos alpha dou \
  cos(270° - alpha) &= cos[270° + (-alpha)] \
  &= sin(-alpha) = -sin alpha dou $

等等。这就证明了关于 $270° - alpha$ 公式的一般性。

(7) 关于 $360° - alpha$ 公式的一般性：因为关于 $n dot 360° + alpha$ 公式和关于 $-alpha$ 公式都具有一般性，所以对于 $alpha$ 的任何值，

$ sin(360° - alpha) &= sin[360° + (-alpha)] \
  &= sin(-alpha) = -sin alpha dou \
  cos(360° - alpha) &= cos[360° + (-alpha)] \
  &= cos(-alpha) = cos alpha dou $

等等。这就证明了关于 $360° - alpha$ 公式的一般性。

这样，我们已证明了九组诱导公式都具有一般性。

这九组公式可以分为两类：第一类是关于 $90°$ 的偶数倍加上或者减去 $alpha$ 的公式。属于这一类的是关于

// p.81
$ n dot 360° + alpha dou space 180° - alpha dou space 180° + alpha dou space 360° - alpha dou space -alpha $

的五组公式。第二类是关于 $90°$ 的奇数倍加上或者减去 $alpha$ 的公式。属于这一类的是关于

$ 90° - alpha dou space 90° + alpha dou space 270° - alpha dou space 270° + alpha $

的四组公式。

// 原书此处作“§ 2.8 和 § 2.10”（用小数点），按全书体例写作 §2·8、§2·10
这两类公式已经分别总起来列在 §2·8 和 §2·10 的表中。从表里可以看到，第一类公式中与 $alpha$ 相关的角的函数一定化成 $alpha$ 的同名函数；第二类公式中与 $alpha$ 相关的角的函数一定化成 $alpha$ 的余函数。

正因为这些公式具有一般性，所以为了帮助记忆，我们仍只要把 $alpha$ 看成锐角。这样就容易确定化得的 $alpha$ 的三角函数前面应当放上什么符号。

例如，$180° + alpha$ 属于第一类；$sin(180° + alpha)$ 一定是用 $sin alpha$ 来表示的。当 $alpha$ 是锐角时，$180° + alpha$ 的终边在第三象限里，$sin(180° + alpha)$ 的值是负的。但锐角 $alpha$ 的正弦的值是正的。因此，我们就可以确定，在 $sin alpha$ 的前面应当放上负号

$ sin(180° + alpha) = -sin alpha ju $

又如，$270° + alpha$ 属于第二类；$cos(270° + alpha)$ 一定要用 $sin alpha$ 来表示。当 $alpha$ 是锐角时，$270° + alpha$ 的终边在第四象限里，$cos(270° + alpha)$ 的值是正的。而当 $alpha$ 是锐角时，$sin alpha$ 的值也是正的。因此，我们就可以确定

$ cos(270° + alpha) = sin alpha ju $

#exercise("2·11")[
1. $A$，$B$，$C$，$D$ 顺次为圆内接四边形的四个内角，求证：

#cols[(1) $sin A = sin C$；][(2) $cos(A + B) = cos(C + D)$；]

#cols[(3) $tan(A + B + C) = -tan D$；][(4) $sec A/2 = csc C/2$；]

// p.82
(5) $sin(A/2 + B) = -cos(C/2 + D)$。

2. 化下列各三角函数为钝角的三角函数：

#cols[(1) $sin 800°$；][(2) $cos 17°20'$；]

#cols[(3) $tan 1017°$；][(4) $cos 395°$；]

#cols[(5) $cot(-7°)$；][(6) $sin 470°$；]

#cols[(7) $sec(-880°)$；][(8) $tan 801°$；]

#cols[(9) $csc(-1000°)$；][(10) $cos 37°$。]

［例如：$sin 257° = sin(90° + 167°) = cos 167°$。］

\*3. 求证 $sin(n dot 180° + alpha) = (-1)^n sin alpha$（$n$ 为整数）。

4. 把 $sin 1000°$ 化成：(1) 小于 $45°$ 角的三角函数；(2) 大于 $45°$ 的锐角的三角函数；(3) 钝角的三角函数；(4) $180°$ 到 $270°$ 之间的角的三角函数；(5) $270°$ 到 $360°$ 之间的角的三角函数。
]

== 同角的三角函数间的关系

我们已经学会根据某一个三角函数的已知值，求出和这个三角函数值对应的角度。当这些角度求出来以后，我们也就能够求出这些角的其他三角函数的值。但是不是可以不求出对应的角度，直接求出它们的其他三角函数的值呢？这个问题在研究了同角的三角函数间的关系以后，就可以得到完满的解决。

同角的三角函数间的关系，最常用的有下面三类：

*1. 倒数关系*#h(1em)根据任意角的三角函数的定义，可以知道

$ 1/(sin alpha) = 1/(y/r) = r/y = csc alpha fen $

$ 1/(cos alpha) = 1/(x/r) = r/x = sec alpha fen $

// p.83
$ 1/(tan alpha) = 1/(y/x) = x/y = cot alpha ju $

就是

#c2b-b[
#eqno([(1)], $csc alpha = 1/(sin alpha) fen$)
#eqno([(2)], $sec alpha = 1/(cos alpha) fen$)
#eqno([(3)], $cot alpha = 1/(tan alpha) ju$)
]

*2. 商数关系*#h(1em)根据任意角的三角函数的定义，可以知道

$ (sin alpha)/(cos alpha) = (y/r)/(x/r) = y/x = tan alpha dou $

就是

#c2b-b(eqno([(4)], $tan alpha = (sin alpha)/(cos alpha) ju$))

从等式 (3) 和 (4)，又可以得到

$ cot alpha = 1/(tan alpha) = 1/((sin alpha)/(cos alpha)) = (cos alpha)/(sin alpha) dou $

就是

#c2b-b(eqno([(5)], $cot alpha = (cos alpha)/(sin alpha) ju$))

*3. 平方关系*#h(1em)因为

$ sin^2 alpha + cos^2 alpha = (y/r)^2 + (x/r)^2 = (y^2 + x^2)/r^2 dou $

而

$ y^2 + x^2 = r^2 dou $

所以

$ sin^2 alpha + cos^2 alpha = r^2/r^2 = 1 dou $

// p.84
就是

#c2b-b(eqno([(6)], $sin^2 alpha + cos^2 alpha = 1 ju$))

把等式 (6) 的两边都除以 $cos^2 alpha$，得

$ (sin^2 alpha)/(cos^2 alpha) + 1 = 1/(cos^2 alpha) dou $

就是

$ ((sin alpha)/(cos alpha))^2 + 1 = (1/(cos alpha))^2 ju $

因此，

#c2b-b(eqno([(7)], $1 + tan^2 alpha = sec^2 alpha ju$))

把等式 (6) 的两边都除以 $sin^2 alpha$，得

$ 1 + (cos^2 alpha)/(sin^2 alpha) = 1/(sin^2 alpha) dou $

就是

$ 1 + ((cos alpha)/(sin alpha))^2 = (1/(sin alpha))^2 ju $

因此，

#c2b-b(eqno([(8)], $1 + cot^2 alpha = csc^2 alpha ju$))

以上 (1) 到 (8) 这八个等式中，(1)，(2)，(3)，(4)，(6) 可以看作是基本的；(5)，(7)，(8) 可以从它们推导出来。

这些等式，对于使它们的任何一边失去意义的那些角当然不成立。例如，当 $alpha = 90°$ 时，$tan alpha$ 不存在。所以对于 $alpha = 90°$ 来说，等式 (3)，(4) 和 (7) 都不成立。但是对于使等式的两边都具有意义的那些角来说，不论角的终边在哪一象限内，等式都成立。所以它们都是恒等式。

#ex("例 1.")[已知 $cos alpha = 3/5$，求 $sin alpha$。]

#sol[根据恒等式 $sin^2 alpha + cos^2 alpha = 1$，得 $sin alpha = plus.minus sqrt(1 - cos^2 alpha)$。因为已知的 $cos alpha$ 的值是正的，所以 $alpha$ 的终边在第一象限或者第四象限内。]

// p.85
对于终边在第一象限内的角 $alpha$ 来说，$sin alpha$ 的值是正的。因此，

$ sin alpha = + sqrt(1 - cos^2 alpha) = + sqrt(1 - (3/5)^2) = 4/5 ju $

对于终边在第四象限内的角 $alpha$ 来说，$sin alpha$ 的值是负的。因此，

$ sin alpha = - sqrt(1 - cos^2 alpha) = - sqrt(1 - (3/5)^2) = -4/5 ju $

#ex("例 2.")[已知 $tan alpha = -15/8$，$90° < alpha < 180°$，求 $alpha$ 的其他三角函数的值。]

#sol[$ cot alpha = 1/(tan alpha) = 1/(-15/8) = -8/15 ju $

  $ sec alpha &= -sqrt(1 + tan^2 alpha) = -sqrt(1 + (-15/8)^2) \
    &= -sqrt(1 + 225/64) = -17/8 $
]

根据恒等式 $1 + tan^2 alpha = sec^2 alpha$，得 $sec alpha = plus.minus sqrt(1 + tan^2 alpha)$。这里，我们在根号前取负号，因为已知 $alpha$ 的终边在第二象限内，它的正割的值是负的。

$ cos alpha = 1/(sec alpha) = 1/(-17/8) = -8/17 ju $

又从恒等式 $tan alpha = (sin alpha)/(cos alpha)$，得

$ sin alpha = cos alpha dot tan alpha = (-8/17)(-15/8) = 15/17 ju $

// p.86
$ csc alpha = 1/(sin alpha) = 1/(15/17) = 17/15 ju $

在例 2 中，我们看到，已知一个三角函数的值，可以求得其他五个三角函数的值。解题的步骤是：先利用倒数关系求出一个三角函数的值；其次利用平方关系和倒数关系再求出两个三角函数的值；最后利用商数关系和倒数关系求出剩下的两个三角函数的值。这样的步骤是比较合理的。

#ex("例 3.")[已知 $alpha$ 的终边在第四象限内，用 $tan alpha$ 来表示 $sin alpha$。]

#sol[这个例题就是要寻求一个公式，用它来根据已知的 $tan alpha$ 的值，算出 $sin alpha$ 的值。我们这样进行：
  $ sec alpha = sqrt(1 + tan^2 alpha) ju $
]

这里，因为 $alpha$ 的终边在第四象限内，所以 $sec alpha$ 的值是正的，根号前应取正号。

$ cos alpha = 1/(sec alpha) = 1/sqrt(1 + tan^2 alpha) ju $

所以

$ sin alpha = cos alpha tan alpha = (tan alpha)/sqrt(1 + tan^2 alpha) ju $

下面再举例说明，怎样利用同角的三角函数间的关系，来化简含有三角函数的式子，或者证明三角恒等式。

#ex("例 4.")[化简
  $ cos alpha dot csc alpha dot sqrt(sec^2 alpha - 1) quad (270° < alpha < 360°) ju $
]

#sol[原式 $= cos alpha dot csc alpha dot sqrt(tan^2 alpha)$。]

注意 $tan^2 alpha$ 的两个平方根是 $tan alpha$ 和 $-tan alpha$。由于 $sqrt(tan^2 alpha)$ 表示正的平方根，而且在所设的条件下，$tan alpha$ 的值是负的，而 $-tan alpha$ 的值是正的，所以 $sqrt(tan^2 alpha) = -tan alpha$。因此，

// p.87
$ "原式" &= cos alpha dot csc alpha (-tan alpha) \
  &= cos alpha dot 1/(sin alpha) (-(sin alpha)/(cos alpha)) = -1 ju $

#ex("例 5.")[证明恒等式
  $ sec^2 alpha + csc^2 alpha = sec^2 alpha dot csc^2 alpha ju $
]

#sol(label: [证])[$ sec^2 alpha + csc^2 alpha &= 1/(cos^2 alpha) + 1/(sin^2 alpha) \
    &= (sin^2 alpha + cos^2 alpha)/(cos^2 alpha sin^2 alpha) = 1/(cos^2 alpha sin^2 alpha) = sec^2 alpha dot csc^2 alpha ju $
]

#ex("例 6.")[证明恒等式
  $ cot alpha + (sin alpha)/(1 + cos alpha) = csc alpha ju $
]

#sol(label: [证])[$ cot alpha + (sin alpha)/(1 + cos alpha) &= (cos alpha)/(sin alpha) + (sin alpha)/(1 + cos alpha) \
    &= (cos alpha + cos^2 alpha + sin^2 alpha)/(sin alpha (1 + cos alpha)) = (cos alpha + 1)/(sin alpha (1 + cos alpha)) \
    &= 1/(sin alpha) = csc alpha ju $
]

#c2b-small[在例 5 和例 6 中，我们用正弦和余弦来表示等式左边的其他三角函数。这是最常用的方法。但有时我们也用更简单的方法进行变形。]

#ex("例 7.")[证明恒等式
  $ (tan alpha - cot beta)/(tan beta - cot alpha) = tan alpha dot cot beta ju $
]

#sol(label: [证])[$ (tan alpha - cot beta)/(tan beta - cot alpha) &= (tan alpha - cot beta)/(1/(cot beta) - 1/(tan alpha)) \
    &= (tan alpha - cot beta)/((tan alpha - cot beta)/(cot beta dot tan alpha)) = tan alpha dot cot beta ju $
]

// p.88
#c2b-small[在这个例题中，恒等式的两边只有两个角的正切和余切，用正弦和余弦来表示它们，就不见得妥当了。我们注意到 $tan alpha$ 和 $cot beta$ 在右边出现，所以在左边就让它们保留不动；而 $tan beta$ 和 $cot alpha$ 在右边不出现，我们就分别用 $cot beta$ 和 $tan alpha$ 的倒数来代替它们。]

#c2b-b[化简含有三角函数的式子和证明三角恒等式，在解决实际问题中很有用处。但我们不可能提出一套到处都适用的法则。只有多做些练习，才能够逐步养成熟练的技巧。]

#exercise("2·12")[
1. 已知 $sin alpha = -24/25$，并且 $270° < alpha < 360°$，计算 $alpha$ 的其他各三角函数的值。

2. 已知 $tan alpha = 1.4$，并且 $180° < alpha < 270°$，求 $cos alpha$ 的值（精确到 0.01）。

3. 已知 $cos alpha = -52/173$，并且 $90° < alpha < 180°$，计算 $tan alpha - sec alpha$ 的值。

4. 设 $tan alpha = 2$，计算 $(sin alpha + cos alpha)/(sin alpha - cos alpha)$ 的值。

5. 证明下列各恒等式：

(1) $sin^4 alpha + cos^2 alpha + sin^2 alpha cos^2 alpha = 1$；

(2) $sin^6 alpha + cos^6 alpha = 1 - 3 sin^2 alpha cos^2 alpha$；

(3) $(csc alpha - sin alpha)(sec alpha - cos alpha)(tan alpha + cot alpha) = 1$；

(4) $tan^2 theta - sin^2 theta = tan^2 theta sin^2 theta$；

(5) $(1 - cot x + csc x)(1 - tan x + sec x) = 2$；

(6) $(cos alpha csc alpha - sin alpha sec alpha)/(cos alpha + sin alpha) = csc alpha - sec alpha$；

(7) $sin^2 alpha + sin^2 beta - sin^2 alpha sin^2 beta + cos^2 alpha cos^2 beta = 1$；

(8) $(sin(180° - alpha) sin(270° - alpha) tan(90° - alpha))/(sin(90° + alpha) tan(270° + alpha) tan(360° - alpha)) = -cos alpha$；

(9) $(sin^2(180° + alpha))/(sin^2(270° + alpha)) + (tan^2(270° + alpha))/(cot^2(180° + alpha)) = sec^2(alpha - 360°)$；

// p.89
(10) $(a sin alpha + b cos alpha)^2 + (a cos alpha - b sin alpha)^2 = a^2 + b^2$。

6. 把 $sin^4 alpha - sin^2 alpha + cos^2 alpha$ 化为只含 $cos alpha$ 的式子。

7. 化简下列各式：

#cols[(1) $(sin alpha + cos alpha)/(sec alpha + csc alpha)$；][(2) $(tan alpha - cot alpha)/(sin^4 alpha - cos^4 alpha)$；]

(3) $sin^2 alpha tan alpha + cos^2 alpha cot alpha + 2 sin alpha cos alpha$；

(4) $(tan beta + cot alpha)/(cot beta + tan alpha)$。

\*8. 已知 $sin x + cos x = a$，求 $sin^3 x + cos^3 x$ 和 $sin^4 x + cos^4 x$。

［例如：求 $sin x cos x$。

#pad(left: 4em, grid(columns: 2, column-gutter: 2em, row-gutter: 0.8em, align: (left + horizon, left + horizon),
  [由题设], [$(sin x + cos x)^2 = a^2$。],
  [#h(2em)$therefore$], [$sin^2 x + cos^2 x + 2 sin x cos x = a^2$，],
  [即], [$1 + 2 sin x cos x = a^2$，],
  [#h(2em)$therefore$], [$sin x cos x = (a^2 - 1)/2$。］],
))

9. 已知 $tan x + cot x = 2$，求 $sin x$。

10. 用 $cot alpha$ 来表示 $alpha$ 的其余五个三角函数。
]

#summary[
*1. 任意角的三角函数的定义*

设任意角 $alpha$ 的顶点是 $O$，始边是 $x$ 轴，终边上任意一点 $P$ 的坐标是 $(x, y)$，$O P$ 的长是 $r$，那么

#align(center, grid(columns: 3, column-gutter: 3em, row-gutter: 1em, align: left,
  [$sin alpha = y/r$，], [$cos alpha = x/r$，], [$tan alpha = y/x$，],
  [$cot alpha = x/y$，], [$sec alpha = r/x$，], [$csc alpha = r/y$。],
))

*2. 三角函数的诱导公式*

设 $alpha$ 是任意角，$n$ 是整数：

(1) $n dot 360° + alpha$，$360° - alpha$，$180° plus.minus alpha$，$-alpha$ 的三角函数的值，等于 $alpha$ 的同函数的值，放上把 $alpha$ 看作是锐角时，原来的函数在相应象限内的符号。

// p.90
(2) $90° plus.minus alpha$，$270° plus.minus alpha$ 的三角函数的值，等于 $alpha$ 的相应余函数的值，放上把 $alpha$ 看作是锐角时，原来的函数在相应象限内的符号。

*3. 把任意角的三角函数化成锐角的三角函数的步骤*

任意负角的三角函数 #sym.arrow.long 任意正角的三角函数 #sym.arrow.long 小于 $360°$ 的正角的三角函数 #sym.arrow.long 锐角的三角函数。

*4. 已知一个三角函数的值等于 $bold(a)$，求角的步骤*

(1) 求出同名函数的值等于 $|a|$ 的锐角；

(2) 然后求得符合已知条件的 $0°$ 到 $360°$ 的角 $x_1$ 和 $x_2$；

(3) $n dot 360° + x_1$ 和 $n dot 360° + x_2$ 就是所求的一切角。

*5. 同角的三角函数间的关系*

(1) 倒数关系

$ sin alpha dot csc alpha &= 1 fen \
  cos alpha dot sec alpha &= 1 fen \
  tan alpha dot cot alpha &= 1 ju $

(2) 商数关系

$ tan alpha &= (sin alpha)/(cos alpha) fen \
  cot alpha &= (cos alpha)/(sin alpha) ju $

(3) 平方关系

$ sin^2 alpha + cos^2 alpha &= 1 fen \
  1 + tan^2 alpha &= sec^2 alpha fen \
  1 + cot^2 alpha &= csc^2 alpha ju $
]

#review(title: [复习题二])[
1. 将下列各式化为角 $alpha$ 的三角函数（$n$ 为整数）：

#cols[(1) $sin(990° + alpha)$；][(2) $cos(630° - alpha)$；]

#cols[(3) $sin(1260° + alpha)$；][(4) $tan(540° + alpha)$；]

#cols[(5) $cos(alpha - 810°)$；][(6) $tan(alpha - n dot 180°)$；]

#cols[(7) $cot(alpha - 1350°)$；][(8) $csc(alpha - 540°)$。]

2. 证明下列各等式（$n$ 为整数）：

(1) $cos(n dot 180° - alpha) = (-1)^n cos alpha$；

// p.91
(2) $sin[(2n - 1) dot 90° + alpha] = (-1)^(n+1) cos alpha$。

［例如：证明

#pad(left: 4em, grid(columns: 2, column-gutter: 2em, row-gutter: 0.8em, align: (left + horizon, left + horizon),
  [], [$cos n dot 180° = (-1)^n$。],
  [当 $n$ 为奇数时，], [$cos n dot 180° = -1$；],
  [当 $n$ 为偶数时，], [$cos n dot 180° = 1$；],
  [#h(4em)$therefore$], [$cos n dot 180° = (-1)^n$。］],
))

\*3. 设 $alpha$，$beta$ 是 $0°$ 到 $360°$ 间的角，如果 $sin alpha = sin beta$，那么 $alpha$ 与 $beta$ 间的关系如何？

\*4. 设 $alpha$，$beta$ 是 $0°$ 到 $360°$ 间的角，如果 $tan alpha = tan beta$，那么 $alpha$ 与 $beta$ 间的关系如何？

5. 求证 $csc(90° + A) sec(360° - A) + sin(180° + A) sec A dot tan(180° + A)$
$ = tan(45° + A) tan(45° - A) ju $

6. 设 $cot alpha = p/q$，求 $(p cos alpha - q sin alpha)/(p cos alpha + q sin alpha)$ 和 $1/(sin^2 alpha + sin alpha cos alpha + cos^2 alpha)$ 的值。

7. 求证下列各恒等式：

(1) $(sin alpha + cos alpha)(1 - sin alpha cos alpha) = sin^3 alpha + cos^3 alpha$；

(2) $(1 - sin alpha + cos alpha)^2 = 2(1 - sin alpha)(1 + cos alpha)$；

(3) $1/(sec alpha + tan alpha) = sec alpha - tan alpha$；

(4) $(1/(sec^2 alpha - cos^2 alpha) + 1/(csc^2 alpha - sin^2 alpha)) cos^2 alpha sin^2 alpha$
$ = (1 - cos^2 alpha sin^2 alpha)/(2 + cos^2 alpha sin^2 alpha) fen $

\*(5) $sqrt((1 - cos alpha)/(1 + cos alpha)) = 1/(csc alpha + cot alpha) quad (0 < alpha < 180°)$；

(6) $1/(csc x - cot x) - 1/(sin x) = 1/(sin x) - 1/(csc x + cot x)$；

(7) $(sec(-alpha) + sin(-alpha - 90°))/(csc(540° - alpha) - cos(-alpha - 270°)) = tan^3 alpha$；

\*(8) $sin(30° + alpha) tan(45° + alpha) tan(45° - alpha) sec(60° - alpha) = 1$；

(9) $(sin(90° + theta) + cos(270° - theta))/(cot(180° + theta) + tan(360° - theta)) = (sin(360° - theta) sin(90° - theta))/(cos(180° - theta) + cos(90° + theta))$；

// p.92
(10) $(1 + 2 sin alpha sin(90° + alpha))/(sin^2 alpha - sin^2(270° + alpha)) = (tan alpha + 1)/(tan alpha - 1)$。

8. 已知 $tan theta + cot theta = a$，求 $tan^2 theta + cot^2 theta$，$tan^3 theta + cot^3 theta$ 的值。

9. 以 $tan theta$ 表 $2 sec^2 theta - sec^4 theta - 2 csc^2 theta + csc^4 theta$。

10. 求下列各式的值：

(1) $2 cos 0° + 3 sin 90° - 4 cos 180° + 5 sin 270° - 6 cos 360°$；

(2) $m tan 0° + n cos 90° - p sin 180° - q cos 270° - r sin 360°$。

11. 讨论角 $x$ 由 $0°$ 变化到 $360°$ 的时候，函数 $y = lr(|sin x|)$ 的变化。

12. 决定下列各差的符号：

#cols[(1) $sin 121° - sin 242°$；][(2) $tan 120° - tan 121°$；]

#cols[(3) $cot 200° - cot 210°$；][(4) $sin 260° - sin 250°$；]

#cols[(5) $cos 320° - cos 310°$；][(6) $cos 110° - cos 130°$。]

13. 求下列各式的值：

(1) $sin 840° + cos 750° - tan 945° + sec 405°$；

(2) $cos 810° + sin(-930°) - tan(-1110°)$；

(3) $csc(-870°) + cot(-870°)$。

\*14. 设 $sin alpha = a sin beta$，$tan alpha = b tan beta$，求证 $cos alpha = plus.minus sqrt((a^2 - 1)/(b^2 - 1))$。

15. 设 $a > 0$，$b > 0$，并且 $a != b$；下列各等式哪些不合理？为什么？

#cols[(1) $tan alpha = (a^2 - b^2)/(a^2 + b^2)$；][(2) $sec beta = a^2/(a^2 + b^2)$；]

(3) $csc gamma = (a^2 + b^2)/(a b)$。

16. 求满足等式 $2 sin^2 x + sqrt(3) cos x + 1 = 0$ 的 $x$ 的一切值。

17. 不用查表计算下列各式的值：

#cols[(1) $(sin 101°)/(cos 11°) + tan(45° - x)/cot(45° + x)$；][(2) $(sin 217°)/(cos 53°) + (tan 98°)/(tan 278°)$。]

\*18. 已知 $sec alpha + csc alpha = a$，求证
$ sin alpha cos alpha = (1 plus.minus sqrt(a^2 + 1))/a^2 ju $

\*19. 已知 $a sec x - c tan x = d$，$b sec x + d tan x = c$，求证 $a^2 + b^2 = c^2 + d^2$。
]
