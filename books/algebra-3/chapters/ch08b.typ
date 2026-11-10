// 第 8 章（续）*§8·3 指数方程和对数方程的图像解法、*§8·4 指数和对数方程组、本章提要、复习题八
// （原书 p.290–296；*§8·3 标题从 p.290 中部起，p.290 页首是 §8·2 习题的尾部，不在本文件；第 9 章 p.297 起不在本文件）
#import "/common/series.typ": *
#import "/books/algebra-3/figures/fig8B-curves.typ": fig-8-2, fig-8-3

// 局部：含分式的方程组的大括号，每行按 display 样式排（同第 1 章）
#let cs(..rows) = math.cases(..rows.pos().map(math.display))

// 局部：本章提要表。模板会把表格第一行设成白字配深色表头，这里不用表头底色，显式改回黑字；
// 上下粗线、行间细线、列间细线，仿原书表格。
#let stab(caption, ..cells) = {
  let cs = cells.pos()
  let m = calc.ceil(cs.len() / 3)
  align(center, block(width: 100%, breakable: false, {
    text(size: 10.5pt, weight: "bold")[#caption]
    v(0.6em)
    set text(size: 9.8pt)
    set par(justify: false)
    show table.cell: set text(fill: black)
    table(
      columns: (6.6em, 1fr, 1fr),
      align: center + horizon,
      inset: (x: 6pt, y: 8pt),
      fill: none,
      stroke: (x, y) => (
        left: if x >= 1 { 0.5pt } else { none },
        top: if y == 0 { 1.2pt } else { 0.5pt },
        bottom: if y == m - 1 { 1.2pt } else { none },
      ),
      ..cs,
    )
  }))
}

// p.290
#heading(level: 2, numbering: star-heading-numbering)[指数方程和对数方程的图像解法]

像一元二次方程的图像解法一样，我们也可以利用图像来解某些指数方程和对数方程。现在举例说明如下：

#ex("例 1")[解方程

$ 2^x - 4 x = 0 ju $]

#sol[把原方程变形成

$ 2^x = 4 x ju $

作函数

$ u = 2^x quad "和" quad u = 4 x $

的图像（图 8·2）。]

#fig("8·2", fig-8-2())[]

从图中可以看到，这两个图像有两个交点，它们的横坐标分别是

$ x_1 approx 0.3 dou quad x_2 = 4 ju $

为了检验这两个值是不是原来方程的解，可以代入原方程进行验算。

当 $x = 4$ 的时候，

$ 2^4 - 4 dot 4 = 0 dou $

所以 $x = 4$ 是方程的解。

当 $x approx 0.3$ 的时候，

$ 2^(0.3) - 4 times 0.3 approx 1.23 - 1.2 approx 0 dou $

所以可看作是方程的一个近似的解。

// p.291
从这个例子可以看到，用图像法求得的解，一般只是一个粗略的近似值。

#ex("例 2")[解方程

$ 2 log_2 x + x - 8 = 0 ju $]

#sol[把原方程变形成

$ log_2 x = 4 - 1/2 x ju $

在同一直角坐标系里，作出函数

$ u = log_2 x quad "和" quad u = 4 - 1/2 x $

的图像（图 8·3）。]

#fig("8·3", fig-8-3())[]

从图中看出两个图像只有一个交点，它的横坐标是

$ x = 4 ju $

这就是所求的解。

#note-small[1\. 直接由观察知道，$x = 4$ 确实是方程的解，这是因为

$ 2 log_2 4 + 4 - 8 = 4 + 4 - 8 = 0 ju $

但是从观察中却还不能确定方程除了这个解以外是否再有其他的解，利用图像可以解决这个问题。

2\. 这里我们求出了精确的解，只是一个特例，一般情况下，利用图像法也只能求出方程的粗略的近似解。]

// p.292
#exercise("8·3")[
利用图像法解下列方程：

#cols[1. $2^x - x - 2 = 0$；][2. $2^x - x^2 = 0$；]
#cols[3. $2 log_2 x - 3 = 0$；][4. $3 log_2 x + 2 x - 6 = 0$。]
]

#heading(level: 2, numbering: star-heading-numbering)[指数和对数方程组]

利用解代数方程组的知识，我们可以解由指数方程和对数方程所组成的方程组。下面举几个简单的例子来说明这种方程组的解法。

