// 第 4 章（续）本章提要、复习题四（原书 p.134 下半–138；p.134 上半是习题 4·9(2)，不在本文件，本章提要从 p.134 中部起）
#import "/common/series.typ": *

// p.134
#summary[
*1. 虚数单位 $i$*

性质：(1) $i^2 = -1$；

(2) $i$ 与实数在一起可以按照通常四则运算的法则进行四则运算。

推论：$i$ 的整数次幂具有周期性：

$ i^(4n+1) = i dou quad i^(4n+2) = -1 dou quad i^(4n+3) = -i dou quad i^(4n+4) = 1 ju $

*2. 复数*

定义：形如 $a + b i$ 的数（$a$、$b$ 都是实数）。

几何意义：

(1) 表示平面上的点 $M(a, b)$； #h(1em) (2) 表示平面上的向量 $arrow(O M)$。

*3. 复数的代数式与三角函数式的互化*

$ z = a + b i = r (cos theta + i sin theta) ju $

$r$——模数（绝对值）

$ r = |z| = |a + b i| = sqrt(a^2 + b^2) ju $

$theta$——辐角

#grid(
  columns: (auto, 1fr), column-gutter: 2em, align: horizon,
  [确定辐角的公式：], align(center, $ cases(cos theta = a/r dou, sin theta = b/r ju) $),
)

#grid(
  columns: (auto, 1fr), column-gutter: 1em, row-gutter: 0.9em,
  [辐角的主值区间：], [$0 <= theta' < 2 pi$。],
  [辐角的一般表示式：], [$theta = 2 k pi + theta'$ #h(1em) （$k$ 是整数）。],
)

*4. 复数的相等*

// p.135
(1) $ a_1 + b_1 i = a_2 + b_2 i quad <-> quad cases(a_1 = a_2 dou, b_1 = b_2 ju) $

(2) $ r_1 (cos theta_1 + i sin theta_1) = r_2 (cos theta_2 + i sin theta_2) quad <-> quad cases(r_1 = r_2 dou, theta_1 = 2 k pi + theta_2 ju) $

*5. 共轭复数* #h(0.5em) $z = a + b i$ 和 $overline(z) = a - b i$ 互为共轭复数。

*6. 复数的运算*

(1) 加法 #h(0.5em) $(a_1 + b_1 i) + (a_2 + b_2 i) = (a_1 + a_2) + (b_1 + b_2) i ju$

(2) 减法 #h(0.5em) $(a_1 + b_1 i) - (a_2 + b_2 i) = (a_1 - a_2) + (b_1 - b_2) i ju$

(3) 乘法

(i) $(a_1 + b_1 i)(a_2 + b_2 i) = (a_1 a_2 - b_1 b_2) + (b_1 a_2 + a_1 b_2) i ju$

(ii) $r_1 (cos theta_1 + i sin theta_1) dot r_2 (cos theta_2 + i sin theta_2) \
  quad quad = r_1 r_2 [cos(theta_1 + theta_2) + i sin(theta_1 + theta_2)] ju$

(4) 除法

(i) $(a_1 + b_1 i)/(a_2 + b_2 i) = ((a_1 + b_1 i)(a_2 - b_2 i))/(a_2^2 + b_2^2) #h(1em) (a_2 + b_2 i != 0) ju$

(ii) $(r_1 (cos theta_1 + i sin theta_1))/(r_2 (cos theta_2 + i sin theta_2)) = r_1/r_2 [cos(theta_1 - theta_2) + i sin(theta_1 - theta_2)] #h(1em) (r_2 != 0) ju$

(5) 乘方

(i) 应用二项式定理。

(ii) 应用棣美弗定理

$ [r (cos theta + i sin theta)]^n = r^n (cos n theta + i sin n theta) ju $

(6) 开方

$ root(n, r (cos theta + i sin theta)) = root(n, r) lr((cos (2 k pi + theta)/n + i sin (2 k pi + theta)/n)) \
  (k = 0, 1, 2, dots.c, n - 1) ju $
]

#review(title: [复习题四])[
1. 计算：

(1) $i^(k+4) + i^(k+5) + i^(k+6) + i^(k+7)$ #h(1em) （$k$ 是自然数）；

(2) $1 + i + i^2 + i^3 + dots.c + i^55$。

2. 设 $z_1 = a_1 + b_1 i$、$z_2 = a_2 + b_2 i$ 是两个复数，在什么条件下有：

// p.136
(1) $z_1 + z_2$ 是实数？是纯虚数？

(2) $z_1 - z_2$ 是实数？是纯虚数？

(3) $z_1 dot z_2$ 是实数？是纯虚数？

(4) $z_1/z_2$ 是实数？是纯虚数？（这里 $z_2 != 0$。）

(5) $z_1^2$ 是实数？是纯虚数？

3. 已知下列这些命题都是成立的，写出它们的逆命题。这些逆命题是否仍成立？

(1) 模数、辐角分别相等的两个复数一定相等；

(2) 共轭复数的模数相等。

[提示：要否定一个命题成立，只需举一个例子来说明就可以了。例如，命题“两个偶数的和是偶数”的逆命题是“两个加数的和是偶数，则这两个加数都是偶数”，只要举出 $1 + 3 = 4$ 一例，因 4 是偶数，但 1 和 3 都不是偶数，就足以说明这个逆命题不成立。]

