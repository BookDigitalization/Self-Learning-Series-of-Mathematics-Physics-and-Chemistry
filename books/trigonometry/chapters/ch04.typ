// 第 4 章 加法定理和它的推论（原书 p.133–175）
#import "/common/series.typ": *
#import "/common/geo.typ": step
#import "/books/trigonometry/figures/c4-figs.typ": *

// p.133
= 加法定理和它的推论

== 两角和的正弦和余弦

前面我们学过了含有一个自变量 $alpha$ 的三角函数。在实际应用上，我们也常常会遇到含有两个自变量 $alpha, beta$ 的三角函数。例如 $sin(alpha + beta)$，$cos(alpha + beta)$ 等等。

函数 $sin(alpha + beta)$ 和 $cos(alpha + beta)$ 分别叫作两角 $alpha, beta$ 的和的正弦和余弦。

我们应该注意，两角和的正弦 $sin(alpha + beta)$，一般地与两角的正弦的和 $sin alpha + sin beta$ 是不相等的。例如我们知道

$ sin(60° + 30°) = sin 90° = 1. $

但是 $sin 60° + sin 30° = sqrt(3)/2 + 1/2 = (sqrt(3) + 1)/2 approx 1.366.$

所以 #h(2em) $sin(60° + 30°) != sin 60° + sin 30°.$

同样地，两角和的余弦 $cos(alpha + beta)$，一般地也并不等于两角的余弦的和。例如

$ cos(60° + 30°) != cos 60° + cos 30°. $

怎样用两个角的三角函数来表示这两个角的和的正弦和余弦呢？

这一节里，我们先就两个角都是锐角，并且它们的和也是锐角的情况来研究。

*1. 两角和的正弦*　我们来证明，当两个角 $alpha, beta$ 都是锐角，并且它们的和 $alpha + beta$ 也是锐角的时候，总有

// p.134
$ bold(sin(alpha + beta) = sin alpha cos beta + cos alpha sin beta). $

#sol(label: [证])[作 $∠A O B = alpha$，并且以它的终边 $O B$ 为始边，再作 $∠B O C = beta$，那么 $∠A O C$ 就等于 $alpha + beta$（图 4·1）。]

#fig("4·1", fig-c4-4-1())[]

由 $C$ 作 $O A$ 的垂线 $D C$ 和 $O B$ 的垂线 $E C$。

由 $E$ 作 $O A$ 的垂线 $F E$ 和 $D C$ 的垂线 $G E$。

因为 $∠D C E$ 的两边 $D C$ 和 $E C$ 与 $∠A O B$ 的两边 $O A$ 和 $O B$ 分别垂直，并且这两个角都是锐角，所以

$ ∠D C E = ∠A O B = alpha. $

在图中我们看到，

$ sin(alpha + beta) = (D C)/(O C) = (D G + G C)/(O C) = (F E)/(O C) + (G C)/(O C). $

但在直角三角形 $E O F$ 和 $C O E$ 中，

$ (F E)/(O E) = sin alpha, quad (O E)/(O C) = cos beta. $

因此，#h(2em) $display((F E)/(O C) = (F E)/(O E) dot (O E)/(O C) = sin alpha cos beta.)$

又在直角三角形 $E C G$ 和 $C O E$ 中，

$ (G C)/(E C) = cos alpha, quad (E C)/(O C) = sin beta. $

因此，#h(2em) $display((G C)/(O C) = (G C)/(E C) dot (E C)/(O C) = cos alpha sin beta.)$

所以

$ sin(alpha + beta) = sin alpha cos beta + cos alpha sin beta. $

#ex("例 1.")[求 $sin 75°$ 的值（精确到 0.001）。]

// p.135
#sol[]
$ sin 75° &= sin(45° + 30°) \
  &= sin 45° cos 30° + cos 45° sin 30° \
  &= sqrt(2)/2 dot sqrt(3)/2 + sqrt(2)/2 dot 1/2 = (sqrt(6) + sqrt(2))/4 \
  &= (2.449 + 1.414)/4 = 3.863/4 = 0.966. $

*2. 两角和的余弦*　利用图 4·1，我们也很容易证明当 $alpha, beta$ 都是锐角，并且它们的和 $alpha + beta$ 也是锐角的时候，总有

$ bold(cos(alpha + beta) = cos alpha cos beta - sin alpha sin beta). $

#sol(label: [证])[在图 4·1 中，我们可以看到

$ cos(alpha + beta) = (O D)/(O C) = (O F - D F)/(O C) = (O F)/(O C) - (G E)/(O C). $
]

但在直角三角形 $E O F$ 和 $C O E$ 中，

$ (O F)/(O E) = cos alpha, quad (O E)/(O C) = cos beta. $

因此，#h(2em) $display((O F)/(O C) = (O F)/(O E) dot (O E)/(O C) = cos alpha cos beta.)$

又在直角三角形 $E C G$ 和 $C O E$ 中，

$ (G E)/(E C) = sin alpha, quad (E C)/(O C) = sin beta. $

因此，#h(2em) $display((G E)/(O C) = (G E)/(E C) dot (E C)/(O C) = sin alpha sin beta.)$

所以

$ cos(alpha + beta) = cos alpha cos beta - sin alpha sin beta. $

#ex("例 2.")[不用查表，求

$ cos 42° cos 18° - sin 42° sin 18° $

的值。]

#sol[因为 $42° + 18° = 60°$，我们可以反过来应用两角和的余弦公式，得

// p.136
$ cos 42° cos 18° - sin 42° sin 18° &= cos(42° + 18°) \
  &= cos 60° = 1/2. $
]

#exercise("4·1")[
  1. 不用查表，求 $cos 75°$ 的值（精确到 0.001）。
  2. 已知 $sin theta = 3/5$，且 $0° < theta < 60°$，求 $sin(theta + 30°)$ 的值。
  3. 已知 $cos theta = 12/13$，且 $0° < theta < 45°$，求 $cos(theta + 45°)$ 的值。
  4. 不用查表，求下列各式的值：

    (1) $sin 13° cos 17° + cos 13° sin 17°$；

    (2) $sin 42° cos 18° + cos 42° sin 162°$；

    (3) $cos^2 15° - sin^2 15°$；

    (4) $sin 70° cos 25° - sin 20° sin 25°$；

    (5) $sin 40° sin 20° - cos 40° cos 20°$。
  5. 已知 $0 < alpha < pi/4$，求 $sin(pi/4 - alpha) cos alpha + cos(pi/4 - alpha) sin alpha$ 的值。
  6. 已知 $sin alpha = 3/5$，$sin beta = 5/13$，且 $alpha$ 和 $beta$ 都是小于 $45°$ 的正锐角，求 $sin(alpha + beta)$ 和 $cos(alpha + beta)$ 的值。
  7. 已知 $alpha$ 是大于 $30°$ 的锐角，且 $cos(alpha - 30°) = 15/17$，求 $cos alpha$ 的值。

    ［提示：$cos alpha = cos[(alpha - 30°) + 30°]$。］
  8. 设 $alpha$ 是小于 $45°$ 的正锐角，求证 $sin alpha + cos alpha = sqrt(2) sin(45° + alpha)$。
]

== 两角和的正弦公式和余弦公式的一般性

在证明公式

#eqno([(1)], $sin(alpha + beta) = sin alpha cos beta + cos alpha sin beta$)

和

#eqno([(2)], $cos(alpha + beta) = cos alpha cos beta - sin alpha sin beta$)

// p.137
的时候，我们曾假定 $alpha$ 和 $beta$ 都是锐角，并且 $alpha + beta$ 也是锐角。事实上，这两个公式对于任何角 $alpha$ 和 $beta$ 都是正确的。

现在我们来证明这个事实。证明的步骤是：首先证明两个公式对于 $alpha$ 和 $beta$ 是 $0°$ 的角或者是任何锐角的时候都能成立；然后再对于 $alpha$ 和 $beta$ 是任意角的情形作出证明。

*1. $bold(alpha)$ 和 $bold(beta)$ 中至少有一个等于 $bold(0°)$*

这里我们假设 $beta = 0°$。对于公式 (1)

$ "左边" &= sin(alpha + beta) = sin(alpha + 0°) = sin alpha; \
  "右边" &= sin alpha cos beta + cos alpha sin beta \
  &= sin alpha cos 0° + cos alpha sin 0° \
  &= sin alpha dot 1 + cos alpha dot 0 \
  &= sin alpha. $

我们看到，左边 = 右边。因此，公式 (1) 能够成立。同样可以证明公式 (2) 也能够成立。

*2. $bold(alpha)$ 和 $bold(beta)$ 都是锐角，而 $bold(alpha + beta)$ 是直角*

这时，对于公式 (1)

$ "左边" &= sin(alpha + beta) = sin 90° = 1; \
  "右边" &= sin alpha cos beta + cos alpha sin beta \
  &= sin alpha cos(90° - alpha) + cos alpha sin(90° - alpha) \
  &= sin^2 alpha + cos^2 alpha = 1. $

我们看到，左边 = 右边。因此，公式 (1) 能够成立。同样可以证明公式 (2) 也能够成立。

*3. $bold(alpha)$ 和 $bold(beta)$ 都是锐角，而 $bold(alpha + beta)$ 是钝角*

我们令 $alpha$ 的余角为 $alpha_1$，$beta$ 的余角为 $beta_1$。那么

$ alpha = 90° - alpha_1, quad beta = 90° - beta_1, \
  alpha + beta = 180° - (alpha_1 + beta_1). $

因为 $alpha$ 和 $beta$ 是锐角，$alpha + beta$ 是钝角，所以 $alpha_1$ 和 $beta_1$ 是锐角，$alpha_1 + beta_1$ 也是锐角。公式 (1) 和 (2) 对于 $alpha_1$ 和 $beta_1$ 是成立的。

这时，
$ sin alpha &= sin(90° - alpha_1) = cos alpha_1, \
  cos alpha &= cos(90° - alpha_1) = sin alpha_1, \
  sin beta &= sin(90° - beta_1) = cos beta_1, $

// p.138
$ cos beta = cos(90° - beta_1) = sin beta_1. $