#ex("例 1")[解方程组：

#eqsys(($2^x = 8^(y + 1) dou$, [(1)]), ($9^y = 3^(x - 9) ju$, [(2)]))]

#sol[从 (1) 得

$ 2^x = 2^(3 (y + 1)) dou \ therefore quad x = 3 (y + 1) ju $

从 (2) 得

$ 3^(2 y) = 3^(x - 9) dou \ therefore quad 2 y = x - 9 ju $

这样，我们就得到了一个二元一次方程组

#eqsys(($x - 3 y = 3 dou$, []), ($x - 2 y = 9 ju$, []))

解这个方程组得

$ cs(x = 21 dou, y = 6 ju) $

这就是原方程组的解。]

// p.293
#ex("例 2")[解方程组：

#eqsys(($lg x + lg y = lg 11 + lg 9 dou$, [(1)]), ($lg (x + y) - lg (x - y) = 1 ju$, [(2)]))]

#sol[从 (1) 知方程组有解的条件是

$ x > 0 dou quad y > 0 ju $

在这种条件下，从 (1) 得

$ lg x y = lg 99 dou \ therefore quad x y = 99 ju $

从 (2) 知方程组有解的条件是

$ x + y > 0 dou quad x - y > 0 ju $

在这种条件下，从 (2) 得

$ lg frac(x + y, x - y) = lg 10 dou \ therefore quad frac(x + y, x - y) = 10 ju $

就是

$ 9 x = 11 y ju $

这样就得到了一个二元二次方程组

#eqsys(($x y = 99 dou$, []), ($9 x = 11 y ju$, []))

解这个方程组得

$ cs(x_1 = 11 dou, y_1 = 9 dou) quad quad cs(x_2 = -11 dou, y_2 = -9 ju) $

因为 $x$ 和 $y$ 都不能是负数，所以第二组解应该舍去。以 $x = 11, y = 9$ 代入原方程组检验，知道它们适合原方程组里的两个方程，所以是原方程组的解。]

#note-small[当 $x = 11, y = 9$ 时，$x + y$ 和 $x - y$ 的值都大于零，根据这一点，可知 $x = 11, y = 9$ 同时满足方程组中两个方程所需要的条件，从而可确定这一组解是原方程组的解。]

// p.294
#ex("例 3")[解方程组：

#eqsys(($x^(lg y) = 100 dou$, [(1)]), ($lg x + lg y = 3 ju$, [(2)]))]

#sol[从方程 (1) 知道方程组有解的条件是

$ x > 0 dou quad y > 0 ju $

在这样的条件下，两边取常用对数得

$ lg y lg x = 2 ju $

原方程组可以变形成

#eqsys(($lg y lg x = 2 dou$, [(3)]), ($lg x + lg y = 3 ju$, [(4)]))

令 $lg x = u, lg y = v$，得到

#eqsys(($u + v = 3 dou$, []), ($u v = 2 ju$, []))

解这个方程组得

$ cs(u_1 = 2 dou, v_1 = 1 dou) quad "和" quad cs(u_2 = 1 dou, v_2 = 2 ju) $

从 $u_1, v_1$ 得

$ cs(lg x = 2 dou, lg y = 1 ju) quad therefore quad cs(x = 100 dou, y = 10 ju) $

从 $u_2, v_2$ 得

$ cs(lg x = 1 dou, lg y = 2 ju) quad therefore quad cs(x = 10 dou, y = 100 ju) $

检验后，知道这两组解都适合原方程组。]

#exercise("8·4", star: true)[
解下列各方程组：

1. #cols[(1) $cs(9^(x + y) = 729 dou, 3^(x - y - 1) = 1 fen)$][(2) $cs(lg x + lg y = 5 dou, lg x - lg y = 3 fen)$]
// p.295
#cols[(3) $cs(x - y = 90 dou, lg x + lg y = 3 fen)$][(4) $cs(x + y = 5 dou, 9 dot 3^(2 x + y) - 3^(x - 2 y) = 0 ju)$]

2. #cols[(1) $cs(2^x dot 3^y = 324 dou, 3^x dot 2^y = 144 fen)$][(2) $cs(2^x - 2^y = 24 dou, 2^(x - 1) + 2^(y - 1) = 20 ju)$]

3. (1) $cs(lg x + lg y = 3 dou, lg (x + 90 y) - lg x = 1 fen)$

