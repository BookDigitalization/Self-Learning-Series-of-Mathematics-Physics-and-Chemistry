// 第 6 章（W 段：原书 p.398–418）：§6·5 参数方程的应用、§6·6 圆锥曲线的直径、练习（p.410）、习题 6·5~6·6、本章提要、复习题六。
// 本段从 p.398 下部的 §6·5 标题开始（p.398 上部是上一节习题的后半，属上一段）；到 p.418 第 6 章末止（p.419 起第七章）。
// solo 编译：--ch 6 --sec 4 --fig 12。图号 6·13–6·19；另有习题 6·5~6·6 第 1、2、11、12 题图，复习题六第 8、12 题图（不编号）。
#import "/common/series.typ": *
#import "/books/analytic-geometry/figures/W-figs.typ": *

// 原书脚注用圈码 ①
#set footnote(numbering: "①")

// 局部：节内“练习”小标题（同 ch04.typ 的 L-practice）
#let W-practice(body) = {
  block(width: 100%, above: 1.6em, below: 0.8em, sticky: true, align(center, text(font: fonts.hei, weight: "bold")[练　习]))
  body
}
// 局部：左边带“即”“但”“又”等引导字的独立公式
#let W-lead(label, body) = grid(columns: (4em, 1fr, 4em), align(left + horizon, label), align(center, body), [])
// 局部：三线表（只有竖线分隔各栏，上下粗线）
#let W-tab(cols, ..cells) = align(center, block(breakable: false, above: 1em, below: 1em, {
  show table.cell: set text(fill: black)
  table(
    columns: cols,
    align: center + horizon,
    inset: (x: 1em, y: 0.65em),
    fill: none,
    stroke: (x, y) => (left: if x > 0 { 0.5pt } else { none }),
    ..cells,
  )
}))

// p.398
== 参数方程的应用

上几节里，我们已讲到一些参数方程的应用，在本节中要进一步应用参数方程解决几种比较复杂而又常见的轨迹问/* p.399 */题。现在分两种情况来讨论：

(1) 第一种仍照前几节的方法引入一个参数，分别求 $x$，$y$ 对于这参数的函数式（就是参数方程）。

(2) 第二种也是引入一个参数，从而求出两组直线，使得轨迹的曲线上的每一点就是两组中的相应两直线的交点。现分别举例于下：

第一种：利用参数求点的轨迹的参数方程。

#ex[例 1.][在线段 $A P$ 上，$B$ 为 $A P$ 间的一定点。令 $A$，$B$ 两点分别在相互垂直的两直线之一上滑动。求 $P$ 点轨迹的方程。]
#sol[用相互垂直的两直线为坐标轴，假定 $A$ 在 $y$ 轴上滑动，$B$ 在 $x$ 轴上滑动。设
$ abs(A P) = a, quad abs(B P) = b, $
又 $A P$ 与 $x$ 轴所成的角为 $theta$，$P$ 点的坐标为 $(x, y)$。如图 6·13(a)，则
$ cases(x = O M = A Q = abs(A P) cos theta dou, y = M P = abs(B P) sin theta dou) $
#W-lead([即], $ cases(x = a cos theta dou, y = b sin theta ju) $)
// p.400
上面是本题所求 $P$ 点轨迹的参数方程。消去 $theta$ 得
$ x^2/a^2 + y^2/b^2 = 1 dou $
这是一个椭圆，半长轴的长是 $a$，半短轴的长是 $b$。
]

#fig("6·13", grid(columns: 2, column-gutter: 2em, align: bottom, fig-W-6-13a(width: 380 * k), fig-W-6-13b(width: 380 * k)), [])

#note-small[利用本题的性质，可以制造一种画椭圆的工具。方法如下：用两根木条（或其他刚性物体）钉成十字形，木条中间挖一道槽。在另一活动木条 $P B A$ 的 $P$ 处钻一小孔，可以容纳铅笔尖，$A$，$B$ 是两个螺旋钉，可以放松移动以配合 $abs(A P) = a$，$abs(B P) = b$ 的长度，当 $A$，$B$ 各在一条槽内移动时，$P$ 处笔尖就画出一个椭圆（图 6·13(b)）。]

#ex[例 2.][一个大小一定的圆，沿平面上一根直线并且在它的上边滚动。求这圆周上一个定点 $P$ 的轨迹的方程。]

#fig("6·14", fig-W-6-14(), [])

#sol[用这根固定直线作为 $x$ 轴，又以 $P$ 点接触此直线之处为原点。