因此，
$ sin(alpha + beta) &= sin[180° - (alpha_1 + beta_1)] \
  &= sin(alpha_1 + beta_1) = sin alpha_1 cos beta_1 + cos alpha_1 sin beta_1 \
  &= cos alpha sin beta + sin alpha cos beta \
  &= sin alpha cos beta + cos alpha sin beta. \
  cos(alpha + beta) &= cos[180° - (alpha_1 + beta_1)] \
  &= -cos(alpha_1 + beta_1) \
  &= -(cos alpha_1 cos beta_1 - sin alpha_1 sin beta_1) \
  &= -(sin alpha sin beta - cos alpha cos beta) \
  &= cos alpha cos beta - sin alpha sin beta. $

我们看到，公式 (1) 和 (2) 也能够成立。

*4. $bold(alpha)$ 和 $bold(beta)$ 是任意正角或负角*

我们已经证明公式 (1) 和 (2) 对于 $alpha$ 和 $beta$ 是 $0°$ 的角或者任何锐角的时候都能成立。现在再设 $alpha$ 和 $beta$ 是任意的正角或者负角。任意角 $theta$ 总可以写成

$ k dot 360° + theta_1, quad k dot 360° + 90° + theta_1, \
  k dot 360° + 180° + theta_1, quad k dot 360° + 270° + theta_1 $

这四种形式中的一种。这里 $k$ 是一个整数，$theta_1$ 是一个锐角或者 $0°$ 的角。例如：

$ 653° = 360° + 270° + 23°, \
  1260° = 3 dot 360° + 180° + 0°, \
  -585° = -2 dot 360° + 90° + 45°. $

假定 $alpha$ 和 $beta$ 已经分别化成上面四种形式中的一种，我们可以证明公式 (1) 和 (2) 能够成立。例如假设

$ alpha = m dot 360° + 270° + alpha_1, \
  beta = n dot 360° + 180° + beta_1, $

其中 $m$ 和 $n$ 是整数，$alpha_1$ 和 $beta_1$ 是锐角或者 $0°$ 的角。这时

$ sin alpha &= sin(m dot 360° + 270° + alpha_1) \
  &= sin(270° + alpha_1) = -cos alpha_1, \
  cos alpha &= cos(m dot 360° + 270° + alpha_1) \
  &= cos(270° + alpha_1) = sin alpha_1, $

// p.139
$ sin beta &= sin(n dot 360° + 180° + beta_1) \
  &= sin(180° + beta_1) = -sin beta_1, \
  cos beta &= cos(n dot 360° + 180° + beta_1) \
  &= cos(180° + beta_1) = -cos beta_1. $

因此，
$ sin(alpha + beta) &= sin(m dot 360° + 270° + alpha_1 + n dot 360° + 180° + beta_1) \
  &= sin[(m + n + 1) dot 360° + 90° + (alpha_1 + beta_1)] \
  &= sin[90° + (alpha_1 + beta_1)] \
  &= cos(alpha_1 + beta_1) \
  &= cos alpha_1 cos beta_1 - sin alpha_1 sin beta_1 \
  &= (-sin alpha)(-cos beta) - cos alpha(-sin beta) \
  &= sin alpha cos beta + cos alpha sin beta. \
  cos(alpha + beta) &= cos(m dot 360° + 270° + alpha_1 + n dot 360° + 180° + beta_1) \
  &= cos[(m + n + 1) dot 360° + 90° + (alpha_1 + beta_1)] \
  &= cos[90° + (alpha_1 + beta_1)] \
  &= -sin(alpha_1 + beta_1) \
  &= -(sin alpha_1 cos beta_1 + cos alpha_1 sin beta_1) \
  &= -[cos alpha(-cos beta) + (-sin alpha)(-sin beta)] \
  &= cos alpha cos beta - sin alpha sin beta. $

我们看到，在这种情形，公式 (1) 和 (2) 也能够成立。当 $alpha$ 和 $beta$ 化成上面所讲的四种形式中的其他形式时，我们同样可以证明公式 (1) 和 (2) 能够成立。

这样，我们就证明了不论 $alpha$ 和 $beta$ 是怎样的角，两角和的正弦和余弦公式都能成立。

#ex("例")[已知 $sin alpha = 2/3$，$cos beta = -3/4$，并且 $90° < alpha < 180°$，$180° < beta < 270°$；求 $sin(alpha + beta)$ 和 $cos(alpha + beta)$ 的值（精确到 0.001）。]

#sol[因为 $alpha$ 的终边在第二象限中，所以

$ cos alpha = -sqrt(1 - sin^2 alpha) = -sqrt(1 - (2/3)^2) = -sqrt(5)/3. $
]

因为 $beta$ 的终边在第三象限中，所以

$ sin beta = -sqrt(1 - cos^2 beta) = -sqrt(1 - (-3/4)^2) = -sqrt(7)/4. $

// p.140
因此，
$ sin(alpha + beta) &= sin alpha cos beta + cos alpha sin beta \
  &= 2/3 (-3/4) + (-sqrt(5)/3)(-sqrt(7)/4) \
  &= -1/2 + sqrt(35)/12 approx -0.500 + 0.493 \
  &= -0.007. \
  cos(alpha + beta) &= cos alpha cos beta - sin alpha sin beta \
  &= (-sqrt(5)/3)(-3/4) - 2/3 (-sqrt(7)/4) \
  &= sqrt(5)/4 + sqrt(7)/6 approx 0.559 + 0.441 \
  &= 1.000. $

#exercise("4·2")[
  1. 利用两角和的正弦及余弦公式验证诱导公式：

    #cols[(1) $sin(pi + alpha) = -sin alpha$；][(2) $sin((3pi)/2 + alpha) = -cos alpha$；]
    #cols[(3) $cos(pi/2 + alpha) = -sin alpha$；][(4) $cos(pi + alpha) = -cos alpha$。]
  2. 利用特殊角的三角函数求 $sin 105°$ 和 $cos 105°$ 的值。
  3. 已知 $cos(alpha - beta) = -4/5$，$cos(alpha + beta) = 4/5$，且 $90° < alpha - beta < 180°$ 和 $270° < alpha + beta < 360°$，求 $cos 2 alpha$ 和 $cos 2 beta$ 的值。

    ［提示：利用 $cos 2 alpha = cos[(alpha - beta) + (alpha + beta)]$ 和 $cos(alpha - beta) = cos(beta - alpha)$ 的关系可得。］
  4. 用 $alpha, beta$ 和 $gamma$ 的三角函数表示 $cos(alpha + beta + gamma)$ 和 $sin(alpha + beta + gamma)$。

    ［提示：利用 $cos[(alpha + beta) + gamma]$ 的展开式来求。］
  5. 设 $alpha$ 和 $beta$ 都是正锐角，求证 $sin(alpha + beta) < sin alpha + sin beta$。
  6. 求证 $cos(alpha + beta) cos gamma - cos alpha cos(beta + gamma)$
    $ = sin(alpha + beta) sin gamma - sin alpha sin(beta + gamma). $
  7. 求证 $cos(alpha - beta) cos(beta - gamma) - sin(alpha - beta) sin(beta - gamma)$
    $ = cos(alpha - gamma). $
]

// p.141
== 两角和的正切和余切

当两角和的正切和余切存在的时候，我们也可以用这两个角的三角函数来表示它们的和的正切和余切。

*1. 两角和的正切*　利用两角和的正弦公式与余弦公式，我们得到

$ tan(alpha + beta) = (sin(alpha + beta))/(cos(alpha + beta)) = (sin alpha cos beta + cos alpha sin beta)/(cos alpha cos beta - sin alpha sin beta). $

假定 $tan alpha$ 和 $tan beta$ 也都存在，我们还可以把最后分式的分子和分母都除以 $cos alpha cos beta$，使结果只含 $tan alpha$ 和 $tan beta$。这样，就得到

$ tan(alpha + beta) &= ((sin alpha cos beta + cos alpha sin beta)/(cos alpha cos beta))/((cos alpha cos beta - sin alpha sin beta)/(cos alpha cos beta)) \
  &= ((sin alpha)/(cos alpha) + (sin beta)/(cos beta))/(1 - (sin alpha)/(cos alpha) dot (sin beta)/(cos beta)) \
  &= (tan alpha + tan beta)/(1 - tan alpha tan beta). $

就是 #h(4em) $display(bold(tan(alpha + beta) = (tan alpha + tan beta)/(1 - tan alpha tan beta)).)$

因为两角和的正弦公式和余弦公式是具有一般性的，所以上面的公式在 $tan(alpha + beta)$，$tan alpha$，$tan beta$ 都存在的条件下总能成立。换句话说，当 $alpha + beta$，$alpha$ 和 $beta$ 都不等于 $k pi + pi/2$（$k$ 是整数）时，上面的公式都能成立。

*2. 两角和的余切*　利用两角和的正弦与余弦公式，按/* p.142 */照求两角和的正切的同样方法，我们可以得到

$ cot(alpha + beta) &= (cos(alpha + beta))/(sin(alpha + beta)) = (cos alpha cos beta - sin alpha sin beta)/(sin alpha cos beta + cos alpha sin beta) \
  &= ((cos alpha cos beta - sin alpha sin beta)/(sin alpha sin beta))/((sin alpha cos beta + cos alpha sin beta)/(sin alpha sin beta)) \
  &= ((cos alpha)/(sin alpha) dot (cos beta)/(sin beta) - 1)/((cos beta)/(sin beta) + (cos alpha)/(sin alpha)) = (cot alpha cot beta - 1)/(cot beta + cot alpha). $

就是 #h(4em) $display(bold(cot(alpha + beta) = (cot alpha cot beta - 1)/(cot beta + cot alpha)).)$

当 $cot(alpha + beta)$，$cot alpha$，$cot beta$ 都存在，也就是当 $alpha + beta$，$alpha$ 和 $beta$ 都不等于 $k pi$（$k$ 是整数）时，这个公式都能成立。

