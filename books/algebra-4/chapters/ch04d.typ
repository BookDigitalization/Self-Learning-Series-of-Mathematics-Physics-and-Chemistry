// 第 4 章（续）§4·7 复数的除法、§4·8 复数的乘方、§4·9 复数的开方（原书 p.119–134 上半，到习题 4·9(2) 结束；本章提要从 p.134 中部起，见 ch04e.typ）
#import "/common/series.typ": *
#import "/books/algebra-4/figures/fig4-13.typ": fig-4-15, fig-4-16, fig-4-17

// p.119
== 复数的除法

在习题 4·6(1) 的第 3 题，曾经证明过：

$ (a + b i)(a - b i) = a^2 + b^2 ju $

这就是说，两个共轭复数的积是一个实数。根据这一性质，就可以应用复数乘法的法则来做复数的除法。

设 $z_1 = a_1 + b_1 i$，$z_2 = a_2 + b_2 i$，并设 $z_2 != 0$，那么

$ z_1 / z_2 &= (a_1 + b_1 i)/(a_2 + b_2 i) = ((a_1 + b_1 i)(a_2 - b_2 i))/((a_2 + b_2 i)(a_2 - b_2 i)) \
  &= (a_1 a_2 + b_1 b_2)/(a_2^2 + b_2^2) + (a_2 b_1 - a_1 b_2)/(a_2^2 + b_2^2) i ju $

这就是说：#edot[两个复数相除（除数不为零），可以先把它们写成分式的形式，然后将分子分母同乘以分母的共轭复数，并且把结果化简]。

#ex("例 1")[计算 $(18 - i)/(4 - 3i) + i (3 - 5i) - (55 + 3i)/(5 + 7i)$。]

#sol[$ "原式" &= ((18 - i)(4 + 3i))/((4 - 3i)(4 + 3i)) + 3i - 5 i^2 - ((55 + 3i)(5 - 7i))/((5 + 7i)(5 - 7i)) \
  &= (75 + 50i)/25 + 3i + 5 - (296 - 370i)/74 \
  &= 3 + 2i + 3i + 5 - 4 + 5i \
  &= 4 + 10 i ju $]

如果复数用三角形式来表示，那么计算它们的商就非常方便。

设

$ z_1 = r_1 (cos theta_1 + i sin theta_1) dou \
  z_2 = r_2 (cos theta_2 + i sin theta_2) dou quad quad z_2 != 0 dou $

// p.120
那么

$ z_1 / z_2 &= (r_1 (cos theta_1 + i sin theta_1))/(r_2 (cos theta_2 + i sin theta_2)) \
  &= r_1/r_2 dot ((cos theta_1 + i sin theta_1)(cos theta_2 - i sin theta_2))/((cos theta_2 + i sin theta_2)(cos theta_2 - i sin theta_2)) \
  &= r_1/r_2 lr([ (cos theta_1 cos theta_2 + sin theta_1 sin theta_2)/(cos^2 theta_2 + sin^2 theta_2) \
  &quad quad + (i (sin theta_1 cos theta_2 - cos theta_1 sin theta_2))/(cos^2 theta_2 + sin^2 theta_2) ]) \
  &= r_1/r_2 [cos(theta_1 - theta_2) + i sin(theta_1 - theta_2)] ju $

这就是说：两个用三角形式表示的复数相除，#edot[商的模等于被除数的模除以除数的模，商的辐角等于被除数的辐角减去除数的辐角]。

#ex("例 2")[计算

$ 12 lr((cos (7 pi)/4 + i sin (7 pi)/4)) div 6 lr((cos (2 pi)/3 + i sin (2 pi)/3)) ju $]

#sol[$ & 12 lr((cos (7 pi)/4 + i sin (7 pi)/4)) div 6 lr((cos (2 pi)/3 + i sin (2 pi)/3)) \
  &= 12/6 lr([cos lr(((7 pi)/4 - (2 pi)/3)) + i sin lr(((7 pi)/4 - (2 pi)/3))]) \
  &= 2 lr((cos (13 pi)/12 + i sin (13 pi)/12)) ju $]