设圆的半径是 $r$（如图 6·14），滚到这样一个位置，$C$ 为圆心，$A$ 为圆与 $x$ 轴接触处（当然相切于 $A$），$P(x, y)$ 是轨迹上的一个位置。又设 $∠Q C P = theta$（弧度），则
$ cases(x = O M = O A - M A dou, y = M P = A Q = A C - Q C ju) $
// p.401
#W-lead([但], $ O A = overparen(A P) = r dot theta, quad M A = P Q = r sin theta dou $)
#W-lead([又], $ A C = abs(C P) = r, quad Q C = r cos theta dou $)
代入上两式得参数方程为
#eqsys(($x = r theta - r sin theta dou$, [(1)]), ($y = r - r cos theta ju$, [(2)]))
这就是所求 $P$ 点轨迹的参数方程。从(2)，得
#eqno([(3)], $ cos theta = (r - y)/r dou $)
所以
$ theta = arccos (r - y)/r, quad sin theta = 1/r sqrt(2r y - y^2) ju $
代入(1)式，得
$ x = r arccos (r - y)/r - sqrt(2r y - y^2) ju $
这就是 $P$ 点轨迹的普通方程，它表示的曲线叫作*旋轮线*（也称*摆线*）。
]

#ex[例 3.][一根绳子紧紧围绕着一个圆，当此绳子拉紧而逐渐剥离时（这时剥离部分的绳为圆的切线），求绳外端 $P$ 点的轨迹。]
#sol[以圆心为坐标的原点，使 $x$ 轴经过圆上 $A$ 点，$A$ 点为绳端 $P$ 合于圆上时的位置，$A B$ 是围绕圆的一段绳子，现在拉到 $B P$ 的位置，因为绳子是拉紧的，所以 $B P$ 切圆于 $B$ 点。令 $P(x, y)$ 为轨迹上的一点，连接 $O B$（如图 6·15），设圆半径为 $r$，又设 $∠D O B = theta$，则 $∠Q B P$ 也是 $theta$。令
$ cases(x = O M = O D + D M = O D + Q P dou, y = M P = D Q = D B - Q B ju) $
#W-lead([但], $ O B = r, quad B P = overparen(B A) = r theta dou $)
$ ∴ quad O D = r cos theta, quad Q P = B P sin theta = r theta sin theta dou $

// p.402
#fig("6·15", fig-W-6-15(), [])

#W-lead([又], $ D B = r sin theta, quad Q B = B P cos theta = r theta cos theta ju $)
代入上式得
$ cases(x = r cos theta + r theta sin theta dou, y = r sin theta - r theta cos theta ju) $
这就是所求 $P$ 点轨迹的参数方程，表示它的曲线叫作*圆的渐开线*（也称*圆的展开线*）。
]

#note-small[1\. 图 6·14 旋轮线中，$E$ 点是 $P$ 点恰转过一周（$2 pi$）又与直线相遇之处，所以 $O E$ 的长度等于所滚动的圆的周长，即 $O E = 2 pi r$，就是说，利用旋轮线可以作一根直线使等于一个圆周的长度#footnote[三等分一角，倍立方体及作一线段等于一个圆周长，这是所传古希腊的几何上的三大问题。]。

2\. 例 2 及例 3 的两条曲线在机械学上很有用处，因为机器所用齿轮的齿面大都是用到旋轮线或圆的渐开线作弯度的。]

第二种：利用两组直线的交点求点的轨迹的方程。它是引用一个参数，求出两个相交直线的方程，再从这两个方程求出轨迹的普通方程或者参数方程。

// p.403
#ex[例 4.][一个三角形的底边长一定，高的长也一定，求它的垂心的轨迹的方程。]
#sol[设三角形的底边长是 $2a$，高是 $h$，以底边所在的直线为 $x$ 轴，底边的中点为原点，所以底边上的两顶点是 $A(a, 0)$，$B(-a, 0)$，它的第三个顶点一定在直线 $y = h$ 上。因此可以设 $C$ 点的坐标是 $(t, h)$，$t$ 是参数（图 6·16）。高 $C D$ 所在的直线的方程是
#eqno([(1)], $ x = t ju $)
又垂心是三个高的交点，也就是 $C D$ 与另一个高 $B E$ 的交点 $P$，因 $A C$ 的斜率是 $h/(t - a)$，故 $B E$ 的斜率是 $(a - t)/h$，所以高 $B E$ 所在的直线的方程是
#eqno([(2)], $ y = (a - t)/h (x + a) ju $)
由(1)，以 $t$ 代进(2)，并且加以整理，得
$ y = -1/h (x^2 - a^2) dou $
它是一个抛物线的方程。如垂心限于三角形内，则本题轨迹的曲线只是抛物线的一部分（图 6·16 的实线部分）。
]

