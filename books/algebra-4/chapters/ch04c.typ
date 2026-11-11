// 第 4 章（续）§4·5 复数的加法和减法、§4·6 复数的乘法（原书 p.107 下半–118，到习题 4·6(3) 结束）；§4·7 起见 ch04d.typ
#import "/common/series.typ": *
#import "/books/algebra-4/figures/fig4-8.typ": fig-4-8, fig-4-9, fig-4-10, fig-4-11, fig-4-12
#import "/books/algebra-4/figures/fig4-13.typ": fig-4-13, fig-4-14

// 局部辅助：原书里的粗斜体向量字母 f、F
#let bf(s, sub: none) = if sub == none { $bold(italic(#s))$ } else { $bold(italic(#s))_#sub$ }

// p.107
== 复数的加法和减法

我们已经知道，一个复数 $z$ 可以用复数的代数形式 $a + b i$ 或者复数的三角形式 $r (cos theta + i sin theta)$ 来表示；并且知道，复数 $z$ 就对应着平面内的一个点 $M(a, b)$，或者一个向量 $arrow(O M)$，由此使复数得到了几何解释。

// p.108
在这基础上，现在就可以来建立复数的各种运算的法则，并且对复数的各种运算作出几何的解释。本节先研究复数的加法和减法。

*1. 复数加法和减法的法则* 复数的加法和减法，可以按照多项式的加法和减法的法则来进行。就是：#edot[实部和实部相加减，虚部和虚部相加减]。用式子来表示即是：

$ (a_1 + b_1 i) + (a_2 + b_2 i) = (a_1 + a_2) + (b_1 + b_2) i ju $

#ex("例 1")[计算：

(1) $(1 - i) + (2 - i^3) + (3 - i^5) + (4 - i^7)$；

(2) $(root(3, -8) + 2 sqrt(2) i) - (sqrt(2) i - 2)$。]

#sol[(1) $ "原式" &= (1 - i) + (2 + i) + (3 - i) + (4 + i) \
  &= (1 + 2 + 3 + 4) + (-1 + 1 - 1 + 1) i \
  &= 10 ju $

(2) $ "原式" &= (-2 + 2 sqrt(2) i) + (2 - sqrt(2) i) \
  &= (-2 + 2) + (2 sqrt(2) - sqrt(2)) i \
  &= sqrt(2) i ju $]

#attention[复数的和，或者差，仍旧是复数。在特殊情况下，这种复数可能就是实数或者纯虚数。]

#ex("例 2")[计算 $z_1$ 与 $z_2$ 的和，已知

$ z_1 = 2 lr((cos pi/3 + i sin pi/3)) dou \
  z_2 = 4 lr((cos pi/6 + i sin pi/6)) ju $]

#sol[$ z_1 = 2 lr((1/2 + sqrt(3)/2 i)) = 1 + sqrt(3) i dou \
  z_2 = 4 lr((sqrt(3)/2 + 1/2 i)) = 2 sqrt(3) + 2i dou $

$ therefore quad z_1 + z_2 = (1 + 2 sqrt(3)) + (2 + sqrt(3)) i ju $]

// p.109
#remark([说明], [复数用三角形式表示时，欲求它们的和或差，一般要先把它们改用代数形式表示，这样可使计算比较简单。题中如无其他要求，求到的和或差，可以不必再化成复数的三角形式。])

#ex("例 3")[设 $(x + 2 y i) + (y - 3 x i) - (5 - 5i) = 0$，求实数 $x$、$y$ 的值。]

#analysis[先把左边化简成 $a + b i$ 的形式。从 $a + b i = 0$ 得 $a = 0, b = 0$。即可列出关于 $x, y$ 的方程组，从而求出 $x, y$ 的实数值。]

#sol[$ because quad (x + 2 y i) + (y - 3 x i) - (5 - 5i) = 0 dou $

$ therefore quad (x + y - 5) + (2y - 3x + 5) i = 0 ju $

既然 $x, y$ 均为实数，所以，根据复数相等的规定，有

$ cases(x + y - 5 = 0 dou, 2y - 3x + 5 = 0 ju) $

解这个方程组，得

$ x = 3 dou quad quad y = 2 ju $]

#exercise("4·5(1)")[
1. 计算：