#ex("例 3")[求证

$ ((1 - sqrt(3) i)(cos theta + i sin theta))/((1 - i)(cos theta - i sin theta)) \
  = sqrt(2) lr([cos lr((2 theta - pi/12)) + i sin lr((2 theta - pi/12))]) ju $]

// p.121
#sol(label: [证])[$ "左边" &= (2 lr((cos (5 pi)/3 + i sin (5 pi)/3)) (cos theta + i sin theta))/(sqrt(2) lr((cos (7 pi)/4 + i sin (7 pi)/4)) [cos(-theta) + i sin(-theta)]) \
  &= (2 lr([cos lr((theta + (5 pi)/3)) + i sin lr((theta + (5 pi)/3))]))/(sqrt(2) lr([cos lr(((7 pi)/4 - theta)) + i sin lr(((7 pi)/4 - theta))])) \
  &= sqrt(2) lr([cos lr((theta + (5 pi)/3 - (7 pi)/4 + theta)) \
  &quad quad + i sin lr((theta + (5 pi)/3 - (7 pi)/4 + theta))]) \
  &= sqrt(2) lr([cos lr((2 theta - pi/12)) + i sin lr((2 theta - pi/12))]) = "右边" ju $]

#note-small[从上面所述的复数三角形式的除法运算法则

$ (r_1 (cos theta_1 + i sin theta_1))/(r_2 (cos theta_2 + i sin theta_2)) \
  = r_1/r_2 [cos(theta_1 - theta_2) + i sin(theta_1 - theta_2)] dou $

读者可以利用图 4·15，自己来解释复数除法的几何意义。]

#fig("4·15", fig-4-15())[]

#exercise("4·7")[
1. 做下列除法：

#cols[(1) $(2i)/(1 - i)$；][(2) $(1 - 2i)/(3 + 4i)$；]

(3) $(1 + 2i)/(2 - 4 i^3)$；

// p.122
(4) $(sqrt(3) (cos 150° + i sin 150°))/(sqrt(3) (cos 225° + i sin 225°))$；

(5) $(-i)/(sqrt(2) (cos 120° + i sin 120°))$。

2. 计算：

(1) $(sqrt(5) + sqrt(3) i)/(sqrt(5) - sqrt(3) i) - (sqrt(3) + sqrt(5) i)/(sqrt(3) - sqrt(5) i)$；

(2) $(9 + 3 sqrt(2) i)/((3 + sqrt(2) i)(1 + i))$。

3. 设 $z$ 是复数，解方程：

#cols[(1) $lr((4 - 3/2 i)) z = 27 - i$；][(2) $1/2 (z - 1) = sqrt(3)/2 (1 + z) i$。]

4. 设 $u, v$ 是复数，解方程组

$ cases((1 - i) u + (2 + i) v = 7 dou, (3 + 2i) u - (2 - 3i) v = 13 i ju) $

\*5. (1) 求证 #h(0.5em) $lr(|z_1/z_2|) = (|z_1|)/(|z_2|)$；

(2) 设 $x, y$ 都是实数，求

$ lr(|(x^2 - y^2 + 2 x y i)/(x y sqrt(2) + sqrt(x^4 + y^4) i)|) ju $
]

== 复数的乘方

把复数 $a + b i$ 看成是一个二项式，那么就可以应用 §3·2 的二项式定理来计算复数的乘方。这里须注意，在所得的展开式里，把 $i$ 的幂都化简，并且把实数和纯虚数分别合并。

#ex("例 1")[计算：

#cols[(1) $(2 + 3i)^4$；][(2) $lr((frac(sqrt(3) + i, 2)))^6$。]]