#fig("6·16", fig-W-6-16(), [])

#ex[\*例 5.][求椭圆的两个垂直切线交点的轨迹的方程（图 6·17）。]
#sol[设椭圆的方程是
$ x^2/a^2 + y^2/b^2 = 1 dou $
// p.404
它的一个切线的斜率是 $m$（$m$ 是参数），从 4·22 节可知这一条切线的方程是
#eqno([(1)], $ y = m x + sqrt(a^2 m^2 + b^2) ju $)
与它垂直的一条切线的斜率是 $-1/m$，所以另一条切线的方程是
#eqno([(2)], $ y = -1/m x + sqrt(a^2/m^2 + b^2) ju $)

#fig("6·17", fig-W-6-17(), [])

从(1)得
#eqno([(3)], $ y - m x = sqrt(a^2 m^2 + b^2) dou $)
由(2)得
#eqno([(4)], $ m y + x = sqrt(a^2 + b^2 m^2) dou $)
$(3)^2 + (4)^2$ 得
$ (1 + m^2)(x^2 + y^2) = (1 + m^2)(a^2 + b^2) dou $
现 $1 + m^2$ 不会等于 0，所以
$ x^2 + y^2 = a^2 + b^2 ju $
这就是所求的两条切线的交点轨迹的方程，这个轨迹是一个圆。
]

// p.405
#note-small[求两组直线交点轨迹的方程，可以从两个对应直线方程求出它们的交点的坐标所表示的参数方程，也可以直接从这两方程消去参数得出普通方程 $F(x, y) = 0$。一般是采取后面的一种方法，因为这样就直接得到普通方程，比较容易看出曲线的性质。在上面的例 4 及例 5 都是直接消去参数的，现例 4 的参数方程是 $x = t$，$y = (a^2 - t^2)/h$，比较还是简单的，但在例 5 中，假使要化为参数方程，反而比较麻烦，不如直接求普通方程来得便当。]

== 圆锥曲线的直径

连接圆锥曲线上任意两点的线段叫作*圆锥曲线的弦*，现在我们来考虑一个圆锥曲线中一组平行弦中点的轨迹。

先从圆谈起，在图 6·18(a) 中是圆的一组平行的弦，由平面几何的知识可以知道它们的中点的轨迹是圆的直径。这个性质对于一般的圆锥曲线是否适用，还须要我们来探讨和证明。下面先来探求椭圆的一组平行弦的中点的轨迹方程：

#fig("6·18", grid(columns: 2, column-gutter: 2em, align: bottom, fig-W-6-18a(), fig-W-6-18b()), [])

*1. 椭圆的直径*　设一个椭圆的方程是
#eqno([(1)], $ beta^2 x^2 + alpha^2 y^2 = alpha^2 beta^2 ju $)
又设一组平行弦的斜率是定值 $k$，那么这组平行弦的直线系/* p.406 */方程是
$ y = k x + t ju $
这里的 $t$ 是参数，如图 6·18(b)，弦 $P_1 P_2$ 是在 $t = t_1$ 时的一个位置，所以 $P_1 P_2$ 直线的方程是
#eqno([(2)], $ y = k x + t_1 ju $)

设弦的两端点 $P_1$，$P_2$ 的坐标分别是 $(x_1, y_1)$ 和 $(x_2, y_2)$，可以理解，这两对数值显然是(1)式及(2)式所组成的方程组的解。

从(1)，(2)两式消去 $y$ 并加以整理，得
#eqno([(3)], $ (alpha^2 k^2 + beta^2) x^2 + 2 alpha^2 t_1 k x + alpha^2 (t_1^2 - beta^2) = 0 ju $)
方程(3)的两根是 $x_1$，$x_2$，由韦达定理，可得
$ x_1 + x_2 = -(2 alpha^2 t_1 k)/(alpha^2 k^2 + beta^2) ju $
假定 $P'(x', y')$ 是弦 $P_1 P_2$ 的中点，则 $x' = (x_1 + x_2)/2$，所以
#eqno([(4)], $ x' = -(alpha^2 t_1 k)/(alpha^2 k^2 + beta^2) ju $)
因 $P'$ 点在弦 $P_1 P_2$ 上，所以
$ y' = k x' + t_1 dou $
#W-lead([即], $ t_1 = y' - k x' dou $)
代入(4)式并且整理得
$ beta^2 x' + alpha^2 k y' = 0 ju $
当弦 $P_1 P_2$ 平行移动时，它的中点 $P'$ 也移动，$P'$ 点的坐标 $(x', y')$ 当然跟着变动，但它们总是满足方程
$ beta^2 x' + alpha^2 k y' = 0 ju $
这一方程也可写成
#eqno([(5)], $ y = -beta^2/(alpha^2 k) x ju quad (P'(x', y') "以" P(x, y) "代替") $)