#exercise("4·3")[
  #set enum(numbering: n => if n in (5, 7) [\*#n.] else [#n.])
  1. 利用 $30°$，$45°$ 和 $60°$ 的三角函数，求 $tan 75°$，$cot 105°$ 的值。
  2. 不用查表，求下列各式的值：

    #cols[(1) $display((tan 22° + tan 23°)/(1 - tan 22° dot tan 23°))$；][(2) $display((1 + tan 15°)/(1 - tan 15°))$；]
    #cols[(3) $display((cot 70° cot 140° - 1)/(cot 70° + cot 140°))$；][(4) $display((tan 50° + cot 20°)/(1 - cot 40° tan 70°))$；]
    (5) $display((cot 15° - 1)/(cot 15° + 1))$。
  3. 已知 $tan alpha = 2$，$tan beta = 3$；且 $alpha$ 和 $beta$ 都是正锐角，求证 $alpha + beta = 135°$。
  4. 求证下列各恒等式：

    #cols[(1) $display((cot(alpha - beta) cot beta - 1)/(cot beta + cot(alpha - beta)) = cot alpha)$；][(2) $display((1 + tan alpha)/(1 - tan alpha) = tan(pi/4 + alpha))$；]
    (3) $display((tan alpha + tan 4 alpha)/(1 - tan alpha tan 4 alpha) = (tan 2 alpha + tan 3 alpha)/(1 - tan 2 alpha dot tan 3 alpha))$。
  5. 已知 $alpha + beta = pi/4$，求证 $(1 + tan alpha)(1 + tan beta) = 2$。
  6. /* p.143 */求证 $tan(alpha + beta) - tan alpha - tan beta = tan(alpha + beta) tan alpha tan beta$。
  7. 设 $cot alpha$，$cot beta$ 是 $x^2 + p x + q = 0$ 的根，求 $cot(alpha + beta)$ 的值。
  8. 求证 $tan(pi/4 + alpha) = (cos alpha + sin alpha)/(cos alpha - sin alpha)$。
  9. 求证 $tan(alpha + beta + gamma) = (tan alpha + tan beta + tan gamma - tan alpha tan beta tan gamma)/(1 - tan alpha tan beta - tan beta tan gamma - tan gamma tan alpha)$。
]

== 两角差的三角函数

在 §4·2 中，我们已经看到，两角和的正弦公式

#eqno([(1)], $sin(x + y) = sin x cos y + cos x sin y$)

对于任意角 $x$ 和 $y$ 都能成立。所以 $y$ 是负角的时候也能成立。例如在公式 (1) 中，令 $x = 45°$，$y = -30°$；可得

$ & sin[45° + (-30°)] \
  & quad = sin 45° cos(-30°) + cos 45° sin(-30°), $

就是

$ sin(45° - 30°) = sin 45° cos 30° - cos 45° sin 30°. $

一般地说，在公式 (1) 中，令 $x = alpha$，$y = -beta$，得

$ sin[alpha + (-beta)] = sin alpha cos(-beta) + cos alpha sin(-beta), $

把两边都化简后，就得到两角差的正弦公式

$ bold(sin(alpha - beta) = sin alpha cos beta - cos alpha sin beta). $

同样，在公式

$ cos(x + y) = cos x cos y - sin x sin y, \
  tan(x + y) = (tan x + tan y)/(1 - tan x tan y), \
  cot(x + y) = (cot x cot y - 1)/(cot y + cot x) $

中，分别令 $x = alpha$，$y = -beta$，就得到

// p.144
$ cos(alpha - beta) &= cos[alpha + (-beta)] \
  &= cos alpha cos(-beta) - sin alpha sin(-beta) \
  &= cos alpha cos beta + sin alpha sin beta, \
  tan(alpha - beta) &= tan[alpha + (-beta)] \
  &= (tan alpha + tan(-beta))/(1 - tan alpha tan(-beta)) = (tan alpha - tan beta)/(1 + tan alpha tan beta), \
  cot(alpha - beta) &= cot[alpha + (-beta)] \
  &= (cot alpha cot(-beta) - 1)/(cot(-beta) + cot alpha) = (-cot alpha cot beta - 1)/(-cot beta + cot alpha) \
  &= (cot alpha cot beta + 1)/(cot beta - cot alpha). $

就是
$ bold(cos(alpha - beta)) & bold(= cos alpha cos beta + sin alpha sin beta), \
  bold(tan(alpha - beta)) & bold(= (tan alpha - tan beta)/(1 + tan alpha tan beta)), \
  bold(cot(alpha - beta)) & bold(= (cot alpha cot beta + 1)/(cot beta - cot alpha)). $

这些公式对于使它们的两边有意义的角都能成立。

#ex("例 1.")[求证 $cos(alpha + beta) cos(alpha - beta) = cos^2 alpha - sin^2 beta$。]

#sol(label: [证])[]
$ & cos(alpha + beta) cos(alpha - beta) \
  &= (cos alpha cos beta - sin alpha sin beta)(cos alpha cos beta + sin alpha sin beta) \
  &= cos^2 alpha cos^2 beta - sin^2 alpha sin^2 beta \
  &= cos^2 alpha (1 - sin^2 beta) - (1 - cos^2 alpha) sin^2 beta \
  &= cos^2 alpha - cos^2 alpha sin^2 beta - sin^2 beta + cos^2 alpha sin^2 beta \
  &= cos^2 alpha - sin^2 beta. $

#ex("例 2.")[已知 $cos x = -12/13$，并且 $pi < x < (3pi)/2$，求 $cot(x - pi/4)$ 的值。]

#sol[因为 $x$ 的终边在第三象限内，所以

// p.145
$ sin x = -sqrt(1 - cos^2 x) = -sqrt(1 - (-12/13)^2) = -5/13. $
]

// 下式分母的 13 扫描似 18（油墨），按上式与算式自洽录作 13
$ cot x = (cos x)/(sin x) = (-display(12/13))/(-display(5/13)) = 12/5. $

因此，
$ cot(x - pi/4) &= (cot x cot display(pi/4) + 1)/(cot display(pi/4) - cot x) \
  &= (display(12/5) dot 1 + 1)/(1 - display(12/5)) = -17/7. $

#exercise("4·4")[
  #set enum(numbering: n => if n == 6 [\*#n.] else [#n.])
  1. 利用特殊角的三角函数，求 $sin 15°$，$cos 15°$，$tan 15°$ 的值。
  2. 不用查表，求下列各式的值：

    (1) $cos(33° - x) cos(27° + x) - sin(33° - x) sin(27° + x)$；

    (2) $cos(80° + 2 alpha) cos(35° + 2 alpha) + sin(80° + 2 alpha) cos(55° - 2 alpha)$；

    (3) $sin(70° + alpha) cos(10° + alpha) - cos(70° + alpha) sin(170° - alpha)$；

    (4) $sin 68° sin 22° + cos 112° sin 428°$；

    (5) $display((tan 81° - tan 36°)/(1 + cot 9° cot 54°))$；

    (6) $display((cot 100° cot 10° + 1)/(tan 80° + cot 80°))$。
  3. 求证下列各恒等式：

    (1) $sin(30° + alpha) + cos(60° + alpha) = cos alpha$；

    (2) $sin(alpha + beta) sin(alpha - beta) = sin^2 alpha - sin^2 beta$；

    (3) $display((sin(alpha + beta) - 2 sin alpha cos beta)/(2 sin alpha sin beta + cos(alpha + beta)) = tan(beta - alpha))$；

    (4) $1 + tan alpha dot tan alpha/2 = sec alpha$；


    // p.146
    (5) $display((sin(2 alpha + beta))/(sin alpha) - 2 cos(alpha + beta) = (sin beta)/(sin alpha))$；

    (6) $display((tan(1 + n) x + tan(1 - n) x)/(1 + tan(n + 1) x tan(n - 1) x) = tan 2 x)$。
  4. 已知 $tan alpha = 1/3$，$tan beta = -2$，求 $tan(alpha + beta)$ 和 $cot(alpha - beta)$。
  5. 求证 $tan alpha + (1 + tan alpha) tan(pi/4 - alpha) = 1$。
  6. 一个三角形的两个内角的正切分别是 2 和 3，求第三个内角。
  7. 求证 $display((tan(75° + alpha) - tan(30° + alpha))/(1 + tan(75° + alpha) tan(30° + alpha)))$
    $ = sin(60° - alpha) cos(30° + alpha) + cos(60° - alpha) sin(30° + alpha). $
]

== 二倍角的三角函数

我们知道，$sin 2 alpha$ 与 $2 sin alpha$ 的意义是不同的。$sin 2 alpha$ 表示角 $alpha$ 的两倍的正弦，而 $2 sin alpha$ 表示角 $alpha$ 的正弦的两倍。一般地说，$sin 2 alpha != 2 sin alpha$。例如，当 $alpha = 30°$ 时，

$ sin 2 alpha = sin(2 times 30°) = sin 60° = sqrt(3)/2, $

但

$ 2 sin alpha = 2 sin 30° = 2 times 1/2 = 1. $

同样，$2 alpha$ 的其他三角函数一般也不等于 $alpha$ 的同名三角函数的两倍。

我们现在来导出用 $alpha$ 的三角函数表示 $2 alpha$ 的三角函数的公式。

*1. 二倍角的正弦*　在两角和的正弦公式

$ sin(x + y) = sin x cos y + cos x sin y $

中，用 $alpha$ 代替 $x$ 和 $y$，得

$ sin(alpha + alpha) = sin alpha cos alpha + cos alpha sin alpha, $

// p.147
就是 #h(4em) $bold(sin 2 alpha = 2 sin alpha cos alpha).$

*2. 二倍角的余弦*　在两角和的余弦公式

$ cos(x + y) = cos x cos y - sin x sin y $

中，用 $alpha$ 代替 $x$ 和 $y$，得

$ cos(alpha + alpha) = cos alpha cos alpha - sin alpha sin alpha, $

就是 #h(4em) $bold(cos 2 alpha = cos^2 alpha - sin^2 alpha).$

因为 $sin^2 alpha + cos^2 alpha = 1$，所以 $cos^2 alpha = 1 - sin^2 alpha$，代入上式得到

$ bold(cos 2 alpha = 1 - 2 sin^2 alpha). $

或者用 $sin^2 alpha = 1 - cos^2 alpha$ 代替 $cos 2 alpha = cos^2 alpha - sin^2 alpha$ 中的 $sin^2 alpha$，又得到

$ bold(cos 2 alpha = 2 cos^2 alpha - 1). $

因此，二倍角的余弦可以写成三种形式。后面两种形式用起来比较方便，因为只要知道单角的一个函数便已足够了。

*3. 二倍角的正切和余切*　同样，在两角和的正切公式与余切公式

$ tan(x + y) = (tan x + tan y)/(1 - tan x tan y) $

和

$ cot(x + y) = (cot x cot y - 1)/(cot y + cot x) $