// p.123
#sol[(1) $ (2 + 3i)^4 &= 2^4 + 4 (2^3)(3i) \
  &quad quad + 6 (2^2)(3i)^2 + 4 (2)(3i)^3 + (3i)^4 \
  &= 16 + 96 i + 216 i^2 + 216 i^3 + 81 i^4 \
  &= 16 + 96 i - 216 - 216 i + 81 \
  &= -119 - 120 i ju $

(2) $ lr((frac(sqrt(3) + i, 2)))^6 &= 1/2^6 (sqrt(3) + i)^6 \
  &= 1/2^6 [(sqrt(3))^6 + 6 (sqrt(3))^5 i + 15 (sqrt(3))^4 i^2 \
  &quad quad + 20 (sqrt(3))^3 i^3 + 15 (sqrt(3))^2 i^4 + 6 sqrt(3) i^5 + i^6] \
  &= 1/64 [(27 - 135 + 45 - 1) + (54 - 60 + 6) sqrt(3) i] \
  &= 1/64 (-64) = -1 ju $]

#ex("例 2")[化简 $(1 + 2i)^2/(1 - i) - (2 - i)^2/(1 + i)$。]

#sol[$ "原式" &= (-3 + 4i)/(1 - i) - (3 - 4i)/(1 + i) \
  &= (-3 + 4i) lr((1/(1 - i) + 1/(1 + i))) \
  &= (-3 + 4i) dot 2/((1 - i)(1 + i)) \
  &= -3 + 4i ju $]

#exercise("4·8(1)")[
1. 计算：

#cols[(1) $(3 - 2i)^4$；][(2) $(2 + i)^6$；]
#cols[(3) $(-1 - i)^(-6)$；][(4) $lr((frac(2 + 2i, 1 - sqrt(3) i)))^4$。]

// p.124
2. 化简：

#cols[(1) $(1 + 2i)^5 + (1 - 2i)^5$；][(2) $((1 + 2i)^2 - (1 - i)^3)/((3 + 2i)^3 - (2 + i)^2)$。]

3. 计算：

#cols[(1) $lr((frac(1 + i, 1 - i)))^(4n + 2)$；][(2) $lr((frac(1 - i, 1 + i)))^(4n + 1)$。]

[提示：$(1 + i)/(1 - i) = (1 + i)^2/(1 - i^2) = i$。]

4. 设 $omega_1 = (-1 + sqrt(3) i)/2$，$omega_2 = (-1 - sqrt(3) i)/2$，求证：

#cols[(1) $omega_1^3 = omega_2^3 = 1$；][(2) $omega_1^2 = omega_2$；]
#cols[(3) $omega_2^2 = omega_1$；][(4) $1 + omega_1 + omega_1^2 = 1 + omega_2 + omega_2^2 = 0$。]
]

#note-small[从 (1) 可以看出，$omega_1$ 和 $omega_2$ 都是 $x^3 = 1$ 的根。本题的结论，在以后解题时很有用。]

在 §4·6 里，曾谈到复数用三角形式表示时做乘法就非常简便。乘方是乘法的一种特殊运算，所以也就容易想到：把复数先用三角形式表示，再来做复数的乘方，同样非常简便。

设 $z = r (cos theta + i sin theta)$，现在来计算 $z$ 的 $n$ 次幂

$ [r (cos theta + i sin theta)]^n /* 原书作 (r cos θ + i sin θ)^n */ ju $

在 §4·6 /* 原书作 §4·7 */例 4 的后面，曾经有过下面这个乘法公式：

$ z_1 z_2 dots.c z_n &= r_1 (cos theta_1 + i sin theta_1) \
  &quad dot r_2 (cos theta_2 + i sin theta_2) dots.c r_n (cos theta_n + i sin theta_n) \
  &= r_1 r_2 dots.c r_n [cos(theta_1 + theta_2 + dots.c + theta_n) \
  &quad quad + i sin(theta_1 + theta_2 + dots.c + theta_n)] ju $

在这个公式里，令

$ r_1 = r_2 = dots.c = r_n = r dou \
  theta_1 = theta_2 = dots.c = theta_n = theta ju $