// p.407
上面方程就是在椭圆中一组平行弦中点的轨迹的方程，它表示一条直线（因为是 $x$，$y$ 的一次方程），我们称它为椭圆 $beta^2 x^2 + alpha^2 y^2 = alpha^2 beta^2$ 的*直径*，所以，椭圆的直径所在的直线是一条经过原点的直线，它是一组平行弦中点的轨迹。

现考察椭圆 $beta^2 x^2 + alpha^2 y^2 = alpha^2 beta^2$ 的直径方程(5)式很容易看到

(1) 它是通过椭圆的中心的（现在椭圆的中心在原点）。

(2) 根据椭圆的方程及已知的平行弦斜率，这相应直径方程可以直接照(5)式的形式写出，它的斜率（设为 $k'$）是
$ k' = -beta^2/alpha^2 dot 1/k ju $
式中 $alpha$ 可大于 $beta$，等于 $beta$ 或小于 $beta$；$beta^2$ 是 $x^2$ 的系数，$alpha^2$ 是 $y^2$ 的系数。如 $4x^2 + 9y^2 = 36$，平行弦的斜率是 2，则相应的直径就是 $y = -4/(9 times 2) x$，即 $2x + 9y = 0$；又在 $9x^2 + 4y^2 = 36$ 中，设平行弦的斜率是 2，则相应直径是 $y = -9/(4 times 2) x$，即 $9x + 8y = 0$。

(3) 假使这是一个圆，它的方程是
$ x^2 + y^2 = a^2 dou $
那么对于一组平行弦斜率为 $k$ 的圆的直径方程就是
$ x + k y = 0 ju $
这说明圆的直径通过圆心，又因 $k' = -1/k$，所以圆的直径是垂直于这平行弦组中的每一个弦。