(2) $cs(lg x + lg y = lg 143 dou, lg (x + y) = lg (x - y) + lg 12 ju)$
]

#summary[
#stab(
  [指数方程和对数方程的解法],
  [类型], [指数方程], [对数方程],
  [最简方程],
  [$a^x = b$ \ $b > 0 dou x = log_a b$ \ $b <= 0$ 时没有解],
  [$log_a x = b$ \ $x = a^b$],
  [可以用取对数或者取幂解的方程],
  [$a^(f(x)) = a^(phi(x))$ \ 只需解方程 \ $f(x) = phi(x)$],
  [$log_a f(x) = log_a phi(x)$ \ 只需在 $f(x) > 0$ 和 $phi(x) > 0$ 的条件下解方程 \ $f(x) = phi(x)$],
  [可以用变量代换法解的方程],
  [$f(a^x) = 0$ \ 令 $y = a^x$，解方程 $f(y) = 0$，\ 再解方程 $a^x = y (y > 0)$],
  [$f(log_a x) = 0$ \ 令 $y = log_a x$，解方程 $f(y) = 0$，\ 再解方程 $log_a x = y$],
  [图像解法],
  [$a^x = f(x)$ \ 作函数 $y = a^x$ 和 $y = f(x)$ 的图像，读出交点的横坐标],
  [$log_a x = f(x)$ \ 作函数 $y = log_a x$ 和 $y = f(x)$ 的图像，读出交点的横坐标],
)
]

#review(title: [复习题八])[
1. (1) 解下面的方程：

#cols[(i) $2 x^2 = 5 x + 7$；][(ii) $3^(2 x^2) = 3^(5 x + 7)$。]

// p.296
(2) 这两个方程是不是同解方程？

(3) 方程 $a^(f(x)) = a^(phi(x))$ $(a > 0, a != 1)$ 和方程 $f(x) = phi(x)$ 是不是同解方程？为什么？

2. (1) 解下面的方程：

#cols[(i) $log_2 2 x^2 = log_2 (x + 6)$，][(ii) $2 x^2 = x + 6$；]

(2) 这两个方程是不是同解方程？

(3) 方程 $log_a f(x) = log_a phi(x)$ 和方程 $f(x) = phi(x)$ 在什么条件下才是同解方程？

3. 解下列方程：

#cols[(1) $4 + frac(2, 3^x - 1) = frac(5, 3^(x - 1))$；][(2) $3^x dot 2^(x - 1) - 3^(x - 1) dot 2^x = 2^2 dot 3^2$；]

(3) $lg (152 + x^2) = 2 lg (x + 2)$；

(4) $frac(lg (x^2 - x + 4), lg x) = 2$。

4. 解下列方程：

#cols[(1) $100^(lg (x + 20)) = 10000$；][(2) $x^(lg x + 2) = 1000$；]
#cols[(3) $lg (lg x - 1) = 0$；][(4) $lg lg lg x = 0$。]

（$lg lg x$ 就是 $lg (lg x)$，它表示 $x$ 的常用对数的常用对数。例如 $lg lg 100 = lg (lg 100) = lg 2 = 0.3010$。）

\*5. 解下列方程：

#cols[(1) $log_(x - 1) (x^2 - 5 x + 10) = 2$；][(2) $log_2 [log_3 (log_4 x)] = 0$；]
#cols[(3) $x^x = x$；][(4) $lg x^(lg x) = 1$。]

\*6. 解下列方程组：

#cols[(1) $cs(2^(frac(x - y, 2)) - 2^(frac(x - y, 4)) = 12 dou, 3^(lg (2 y - x)) = 1 fen)$][(2) $cs(x y = 40 dou, x^(lg y) = 4 fen)$]
#cols[(3) $cs(x^(sqrt(y)) = y dou, y^(sqrt(y)) = x^4 fen)$][(4) $cs(2^(sqrt(x) + sqrt(y)) = 512 dou, lg sqrt(x y) = 1 + lg 2 ju)$]

7. 如果劳动生产率平均每年比上一期提高 18.9%，那么经过多少年可以提高到原来的 2 倍？

8. 机器的价值是 10 万元，如果每年的折旧率是 8.75%（就是每年减少它的价值的 8.75%），那么，大约几年后它的价值成为 4 万元？
]