中，分别令 $x = y = alpha$，化简后，得

$ bold(tan 2 alpha = (2 tan alpha)/(1 - tan^2 alpha)), \
  bold(cot 2 alpha = (cot^2 alpha - 1)/(2 cot alpha)). $

// p.148
#ex("例 1.")[已知 $sin alpha = 0.8$，并且 $alpha$ 的终边在第二象限内，求 $sin 2 alpha$ 和 $cos 2 alpha$ 的值。]

#sol[因为 $alpha$ 的终边在第二象限内，所以

$ cos alpha = -sqrt(1 - sin^2 alpha) = -sqrt(1 - 0.8^2) = -0.6. $
]

因此，

$ sin 2 alpha = 2 sin alpha cos alpha = 2 times 0.8(-0.6) = -0.96; \
  cos 2 alpha = 1 - 2 sin^2 alpha = 1 - 2 times 0.8^2 = 1 - 1.28 = -0.28. $

#ex("例 2.")[设 $tan theta/2 = t$，求证：

#cols[(1) $sin theta = display((2t)/(1 + t^2))$；][(2) $cos theta = display((1 - t^2)/(1 + t^2))$；]
(3) $tan theta = display((2t)/(1 - t^2))$。]

#sol(label: [证])[(1) $sin theta = sin(2 dot theta/2) = 2 sin theta/2 cos theta/2$
$ &= (2 sin display(theta/2) cos display(theta/2))/(cos^2 display(theta/2) + sin^2 display(theta/2)) \
  &= ((2 sin display(theta/2) cos display(theta/2))/(cos^2 display(theta/2)))/((cos^2 display(theta/2) + sin^2 display(theta/2))/(cos^2 display(theta/2))) \
  &= (2 tan display(theta/2))/(1 + tan^2 display(theta/2)) = (2t)/(1 + t^2). $
]

// p.149
(2) $cos theta = cos(2 dot theta/2) = cos^2 theta/2 - sin^2 theta/2$
$ &= (cos^2 display(theta/2) - sin^2 display(theta/2))/(cos^2 display(theta/2) + sin^2 display(theta/2)) \
  &= ((cos^2 display(theta/2) - sin^2 display(theta/2))/(cos^2 display(theta/2)))/((cos^2 display(theta/2) + sin^2 display(theta/2))/(cos^2 display(theta/2))) \
  &= (1 - tan^2 display(theta/2))/(1 + tan^2 display(theta/2)) = (1 - t^2)/(1 + t^2). $

(3) $tan theta = tan(2 dot display(theta/2)) = display((2 tan display(theta/2))/(1 - tan^2 display(theta/2)) = (2t)/(1 - t^2)).$

在这个例题里，我们看到，如果令 $tan theta/2 = t$，那么 $sin theta$，$cos theta$ 和 $tan theta$ 都可以表示成关于 $t$ 的分式。这种变形，在高等数学里很有用处。它们叫作万能代换。

我们还要注意，从二倍角的余弦公式

$ cos 2 alpha = 1 - 2 sin^2 alpha, \
  cos 2 alpha = 2 cos^2 alpha - 1, $

分别可以推得

$ sin^2 alpha = (1 - cos 2 alpha)/2, $

// p.150
$ cos^2 alpha = (1 + cos 2 alpha)/2. $

这两个恒等式也是很有用的。

#ex("例 3.")[求证 $2 sin^2 theta sin^2 phi + 2 cos^2 theta cos^2 phi$
$ = 1 + cos 2 theta cos 2 phi. $]

#sol(label: [证])[]
$ & 2 sin^2 theta sin^2 phi + 2 cos^2 theta cos^2 phi \
  &= 2 dot (1 - cos 2 theta)/2 dot (1 - cos 2 phi)/2 \
  & quad + 2 dot (1 + cos 2 theta)/2 dot (1 + cos 2 phi)/2 \
  &= 1/2 (1 - cos 2 theta - cos 2 phi + cos 2 theta cos 2 phi) \
  & quad + 1/2 (1 + cos 2 theta + cos 2 phi + cos 2 theta cos 2 phi) \
  &= 1 + cos 2 theta cos 2 phi. $

#ex("例 4.")[分别用 $sin alpha$，$cos alpha$ 和 $tan alpha$ 来表示 $sin 3 alpha$，$cos 3 alpha$ 和 $tan 3 alpha$。]

#sol[]
$ sin 3 alpha &= sin(2 alpha + alpha) \
  &= sin 2 alpha cos alpha + cos 2 alpha sin alpha \
  &= 2 sin alpha cos^2 alpha + (1 - 2 sin^2 alpha) sin alpha \
  &= 2 sin alpha (1 - sin^2 alpha) + (1 - 2 sin^2 alpha) sin alpha \
  &= 2 sin alpha - 2 sin^3 alpha + sin alpha - 2 sin^3 alpha \
  &= 3 sin alpha - 4 sin^3 alpha. \
  cos 3 alpha &= cos(2 alpha + alpha) \
  &= cos 2 alpha cos alpha - sin 2 alpha sin alpha \
  &= (2 cos^2 alpha - 1) cos alpha - 2 sin^2 alpha cos alpha \
  &= (2 cos^2 alpha - 1) cos alpha - 2(1 - cos^2 alpha) cos alpha \
  &= 2 cos^3 alpha - cos alpha - 2 cos alpha + 2 cos^3 alpha \
  &= 4 cos^3 alpha - 3 cos alpha. $

// p.151
$ tan 3 alpha &= tan(2 alpha + alpha) = (tan 2 alpha + tan alpha)/(1 - tan 2 alpha tan alpha) \
  &= (display((2 tan alpha)/(1 - tan^2 alpha)) + tan alpha)/(1 - display((2 tan alpha)/(1 - tan^2 alpha)) dot tan alpha) \
  &= (2 tan alpha + tan alpha (1 - tan^2 alpha))/(1 - tan^2 alpha - 2 tan^2 alpha) \
  &= (3 tan alpha - tan^3 alpha)/(1 - 3 tan^2 alpha). $

#exercise("4·5")[
  #set enum(numbering: n => if n == 6 [\*#n.] else [#n.])
  1. 设 $alpha = pi/3$，计算下列各式的值：

    #cols[(1) $sin 2 alpha$；][(2) $sin^2 alpha$；][(3) $2 sin alpha$；]
    #cols[(4) $display(1/2) sin alpha$；][(5) $sin display(alpha/2)$；][(6) $sin alpha^2$。]
  2. 已知 $cos alpha = 7/8$，$(3pi)/2 < alpha < 2pi$，求 $cos 2 alpha$，$sin 2 alpha$ 和 $tan 2 alpha$。
  3. 已知 $tan alpha = -(sqrt(2) - 1)$；求 $sin 2 alpha$，$cos 2 alpha$ 和 $tan 2 alpha$。

    ［提示：利用万能代换公式。］
  4. 求证下列各恒等式：

    #cols[(1) $tan theta + cot theta = 2 csc 2 theta$；][(2) $tan theta - cot theta = -2 cot 2 theta$；]
    #cols[(3) $display((sin theta + sin 2 theta)/(1 + cos theta + cos 2 theta) = tan theta)$；][(4) $sin^6 alpha + cos^6 alpha = 1 - display(3/4) sin^2 2 alpha$；]
    #cols[(5) $display((1 + sin 2 alpha - cos 2 alpha)/(1 + sin 2 alpha + cos 2 alpha) = tan alpha)$；][\*(6) $display((sec 8 beta - 1)/(sec 4 beta - 1) = (tan 8 beta)/(tan 2 beta))$。]
  5. 求证 (1) $cos 4 alpha = 1 - 8 cos^2 alpha + 8 cos^4 alpha$；

    #h(2.6em)\(2) $sin 4 alpha = 4(sin alpha cos^3 alpha - cos alpha sin^3 alpha)$。
  6. (1) 求证
    $ sqrt(1 - sin 2 alpha) = |sin alpha - cos alpha| \
      "和" sqrt(1 + sin 2 alpha) = |sin alpha + cos alpha|; $
    ［提示：$1 - sin 2 alpha = sin^2 alpha + cos^2 alpha - 2 sin alpha cos alpha$。］

    // p.152
    (2) 当 $0 <= alpha <= 2pi$ 时，$alpha$ 在怎样的范围内 $sqrt(1 - sin 2 alpha) = sin alpha - cos alpha$？在怎样的范围内 $sqrt(1 + sin 2 alpha) = -(sin alpha + cos alpha)$？

    (3) 利用上两题求 $sin 15° - cos 15°$ 和 $sin 112°30' + cos 112°30'$ 的值。
  7. 已知 $sin alpha = 0.6$，且 $pi/2 < alpha < pi$，求 $sin 3 alpha$，$cos 3 alpha$ 和 $tan 3 alpha$ 的值。
  8. 求证下列各恒等式：

    (1) $sin 3A sin^3 A + cos 3A cos^3 A = cos^3 2A$；

    (2) $tan alpha + tan(pi/3 + alpha) + tan((2pi)/3 + alpha) = 3 tan 3 alpha$；

    (3) $cot 3 theta = display((cot^3 theta - 3 cot theta)/(3 cot^2 theta - 1))$；

    (4) $cos 6 alpha = 32 cos^6 alpha - 48 cos^4 alpha + 18 cos^2 alpha - 1$。
  9. 已知 $tan theta = 7/24$，求 $cos 2 theta$ 和 $cot 3 theta$ 的值。
]

== 半角的三角函数

一个角的一半叫作它的半角。有时我们要用一个角的三角函数来表示它的半角的三角函数。例如，已知

$ cos 45° = sqrt(2)/2, $

要算出 $sin 22°30'$，$cos 22°30'$，等等。半角三角函数的公式可以从二倍角的余弦公式推导出来。

在二倍角的余弦公式

$ cos 2x = 1 - 2 sin^2 x $

中，令 $x = alpha/2$，那么 $2x = alpha$。因此，

$ cos alpha = 1 - 2 sin^2 alpha/2. $

移项，得 #h(4em) $2 sin^2 display(alpha/2) = 1 - cos alpha,$

// p.153
就是

#eqno([(1)], $sin^2 alpha/2 = (1 - cos alpha)/2.$)

$ ∴ quad bold(sin alpha/2 = ± sqrt((1 - cos alpha)/2)). $

在二倍角的余弦的另一公式