这时，就有

$ z_1 = z_2 = dots.c = z_n = z dou $

// p.125
从而有

$ z^n = [r (cos theta + i sin theta)]^n = r^n (cos n theta + i sin n theta) ju $

这里 $n$ 是自然数。这就是说，#edot[复数的 $n$ 次幂（$n$ 是正整数）的模，等于这个复数的模的 $n$ 次幂，它的辐角等于这个复数的辐角的 $n$ 倍]。

这一法则称为*棣莫弗定理*。

#ex("例 3")[计算 $(1 + sqrt(3) i)^10$。]

#sol[$ (1 + sqrt(3) i)^10 &= lr([2 lr((cos pi/3 + i sin pi/3))])^10 \
  &= 2^10 lr((cos pi/3 + i sin pi/3))^10 \
  &= 2^10 lr((cos (10 pi)/3 + i sin (10 pi)/3)) \
  &= 1024 lr((-1/2 - sqrt(3)/2 i)) \
  &= -512 - 512 sqrt(3) i ju $]

#note-small[本题如果应用二项式定理来计算，显然运算过程就要繁复得多。]

#exercise("4·8(2)")[
1. 用棣莫弗定理计算：

#cols[(1) $[3 (cos 18° + i sin 18°)]^5$；][(2) $lr([3 lr((cos pi/4 - i sin pi/4))])^6$；]
#cols[(3) $(2 + 2i)^8$；][(4) $lr((frac(sqrt(3), 2) - 1/2 i))^12$。]

2. 计算：

#cols[(1) $(sqrt(3) i - 1) lr((-1/2 + sqrt(3)/2 i))^20$；][(2) $(sqrt(3) - i)^5/(sqrt(3) + i)$；]

(3) $(1 + i)^5/(1 - i) + (1 - i)^5/(1 + i)$；

// p.126
(4) $(-1 + sqrt(3) i)^15/(1 - i)^20 + (-1 - sqrt(3) i)^15/(1 + i)^20$。

\[解法举例：(1) 令 $-1/2 + sqrt(3)/2 i = omega$，则

$ lr((-1/2 + sqrt(3)/2 i))^20 = omega^20 = (omega^3)^6 dot omega^2 = omega^2 = (-1 - sqrt(3) i)/2 $

#align(right)[\[习题 4·8(1) 第 4 题\]。]

$ therefore quad "原式" &= (sqrt(3) i - 1) (-1 - sqrt(3) i)/2 \
  &= 1/2 (-1 + sqrt(3) i)(-1 - sqrt(3) i) \
  &= 1/2 (1 + 3) = 2 ju "]" $
]

下面再举几个应用棣莫弗定理来解题的例子。

#ex("*例 4")[已知 $n$ 是自然数，且 $(1 + i)^n$ 是实数。试问 $n$ 的最小值是什么？这个实数是什么？]

#analysis[应用棣莫弗定理，把 $(1 + i)^n$ 用复数的三角形式表出，令虚部系数等于 0，即可求出 $n$ 的最小值。]

#sol[$ because quad 1 + i = sqrt(2) lr((cos pi/4 + i sin pi/4)) dou $

$ therefore quad (1 + i)^n = (sqrt(2))^n lr((cos (n pi)/4 + i sin (n pi)/4)) ju $

要使 $(1 + i)^n$ 为实数，必须并且只需 $sin (n pi)/4 = 0$。

$ therefore quad n = 4k #h(1em) (k "是任意整数") ju $

要使 $n$ 是最小的自然数，只需使 $k = 1$。

$ therefore quad n = 4 ju $

这时，

$ (1 + i)^n = (1 + i)^4 = (sqrt(2))^4 (cos pi + i sin pi) = -4 ju $]

#note-small[如果要使 $(1 + i)^n$ 是正实数，应该怎样解？要使 $(1 + i)^n$ 是纯虚数呢？]