(1) $lr((2/3 + i)) + lr((1 - 2/3 i)) - lr((1/2 + 3/4 i))$；

(2) $(-sqrt(2) + sqrt(3) i) + (sqrt(3) - sqrt(2) i) - [(sqrt(3) - sqrt(2)) + (sqrt(3) + sqrt(2)) i]$；

(3) $[(a + b) + (a - b) i] - [(a - b) - (a + b) i]$ #h(1em) （$a, b$ 均为实数）；

(4) $(2x + 3 y i) - (3x - 2 y i) + (y - 2 x i) - 3 x i$ #h(1em) （$x, y$ 均为实数）；

(5) $(1 - 3 i^7) + (2 + 4 i^9) - (3 - 5 i^3)$。

2. 计算：

(1) $(cos 210° + i sin 210°) + (cos 120° + i sin 120°)$；

(2) $3 (cos 60° + i sin 60°) - 2 (cos 180° + i sin 180°) + lr((-3/2 + sqrt(3)/2 i))$。

// p.110
3. 求实数 $x$ 和 $y$ 的值：

(1) $(2 + 5 x i) - 3 y i - (14 i + 3x - 5y) = 0$；

(2) $(x + x i) + (y - y i) - (-3 + i) = 0$；

(3) $lr((1/y + 1/x i)) + lr((-1/x + 1/y i)) + lr((1/6 - 5/y i)) = 0$。

4. 求证：两个共轭虚数的和是实数，差是纯虚数。

\*5. 设 $z$ 是复数，解下列关于 $z$ 的方程：

#cols[(1) $2z + overline(z) - 6i = 6 - 3i$；][(2) $|z| - z = 1 + 2i$。]

[提示：设 $z = x + y i$，代入方程，从而解出 $x$ 和 $y$。]
]

*\*2. 复数加、减法的几何解释* 利用复数与向量间的对应关系，对复数的加法和减法的意义，不难作出几何的解释。

想必读者已经知道，物理学里像力、速度这些量，都是向量（也称作矢量）；对于两个向量，可以应用平行四边形法则进行加法运算。例如，图 4·8 中 #bf("F", sub: 1) 和 #bf("F", sub: 2) 表示作用于同一点 $O$ 的两个力；用表示这两个力的有向线段 $arrow(O M_1)$，$arrow(O M_2)$ 作为邻边，画出平行四边形，那么通过这个作用点 $O$ 的对角线 $arrow(O M)$ 就表示这两个力的合力 #bf("F")。这就是说：

$ arrow(O M) = arrow(O M_1) + arrow(O M_2) ju $

#fig("4·8", fig-4-8())[]

现在，我们来证明：如果向量 $arrow(O M_1)$ 与 $arrow(O M_2)$ 所对应的复数分别是：

$ z_1 = a_1 + b_1 i dou quad quad z_2 = a_2 + b_2 i dou $

那么这两个向量的和 $arrow(O M)$ 所对应的复数 $z$，正就是上面所规定的复数 $z_1$ 与 $z_2$ 的和 $(a_1 + a_2) + (b_1 + b_2) i$/* 原书作 (a₁+b₁)+(a₂+b₂i) */。

#sol(label: [证])[$O M_1 M M_2$ 是平行四边形（图 4·9），点 $M_1$ 的坐标是 $(a_1, b_1)$，点 $M_2$ 的坐标是 $(a_2, b_2)$。

作 $x$ 轴的垂线 $M_1 N_1$，$M_2 N_2$ 和 $M N$，并且作 $M_1 S perp M N$。容易证明，这时有

$ triangle M_1 S M tilde.equiv triangle O N_2 M_2 dou $

四边形 $M_1 N_1 N S$ 是矩形。]

#fig("4·9", fig-4-9())[]

// p.111
于是，

$ O N = O N_1 + N_1 N = O N_1 + M_1 S = O N_1 + O N_2 = a_1 + a_2 dou \
  N M = N S + S M = N_1 M_1 + N_2 M_2 = b_1 + b_2 ju $

由此得 $M$ 的坐标是 $(a_1 + a_2, b_1 + b_2)$。从而可知，向量 $arrow(O M)$ 对应复数

$ (a_1 + a_2) + (b_1 + b_2) i ju $

这样，复数的加法就得到了几何解释。