$ cos 2x = 2 cos^2 x - 1 $

中，令 $x = alpha/2$，那么

$ cos alpha = 2 cos^2 alpha/2 - 1. $

移项，得 #h(4em) $2 cos^2 display(alpha/2) = 1 + cos alpha,$

就是

#eqno([(2)], $cos^2 alpha/2 = (1 + cos alpha)/2.$)

$ ∴ quad bold(cos alpha/2 = ± sqrt((1 + cos alpha)/2)). $

把等式 (1) 的两边分别除以等式 (2) 的两边，还可以得到

$ tan^2 alpha/2 = (1 - cos alpha)/(1 + cos alpha), $

$ ∴ quad bold(tan alpha/2 = ± sqrt((1 - cos alpha)/(1 + cos alpha))). $

我们得到了由角 $alpha$ 的余弦来求 $display(alpha/2)$ 的正弦，余弦和正切的公式。这些公式只能确定所求的三角函数的绝对值。根号前的符号，决定于角 $display(alpha/2)$ 的终边所在的象限。因此，应用这些公式时，应当根据题目的条件，先求出 $display(alpha/2)$ 的终边所在的象限，然后决定根号前应取的符号。从下面的例 1～例 3 可以看到，/* p.154 */如果知道角 $alpha$ 的值或者它所在的范围，那么 $display(alpha/2)$ 的三角函数值可以唯一确定；但是如果只知道角 $alpha$ 的终边所在的象限，那么将得到 $display(alpha/2)$ 的两组三角函数值。

#ex("例 1.")[求 $tan 67°30'$ 的值。]

#sol[$67°30' = display((135°)/2)$，并且 $67°30'$ 的终边在第一象限内，所以

$ tan 67°30' &= tan (135°)/2 = +sqrt((1 - cos 135°)/(1 + cos 135°)) \
  &= sqrt((1 - (-display(1/sqrt(2))))/(1 + (-display(1/sqrt(2))))) = sqrt((sqrt(2) + 1)/(sqrt(2) - 1)) \
  &= sqrt((sqrt(2) + 1)^2/((sqrt(2) - 1)(sqrt(2) + 1))) = sqrt((sqrt(2) + 1)^2/(2 - 1)) \
  &= sqrt(2) + 1. $
]

#ex("例 2.")[已知 $cos alpha = -15/17$，并且 $180° < alpha < 270°$，求 $sin display(alpha/2)$ 和 $cos display(alpha/2)$ 的值。]

#sol[因为 $180° < alpha < 270°$，所以 $90° < display(alpha/2) < 135°$，$display(alpha/2)$ 的终边在第二象限内。因此，

$ sin alpha/2 = +sqrt((1 - cos alpha)/2) = +sqrt((1 - (-display(15/17)))/2) = +(4 sqrt(17))/17; \
  cos alpha/2 = -sqrt((1 + cos alpha)/2) = -sqrt((1 + (-display(15/17)))/2) = -sqrt(17)/17. $
]

// p.155
#ex("例 3.")[已知 $cos alpha = 3/5$，并且 $alpha$ 的终边在第四象限内，求 $sin display(alpha/2)$，$cos display(alpha/2)$ 和 $tan display(alpha/2)$ 的值。]

#sol[终边在第四象限内的角 $alpha$ 可以写成

$ n dot 360° + 270° + alpha_1 $
]

的形式，这里 $n$ 是一个整数，$alpha_1$ 是一个锐角。因此，

$ alpha/2 = n dot 180° + 135° + alpha_1/2. $

因为 $alpha_1$ 是锐角，所以 $display(alpha_1/2)$ 是小于 $45°$ 的锐角，$135° + display(alpha_1/2)$ 是在 $135°$ 与 $180°$ 之间的角，并且容易看出：

当 $n$ 是偶数时，$display(alpha/2)$ 的终边在第二象限内；

当 $n$ 是奇数时，$display(alpha/2)$ 的终边在第四象限内。

(1) 当 $display(alpha/2)$ 的终边在第二象限内时，

$ sin alpha/2 > 0, quad cos alpha/2 < 0, quad tan alpha/2 < 0. $

应用公式，得到

$ sin alpha/2 &= sqrt((1 - display(3/5))/2) = sqrt(5)/5; \
  cos alpha/2 &= -sqrt((1 + display(3/5))/2) = -(2 sqrt(5))/5; \
  tan alpha/2 &= -sqrt((1 - display(3/5))/(1 + display(3/5))) = -1/2. $

(2) 当 $display(alpha/2)$ 的终边在第四象限内时，

// p.156
$ sin alpha/2 < 0, quad cos alpha/2 > 0, quad tan alpha/2 < 0. $

应用公式，得到

$ sin alpha/2 &= -sqrt((1 - display(3/5))/2) = -sqrt(5)/5; \
  cos alpha/2 &= sqrt((1 + display(3/5))/2) = (2 sqrt(5))/5; \
  tan alpha/2 &= -sqrt((1 - display(3/5))/(1 + display(3/5))) = -1/2. $

$tan display(alpha/2)$ 也可以用 $sin alpha$ 和 $cos alpha$ 的不带根号的式子来表示。

$ tan alpha/2 = (sin display(alpha/2))/(cos display(alpha/2)) = (2 sin display(alpha/2) cos display(alpha/2))/(2 cos^2 display(alpha/2)) = (sin alpha)/(1 + cos alpha). $

就是

#eqno([(3)], $bold(tan alpha/2 = (sin alpha)/(1 + cos alpha)).$)

同样，#h(2em) $display(tan alpha/2 = (sin display(alpha/2))/(cos display(alpha/2)) = (2 sin^2 display(alpha/2))/(2 sin display(alpha/2) cos display(alpha/2)) = (1 - cos alpha)/(sin alpha).)$

就是

#eqno([(4)], $bold(tan alpha/2 = (1 - cos alpha)/(sin alpha)).$)

应用这两个公式时，只要知道角 $alpha$ 的终边所在的象限，可不必先分析 $display(alpha/2)$ 的终边所在的象限，就求出 $tan display(alpha/2)$ 的值。

// p.157
例如，在例 3 里，已知 $cos alpha = 3/5$，并且 $alpha$ 的终边在第四象限内。我们先算出 $sin alpha$ 的值。

因为角 $alpha$ 的终边在第四象限内，所以 $sin alpha < 0$。因此，

$ sin alpha = -sqrt(1 - cos^2 alpha) = -sqrt(1 - (3/5)^2) = -4/5. $

应用公式 $tan display(alpha/2) = display((1 - cos alpha)/(sin alpha))$，得到

$ tan alpha/2 = (1 - display(3/5))/(-display(4/5)) = -1/2. $

我们看到，这样计算就比较方便。

公式 (3) 和 (4) 不仅可以根据 $sin alpha$ 和 $cos alpha$ 的值，用来求 $tan display(alpha/2)$，在化简三角函数式或者证明三角恒等式的时候，也很有用。

#ex("例 4.")[化简：$display((1 + sin theta - cos theta)/(1 + sin theta + cos theta))$。]

#sol[原式 $display(= (display((1 - cos theta)/(sin theta)) + 1)/(display((1 + cos theta)/(sin theta)) + 1) = (tan display(theta/2) + 1)/(display(1/(tan display(theta/2))) + 1) = tan theta/2.)$]

#exercise("4·6")[
  #set enum(numbering: n => if n == 7 [\*#n.] else [#n.])
  1. 已知 $cos alpha = 119/169$，求 $sin display(alpha/2)$，$cos display(alpha/2)$ 和 $tan display(alpha/2)$。
  2. 已知 $cos alpha = 4/5$，且 $(3pi)/2 < alpha < 2pi$，求 $tan display(alpha/2)$。
  3. 已知等腰三角形顶角的余弦等于 $display(7/25)$，求底角的正弦和余弦。
  4. /* p.158 */已知 $tan alpha = 4/3$，且 $180° < alpha < 270°$，求 $tan display(alpha/2)$。
  5. 求证下列各恒等式：

    #cols[(1) $display((cos A)/(cot display(A/2) - tan display(A/2)) = 1/2 sin A)$；][(2) $1 + sin alpha = 2 cos^2 (pi/4 - alpha/2)$；]
    #cols[(3) $1 - sin alpha = 2 sin^2 (pi/4 - alpha/2)$；][(4) $display((2 sin theta - sin 2 theta)/(2 sin theta + sin 2 theta) = tan^2 theta/2)$；]
    (5) $display((tan display(alpha/2))/(1 + tan display(alpha/2)) + (tan display(alpha/2))/(1 - tan display(alpha/2)) = tan alpha)$。
  6. 利用 $45°$，$30°$ 的三角函数值，求 $cos 22°30'$，$sin 22°30'$，$cos 15°$，$sin 15°$ 的值。
  7. 求证 $tan 7°30' = sqrt(6) - sqrt(3) + sqrt(2) - 2$。
]

== 三角函数的积化为和

在有些关于三角函数的计算和化简的问题中，我们需要把三角函数的积化成三角函数的代数和的形式。

我们知道：

$ sin(alpha + beta) = sin alpha cos beta + cos alpha sin beta, \
  sin(alpha - beta) = sin alpha cos beta - cos alpha sin beta. $

把这两个等式的两边分别相加或者相减，得

$ sin(alpha + beta) + sin(alpha - beta) = 2 sin alpha cos beta, \
  sin(alpha + beta) - sin(alpha - beta) = 2 cos alpha sin beta. $

把最后这两个等式的两边都除以 2，并且调过来写，得到

#eqno([(1)], $bold(sin alpha cos beta = 1/2 [sin(alpha + beta) + sin(alpha - beta)]),$)

#eqno([(2)], $bold(cos alpha sin beta = 1/2 [sin(alpha + beta) - sin(alpha - beta)]).$)

// p.159
#ex("例 1.")[计算 $sin 105° cos 75°$ 的值。]

#sol[应用公式 (1)，得

$ sin 105° cos 75° &= 1/2 [sin(105° + 75°) + sin(105° - 75°)] \
  &= 1/2 (sin 180° + sin 30°) = 1/2 (0 + 1/2) = 1/4. $
]

也可以应用公式 (2)，得

$ cos 75° sin 105° &= 1/2 [sin(75° + 105°) - sin(75° - 105°)] \
  &= 1/2 [sin 180° - sin(-30°)] \
  &= 1/2 (sin 180° + sin 30°) = 1/2 (0 + 1/2) = 1/4. $