#ex("*例 5")[用 $sin theta$ 和 $cos theta$ 的代数式来表示 $sin 5 theta$ 和 $cos 5 theta$。]

#analysis[根据棣莫弗定理，有

$ (cos theta + i sin theta)^5 = (cos 5 theta + i sin 5 theta) dou $

// p.127
应用二项式定理把左边的式子展开，并化简，这样就可以根据复数相等的意义，求得 $cos 5 theta$ 和 $sin 5 theta$ 的表达式。]

#sol[设 $z = cos theta + i sin theta$，则

$ z^5 &= cos 5 theta + i sin 5 theta = (cos theta + i sin theta)^5 \
  &= cos^5 theta + 5 cos^4 theta dot sin theta dot i + 10 cos^3 theta sin^2 theta dot i^2 \
  &quad quad + 10 cos^2 theta dot sin^3 theta dot i^3 + 5 cos theta sin^4 theta dot i^4 + sin^5 theta dot i^5 \
  &= (cos^5 theta - 10 cos^3 theta sin^2 theta + 5 cos theta sin^4 theta) \
  &quad quad + (5 cos^4 theta sin theta - 10 cos^2 theta sin^3 theta + sin^5 theta) i ju $

$ therefore quad cos 5 theta &= cos^5 theta - 10 cos^3 theta sin^2 theta + 5 cos theta sin^4 theta fen \
  sin 5 theta &= sin^5 theta - 10 cos^2 theta sin^3 theta + 5 cos^4 theta sin theta ju $]

#note-small[应用公式 $sin^2 theta = 1 - cos^2 theta$、$cos^2 theta = 1 - sin^2 theta$，还可用 $cos theta$ 的有理代数式来表示 $cos 5 theta$，用 $sin theta$ 的有理代数式来表示 $sin 5 theta$。具体的推导留给读者。]

#exercise("4·8(3)", star: true)[
1. 设 $n$ 是正整数，求证：

(1) $(cos theta + i sin theta)^(-n) = cos(-n theta) + i sin(-n theta)$；

(2) $(cos theta - i sin theta)^n = cos n theta - i sin n theta$。

2. 求最小的正整数 $n$，使 $lr([frac(sqrt(3), 3/2 + sqrt(3)/2 i)])^n$ 是实数。并求这个实数的值？

3. 设 $lr((frac(1 + i, 1 - i)))^n = 1$，求最小的正整数 $n$。

[提示：$(1 + i)/(1 - i) = (1 + i)^2/((1 - i)(1 + i)) = (2i)/2 = i$，所以本题不必用棣莫弗定理。]

4. 设 $(1 + i)^(2n)/(1 - i) + (1 - i)^(2n)/(1 + i) = 2^n$，求最小的正整数 $n$。

5. 用棣莫弗定理和复数相等的条件，证明：

(1) $cos 2 theta = cos^2 theta - sin^2 theta$，$sin 2 theta = 2 sin theta cos theta$；

(2) $cos 3 theta = cos^3 theta - 3 cos theta sin^2 theta$，$sin 3 theta = 3 cos^2 theta sin theta - sin^3 theta$。

// p.128
\*6. 运用棣莫弗定理、复数相等的条件，以及二项式定理，试求 $sin n theta$ 和 $cos n theta$ 用 $sin theta$，$cos theta$ 表示的公式。
]

== 复数的开方

像实数开方的意义一样，如果复数 $w$ 的 $n$ 次幂等于另一个复数 $z$，即 $w^n = z$，那么 $w$ 就称为 $z$ 的 $n$ 次方根。求复数 $z$ 的 $n$ 次方根的运算，称为把复数 $z$ 开 $n$ 次方。

例如：因为 $i^2 = -1$、$(-i)^2 = -1$，所以 $i$ 和 $-i$ 都是 $-1$ 的二次方根；

又如：因为

$ 1^3 = 1 dou quad lr((frac(-1 + sqrt(3) i, 2)))^3 = 1 dou quad lr((frac(-1 - sqrt(3) i, 2)))^3 = 1 dou $