4. (1) 已知 $z = r (cos theta + i sin theta)$，求证它的共轭复数 $overline(z)$ 可以写成 $r (cos theta - i sin theta)$ 的形式。

(2) 如果复数 $z$ 的辐角的主值是 $alpha$ $(0 <= alpha < 2 pi)$，怎样用 $alpha$ 的代数式来表示复数 $overline(z)$ 的辐角？表示 $overline(z)$ 的辐角的主值？

5. 求适合下列各式的实数 $x$ 和 $y$：

(1) $(1 + 2i) x + (3 - 10 i) y = 5 - 6i$；

(2) $x^2 + x i + 2 - 3i = y^2 + y i + 9 - 2i$；

(3) $2 x^2 - 5x + 2 + (y^2 + y - 2) i = 0$；

(4) $x/(1 - i) + y/(1 - 2i) = 5/(1 - 3i)$。

6. 化简：

(1) $(1 - sqrt(3) i)^6 [cos(phi - 3 theta) + i sin(phi - 3 theta)] \
  times ((cos 2 theta + i sin 2 theta)^3 (cos 2 phi - i sin 2 phi))/(cos(theta - phi) + i sin(theta - phi))$；

(2) $((sqrt(3) + i)^3 lr((cos pi/3 + i sin pi/3)))/(lr((cos pi/12 - i sin pi/12))^3)$。

// p.137
7. 计算：

(1) $(-1 + sqrt(3) i)^6 - (-1 - sqrt(3) i)^6$；

(2) $((-1 + sqrt(2) i)^4 (-1 - sqrt(2) i)^4)/((sqrt(2) + i)^4 (sqrt(2) - i)^4)$。

8. 计算：

(1) $(x - 1 - sqrt(2) i)(x - 1 + sqrt(2) i)(x + 1 - sqrt(2) i)(x + 1 + sqrt(2) i)$；

(2) $(x - sqrt(2) + i)(x + sqrt(2) + i)(x + sqrt(2) - i)(x - sqrt(2) - i)$。

9. 已知 $m$ 是一个不等于零的实数，且 $|m| < 1$。求证

$ (sqrt(1 + m) + sqrt(1 - m) i)/(sqrt(1 + m) - sqrt(1 - m) i) - (sqrt(1 - m) + sqrt(1 + m) i)/(sqrt(1 - m) - sqrt(1 + m) i) $

的值是一个实数。

10. 设 $omega = (-1 + sqrt(3) i)/2$，求证：

(1) $(1 - omega + omega^2)(1 + omega - omega^2) = 4$；

(2) $(1 - omega)(1 - omega^2)(1 - omega^4)(1 - omega^8) = 9$；

(3) $a^3 + b^3 = (a + b)(a omega + b omega^2)(a omega^2 + b omega)$；

(4) $a^3 + b^3 + c^3 - 3 a b c = (a + b + c)(a + b omega + c omega^2)(a + b omega^2 + c omega)$。

\[提示：可以利用 $omega$ 的性质（见习题 4·8(1) 第 4 题）：

$ omega^3 = 1 dou quad quad 1 + omega + omega^2 = 0 ju "]" $

11. 利用 $sqrt(x^2 - y^2 plus.minus 2 x y) = plus.minus (x + y i)^2$，计算：

#cols[(1) $sqrt(-3 + 4i)$；][(2) $sqrt(7 + sqrt(15) i)$；]
#cols[(3) $sqrt(5 - sqrt(11) i)$；][(4) $sqrt(-7 - sqrt(15) i)$。]

12. 设 $f(z) = (z^2 - z + 1)/(z^2 + z + 1)$，求：

#cols[(1) $f(2 + 3i)$，][(2) $f(2 - 3i)$]

的值。

[提示：$f(z)$ 表示复数 $z$ 的函数。在右边这个分式中，令 $z = 2 + 3i$，化简后即得 $f(2 + 3i)$ 的值。]

\*13. 求作关于 $z$ 的二次方程，使它的两根是：

#cols[(1) $(1 + sqrt(3) i)/2$ 和 $(1 - sqrt(3) i)/2$；][(2) $(2 - i)/(1 + i)$ 和 $(2 + i)/(1 - i)$。]

\*14. 设 $z_1$、$z_2$ 是不等于零的复数，用几何方法证明

// p.138
$ |z_1| + |z_2| >= |z_1 + z_2| >= |z_1| - |z_2| fen $

并回答下列问题：

(1) 这个二重不等式的两个等号能否同时成立？

(2) $|z_1| + |z_2| >= |z_1 + z_2|$ 中，什么情况下等号成立？

(3) $|z_1 + z_2| >= |z_1| - |z_2|$ 中，什么情况下等号成立？

\*15. 求证 $|z_1 + z_2|^2 + |z_1 - z_2|^2 = 2 |z_1|^2 + 2 |z_2|^2$，并作出几何解释。

16. 已知甲数的平方等于乙数，且乙数的平方等于甲数，求这两个数。

17. 设 $z$ 的共轭虚数是 $overline(z)$，解下列方程：

#cols[(1) $z + |overline(z)| = 2 + i$；][(2) $z^2 = overline(z)$。]

[提示：设 $z = x + y i$ $(y != 0)$，则 $overline(z) = x - y i$。]
]