如果先作出与 $z_1$ 对应的向量 $arrow(O M_1)$，与 $z_2$ 对应的向量 $arrow(O M_2)$，然后，以 $O M_1$ 为对角线，以 $O M_2$ 为一边，作平行四边形 $O M_2 M_1 M$（图 4·10），容易证明 $arrow(O M)$ 就对应着 $z_1$ 与 $z_2$ 的差

$ (a_1 - a_2) + (b_1 - b_2) i /* 原书作 (a_1 - b_1) + (a_2 - b_2) i */ ju $

这样，复数的减法也就得到了几何的解释。

#fig("4·10", fig-4-10())[]

理解了复数加减法的几何解释，就可以应用复数这一工具来解一些实际问题。

#ex("例 4")[两个力都等于 6 公斤#dnote[原书以“公斤”作力的单位，指千克力（kgf），1 千克力约等于 9.8 牛顿；现代力的单位用牛顿（N）。本节例题、习题里的“公斤”都按原书照录，数值不换算。]，作用于一点，并成 $120°$ 角。求它们的合力。]

#analysis[根据力的合成法则，这个问题可以用图解法解出，解法如下：

作 □$O M_1 M M_2$，使

$ O M_1 = O M_2 = 6 "厘米" dou \
  angle M_1 O M_2 = 120° ju $

量出 $O M$ 的长度，得 6 厘米。量出 $angle M_1 O M$ 的大小，得 $60°$。由此可知，所求的合力是 6 公斤，它与这两个力都成 $60°$ 角。]

#fig("4·11", fig-4-11())[]

从上面的解法中可以看出，如果把作用点 $O$ 作为坐标系的原点，$arrow(O M_1)$ 所在直线作为 $x$ 轴，那么这两个力就可以分别用复数

$ bold(italic(f))_1 &: quad z_1 = 6 (cos 0° + i sin 0°) dou \
  bold(italic(f))_2 &: quad z_2 = 6 (cos 120° + i sin 120°) $

来表示。由此可知，只要求出 $z_1$ 与 $z_2$ 的和 $z$，那么，$z$ 的模就表示合/* p.112 */力 #bf("f") 的大小；$z$ 的辐角就表示力 #bf("f", sub: 1) 与合力 #bf("f") 间的夹角，从而确定了合力 #bf("f") 的方向。这样，就得到下面的复数解法。

#sol[设力 #bf("f", sub: 1) 与 #bf("f", sub: 2) 分别对应着复数

$ z_1 &= 6 (cos 0° + i sin 0°) = 6 dou \
  z_2 &= 6 (cos 120° + i sin 120°) = -3 + 3 sqrt(3) i ju $

那么它们的合力所对应的复数就是

$ z = z_1 + z_2 = 3 + 3 sqrt(3) i ju $

可以求得

$ |z| &= sqrt(9 + 27) = 6 fen \
  tan theta &= (3 sqrt(3))/3 = sqrt(3) dou quad therefore quad theta = 60° ju $

由此可知，合力 #bf("f") 是 6 公斤，且与力 #bf("f", sub: 1) 成 $60°$ 角。]

#note-small[为了叙述上的简便，“力 #bf("f", sub: 1) 对应着复数 $z_1 = 6 (cos 0° + i sin 0°)$”也可以直接用

$ bold(italic(f))_1 = 6 (cos 0° + i sin 0°) $

来表示。]

#ex("例 5")[有作用于一点的两个力 #bf("f", sub: 1) 和 #bf("f", sub: 2)，已知它们的大小分别是 14.14 公斤和 20.00 公斤，方向分别是北 $45°$ 东、南 $60°$ 东，求它们的合力。]

#sol[取作用点为原点，从西向东方向作为 $x$ 轴的正方向（图 4·12）。则

$ bold(italic(f))_1 &= 14.14 (cos 45° + i sin 45°) \
  &approx 10 sqrt(2) lr((1/sqrt(2) + 1/sqrt(2) i)) \
  &= 10 + 10 i dou \
  bold(italic(f))_2 &= 20.00 [cos(-30°) + i sin(-30°)] = 10 sqrt(3) - 10 i ju \
  therefore quad bold(italic(f)) &= bold(italic(f))_1 + bold(italic(f))_2 = 10 (1 + sqrt(3)) - 0 i ju \
  therefore quad |bold(italic(f))| &= 10 (1 + sqrt(3)) approx 27.32 dou \
  theta &= 0° ju $