所以 $1$、$(-1 + sqrt(3) i)/2$ 和 $(-1 - sqrt(3) i)/2$ 都是 $1$ 的三次方根。

这里可以看到，在复数范围里，负数也可以开偶次方，正数的奇次方根也不只有唯一的值。

本节将根据开方是乘方的逆运算这一关系，利用棣莫弗定理来导出复数开方的一般法则。由此说明：任何一个复数都可以开 $n$ 次方，并且，任一非零复数的 $n$ 次方根都有 $n$ 个值。

*1. 复数开方的法则* 先来计算一个具体的题目。

求复数 $z = 1 + sqrt(3) i$ 的平方根。

为了能应用棣莫弗定理，先把这个复数写成三角形式：

$ z = 2 lr((cos pi/3 + i sin pi/3)) dou $

并且设所求的平方根是

$ w = rho (cos phi + i sin phi) ju $

那么，根据方根的意义：$w^2 = z$，就有

// p.129
$ [rho (cos phi + i sin phi)]^2 = 2 lr((cos pi/3 + i sin pi/3)) dou $

就是

$ rho^2 (cos 2 phi + i sin 2 phi) = 2 lr((cos pi/3 + i sin pi/3)) ju $

因为，两个复数相等时，它们的模必须相等，而辐角可以相差 $2 pi$ 的整数倍，所以