从这个例题可以看到，公式 (1) 和 (2) 的作用是一样的，它们都可以用来把正弦与余弦的积化成另外两个角的正弦的代数和的形式。

相仿地，可以推出把两个角的正弦的积或者余弦的积化成三角函数的代数和的公式。

根据公式

$ cos(alpha + beta) = cos alpha cos beta - sin alpha sin beta, \
  cos(alpha - beta) = cos alpha cos beta + sin alpha sin beta, $

可以得到

$ cos(alpha + beta) + cos(alpha - beta) = 2 cos alpha cos beta, \
  cos(alpha + beta) - cos(alpha - beta) = -2 sin alpha sin beta. $

因此，

#eqno([(3)], $bold(cos alpha cos beta = 1/2 [cos(alpha + beta) + cos(alpha - beta)]),$)

#eqno([(4)], $bold(sin alpha sin beta = -1/2 [cos(alpha + beta) - cos(alpha - beta)]).$)

// p.160
注意公式 (4) 前面的系数是 $-display(1/2)$。这个公式也可以写成另一种形式：

#eqno([(4$'$)], $sin alpha sin beta = 1/2 [cos(alpha - beta) - cos(alpha + beta)].$)

#ex("例 2.")[化简 $cos(alpha + beta) cos(alpha - beta)$
$ - cos(beta + gamma) cos(beta - gamma) \
  + cos(alpha + gamma) cos(alpha - gamma). $]

#sol[应用公式 (3)，得

$ cos(alpha + beta) cos(alpha - beta) = 1/2 (cos 2 alpha + cos 2 beta), \
  -cos(beta + gamma) cos(beta - gamma) = -1/2 (cos 2 beta + cos 2 gamma), \
  cos(alpha + gamma) cos(alpha - gamma) = 1/2 (cos 2 alpha + cos 2 gamma). $
]

把这三个等式的两边分别相加，就得到

$ & cos(alpha + beta) cos(alpha - beta) - cos(beta + gamma) cos(beta - gamma) \
  & quad + cos(alpha + gamma) cos(alpha - gamma) = cos 2 alpha. $

#ex("例 3.")[求证 $sin(alpha + beta) sin(alpha - beta) = sin^2 alpha - sin^2 beta$。]

#sol(label: [证])[应用公式 (4$'$)，得

$ & sin(alpha + beta) sin(alpha - beta) \
  &= 1/2 {cos[(alpha + beta) - (alpha - beta)] - cos[(alpha + beta) + (alpha - beta)]} \
  &= 1/2 (cos 2 beta - cos 2 alpha) \
  &= 1/2 [(1 - 2 sin^2 beta) - (1 - 2 sin^2 alpha)] \
  &= sin^2 alpha - sin^2 beta. $
]

// p.161
#exercise("4·7")[
  #set enum(numbering: n => if n == 4 [\*#n.] else [#n.])
  1. 不用查表，计算下列各式的值：

    #cols[(1) $sin 52°30' cos 7°30'$；][(2) $cos 97°30' sin 37°30'$；]
    (3) $2 cos 165° cos 135°$。
  2. 以和或差表示下列各式：

    #cols[(1) $2 sin 3 theta cos theta$；][(2) $2 sin(pi/4 - 3x) cos(pi/4 + x)$；]
    #cols[(3) $cos((3pi)/4 + 2x) sin(pi/4 - x)$；][(4) $2 sin(pi/4 - x) sin(pi/4 + x)$。]
  3. 求证 $sin(alpha + beta) sin(alpha - beta) + sin(beta + gamma) sin(beta - gamma)$
    $ + sin(gamma + alpha) sin(gamma - alpha) = 0. $
  4. 求证 $display((sin alpha)/(sin(alpha - beta) sin(alpha - gamma)) + (sin beta)/(sin(beta - alpha) sin(beta - gamma)))$
    $ + (sin gamma)/(sin(gamma - alpha) sin(gamma - beta)) = 0. $
    ［提示：取公分母为 $sin(alpha - beta) sin(beta - gamma) sin(gamma - alpha)$。］
  5. 求证 $tan(alpha + beta) + tan(alpha - beta) = display((2 sin 2 alpha)/(cos 2 alpha + cos 2 beta))$。
  6. 求证 $cot(A + 15°) - tan(A - 15°) = display((4 cos 2A)/(1 + 2 sin 2A))$。
  7. 求证 $tan 67°30' - tan 22°30' = 2$。
]

== 三角函数的和化为积

有时我们也需要把三角函数的代数和化成积的形式。现在我们先来求出把 $sin alpha plus.minus sin beta$ 与 $cos alpha plus.minus cos beta$ 化成积的公式。

我们从 §4·7 中知道：

$ sin(x + y) + sin(x - y) = 2 sin x cos y; \
  sin(x + y) - sin(x - y) = 2 cos x sin y; \
  cos(x + y) + cos(x - y) = 2 cos x cos y; \
  /* p.162 */ cos(x + y) - cos(x - y) = -2 sin x sin y. $

令 $x + y = alpha$，$x - y = beta$。解这个方程组，得 $x = display((alpha + beta)/2)$，$y = display((alpha - beta)/2)$。代入上面的四个等式中，就得到

#eqno([(1)], $bold(sin alpha + sin beta = 2 sin (alpha + beta)/2 cos (alpha - beta)/2);$)

#eqno([(2)], $bold(sin alpha - sin beta = 2 cos (alpha + beta)/2 sin (alpha - beta)/2);$)

#eqno([(3)], $bold(cos alpha + cos beta = 2 cos (alpha + beta)/2 cos (alpha - beta)/2);$)

#eqno([(4)], $bold(cos alpha - cos beta = -2 sin (alpha + beta)/2 sin (alpha - beta)/2).$)

利用这些公式，可以把两个角的正弦或者余弦的代数和化成另外两个角的三角函数的积。

注意公式 (4) 中的系数是 $-2$。由于

$ -sin (alpha - beta)/2 = sin(-(alpha - beta)/2) = sin (beta - alpha)/2, $

公式 (4) 也可以写成下面的形式：

#eqno([(4$'$)], $cos alpha - cos beta = 2 sin (alpha + beta)/2 sin (beta - alpha)/2.$)

#ex("例 1.")[求证 $sin(45° + x) - sin(45° - x) = sqrt(2) sin x$。]

#sol(label: [证])[]
$ & sin(45° + x) - sin(45° - x) \
  &= 2 cos ((45° + x) + (45° - x))/2 \
  & quad times sin ((45° + x) - (45° - x))/2 \
  &= 2 cos 45° sin x = 2 dot sqrt(2)/2 sin x = sqrt(2) sin x. $

除了应用公式 (1)～(4) 可以把两个角的正弦或者余弦的代数和化成积以外，其他两个同名函数的代数和也很容易化/* p.163 */成积的形式。这些就不必作为公式来记忆了。我们只举一些例子说明如下：

#ex("例 2.")[把 $tan alpha + tan beta$ 化成积的形式。]

#sol[]
$ tan alpha + tan beta &= (sin alpha)/(cos alpha) + (sin beta)/(cos beta) \
  &= (sin alpha cos beta + cos alpha sin beta)/(cos alpha cos beta) \
  &= (sin(alpha + beta))/(cos alpha cos beta). $

像 $a + b sin alpha$，$a + b cos alpha$，$a + b tan alpha$ 等形式的式子可以利用辅助角把它们化成积的形式。

#ex("例 3.")[把 $1 + sqrt(3) tan alpha$ 化成积的形式。]

#sol[]
$ 1 + sqrt(3) tan alpha &= sqrt(3) (1/sqrt(3) + tan alpha) \
  &= sqrt(3) (tan 30° + tan alpha). $

利用例 2 的结果，得

$ tan 30° + tan alpha = (sin(30° + alpha))/(cos 30° cos alpha). $

因此，

$ 1 + sqrt(3) tan alpha &= sqrt(3) dot (sin(30° + alpha))/(cos 30° cos alpha) = sqrt(3) dot (sin(30° + alpha))/(display(sqrt(3)/2) cos alpha) \
  &= (2 sin(30° + alpha))/(cos alpha). $

#ex("例 4.")[把 $1 + sin alpha$ 化成积的形式。]

#sol[]
$ 1 + sin alpha &= sin 90° + sin alpha \
  &= 2 sin(45° + alpha/2) cos(45° - alpha/2). $

这个例题也可以应用二倍角的余弦公式，按照下面的方法来做：

// p.164
$ 1 + sin alpha &= 1 + cos(90° - alpha) \
  &= 1 + 2 cos^2 (45° - alpha/2) - 1 = 2 cos^2 (45° - alpha/2). $

两个结果的形式虽然不同，其实是一样的；因为

$ & 2 sin(45° + alpha/2) cos(45° - alpha/2) \
  &= 2 cos[90° - (45° + alpha/2)] cos(45° - alpha/2) = 2 cos^2 (45° - alpha/2). $

当两个角的函数互为余函数，而要把它们化成积的形式时，可以仿照下面的例 5 和例 6 来做。

#ex("例 5.")[把 $sin alpha + cos beta$ 化成积的形式。]

#sol[]
$ sin alpha + cos beta &= sin alpha + sin(90° - beta) \
  &= 2 sin (alpha + (90° - beta))/2 \
  & quad times cos (alpha - (90° - beta))/2 \
  &= 2 sin((alpha - beta)/2 + 45°) \
  & quad times cos((alpha + beta)/2 - 45°). $

#ex("例 6.")[把 $tan alpha + cot beta$ 化成积的形式。]

#sol[$tan alpha + cot beta = tan alpha + tan(90° - beta)$。]

利用例 2 的结果，得

$ tan alpha + tan(90° - beta) = (sin(alpha + 90° - beta))/(cos alpha cos(90° - beta)) = (cos(alpha - beta))/(cos alpha sin beta). $

因此，

$ tan alpha + cot beta = (cos(alpha - beta))/(cos alpha sin beta). $

遇到要把三个同名函数的代数和化成积的时候，要适当选择某两个函数，先把它们的和化成积，不要盲目乱套公式。

#ex("例 7.")[把 $sin 40° + sin 50° + sin 60°$ 化成积的形式。]