由此可知，合力 #bf("f") 的大小为 27.32 公斤，它的方向为正东。]

#fig("4·12", fig-4-12())[]

// p.113
#exercise("4·5(2)", star: true)[
1. 用几何方法作下列加减法：

#cols[(1) $(4 + 5i) + (2 + 3i)$；][(2) $(4 + 5i) - (2 + 3i)$；]

(3) $(cos 210° + i sin 210°) + 2 (cos 120° + i sin 120°)$；

(4) $2 (cos 120° + i sin 120°) - 3 (cos 135° + i sin 135°)$。

2. 设有平行四边形 $A B C D$，它的三个顶点 $A$、$B$、$D$ 可以分别用复数 $0 + 0i$、$2 + 0i$、$1 + i$ 来表示，试考虑下述问题：

(1) 画出这个平行四边形；

(2) 用复数来表示它的另一顶点 $C$；

(3) 求对角线 $A C$ 的长；

(4) 求对角线 $B D$ 的长。

[提示：把 $arrow(B D)$ 平行移动到 $arrow(A E)$ 的位置，则 $arrow(B D) = arrow(A E) = arrow(A D) - arrow(A B)$。]

3. 在第 I 象限里有一个锐角是 $30°$ 的直角三角形，它的直角顶点和 $30°$ 角的顶点可以分别用复数

$ z_1 = sqrt(3) + 0 i dou quad quad z_2 = 2 sqrt(3) + i $

来表示。求表示第三个顶点的复数。

4. 有两力 $bold(italic(f))_1 = 30.00$ 公斤、$bold(italic(f))_2 = 40.00$ 公斤作用于一点，它们的夹角是 $60°$，求合力的大小。
]

== 复数的乘法

*1. 复数乘法的法则* 像复数的加减法一样，复数的乘法也可以按照多项式乘法的法则来进行，在所得的结果中把 $i^2$ 换成 $-1$，并且把实数和纯虚数分别合并。

用式子来表示，就是

$ (a_1 + b_1 i)(a_2 + b_2 i) = (a_1 a_2 - b_1 b_2) + (a_1 b_2 + a_2 b_1) i ju $

#ex("例 1")[计算 $(1 + i)(4 - i^3)(2 + 3 i^5)$。]

#sol[$ (1 + i)(4 - i^3)(2 + 3 i^5) &= (1 + i)(4 + i)(2 + 3i) \
  &= (3 + 5i)(2 + 3i) = -9 + 19 i ju $]

// p.114
#ex("例 2")[验证

$ x^4 + 4 = (x - 1 - i)(x - 1 + i)(x + 1 - i)(x + 1 + i) ju $]

#sol(label: [证])[$ & (x - 1 - i)(x - 1 + i)(x + 1 - i)(x + 1 + i) \
  &= [(x - 1)^2 - i^2][(x + 1)^2 - i^2] \
  &= (x^2 - 2x + 2)(x^2 + 2x + 2) = x^4 + 4 ju $

原式得证。]

#ex("例 3")[设 $x$、$y$ 是实数，解方程

$ (1 + 2i)(x + y i) + (2y - 2 x i) = -5 + 3i ju $]

#sol[原方程可化为

$ (x - 2y) + (2x + y) i + (2y - 2 x i) = -5 + 3i dou $

即

$ x + y i = -5 + 3i ju $

因为 $x$、$y$ 是实数，按复数相等的规定，有

$ x = -5 dou quad quad y = 3 ju $]

#exercise("4·6(1)")[
1. 计算：

(1) $(-5 + 6i)(-3i)$；

(2) $(-3 - 4i)(2 + 3i)$；

(3) $(0.1 + 0.3i)(-0.1 - 0.4i)$；

(4) $lr((-1/2 + sqrt(3)/2 i)) lr((-1/2 - sqrt(3)/2 i))$。

2. 已知 $a > b > 0$，计算：

(1) $(a + sqrt(b) i)(a - sqrt(b) i)(-a + sqrt(b) i)(-a - sqrt(b) i)$；

(2) $sqrt(b - a) (sqrt(a - b) - sqrt(b - a))$。