$ cases(rho^2 = 2 dou, 2 phi = pi/3 + 2 k pi #h(1em) (k "是整数") ju) $

由此可知，

$ cases(rho = sqrt(2) #h(1em) ("因为" rho "是模，所以只取算术根") dou, phi = pi/6 + k pi ju) $

这样，即得所求的平方根是

$ w = sqrt(2) lr([cos lr((pi/6 + k pi)) + i sin lr((pi/6 + k pi))]) dou $

这里 $k$ 是整数。

为了确定所求的平方根究竟有几个，不妨试取 $k$ 的一些值代入计算。例如：

当 $k = 0$ 时，得

$ w_0 = sqrt(2) lr((cos pi/6 + i sin pi/6)) = 1/2 sqrt(6) + 1/2 sqrt(2) i fen $

当 $k = 1$ 时，得

$ w_1 = sqrt(2) lr((cos 7/6 pi + i sin 7/6 pi)) = -1/2 sqrt(6) - 1/2 sqrt(2) i ju $

正弦函数、余弦函数都是以 $2 pi$ 为周期的函数，所以，倘使取 $k$ 的其他值 $plus.minus 2, plus.minus 4, plus.minus 6, dots.c$ 代入，求得的结果都与 $w_0$ 相同；取 $k$ 的其他值 $plus.minus 1, plus.minus 3, plus.minus 5, dots.c$ 代入，求得的结果都与 $w_1$ 相同。由此可知，$1 + sqrt(3) i$ 的平方根有两个值，并且只有/* p.130 */两个值，它们可以用式子

$ sqrt(2) lr([cos lr((pi/6 + k pi)) + i sin lr((pi/6 + k pi))]) quad quad (k = 0, 1) $

来表示。

一般地，设复数 $z = r (cos theta + i sin theta)$ $(z != 0)$ 的 $n$ 次方根是 $w = rho (cos phi + i sin phi)$。那么，从 $w^n = z$ $(z != 0)$，可得

$ rho^n (cos n phi + i sin n phi) = r (cos theta + i sin theta) ju $

由此，根据复数相等的意义，有

$ cases(rho^n = r dou, n phi = theta + 2 k pi #h(1em) (k "为整数") ju) $

从而有

$ cases(rho = root(n, r) dou, phi = (theta + 2 k pi)/n ju) $

$ therefore quad w_k = root(n, r) lr([cos (theta + 2 k pi)/n + i sin (theta + 2 k pi)/n]) dou $

这里 $root(n, r)$ 表示 $r$ 的 $n$ 次算术根，$k$ 只需取 $0, 1, 2, dots.c, n - 1$ 这 $n$ 个值。（想一想，这是为什么？）

为了方便起见，采用符号 $root(n, z)$ 来表示复数 $z$ 的各个 $n$ 次方根，这样就有

$ root(n, z) = root(n, r) lr([cos (theta + 2 k pi)/n + i sin (theta + 2 k pi)/n]) \
  (k = 0, 1, 2, dots.c, n - 1) ju $

这就是说，#edot[复数的 $n$ 次方根有 $n$ 个值，它们的模都等于这个复数的 $n$ 次算术根，而它们的辐角分别等于这个复数的辐角与 $2 pi$ 的 $0, 1, 2, dots.c, n - 1$ 倍的和的 $n$ 分之一]。

#attention[在实数范围内和在复数范围内，记号 $root(n, space)$ 的意义有所不同。例如：在实数范围里，$sqrt(1)$ 只表示 1 的算术根 1，在复数范围里 $sqrt(1)$/* p.131 */就表示 1 的两个平方根 $plus.minus 1$。又如：在实数范围里，$root(3, -1)$ 只表示实数 $-1$，但在复数范围里，$root(3, -1)$ 就表示 $-1$ 的三个立方根 $-1, -omega, -omega^2$。为了防止混淆，以后如要用方根符号来表示实数 $a$ 的 $n$ 个 $n$ 次方根，宁可把 $a$ 写成 $a + 0 i$ 的形式，表示成 $root(n, a + 0 i)$，而仍旧把符号 $root(n, a)$（当它有意义时）来表示唯一的实数值。]

#ex("例 1")[计算 $sqrt(-1 + i)$。]

#sol[$ -1 + i = sqrt(2) lr((cos 3/4 pi + i sin 3/4 pi)) ju $

$ therefore quad w_k = sqrt(-1 + i) &= sqrt(sqrt(2) lr((cos 3/4 pi + i sin 3/4 pi))) \
  &= root(4, 2) lr([cos 1/2 lr((2 k pi + 3/4 pi)) + i sin 1/2 lr((2 k pi + 3/4 pi))]) \
  &= root(4, 2) lr([cos lr((k pi + 3/8 pi)) + i sin lr((k pi + 3/8 pi))]) ju $

由此得

$ w_0 &= root(4, 2) lr((cos 3/8 pi + i sin 3/8 pi)) dou \
  w_1 &= root(4, 2) lr((cos 11/8 pi + i sin 11/8 pi)) ju $]

#ex("例 2")[在复数范围里，解方程 $x^5 + 1 = 0$。]

#sol[$ x^5 + 1 &= 0 dou \
  x^5 &= -1 dou \
  therefore quad x^5 &= cos pi + i sin pi ju $

于是

$ x_k &= cos (2 k pi + pi)/5 + i sin (2 k pi + pi)/5 \
  &= cos 1/5 (2k + 1) pi + i sin 1/5 (2k + 1) pi \
  &quad (k = 0, 1, 2, 3, 4) ju $

由此得

// p.132
$ x_0 &= cos pi/5 + i sin pi/5 dou \
  x_1 &= cos 3/5 pi + i sin 3/5 pi dou \
  x_2 &= cos pi + i sin pi = -1 dou \
  x_3 &= cos 7/5 pi + i sin 7/5 pi dou \
  x_4 &= cos 9/5 pi + i sin 9/5 pi ju $]

#exercise("4·9(1)")[
1. 计算：

#cols[(1) $root(4, 16 lr((cos 2/3 pi + i sin 2/3 pi)))$；][(2) $root(6, 8 (cos 60° - i sin 60°))$。]

2. 计算：

#cols[(1) $sqrt(-i)$；][(2) $root(4, sqrt(2) - sqrt(2) i)$；]
#cols[(3) $root(6, -1 + sqrt(3) i)$；][(4) $root(5, -3 + 3 i)$。]

3. (1) 求 $-1$ 的三个立方根；

(2) 求 $-64$ 的四个四次方根。

4. 设 $a$ 为正实数，应用复数开方的法则，解下列关于复数 $x$ 的方程：

#cols[(1) $x^3 + a^3 = 0$；][(2) $x^3 - a^3 = 0$；]
#cols[(3) $x^4 + a^4 = 0$；][(4) $x^4 - a^4 = 0$。]

5. 设 $a$、$b$、$c$ 都是实数，且 $b^2 - 4 a c < 0$。解方程

$ a x^2 + b x + c = 0 quad (a != 0) ju $
]

