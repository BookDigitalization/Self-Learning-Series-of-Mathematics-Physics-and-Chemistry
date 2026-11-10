// 第 5 章（续）§5·5 后半（原书 p.178 中部“*2. 二次不尽根”起–181 上部，到习题 5·5(2) 结束；§5·6 标题在 p.181 下部，见 ch05h.typ）
#import "/common/series.typ": *

// p.178
*\*2. 有理系数方程 $f(x) = 0$ 的二次不尽根* 我们知道，在方程

$ a x^2 + b x + c = 0 quad (a != 0) $

里，如果 $a, b, c$ 都是有理数，$b^2 - 4a c > 0$，且 $b^2 - 4a c$ 不是一个完全平方数，那么它的两个根

$ x_1 = (-b + sqrt(b^2 - 4a c))/(2a) quad "和" quad x_2 = (-b - sqrt(b^2 - 4a c))/(2a) $

都是无理数。这样的根通常称为二次不尽根。这里可以看到，像二次方程的虚根一样，二次方程的二次不尽根也是成对地出现的。

现在来证明，一般的有理系数方程 $f(x) = 0$，都具有这样的性质。

*定理 2*。如果有理系数方程

$ f(x) = a_0 x^n + a_1 x^(n-1) + dots.c + a_(n-1) x + a_n = 0 quad (a_0 != 0) $

有无理根 $a + sqrt(b)$，这里 $a, b$ 都是有理数，$sqrt(b)$ 是无理数，那么它一定还有一个无理根 $a - sqrt(b)$。

这个定理的证明，可以仿照虚根成对定理的证法。

#sol(label: [证])[设

// p.179
#eqno([(1)], $f(x) = [x - (a + sqrt(b))][x - (a - sqrt(b))] Q(x) + p x + q ju$)

这里，因为除式 $[x - (a + sqrt(b))][x - (a - sqrt(b))] = x^2 - 2a x + a^2 - b$ 是 $x$ 的有理系数二次多项式，被除式 $f(x)$ 是 $x$ 的有理系数 $n$ 次多项式，而两个有理数的加减乘除仍是有理数，通过这里的除法是不会得出无理数或虚数的，所以商 $Q(x)$ 是 $x$ 的有理系数 $n - 2$ 次多项式，而余式中 $p$ 和 $q$ 也都是有理数。

因为 $a + sqrt(b)$ 是方程 $f(x) = 0$ 的根，所以 $f(a + sqrt(b)) = 0$。代入式 (1)，得

$ 0 = 0 + p(a + sqrt(b)) + q ju $

就是

#eqno([(2)], $(p a + q) + p sqrt(b) = 0 ju$)

因为 $p a + q$ 是有理数，而 $p sqrt(b)$ 是无理数，所以从式 (2) 可推出

#eqsys(($p a + q = 0 dou$, [(3)]), ($p sqrt(b) = 0 ju$, [(4)]))

由式 (4)，因为 $sqrt(b) != 0$，所以 $p = 0$。代入式 (3)，得 $q = 0$。因此，式 (1) 可以写成

#eqno([(5)], $f(x) = [x - (a + sqrt(b))][x - (a - sqrt(b))] Q(x) dou$)

从而有

#align(center)[$f(a - sqrt(b)) = 0 dou$]

所以 $x = a - sqrt(b)$ 是方程 $f(x) = 0$ 的根。定理得证。]

把上面的定理加以推广，还可以得出以下的定理#footnote[证明较繁，这里把它略去了。]：

*定理 3*。如果有理系数方程

$ f(x) = a_0 x^n + a_1 x^(n-1) + dots.c + a_(n-1) x + a_n = 0 quad (a_0 != 0) $

(1) 有一个无理根 $sqrt(a) + sqrt(b)$，这里 $a, b$ 是有理数，而 $sqrt(a), sqrt(b)$ 是无理数，那么它一定有三个无理根：

#align(center)[$sqrt(a) - sqrt(b), quad -sqrt(a) + sqrt(b), quad -sqrt(a) - sqrt(b)$。]

(2) 有一个虚根 $sqrt(a) + sqrt(b) i$，这里 $a, b$ 是有理数，而 $sqrt(a), sqrt(b)$ 是无理数，那么它一定还有三个虚根：

#align(center)[$sqrt(a) - sqrt(b) i, quad -sqrt(a) + sqrt(b) i, quad -sqrt(a) - sqrt(b) i$。]

#attention[定理 2 不能推广到任意无理根的情形。例如，有理系数方程 $f(x) = 0$ 如/* p.180 */具有三次不尽根 $x = a + root(3, b)$（$a$ 和 $b$ 皆有理数，$root(3, b)$ 为无理数），但推不出 $f(x) = 0$ 必具有根 $x = a - root(3, b)$。]

#ex("例 4")[已知方程