*\*2. 椭圆的共轭直径*　在椭圆 $beta^2 x^2 + alpha^2 y^2 = alpha^2 beta^2$ 中，有斜率为 $k$ 的平行弦的相应直径 $U V$（图 6·19(a)）是
#eqno([(1)], $ y = k' x $)
$ (k' = -beta^2/(alpha^2 k)) dou $
// p.408
现在以这直径的斜率 $k'$ 为斜率的平行弦的直径 $U' V'$ 是
$ y = -beta^2/(alpha^2 k') x ju $
把 $k'$ 的值代入直径 $U' V'$ 的方程得
#eqno([(2)], $ y = k x ju $)
上式的斜率就是原来弦的斜率，所以从(1)式和(2)式可以看到它们的相互关系，就是

1\. 两式斜率间有关系式
$ k dot k' = -beta^2/alpha^2 ju $

2\. 以(1)式的斜率 $k'$ 为斜率的平行弦，它的相应直径是(2)式。

3\. 以(2)式的斜率 $k$ 为斜率的平行弦，它的相应直径是(1)式。

(1)，(2)两式的图像在几何意义上是 $U V$ 平分平行于 $U' V'$ 的弦；相反地 $U' V'$ 平分平行于 $U V$ 的弦，因此我们叫 $U V$，$U' V'$ 为椭圆的两*共轭直径*（图 6·19(a)）。(1)式和(2)式是对于椭圆方程 $beta^2 x^2 + alpha^2 y^2 = alpha^2 beta^2$ 的两共轭直径方程，$k k' = -beta^2/alpha^2$ 是椭圆共轭直径斜率的关系式。

*\*3. 双曲线、抛物线的直径*　设双曲线的方程是 $beta^2 x^2 - alpha^2 y^2 = alpha^2 beta^2$，又设一组平行弦的斜率是已知数 $k$，照椭圆同样的方法可以求到它相应的直径方程是
$ y = beta^2/(alpha^2 k) x ju $
同样可推到，假使
$ y = k x, quad y = k' x $
是双曲线的两共轭直径，则它们斜率间的关系是 $k k' = beta^2/alpha^2$（图 6·19(b)）。

设抛物线的方程是 $y^2 = 2p x$，又它的一组平行弦的斜率是 $k$，同样可推到它的直径是
$ y = p/k ju $
很明显，可看出抛物线的直径都是平行于它的轴的（图 6·19(c)），抛物线的直径没有共轭的直径。

现在把圆锥曲线的直径方程（假定平行弦组的斜率是 $k$），列表于下，以备查考。

// p.409
#fig("6·19", fig-W-6-19(), [])

#W-tab(3,
  table.hline(stroke: 1pt),
  [圆锥曲线方程], [直径方程], [两共轭直径的斜率关系式],
  table.hline(stroke: 0.6pt),
  // 原书此格印作 γ²（与正文 p.407 的 x² + y² = a² 不一致），照录
  [$x^2 + y^2 = gamma^2$], [$x + k y = 0$], [$k k' = -1$],
  [$beta^2 x^2 + alpha^2 y^2 = alpha^2 beta^2$], [$beta^2 x + alpha^2 k y = 0$], [$k k' = -beta^2/alpha^2$],
  [$beta^2 x^2 - alpha^2 y^2 = alpha^2 beta^2$], [$beta^2 x - alpha^2 k y = 0$], [$k k' = beta^2/alpha^2$],
  [$y^2 = 2p x$], [$y = p/k$], [无共轭直径],
  table.hline(stroke: 1pt),
)

// p.410
#W-practice[
+ 填列下表（根据公式直接写出直径方程）：
  #W-tab((auto, auto, 9em),
    table.hline(stroke: 1pt),
    [方#h(4em)程], [平行弦的方程或斜率], [直#h(4em)径],
    table.hline(stroke: 0.6pt),
    [$4x^2 + 9y^2 = 36$], [$k = 2$], [],
    table.hline(stroke: 0.4pt),
    [$9x^2 + 4y^2 = 36$], [$k = 2$], [],
    table.hline(stroke: 0.4pt),
    [$9x^2 - 4y^2 = 36$], [$2x - y + c = 0$], [],
    table.hline(stroke: 0.4pt),
    [$4y^2 - 9x^2 = 36$], [$9x - 8y + c = 0$], [],
    table.hline(stroke: 0.4pt),
    [$y^2 = 8x$], [$k = -3$], [],
    table.hline(stroke: 0.4pt),
    [$x^2 = 4y$], [$k = 3$], [],
    table.hline(stroke: 1pt),
  )
+ 试从椭圆的直径方程推出这直径的参数方程，它是
  $ x = -(alpha^2 k t)/(alpha^2 k^2 + beta^2), quad y = (beta^2 t)/(alpha^2 k^2 + beta^2) quad (t "是参数") ju $
]

#exercise("6·5~6·6")[
  #set enum(numbering: n => if n in (5, 7, 8, 9, 10, 12) [\*#n.] else [#n.])
  + 一刚体棒 $A B$，两端 $A$，$B$ 各在相互垂直的两杆上滑动。现在 $A B$ 间有一点 $P$，已知 $P B$，$P A$ 的长度各为 $a$，$b$。求

    #plainfig((fig-W-q1(), [（第 1 题）]))

    /* p.411 */(1) $P$ 点的轨迹的参数方程；

    (2) 假使 $a$，$b$ 相等时，$P$ 点的轨迹是什么？
  + 过一定点 $Q$ 作直线分别交 $x$ 和 $y$ 两轴于 $A$，$B$ 两点，求 $A B$ 中点 $P$ 的轨迹的方程。

    ［提示：令过 $Q(a, b)$ 点的直线方程为 $y - b = k(x - a)$。令 $k$ 是参数，再分别令 $y = 0$，$x = 0$ 求得 $A$，$B$ 两点的截距。设 $P$ 点的坐标是 $(x, y)$，则
    $ x = 1/2 (O A), quad y = 1/2 (O B), quad dots.c ju #h(-0.3em) "］" $

    #plainfig((fig-W-q2(), [（第 2 题）]))
  + 由圆外一点 $Q(a, b)$ 向圆 $x^2 + y^2 = r^2$ 作割线交圆周于 $A$，$B$ 两点，求 $A B$ 中点 $P$ 的轨迹的方程。

    ［提示：设过 $Q$ 的直线方程是 $y - b = k(x - a)$，$k$ 是参数，则圆心与 $A B$ 中点的连线的方程是 $y = -1/k x$，$dots.c$。］
  + 在双曲线 $beta^2 x^2 - alpha^2 y^2 = alpha^2 beta^2$ 中，一组平行弦的斜率是 $k$，求平分这组弦的直径方程。

    ［提示：解题方法同 6·6 节 1。］
  + 在上题中，设双曲线的一组平行弦的斜率是 $beta^2/(alpha^2 k)$（即上题直径的斜率），求它的对应直径（即上题的共轭直径）的方程。
  + 在抛物线 $y^2 = 2p x$ 中，一组平行弦的斜率是 $k$，求平分这组弦的直径方程。
  + /* p.412 */在椭圆 $b^2 x^2 + a^2 y^2 = a^2 b^2$ 中，一个直径的两端为 $(a cos theta, b sin theta)$，$(-a cos theta, -b sin theta)$：

    (1) 求证 $(-a sin theta, b cos theta)$ 及 $(a sin theta, -b cos theta)$ 是它的共轭直径的两端；

    (2) 求这直径方程及它的共轭直径方程。
  + 在椭圆 $9x^2 + 4y^2 = 36$ 中，证明经过一个直径端点的切线平行于它的共轭直径。
  + 在双曲线 $9x^2 - 4y^2 = 36$ 中，证明经过一个直径端点的切线平行于它的共轭直径。
  + 在双曲线 $4x^2 - y^2 = 4$ 中，已知一条直径是 $x - 2y = 0$，写出它的共轭直径方程。
  + 一个小圆半径是一个大圆半径的四分之一，令小圆在大圆内沿大圆周滚动，求小圆上一个点 $P$ 的轨迹的参数方程和普通方程。

    #plainfig((fig-W-q11(), [（第 11 题）]))

    ［提示：如图上小圆半径 $C B = r$，大圆半径 $O B = 4r$，$∠A O B = phi.alt$。又设 $P(x, y)$ 为小圆上一点。以大圆心为原点，$x$ 轴经过大圆周上 $A$ 点，此 $A$ 点为滚动开始时 $P$ 与大圆周相合之处，所以
    $ overparen(B P) = overparen(B A) dou $
    // p.413
    #W-lead([但], $ overparen(B P) = r(∠P C B) dou $)
    #W-lead([又], $ overparen(B A) = 4r dot phi.alt dou $)
    $ ∴ quad r(∠P C B) = 4r dot phi.alt dou $
    #W-lead([故], $ ∠P C B = 4 phi.alt ju $)
    令
    #eqsys(($x = O M = O D + D M = O D + E P dou$, [(1)]), ($y = M P = D E = D C - E C ju$, [(2)]))
    $ ∵ quad & O D = abs(O C) cos phi.alt = 3r cos phi.alt quad (∵ O C = O B - C B = 3r) dou \
      & ∠P C E = ∠B C E - ∠P C B = (phi.alt + 90°) - 4 phi.alt = 90° - 3 phi.alt dou \
      & E P = abs(C P) sin(∠P C E) = r sin(90° - 3 phi.alt) = r cos 3 phi.alt dou \
      & D C = abs(O C) sin phi.alt = 3r sin phi.alt dou \
      & E C = abs(C P) cos(∠P C E) = r cos(90° - 3 phi.alt) = r sin 3 phi.alt dou $
    ∴ 代入(1)，(2)两式得
    #eqno([(3)], $ cases(x = 3r cos phi.alt + r cos 3 phi.alt dou, y = 3r sin phi.alt - r sin 3 phi.alt ju) $)
    这是所求轨迹的参数方程，参数为 $phi.alt$。

    从三角公式，
    $ & cos 3 phi.alt = 4 cos^3 phi.alt - 3 cos phi.alt dou \
      & sin 3 phi.alt = 3 sin phi.alt - 4 sin^3 phi.alt dou \
      ∴ quad & 3 cos phi.alt + cos 3 phi.alt = 4 cos^3 phi.alt dou \
      & 3 sin phi.alt - sin 3 phi.alt = 4 sin^3 phi.alt dou $
    代入(3)得
    $ cases(x = 4r cos^3 phi.alt dou, y = 4r sin^3 phi.alt ju) $
    这曲线是内摆线的一个特例，因为它有四个歧点，所以叫它是*四歧点内摆线*。］
  + 下页附图中，$O B$ 是一根曲柄，它围绕 $O$ 点旋转；$A B$ 是一根联杆，$A$ 点在 $O x$ 线上滑动，令 $O B$ 长 $r$，$abs(A B) = abs(O B)$，设 $P$ 为 $A B$ 上面一点，又 $abs(P B) = b$，$abs(P A) = a$。求 $P$ 点的轨迹的方程。

    // p.414
    #plainfig((fig-W-q12(), [（第 12 题）]))
]

#summary[
  *1. 参数方程一般形式是*（设 $t$ 是参数）：
  $ cases(x = f_1(t) dou, y = f_2(t) ju) $
  消去 $t$ 可得到普通方程
  $ F(x, y) = 0 quad "或者是" quad y = phi.alt(x) "的形式" ju $

  *2. 参数方程的作用*

  (1) 有些轨迹问题（或有些物理学中的问题），引进参数容易求出它的方程。

  (2) 有些曲线，利用参数方程容易描出它的图像。

  3\. 圆锥曲线的直径（设 $k$ 是平行弦组的斜率）

  (1) 椭圆：$beta^2 x^2 + alpha^2 y^2 = alpha^2 beta^2$，它的直径是 $beta^2 x + alpha^2 k y = 0$；

  (2) 双曲线：$beta^2 x^2 - alpha^2 y^2 = alpha^2 beta^2$，它的直径是 $beta^2 x - alpha^2 k y = 0$；

  (3) 抛物线：$y^2 = 2p x$，它的直径 $y = p/k$。

  （上式中与 $alpha$，$beta$ 的大小无关，$beta^2$ 是 $x^2$ 的系数，$alpha^2$ 是 $y^2$ 的系数。）

  4\. 椭圆与双曲线的共轭直径

  (1) 椭圆 $beta^2 x^2 + alpha^2 y^2 = alpha^2 beta^2$ 的两个共轭直径是
  // p.415
  $ y = k x, quad y = k' x, quad "其中" k k' = -beta^2/alpha^2 fen $

  (2) 双曲线 $beta^2 x^2 - alpha^2 y^2 = alpha^2 beta^2$ 的两个共轭直径是
  $ y = k x, quad y = k' x, quad "其中" k k' = beta^2/alpha^2 ju $
]

#review(title: [复习题六])[
  #set enum(numbering: n => if n in (3, 4, 6, 7, 8, 11, 12) [\*#n.] else [#n.])
  + 根据所给条件，把下列各方程化成参数方程（$theta$，$t$ 是参数）：

    (1) $x^(2/3) + y^(2/3) = a^(2/3)$ 中，当 $x = a cos^3 theta$；

    (2) $x^2 + 4y^2 - 6x + 5 = 0$ 中，当 $x = 3 + 2 cos theta$；

    (3) $x^3 + y^3 - 3a x y = 0$ 中，当 $y = t x$。
  + 消去下列各式的参数（$t$，$phi.alt$，$theta$ 或 $lambda$）：

    #cols[(1) $cases(x = -3 + a csc phi.alt dou, y = 4 + b cot phi.alt fen)$][(2) $cases(x = cos phi.alt dou, y = 2 + cos 2 phi.alt fen)$]

    #cols[(3) $cases(display(x = (x_1 + lambda x_2)/(1 + lambda)) dou, display(y = (y_1 + lambda y_2)/(1 + lambda)) fen)$][(4) $cases(display(x = -(36t)/(4 + 9t^2)) dou, display(y = (8 - 18t^2)/(4 + 9t^2)) fen)$]

    #grid(columns: (auto, 1fr), column-gutter: 2em, row-gutter: 1em, align: horizon,
      [(5) $cases(x = a cos^4 theta dou, y = a sin^4 theta fen)$], [［提示：化成 $cos^2 theta = dots.c$。］],
      [(6) $cases(x = phi.alt - sin phi.alt dou, y = 1 - cos phi.alt ju)$], [［提示：从第二式得 $cos phi.alt = 1 - y$，\ $∴ phi.alt = arccos(1 - y)$；又 $sin phi.alt = dots.c$。］])
  + 在 $9x^2 - 4y^2 = 36$ 中，求对于 $y = 2x + t$ 平行弦的直径，又求它的共轭直径。
  + 在上题的共轭双曲线（参考第四章双曲线节）$4y^2 - 9x^2 = 36$ 中，求以上题的直径的斜率为平行弦组的斜率的直径方程。

    #note-small[从本题的结果看到，双曲线的共轭直径平分一组以原直径为斜率的平行弦，并且也平分一组在它的共轭双曲线中以原直径为斜率的平行弦。]
  + 设椭圆方程是 $beta^2 x^2 + alpha^2 y^2 = alpha^2 beta^2$，它的平行弦的倾角是定值 $gamma$，试从平行弦的参数方程 $x = x' + rho cos gamma$，$y = y' + rho sin gamma$（$rho$ 是参数），求/* p.416 */它的相应直径的方程。

    ［提示：以弦的参数方程代入椭圆方程，并照 $rho$ 的降幂次序排列得
    $ (beta^2 cos^2 gamma + alpha^2 sin^2 gamma) rho^2 + 2(beta^2 x' cos gamma + alpha^2 y' sin gamma) rho \
      + (beta^2 x'^2 + alpha^2 y'^2 - alpha^2 beta^2) = 0 dou $
    // 原书“ρ₁（PP₁ 的长），ρ₂（PP₂ 的长）”，P 疑应作 P′（弦的中点），照录
    照图 6·18(b)，设 $P'$ 是 $P_1 P_2$ 弦的中点，则上式两根是 $rho_1$（$P P_1$ 的长），$rho_2$（$P P_2$ 的长），令 $rho_1 = -rho_2$，那么
    $ rho_1 + rho_2 = (-2(beta^2 x' cos gamma + alpha^2 y' sin gamma))/(beta^2 cos^2 gamma + alpha^2 sin^2 gamma) = 0 ju $
    即 $beta^2 x' cos gamma + alpha^2 y' sin gamma = 0$，即 $beta^2 x' + alpha^2 tan gamma dot y' = 0$，即 $beta^2 x' + alpha^2 k y' = 0$，如 $P'(x', y')$ 以动点 $P(x, y)$ 代替，则前式可改写为 $beta^2 x + alpha^2 k y = 0$，这就是所要求的直径方程。］
  + 用上题方法求下列各圆锥曲线的直径：

    (1) $beta^2 x^2 - alpha^2 y^2 = alpha^2 beta^2$，它们平行弦的斜率是定值 $k$；

    (2) $y^2 = 2p x$，它们平行弦的斜率是定值 $k$；

    (3) $x^2 = 2p y$，它们平行弦的斜率是定值 $k$。
  + 椭圆中一对共轭直径，设它们的一半长度为 $a'$，$b'$，则 $a'^2 + b'^2 = a^2 + b^2$（$a$，$b$ 为椭圆的半长轴及半短轴的长）。

    ［提示：用 $(a cos theta, b sin theta)$，$(a sin theta, -b cos theta)$ 为两共轭直径的各一端。］
  + 在椭圆共轭直径的端点各作切线，围成一个平行四边形，求它的面积。

    #plainfig((fig-W-r8(), [（第 8 题）]))

    /* p.417 */［提示：一直径端点的切线平行于它的共轭直径，所以平行四边形面积 $= 8(△O P R)$。］
  + 求双曲线的两个垂直切线交点的轨迹。

    ［提示：方法同 6·5 节例 5。］
  + 求抛物线的两个垂直切线交点的轨迹。

    ［提示：用切线 $y = k x + p/(2k)$，$y = -x/k - (p k)/2$，再设法消去 $y$，同时也把 $k$ 消去了。］
  + 作(1)椭圆，(2)双曲线，(3)抛物线的切线，从焦点向所作切线作垂线，求垂足的轨迹的方程。

    ［提示：用斜率为 $k$ 的切线式。］
  + 一直线截一双曲线及它的渐近线，证明夹于渐近线与曲线间的线段相等。

    ［提示：设双曲线为
    #eqno([(1)], $ b^2 x^2 - a^2 y^2 = a^2 b^2 dou $)
    则它的渐近线是
    #eqno([(2)], $ b^2 x^2 - a^2 y^2 = 0 ju $)
    又设任意一直线
    #eqno([(3)], $ y = k x + r dou $)
    交(1)于 $P(x_1, y_1)$，$Q(x_4, y_4)$ 两点，又交(2)于 $R(x_2, y_2)$，$S(x_3, y_3)$ 两点。

    #plainfig((fig-W-r12(), [（第 12 题）]))

    以(3)代入(1)得
    #eqno([(4)], $ (b^2 - a^2 k^2) x^2 - 2a^2 r k x - a^2 (r^2 + b^2) = 0 dou $)
    // p.418
    它的两根为 $x_1$，$x_4$，
    #eqno([(5)], $ ∴ quad x_1 + x_4 = (2a^2 r k)/(b^2 - a^2 k^2) ju $)
    又以(3)代入(2)得
    #eqno([(6)], $ (b^2 - a^2 k^2) x^2 - 2a^2 r k x - a^2 r^2 = 0 dou $)
    它的两根为 $x_2$，$x_3$，
    #eqno([(7)], $ ∴ quad x_2 + x_3 = (2a^2 r k)/(b^2 - a^2 k^2) ju $)
    从(5)，(7)得
    $ x_1 + x_4 = x_2 + x_3 dou \
      ∴ quad x_1 - x_2 = x_3 - x_4 ju $
    #W-lead([但], $ (y_1 - y_2)/(x_1 - x_2) = (y_3 - y_4)/(x_3 - x_4) = k dou $)
    $ ∴ quad y_1 - y_2 = y_3 - y_4 ju $
    再由“已知两点求距离”的公式可推得
    $ P R = S Q ju #h(-0.3em) "］" $
  + 设一圆锥曲线的方程是 $A x^2 + B x y + C y^2 + D x + E y + F = 0$，它的一组平行弦的斜率是 $k$，求证它相应的直径的方程是
    $ (2A + B k) x + (B + 2C k) y + (D + E k) = 0 ju $

    ［提示：按照 6·6 节 1 的方法求直径方程。］
  + 等边双曲线的方程是 $x y = lambda$，它的一组平行弦的斜率是 $k$，求证它相应的直径的方程是 $k x + y = 0$。
]