// p.165
#sol[]
$ & sin 40° + sin 50° + sin 60° \
  &= (sin 60° + sin 40°) + sin 50° \
  &= 2 sin 50° cos 10° + sin 50° \
  &= 2 sin 50° (cos 10° + 1/2) \
  &= 2 sin 50° (cos 10° + cos 60°) \
  &= 2 sin 50° dot 2 cos 35° cos 25° \
  &= 4 sin 50° cos 35° cos 25°. $

// 原书此段排小字
#text(size: 9.8pt)[这里，我们先把 $sin 60° + sin 40°$ 化成积，是因为 $60°$ 和 $40°$ 这两个角的和的一半等于 $50°$，恰巧就是题目中的第三个角。]

一般地说，如果题目中的两个角的和或者和的一半，差或者差的一半等于第三个角，那么总应先把这两个角的函数的代数和化成积，然后继续做下去。

三角函数的形式是多种多样的。要把某一个和化成积的形式，除了上面例题中所作的指示以外，并没有一定的方法，应该根据具体题目灵活处理。

#ex("例 8.")[把 $1 + tan x + sec x$ 化成积的形式。]

#sol[]
$ & 1 + tan x + sec x \
  &= (cos x + sin x + 1)/(cos x) \
  &= (2 cos^2 display(x/2) - 1 + 2 sin display(x/2) cos display(x/2) + 1)/(cos x) \
  &= (2 cos display(x/2) (cos display(x/2) + sin display(x/2)))/(cos x) \
  &= (2 cos display(x/2) [sin(90° - display(x/2)) + sin display(x/2)])/(cos x) \
  /* p.166 */ &= (2 cos display(x/2) dot 2 sin 45° cos(45° - display(x/2)))/(cos x) \
  &= (2 sqrt(2) cos display(x/2) cos(45° - display(x/2)))/(cos x). $

#exercise("4·8")[
  #set enum(numbering: n => if n == 8 [\*#n.] else [#n.])
  1. 将下列各式化成积的形式：

    #cols[(1) $cos 6 theta - cos 4 theta$；][(2) $cos 4 theta cos theta - sin 6 theta sin 3 theta$；]
    #cols[(3) $1 + sin alpha + cos alpha$；][(4) $sin theta + sin 2 theta + sin 3 theta$；]
    (5) $sin 70° + 8 cos 20° cos 40° cos 80°$；

    (6) $cos alpha + cos beta + cos gamma + cos(alpha + beta + gamma)$。
  2. 将下列各式化成积的形式：

    #cols[(1) $3 - cot^2 alpha$；][(2) $1 + cot alpha tan beta$；][(3) $sec x - tan x$；]
    (4) $sin(alpha + beta) - display((sin(2 alpha + beta) - sin beta)/(2 cos alpha))$；

    (5) $1 + cot alpha + csc alpha$。
  3. 化简下列各式：

    #cols[(1) $display((cos A - cos 3A)/(sin 3A - sin A))$；][(2) $display((sin alpha + sin 3 alpha)/(cos alpha + cos 3 alpha))$；]
    #cols[(3) $display((sin x + sin 3x + sin 5x)/(cos x + cos 3x + cos 5x))$；][(4) $display((sin A + 2 sin 3A + sin 5A)/(sin 3A + 2 sin 5A + sin 7A))$；]
    (5) $display((sin theta + sin 2 theta)/(1 + cos theta + cos 2 theta))$。
  4. 求下列各式的值：

    #cols[(1) $sin 75° + sin 15°$；][(2) $sin 10° + sin 50° - sin 70°$；]
    #cols[(3) $cos 114° + sin 24°$；][\*(4) $cos display((2pi)/15) cos display((4pi)/15) cos display((8pi)/15) cos display((14pi)/15)$。]
  5. 求证 $cos(60° + alpha) + cos(60° - alpha) = cos alpha$。
  6. 求证 $cos 10 alpha + cos 8 alpha + 3 cos 4 alpha + 3 cos 2 alpha = 8 cos alpha cos^3 3 alpha$。
  7. 求证 $display((sin(n + 1) A + 2 sin n A + sin(n - 1) A)/(cos(n - 1) A - cos(n + 1) A) = cot A/2)$。
  8. /* p.167 */求证 $cos 55° cos 65° + cos 65° cos 175° + cos 55° cos 175° = -display(3/4)$。
]

== 化 $a sin x + b cos x$ 成一个角的正弦

在物理学中，我们会遇到 $a sin x + b cos x$ 这样形式的函数。应用两角和或者差的正弦公式，可以把它化成一个角的正弦的形式。现在举例说明如下：

#ex("例 1.")[化 $display(sqrt(3)/2) sin x + display(1/2) cos x$ 成一个角的正弦的形式。]

#sol[把 $sin x$ 的系数提到括号外面，得

$ sqrt(3)/2 sin x + 1/2 cos x = sqrt(3)/2 (sin x + 1/sqrt(3) cos x). $
]

因为 $display(1/sqrt(3) = tan pi/6 = (sin display(pi/6))/(cos display(pi/6)))$，所以

$ "原式" &= sqrt(3)/2 (sin x + (sin display(pi/6))/(cos display(pi/6)) cos x) \
  &= sqrt(3)/(2 cos display(pi/6)) (sin x cos pi/6 + cos x sin pi/6) = sin(x + pi/6). $

#ex("例 2.")[化 $4 sin x + 3 cos x$ 成一个角的正弦的形式。]

#sol[原式 $= 4(sin x + display(3/4) cos x)$。]

令 $display(3/4) = tan phi$。查表求得 $phi$ 的最小正值

$ phi = 36°52'. $

因此，

$ "原式" &= 4(sin x + tan 36°52' cos x) \
  &= 4(sin x + (sin 36°52')/(cos 36°52') cos x) \
  /* p.168 */ &= 4/(cos 36°52') (sin x cos 36°52' + cos x sin 36°52') \
  &= 4/(cos 36°52') sin(x + 36°52'). $

由 $tan 36°52' = display(3/4)$，得

$ sec 36°52' = sqrt(1 + tan^2 36°52') = sqrt(1 + (3/4)^2) = 5/4, \
  cos 36°52' = 1/(sec 36°52') = 1/display(5/4) = 4/5. $

$ ∴ quad "原式" = 4/display(4/5) sin(x + 36°52') = 5 sin(x + 36°52'). $

一般地说，

$ a sin x + b cos x = a(sin x + b/a cos x). $

令 $display(b/a) = tan phi$，那么

$ a sin x + b cos x &= a(sin x + tan phi cos x) \
  &= a/(cos phi) (sin x cos phi + cos x sin phi) = (a sin(x + phi))/(cos phi). $

#ex("例 3.")[画出 $y = 3 sin x - sqrt(3) cos x$ 的图像。]

// 第二行的 √3 扫描似 √8（油墨），按上下文录作 √3
#sol[]
$ y &= 3 sin x - sqrt(3) cos x \
  &= 3(sin x - sqrt(3)/3 cos x) \
  &= 3(sin x - tan pi/6 cos x) \
  &= 3/(cos display(pi/6)) (sin x cos pi/6 - cos x sin pi/6) \
  &= 2 sqrt(3) sin(x - pi/6). $

由此可知，要画出 $y = 3 sin x - sqrt(3) cos x$ 的图像，只要先画出 $y = 2 sqrt(3) sin x$ 的图像，然后将 $y$ 轴向左平移等于 $display(pi/6)$ 的一段距离就可/* p.169 */以了（图 4·2）。

#fig("4·2", fig-c4-4-2())[]

#exercise("4·9")[
  1. 化 $sin x + cos x$ 成一个角的正弦的形式。
  2. 化 $sin x - sqrt(3) cos x$ 成一个角的余弦的形式。
  3. 化 $sin(45° + x) - cos(45° + x)$ 成一个角的正弦的形式。
  4. 化 $cos(45° - x) + cos(45° + x)$ 成一个角的余弦的形式。
  5. 化 $8 sin x + 15 cos x$ 成一个角的正弦的形式。
  6. 求证 $4 sin 53°8' + 3 cos 53°8' = 5$。
  7. 求证 $a sin x + b cos x$ 的极大值为 $sqrt(a^2 + b^2)$。
  8. 画出 $y = sqrt(3) sin(pi/6 - x) + 3 sin(pi/3 + x)$ 的图像。
]

== 三角形内角的三角函数间的关系

我们知道，在任意三角形中，三内角的和等于 $180°$。应用把三角/* p.170 */函数的和化为积的公式，可以推出三个内角的三角函数间的各种关系。现在举例说明如下：

#ex("例 1.")[在 $△A B C$ 中，求证

$ sin A + sin B + sin C = 4 cos A/2 cos B/2 cos C/2. $]

#sol(label: [证])[]
$ & sin A + sin B + sin C \
  &= sin A + sin B + sin[180° - (A + B)] \
  &= sin A + sin B + sin(A + B) \
  &= 2 sin 1/2 (A + B) cos 1/2 (A - B) \
  & quad + 2 sin 1/2 (A + B) cos 1/2 (A + B) \
  &= 2 sin 1/2 (A + B) [cos 1/2 (A + B) + cos 1/2 (A - B)] \
  &= 2 sin 1/2 (180° - C) dot 2 cos A/2 cos B/2 \
  &= 4 sin(90° - C/2) cos A/2 cos B/2 \
  &= 4 cos A/2 cos B/2 cos C/2. $

在这个例题中，我们看到，一开始就要把 $C$ 写成 $180° - (A + B)$，后来又把 $A + B$ 写成 $180° - C$。证明这一类等式，一般都可以这样做。

#ex("例 2.")[在 $△A B C$ 中，求证

$ cos 2A + cos 2B + cos 2C = -1 - 4 cos A cos B cos C. $]

#sol(label: [证])[]
$ & cos 2A + cos 2B + cos 2C \
  &= cos 2A + cos 2B + cos 2[180° - (A + B)] \
  &= cos 2A + cos 2B + cos[360° - 2(A + B)] \
  &= cos 2A + cos 2B + cos 2(A + B) \
  &= 2 cos(A + B) cos(A - B) + 2 cos^2 (A + B) - 1 \
  &= -1 + 2 cos(A + B) [cos(A + B) + cos(A - B)] \
  &= -1 + 2 cos(180° - C) dot 2 cos A cos B \
  &= -1 - 4 cos A cos B cos C. $