[提示：$sqrt(b - a) = sqrt(a - b) i$。]

3. (1) 证明 $(a + b i)(a - b i) = a^2 + b^2$；

(2) 应用上面这个公式，分解下列各式为一次因式的积：

#cols[(i) $x^2 + 4$，][(ii) $x^4 - a^4$ #h(1em) （$a$ 为实数），]
#cols[(iii) $x^2 + 2x + 2$，][(iv) $x^2 + x + 1$。]

// p.115
[解法举例：(iii) $x^2 + 2x + 2 = (x^2 + 2x + 1) + 1 = (x + 1)^2 - i^2 = (x + 1 + i) dot (x + 1 - i)$。]

4. 已知 $x$、$y$ 均为实数，解下列各方程：

(1) $(x + y i) i - 2 + 4i = (x - y i)(1 + i)$；

(2) $(x + 1) + (y - 3) i = (1 + i)(5 + 3i)$。
]

*2. 复数三角形式的乘法运算* 我们来计算复数

$ z_1 = r_1 (cos theta_1 + i sin theta_1) dou \
  z_2 = r_2 (cos theta_2 + i sin theta_2) $

的积。

根据上面所述的复数乘法法则，容易算出：

$ z_1 z_2 &= r_1 r_2 (cos theta_1 + i sin theta_1)(cos theta_2 + i sin theta_2) \
  &= r_1 r_2 [(cos theta_1 cos theta_2 - sin theta_1 sin theta_2) \
  &quad quad + (cos theta_1 sin theta_2 + sin theta_1 cos theta_2) i] ju $

根据三角学中的知识，知道：

$ cos theta_1 cos theta_2 - sin theta_1 sin theta_2 = cos(theta_1 + theta_2) dou \
  cos theta_1 sin theta_2 + sin theta_1 cos theta_2 = sin(theta_1 + theta_2) ju $

代入上式，即得

$ z_1 z_2 = r_1 r_2 [cos(theta_1 + theta_2) + i sin(theta_1 + theta_2)] ju $

这就是说，两个复数相乘时，#edot[积的模等于因数模的积]，#edot[而积的辐角等于因数的辐角的和]。

从这个法则可以看出，在复数相乘时把它们表示成三角形式后进行计算就比较简便。

#ex("例 4")[已知

$ z_1 = r_1 (cos theta_1 + i sin theta_1) dou \
  z_2 = r_2 (cos theta_2 + i sin theta_2) dou \
  z_3 = r_3 (cos theta_3 + i sin theta_3) dou $

求 $z_1 z_2 z_3$。]

#sol[$ because quad z_1 z_2 = r_1 r_2 [cos(theta_1 + theta_2) + i sin(theta_1 + theta_2)] dou $

// p.116
$ therefore quad z_1 z_2 z_3 &= r_1 r_2 [cos(theta_1 + theta_2) + i sin(theta_1 + theta_2)] \
  &quad dot r_3 (cos theta_3 + i sin theta_3) \
  &= r_1 r_2 r_3 [cos(theta_1 + theta_2 + theta_3) + i sin(theta_1 + theta_2 + theta_3)] ju $]

由例 4 容易看出，对于 $n$ 个复数

$ z_1 &= r_1 (cos theta_1 + i sin theta_1) dou \
  z_2 &= r_2 (cos theta_2 + i sin theta_2) dou \
  &"……………………………" \
  z_n &= r_n (cos theta_n + i sin theta_n) $

的积，可以用下式直接写出：

$ z_1 z_2 dots.c z_n &= r_1 r_2 dots.c r_n [cos(theta_1 + theta_2 + dots.c + theta_n) \
  &quad quad + i sin(theta_1 + theta_2 + dots.c + theta_n)] ju $

#ex("例 5")[计算

$ 3 (cos 18° + i sin 18°) dot 2 (cos 54° + i sin 54°) \
  dot 5 (cos 108° + i sin 108°) ju $]

#sol[$ & 3 (cos 18° + i sin 18°) dot 2 (cos 54° + i sin 54°) \
  & quad dot 5 (cos 108° + i sin 108°) \
  &= 30 [cos(18° + 54° + 108°) + i sin(18° + 54° + 108°)] \
  &= 30 (cos 180° + i sin 180°) = -30 ju $]