*\*2. 复数开方的几何解释* 根据复数开方的法则，不难作出复数开方的几何解释。

设 $z = r (cos theta + i sin theta)$ 的 $n$ 个 $n$ 次方根是

$ w_k = root(n, r) lr((cos (2 k pi + theta)/n + i sin (2 k pi + theta)/n)) dou $

其中 $k = 0, 1, 2, dots.c, n - 1$。并设 $w_k$ 在平面内对应的点是 $M_k$。

那么，容易看出：

// p.133
(1) 这些点与原点的距离都等于 $root(n, r)$。因此，这些点在以原点为中心、$root(n, r)$ 为半径的圆周上；

(2) 任意相邻两点（例如 $M_0$ 与 $M_1$，$M_1$ 与 $M_2$，……）间的夹角都等于 $(2 pi)/n$。因此，只要先作出对应于 $w_0$ 的向量 $arrow(O M_0)$，把它沿逆时针方向旋转角 $(2 pi)/n$，就得到对应于 $w_1$ 的向量 $arrow(O M_1)$，再旋转角 $(2 pi)/n$，就得到对应于 $w_2$ 的向量 $arrow(O M_2)$，……最后，把对应于 $w_(n-2)$ 的向量 $arrow(O M_(n-2))$ 旋转角 $(2 pi)/n$，就得到对应于 $w_(n-1)$ 的向量 $arrow(O M_(n-1))$。

由此，从几何观点来看，复数 $z = r (cos theta + i sin theta)$ 的 $n$ 个 $n$ 次方根所对应的点，恰巧是以原点为中心、$root(n, r)$ 为半径的圆的一个内接正 $n$ 边形的顶点，其中第一个顶点（点 $M_0$）所对应的向量（向量 $arrow(O M_0)$）与 $x$ 轴的正方向 $O x$ 间的夹角是 $1/n theta$（以 $O x$ 为始边）。

例如，图 4·16 是当 $n = 7$ 时的情况。

#fig("4·16", fig-4-16())[]

#ex("例 3")[根据复数开方的几何意义，试在复平面内作出表示方程 $x^5 - 1 = 0$ 的五个根的点。]

#sol[$ because quad x^5 = 1 = cos 0 + i sin 0 dou $

$ therefore quad x = root(5, cos 0 + i sin 0) ju $

所以，它的五个根对应的点是一个以坐标系原点 $O$ 为中心、其外接圆半径是 1 的正五边形的顶点 $M_0, M_1, M_2, M_3, M_4$。先作出顶点

$ M_0 = cos 0 + i sin 0 fen $

然后把向量 $arrow(O M_0)$ 沿逆时针方向旋转 $72°$ 角，得到向量 $arrow(O M_1)$，这就得到了顶点 $M_1$；又把向量 $arrow(O M_1)$ 旋转 $72°$ 角，从而得到顶点 $M_2$；依次同样进行下去，即可得顶点 $M_3, M_4$。]

#fig("4·17", fig-4-17())[]

// p.134
#exercise("4·9(2)", star: true)[
1. 在复平面内，作出表示：

#cols[(1) 1 的六次方根；][(2) 1 的八次方根]

的各点。

2. 求方程 $x^4 + 1 = 0$ 的复数解，并证明这些解所对应的点构成一个正方形。
]