#ex("例 3.")[在 $△A B C$ 中，求证

$ cos^2 A + cos^2 B + cos^2 C = 1 - 2 cos A cos B cos C. $]

// p.171
#sol(label: [证])[]
$ & cos^2 A + cos^2 B + cos^2 C \
  &= (1 + cos 2A)/2 + (1 + cos 2B)/2 + (1 + cos 2C)/2 \
  &= 3/2 + 1/2 (cos 2A + cos 2B + cos 2C). $

利用例 2 中所证明的关系，得

$ cos^2 A + cos^2 B + cos^2 C &= 3/2 + 1/2 (-1 - 4 cos A cos B cos C) \
  &= 1 - 2 cos A cos B cos C. $

#ex("例 4.")[在 $△A B C$ 中，求证

$ tan A + tan B + tan C = tan A tan B tan C. $]

#sol(label: [证])[利用 §4·8 例 2 的结果，我们知道

$ tan A + tan B = (sin(A + B))/(cos A cos B). $
]

所以

$ tan A + tan B + tan C &= (sin(A + B))/(cos A cos B) + (sin C)/(cos C) \
  &= (sin C)/(cos A cos B) + (sin C)/(cos C) \
  &= sin C dot (cos C + cos A cos B)/(cos A cos B cos C) \
  &= sin C dot (-cos(A + B) + cos A cos B)/(cos A cos B cos C) \
  &= sin C dot (-cos A cos B + sin A sin B + cos A cos B)/(cos A cos B cos C) \
  &= (sin A sin B sin C)/(cos A cos B cos C) = tan A tan B tan C. $

这个例题也可以不先把 $tan A + tan B$ 变形，而采用下面的更简便的证法：

因为 #h(4em) $A + B = 180° - C,$

所以 #h(4em) $tan(A + B) = tan(180° - C),$

就是 #h(4em) $display((tan A + tan B)/(1 - tan A tan B) = -tan C.)$

等式的两边都乘以 $1 - tan A tan B$，得

$ tan A + tan B = -tan C + tan A tan B tan C, $

// p.172
移项，就得到 #h(2em) $tan A + tan B + tan C = tan A tan B tan C.$

注意，这个等式对于直角三角形不成立。

#exercise("4·10")[
  设 $A + B + C = pi$，求证：

  1. $display((sin 2A + sin 2B + sin 2C)/(sin A + sin B + sin C) = 8 sin A/2 sin B/2 sin C/2)$。
  2. $cos A + cos B + cos C = 1 + 4 sin A/2 sin B/2 sin C/2$。
  3. $sin^2 A/2 + sin^2 B/2 + sin^2 C/2 = 1 - 2 sin A/2 sin B/2 sin C/2$。
  4. $sin A/2 + sin B/2 + sin C/2 = 1 + 4 sin (pi - A)/4 sin (pi - B)/4 sin (pi - C)/4$。
  5. $sin A + sin B - sin C = 4 sin A/2 sin B/2 cos C/2$。
  6. $cot A/2 + cot B/2 + cot C/2 = cot A/2 cot B/2 cot C/2$。
  7. $tan A/2 tan B/2 + tan B/2 tan C/2 + tan C/2 tan A/2 = 1$。
  8. $sin(B + C - A) + sin(C + A - B) + sin(A + B - C)$
    $ = 4 sin A sin B sin C. $
]

#summary[
  *1. 重要公式*（公式后面括号中注的是公式名称的略号）

  #let nm(a, b) = grid(columns: (1fr, auto), column-gutter: 1em, a, b)
  #nm([(1) $sin(alpha plus.minus beta) = sin alpha cos beta plus.minus cos alpha sin beta$；], $S_(alpha plus.minus beta)$)
  #nm([(2) $cos(alpha plus.minus beta) = cos alpha cos beta minus.plus sin alpha sin beta$；], $C_(alpha plus.minus beta)$)
  #nm([(3) $tan(alpha plus.minus beta) = display((tan alpha plus.minus tan beta)/(1 minus.plus tan alpha tan beta))$；], $T_(alpha plus.minus beta)$)
  #nm([(4) $sin 2 alpha = 2 sin alpha cos alpha$；], $S_(2 alpha)$)
  #nm([(5) $cos 2 alpha = cos^2 alpha - sin^2 alpha = 1 - 2 sin^2 alpha = 2 cos^2 alpha - 1$；], $C_(2 alpha)$)
  #nm([(6) $tan 2 alpha = display((2 tan alpha)/(1 - tan^2 alpha))$；], $T_(2 alpha)$)
  #nm([(7) $sin alpha/2 = plus.minus sqrt(display((1 - cos alpha)/2))$；], $S_(alpha/2)$)
  // p.173
  #nm([(8) $cos alpha/2 = plus.minus sqrt(display((1 + cos alpha)/2))$；], $C_(alpha/2)$)
  #nm([(9) $tan alpha/2 = plus.minus sqrt(display((1 - cos alpha)/(1 + cos alpha))) = (1 - cos alpha)/(sin alpha) = (sin alpha)/(1 + cos alpha)$；], $T_(alpha/2)$)
  #nm([(10) $sin alpha cos beta = display(1/2) [sin(alpha + beta) + sin(alpha - beta)]$；], $S C$)
  #nm([(11) $cos alpha sin beta = display(1/2) [sin(alpha + beta) - sin(alpha - beta)]$；], $C S$)
  #nm([(12) $cos alpha cos beta = display(1/2) [cos(alpha + beta) + cos(alpha - beta)]$；], $C C$)
  #nm([(13) $sin alpha sin beta = -display(1/2) [cos(alpha + beta) - cos(alpha - beta)]$；], $S S$)
  #nm([(14) $sin alpha + sin beta = 2 sin (alpha + beta)/2 cos (alpha - beta)/2$；], $S + S$)
  #nm([(15) $sin alpha - sin beta = 2 cos (alpha + beta)/2 sin (alpha - beta)/2$；], $S - S$)
  #nm([(16) $cos alpha + cos beta = 2 cos (alpha + beta)/2 cos (alpha - beta)/2$；], $C + C$)
  #nm([(17) $cos alpha - cos beta = -2 sin (alpha + beta)/2 sin (alpha - beta)/2$。], $C - C$)

  *2. 各个公式间的关系*

  #fig("4·3", fig-c4-4-3())[]

  // p.174
  *3. $bold(a sin x + b cos x)$ 的变形*　在 $a sin x + b cos x$ 中，令 $display(b/a) = tan phi$，就得到

  $ a sin x + b cos x = (a sin(x + phi))/(cos phi). $
]

#review(title: [复习题四])[
  #set enum(numbering: n => if n in (8, 9, 10, 12, 14, 16, 17) [\*#n.] else [#n.])
  1. 已知 $cos theta = 5/11$，$270° < theta < 360°$，求 $tan display(theta/2)$ 和 $tan 2 theta$。
  2. 已知 $tan alpha = m/n$，求 $m cos 2 alpha + n sin 2 alpha$。
  3. 已知 $tan alpha = 1/7$，$tan beta = 1/2$，求 $tan(beta - 2 alpha)$。
  4. 设 $alpha, beta, gamma$ 都是锐角，它们的正切依次为 $1/2, 1/5, 1/8$；求证
    $ alpha + beta + gamma = 45°. $
  5. 不用查表，求下列各式的值：

    (1) $sin 20° + sin 40° - sin 80°$；

    (2) $cos 20° + cos 60° + cos 100° + cos 140°$；

    (3) $cos 40° cos 80° cos 160°$。
  6. 设 $sin alpha + sin beta = a$，$cos alpha + cos beta = b$，求 $tan display((alpha - beta)/2)$。
  7. 在直角三角形 $A B C$ 中，$∠B = 90°$，$C D$ 是 $∠C$ 的平分线，已知 $A D = b$，$D B = a$，求 $B C$ 的长。
  8. 求证 $display(1/(2 sin 10°) - sqrt(3)/(2 cos 10°) = 2)$。

    ［提示：左边 $= display((sin 30°)/(sin 10°) - (cos 30°)/(cos 10°))$。］
  9. 已知 $tan alpha$ 和 $tan beta$ 是方程 $x^2 + 6x + 7 = 0$ 的两个根，求证
    $ sin(alpha + beta) = cos(alpha + beta). $
  10. 已知 $tan alpha$ 和 $tan beta$ 是方程 $x^2 + p x + q = 0$ 的两个根，求下式的值：
    $ sin^2 (alpha + beta) + p sin(alpha + beta) cos(alpha + beta) + q cos^2 (alpha + beta). $
  11. 在一个圆的圆心的同旁作平行的两弦，这二条弦所对的圆心角为 $72°$ 与 $144°$。求证这二弦间的距离等于半径的二分之一。
  12. 求证 $tan 6° tan 42° tan 66° tan 78° = 1$。
  // p.175
  13. 求证
    $ 1/(sin(alpha - beta) sin(alpha - gamma)) + 1/(sin(beta - gamma) sin(beta - alpha)) $
    $ + 1/(sin(gamma - alpha) sin(gamma - beta)) = 1/(2 cos (alpha - beta)/2 cos (beta - gamma)/2 cos (gamma - alpha)/2). $
  14. 求证 $cos 47° - cos 61° - cos 11° + cos 25° = sin 7°$。
  15. 设 $A + B + C = pi$，求证
    $ cot A cot B + cot B cot C + cot C cot A = 1. $
  16. 设 $alpha + beta + gamma + delta = 2pi$，求证
    $ cos alpha + cos beta + cos gamma + cos delta + 4 cos (alpha + beta)/2 cos (alpha + gamma)/2 cos (alpha + delta)/2 = 0. $
  17. 设 $alpha + beta + gamma = 0$，求证
    $ 2(sin alpha + sin beta + sin gamma)(1 + cos alpha + cos beta + cos gamma) $
    $ = sin 2 alpha + sin 2 beta + sin 2 gamma. $
  18. 设 $A + B + C = pi$，求证
    $ sin 4A + sin 4B + sin 4C = -4 sin 2A dot sin 2B dot sin 2C. $
  19. 设 $A + B + C = pi$，且 $2 sin B sin C = 2 cos^2 A/2$，求证 $∠B = ∠C$。
  20. 设 $alpha + beta + gamma = pi$，且 $sin alpha = cos beta cos gamma$，求证 $tan beta + tan gamma = 1$。
]