#ex("例 6")[化简 $(cos 3 theta - i sin 3 theta)(cos 2 theta - i sin 2 theta)$。]

#analysis[这里的两个因式，都还不是复数的三角形式，所以要先把它们化成复数的三角形式，才能应用上面的法则。]

#sol[$ & (cos 3 theta - i sin 3 theta)(cos 2 theta - i sin 2 theta) \
  &= [cos(-3 theta) + i sin(-3 theta)][cos(-2 theta) + i sin(-2 theta)] \
  &= cos(-3 theta - 2 theta) + i sin(-3 theta - 2 theta) \
  &= cos(-5 theta) + i sin(-5 theta) ju $]

// p.117
#exercise("4·6(2)")[
1. 计算：

(1) $sqrt(2) lr((cos pi/12 + i sin pi/12)) dot sqrt(3) lr((cos pi/6 + i sin pi/6))$；

(2) $8 lr((cos pi/6 + i sin pi/6)) dot 2 lr((cos pi/6 - i sin pi/6))$；

(3) $(1 - i) lr((-1/2 + sqrt(3)/2 i)) lr([cos lr((5 pi/12 - theta)) - i sin lr((5 pi/12 - theta))])$；

(4) $2 (cos 12° + i sin 12°) dot 3 (cos 78° + i sin 78°) dot 1/6 (cos 45° + i sin 45°)$。

2. 证明：

(1) $3 (cos 75° - i sin 75°)(cos 15° - i sin 15°) = -3i$；

(2) $(cos 3 theta + i sin 3 theta)(cos 2 theta - i sin 2 theta) = (cos 5 theta + i sin 5 theta)(cos 4 theta - i sin 4 theta)$。
]

*\*3. 复数乘法的几何解释* 根据复数三角形式的乘法法则，不难作出复数乘法的几何解释。

设复数 $z_1 = r_1 (cos theta_1 + i sin theta_1)$，$z_2 = r_2 (cos theta_2 + i sin theta_2)$ 分别与向量 $arrow(O M_1)$，$arrow(O M_2)$ 对应。它们的积

$ z = z_1 dot z_2 = r_1 r_2 [cos(theta_1 + theta_2) + i sin(theta_1 + theta_2)] $

与向量 $arrow(O M)$ 对应（图 4·13）。

#fig("4·13", fig-4-13())[]

// p.118
从图中可以看出，复数 $z_1$ 乘以复数 $z_2$ 的几何意义就是：把 $z_1$ 所对应的向量 $arrow(O M_1)$ 先按照 $z_2$ 的辐角 $theta_2$ 旋转一个角 $theta_2$，再把 $arrow(O M_1)$ 的长度按照 $z_2$ 的模 $r_2$ 改变 $r_2$ 倍，所得到的一个新的向量 $arrow(O M)$，即是复数 $z_1 dot z_2$ 所对应的向量。

#ex("*例 7")[用几何的方法做下面的乘法：

$ 2 (cos 60° + i sin 60°) dot 3 (cos 45° + i sin 45°) dou $

并用复数的代数形式表示求得的结果。]

#fig("4·14", fig-4-14())[]

#sol[作出复数 $2 (cos 60° + i sin 60°)$ 与复数 $3 (cos 45° + i sin 45°)$ 的向量 $arrow(O M_1)$ 与 $arrow(O M_2)$，将向量 $arrow(O M_1)$ 旋转 $45°$ 的角并且伸长 3 倍，得到新的向量 $arrow(O M)$，它所对应的复数 $-1.6 + 5.8 i$ 即为所求的积。]

#exercise("4·6(3)", star: true)[
下列各题中，作出复数 $z_1$ 与 $z_2$ 以及它们的积 $z$ 所对应的向量：

1. $z_1 = 2 (cos 30° + i sin 30°)$， #h(1em) $z_2 = 3 (cos 60° + i sin 60°)$。

2. $z_1 = 2 sqrt(2) (cos 15° + i sin 15°)$，

$z_2 = sqrt(2) (cos 120° + i sin 120°)$。

3. $z_1 = 1 - i$， #h(2em) $z_2 = 2 (cos 75° + i sin 75°)$。

4. $z_1 = 2 + i$， #h(2em) $z_2 = 4 + 3i$。
]