// 原书作 8x^2（应为 8x^3：下面的整除、商 x^2-2x+4 均按 x^3 项成立；疑原书错误，仅登记，照录）
$ f(x) = x^6 - 2x^5 + 8x^2 - 32x + 64 = 0 $

有一个根 $sqrt(3) + i$，解这个方程。]

#sol[这是一个有理系数方程，它既有一个虚根 $sqrt(3) + i$，必定还有另外三个虚根 $sqrt(3) - i, -sqrt(3) + i, -sqrt(3) - i$。可以推出，$f(x)$ 能被

$ [x - (sqrt(3) + i)][x - (sqrt(3) - i)][x - (-sqrt(3) + i)][x - (-sqrt(3) - i)] \ = x^4 - 4x^2 + 16 $

整除。做除法，求出商是 $x^2 - 2x + 4$，再解二次方程

#align(center)[$x^2 - 2x + 4 = 0 dou$]

求得另两个根是 $x = 1 + sqrt(3) i$ 和 $x = 1 - sqrt(3) i$。所以原方程的六个根是 $sqrt(3) plus.minus i, -sqrt(3) plus.minus i$ 和 $1 plus.minus sqrt(3) i$。]

#note-small[本题在确定方程 $f(x) = 0$ 有四个根 $sqrt(3) plus.minus i, -sqrt(3) plus.minus i$ 后，也可以先假设另两个根是 $alpha$ 和 $beta$，根据根与系数关系列出方程组，从而求得 $alpha$ 和 $beta$ 的值。]

#ex("例 5")[求作一个次数最低的有理系数方程 $f(x) = 0$，使它的一个根是 $sqrt(3) + 2 sqrt(2)$。]

#sol[既然 $sqrt(3) + 2 sqrt(2)$（就是 $sqrt(3) + sqrt(8)$）是有理系数方程 $f(x) = 0$ 的一个根，根据定理 3，可知所求的方程至少还要有另外三个根：

#align(center)[$sqrt(3) - 2 sqrt(2), quad -sqrt(3) + 2 sqrt(2), quad -sqrt(3) - 2 sqrt(2)$。]

所以，所求的方程是

$ [x - (sqrt(3) + 2 sqrt(2))][x - (sqrt(3) - 2 sqrt(2))][x - (-sqrt(3) + 2 sqrt(2))] \ times [x - (-sqrt(3) - 2 sqrt(2))] = 0 dou $

#eqno([], $"就是" quad [(x - sqrt(3))^2 - 8][(x + sqrt(3))^2 - 8] = 0 dou$)

$ [(x^2 - 5) - 2 sqrt(3) x][(x^2 - 5) + 2 sqrt(3) x] = 0 dou $

$ x^4 - 22x^2 + 25 = 0 ju $
]

#note-small[对于这类问题，还可用另一种解法。因为，具有根 $sqrt(3) + 2 sqrt(2)$ 的最低次方程是 $x = sqrt(3) + 2 sqrt(2)$。现在要使所求的方程各项系数都是有理数，可以用逐次平方的办法，把这个等式的系数有理化。

// p.181
$ because quad x - sqrt(3) = 2 sqrt(2) dou $

#eqno([], $"两边平方，得" quad x^2 - 2 sqrt(3) x + 3 = 8 dou$)

#eqno([], $"即" quad x^2 - 5 = 2 sqrt(3) x ju$)

#eqno([], $"两边再平方，得" quad x^4 - 10x^2 + 25 = 12x^2 dou$)

#eqno([], $"所以" quad x^4 - 22x^2 + 25 = 0 ju$)

这就是所求的方程。]

#exercise("5·5(2)")[
1. 已知 $1 + sqrt(2)$ 是下面这两个方程公有的一个根：

(1) $x^3 - 4x^2 + 3x + 2 = 0 dou$

(2) $x^3 - 2(sqrt(2) + 1) x^2 + (1 + 4 sqrt(2)) x - 2 = 0 dou$

解这两个方程。

［提示：(1) 可以应用本节中的定理 2 来解，(2) 不能应用定理，应先求出一个降次方程后解。］

2. 已知有理系数方程 $x^3 - 3x^2 + a x + b = 0$ 有一个根是 $1 - sqrt(2)$，求 $a$、$b$ 的值，并解这个方程。

3. 求作含有根 $sqrt(3) - 2$ 和 $1 + i$ 的次数最低的有理系数方程。

4. 求证：$1 + sqrt(2)$ 是方程

$ f(x) = x^5 - 3x^4 - 2x^3 + 6x^2 + 5x + 1 = 0 $

的一个二重根，并解这个方程。

5. 已知方程 $x^5 + x^4 - 2x^3 - 2x^2 + 25x + 25 = 0$ 有一个根是 $sqrt(3) - sqrt(2) i$，解这个方程。
]
