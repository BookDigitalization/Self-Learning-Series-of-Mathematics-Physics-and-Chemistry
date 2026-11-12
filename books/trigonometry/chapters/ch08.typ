// 第八章 三角方程（原书 p.273–303：§8·1–§8·7、本章提要、复习题八）
#import "/common/series.typ": *
#import "/books/trigonometry/figures/c8-figs.typ": *

// p.273
= 三角方程

== 最简三角方程

我们知道，含有未知数的等式叫作方程。如果方程中含有未知数的三角函数，那么就叫作*三角方程*。例如

$ 2 sin x - 1 = 0 fen $
$ sin x + cos x = 1 fen $

等等，都是三角方程。像方程

$ sin x + x - 1 = 0 dou $

未知数不仅出现在三角函数记号的后面，而且还有不在三角函数记号后面的，这样的方程也是三角方程。

求出满足三角方程的未知数的一切值，叫作*解三角方程*。这些值叫作三角方程的解。某些三角方程可能没有解，就是，未知数的任何值都不满足求解的方程。遇到这样的情形，解方程的结果只要指出它没有解就可以了。

解三角方程的问题，在前面几章中早已遇到过。不过以前我们不说解方程，而说“求满足等式的角”，或者“求符合下列条件的角”。其实这和解方程是同一回事。在这一章中，我们要把解三角方程的知识有系统地介绍一下。

三角方程的形式是多种多样的。它不像代数中的一元一次方程或者一元二次方程那样，有固定的解法。实际上，只有某些特殊类型的三角方程才能够用初等数学的方法求出它们的解。

// p.274
用初等方法解特殊类型的三角方程时，归根结底，要把所给的方程化成一个或者几个像 $sin x = a$，$cos x = a$，$tan x = a$，$cot x = a$ 等形式的方程。这样的方程叫作*最简三角方程*。

解最简三角方程，就是 §2·9 中所讲的“已知一个三角函数的值，求角”的问题。虽然这个问题以前已经解决了，但是利用反三角函数，可以更方便地写出结果。现在我们分别说明如下：

*1.* $bold(sin x = a)$

#ex([例 1.])[解方程 #h(0.5em) $sin x = 3/4$。]

#sol[因为已知的正弦的值是正的，所以在 0 与 $pi/2$ 之间有未知数 $x$ 的一个值满足所给的方程。这个值可以用反正弦来表示，写作

$ x_1 = arcsin 3/4 ju $

根据诱导公式 $sin(pi - alpha) = sin alpha$，可以知道，满足 $sin x = 3/4$ 的未知数的另一个值是

$ x_2 = pi - arcsin 3/4 ju $

因为正弦函数的最小正周期是 $2 pi$，所以对于 $x_1$ 和 $x_2$ 加上或者减去 $2 pi$ 的整数倍，所得的角的正弦都等于 $3/4$。

由此可知，满足所给方程的未知数的一切值是#footnote[以下 $n$ 都表示整数。]：

$ x = 2 n pi + arcsin 3/4 fen $
// p.275
$ x &= 2 n pi + pi - arcsin 3/4 \
  &= (2 n + 1) pi - arcsin 3/4 ju $
]

#ex([例 2.])[解方程 #h(0.5em) $sin x = -2/3$。]

#sol[因为已知的正弦的值是负的，所以在 $-pi/2$ 与 0 之间有所给方程的一个解。这个解可以写作

$ x_1 = arcsin(-2/3) ju $

又因为诱导公式 $sin(pi - alpha) = sin alpha$ 对于 $alpha$ 的任何值都成立，所以方程的另一个解是

$ x_2 = pi - arcsin(-2/3) ju $

因此，所给方程的一切解是

$ x = 2 n pi + arcsin(-2/3) fen $
$ x &= 2 n pi + pi - arcsin(-2/3) \
  &= (2 n + 1) pi - arcsin(-2/3) ju $
]

从上面的例题，可以看到，当 $|a| <= 1$ 时，方程 $sin x = a$ 的一个解总可以写作

$ x_1 = arcsin a dou $

而另一个解写作

$ x_2 = pi - arcsin a ju $

因此，方程 $sin x = a$ 的一切解是

#eqno([(1)], $bold(x = 2 n pi + arcsin a) fen$)
#eqno([(2)], $bold(x = (2 n + 1) pi - arcsin a) ju$)

// p.276
由于正弦的绝对值不能超过 1，所以当 $|a| > 1$ 时，方程 $sin x = a$ 没有解。

利用公式 (1) 和 (2)，我们可以直接写出方程 $sin x = a$ 的解。

*2.* $bold(cos x = a)$

#ex([例 3.])[解方程 #h(0.5em) $cos x = -0.3$。]

#sol[已知的余弦的值是负的。方程有一个解在 $pi/2$ 与 $pi$ 之间。这个解可以写作

$ x_1 = arccos(-0.3) ju $

因为 $cos(-alpha) = cos alpha$，所以方程有另一个解

$ x_2 = -arccos(-0.3) ju $

根据余弦函数的最小正周期是 $2 pi$，可以知道方程的一切解是

$ x = 2 n pi + arccos(-0.3) fen $
$ x = 2 n pi - arccos(-0.3) ju $
]

一般地说，当 $|a| <= 1$，方程 $cos x = a$ 的一个解总可以写成

$ x_1 = arccos a dou $

并且

$ x_2 = -arccos a $

也是方程的一个解。因此，方程 $cos x = a$ 的一切解是

$ bold(x = 2 n pi plus.minus arccos a) ju $

当 $|a| > 1$ 时，方程 $cos x = a$ 没有解。

*3.* $bold(tan x = a)$#h(1em)不论 $a$ 是正数、负数或者零，$tan x = a$ 的一个解可以写作

$ x_1 = arctan a ju $

因为正切函数的最小正周期是 $pi$，所以对于 $x_1$ 加上或者/* p.277 */减去 $pi$ 的整数倍所得的角的正切都等于 $a$。因此，方程的一切解是

$ bold(x = n pi + arctan a) ju $

#ex([例 4.])[解方程 #h(0.5em) $tan x = sqrt(3)$。]

#sol[因为 $arctan sqrt(3) = pi/3$，所以方程的解是

$ x = n pi + arctan sqrt(3) = n pi + pi/3 ju $
]

*4.* $bold(cot x = a)$#h(1em)这个方程的一个解是

$ x_1 = arccot a ju $

因为余切函数的最小正周期是 $pi$，所以方程的一切解是

$ bold(x = n pi + arccot a) ju $

#ex([例 5.])[解方程 #h(0.5em) $cot x = -1$。]

#sol[因为 $arccot(-1) = (3 pi)/4$，所以方程的解是

$ x = n pi + arccot(-1) = n pi + (3 pi)/4 ju $
]

#exercise("8·1")[
  1. $a$ 在怎样的范围内，方程 $sin x = (a + 1)/2$ 有解？
  2. $a$ 在怎样的范围内，方程 $cos x = (a^2 + 1)/2$ 没有解？
  3. $a$ 在怎样的范围内，方程 $tan x = a^2/(a + 1)$ 没有解？
  4. $a$ 在怎样的范围内，方程 $(a - 1) cot x = 3$ 有解？
  5. 已知 $a b != 0$，方程 $sin x = (a^2 + b^2)/(2 a b)$ 当 $a = b$ 和 $a != b$ 时解的情形怎样？
  6. 解方程 #h(0.5em) $sin x = sqrt(3)/2$。
  /* p.278 */
  7. 解方程 #h(0.5em) $cos x = 0.7342$。
  8. 解方程 #h(0.5em) $sin x = sin (5 pi)/4$。
  9. 解方程 #h(0.5em) $tan x = -sqrt(3)/3$。
  10. 解方程 #h(0.5em) $cot x = sqrt(3)$。
]

== 只含同角的同名三角函数的三角方程

如果三角方程中只含同一个角的同名三角函数，那么可以先应用最简三角方程的解法求出这个角，然后再求未知数的值。现在举例说明如下：

#ex([例 1.])[解方程 #h(0.5em) $sin 3 x = 1/2$。]

#sol[我们先把 $3 x$ 看作一个未知量，求得它的一切解是

$ 3 x = 2 n pi + arcsin 1/2 = 2 n pi + pi/6 fen $
$ 3 x &= (2 n + 1) pi - arcsin 1/2 = 2 n pi + pi - pi/6 \
  &= 2 n pi + (5 pi)/6 ju $

$therefore$ 方程的解是

$ x = (2 n pi)/3 + pi/18 fen quad x = (2 n pi)/3 + (5 pi)/18 ju $

为了要知道 $x$ 的值是否满足原来的方程，我们可以这样来进行验算：

当 $n = 0$ 时，$x = pi/18$ 或 $(5 pi)/18$（就是 $10°$ 或 $50°$）。

// p.279
令 $x = pi/18$，我们得

$ sin 3 x = sin(3 dot pi/18) = sin pi/6 = 1/2 ju $

令 $x = (5 pi)/18$，我们得

$ sin 3 x = sin(3 dot (5 pi)/18) = sin (5 pi)/6 = 1/2 ju $

所以 $pi/18$ 和 $(5 pi)/18$ 都满足原方程。
]

从方程的解可以看出，未知数的其他的值都和 $pi/18$ 或者 $(5 pi)/18$ 相差 $(2 pi)/3$ 的整数倍。由于 $sin 3 x$ 的最小正周期是 $(2 pi)/3$（见 §3·5），所以可以知道 $(2 n pi)/3 + pi/18$ 和 $(2 n pi)/3 + (5 pi)/18$ 的正弦都等于 $1/2$，因而它们都是所给方程的解。

#ex([例 2.])[解方程 #h(0.5em) $cos x/2 = -sqrt(2)/2$。]

#sol[$ x/2 = 2 n pi plus.minus arccos(-sqrt(2)/2) = 2 n pi plus.minus (3 pi)/4 ju $
$ therefore quad x = 4 n pi plus.minus (3 pi)/2 ju $

验算：当 $n = 0$ 时，$x = plus.minus (3 pi)/2$。把 $(3 pi)/2$ 和 $-(3 pi)/2$ 代入原方程都满足。因为 $cos pi/2$/* 原书如此，疑为 cos x/2 之误，未登记 REVISIONS，待负责人定 */ 的最小正周期是 $4 pi$，所以 $4 n pi plus.minus (3 pi)/2$ 都是原方程的解。
]

#ex([例 3.])[解方程 #h(0.5em) $tan(x + 30°) = sqrt(3)$。]

#sol[$ x + 30° = n dot 180° + arctan sqrt(3) = n dot 180° + 60° ju $
$ therefore quad x = n dot 180° + 30° ju $

请读者自己验算。
]

// p.280
#ex([例 4.])[解方程 #h(0.5em) $tan(2 x - pi/12) = -1$。]

#sol[$ 2 x - pi/12 &= n pi + arctan(-1) \
  &= n pi + (-pi/4) = n pi - pi/4 ju $
$ therefore quad 2 x &= n pi - pi/6 dou \
  x &= (n pi)/2 - pi/12 ju $
]

#ex([例 5.])[解方程 #h(0.5em) $tan^2 2 x - 1 = 0$。]

#sol[$ tan^2 2 x - 1 = 0 dou \
  tan^2 2 x = 1 dou \
  therefore quad tan 2 x = plus.minus 1 ju $

由 $tan 2 x = 1$，得

$ 2 x = n pi + arctan 1 = n pi + pi/4 dou $
$ therefore quad x = (n pi)/2 + pi/8 ju $

由 $tan 2 x = -1$，得

$ 2 x = n pi + arctan(-1) = n pi - pi/4 dou $
$ therefore quad x = (n pi)/2 - pi/8 ju $

所以方程的解是

$ x = (n pi)/2 + pi/8 fen quad x = (n pi)/2 - pi/8 ju $
]

#ex([例 6.])[解方程 #h(0.5em) $2 sin^2 x - 5 sin x - 3 = 0$。]

#sol[我们先把 $sin x$ 看成一个未知量，用代数方法解这个方程，得

// p.281
$ sin x = 3 dou quad sin x = -1/2 ju $

因为 $sin x$ 的值不能大于 1，所以 $sin x = 3$ 没有解。

由 $sin x = -1/2$，得

$ x = 2 n pi + arcsin(-1/2) = 2 n pi - pi/6 fen $
$ x = (2 n + 1) pi - arcsin(-1/2) = 2 n pi + (7 pi)/6 ju $
]

#ex([例 7.])[解方程 #h(0.5em) $(cos x - sqrt(5))/(cos x) = (cos x - 10)/(cos x + sqrt(5))$。]

#sol[两边都乘以 $cos x (cos x + sqrt(5))$，得

$ cos^2 x - 5 = cos^2 x - 10 cos x dou $

就是

$ cos x = 1/2 ju $

所以

$ x = 2 n pi plus.minus pi/3 ju $

因为求得的 $x$ 的值不使原方程的分母失去意义或者变成零，所以是原方程的解。
]

#exercise("8·2")[
  解下列各方程（1～9）：

  #cols[1\. $cos 4 x = 1$。][2\. $sin(5 x - pi/3) = -1/2$。]
  #cols[3\. $2 cos(x/2 + 60°) = -sqrt(2)$。][4\. $tan^2(2 x + pi/4) = 3$。]
  #cols[5\. $sin^2 x + sin x - 6 = 0$。][6\. $2 cos^2 2 x + 3 cos 2 x = 2$。]
  #cols[7\. $(tan^2 2 x)/(2 + tan^2 2 x) = 1/3$。][8\. $(1 - sin 3 x)/(1 + sin 3 x) = 1$。]
  #cols[9\. $(2 tan x)/(1 + tan^2 x) = 0$。][]
  /* p.282 */
  10\. 下列各方程能否有解？为什么？

  #cols[(1) $sin^2(2 x - pi/3) = 2$；][(2) $cos^2((2 pi)/3 - x) = a^2 + 1/a^2 thin (a != 0)$。]
]

== 可化成含同角的同名三角函数的三角方程

如果一个三角方程经过变形，可以化成只含同一个角的同一个三角函数的方程，那么就可以用 §8·2 的方法来解。现在举例说明如下：

#ex([例 1.])[解方程 #h(0.5em) $sin^2 x - cos^2 x = cos x$。]

#sol[这个方程含有未知数的正弦和余弦。但是，利用三角函数间的关系 $sin^2 x + cos^2 x = 1$，可以化成只含有未知数的余弦的三角方程。

$ (1 - cos^2 x) - cos^2 x = cos x dou $

就是

$ 2 cos^2 x + cos x - 1 = 0 ju $
$ therefore quad cos x = -1 dou quad cos x = 1/2 ju $

由 $cos x = -1$，得 $x = 2 n pi + pi = (2 n + 1) pi$；

由 $cos x = 1/2$，得 $x = 2 n pi plus.minus pi/3$。

所以原方程的解是

$ x = (2 n + 1) pi fen quad x = 2 n pi plus.minus pi/3 ju $
]

#ex([例 2.])[解方程 #h(0.5em) $3 cos x/2 + cos x = 1$。]

#sol[由二倍角公式，得 $cos x = 2 cos^2 x/2 - 1$。

因此，原方程可以写成

// p.283
$ 3 cos x/2 + 2 cos^2 x/2 - 1 = 1 dou $

就是

$ 2 cos^2 x/2 + 3 cos x/2 - 2 = 0 ju $
$ therefore quad cos x/2 = -2 dou quad cos x/2 = 1/2 ju $

$cos x/2 = -2$ 没有解。

由 $cos x/2 = 1/2$，得

$ x/2 = 2 n pi plus.minus pi/3 ju $
$ therefore quad x = 4 n pi plus.minus (2 pi)/3 ju $
]

#ex([例 3.])[解方程

$ sin(3 x - pi/3) cos(3 x + pi/6) + cos(3 x - pi/3) sin(3 x + pi/6) = 1 ju $
]

#sol[这个方程虽然含有不同角的不同的三角函数，但是左边可以化成两个角的和的正弦。换句话说，这个方程可以写成

$ sin[(3 x - pi/3) + (3 x + pi/6)] = 1 dou $

就是

$ sin(6 x - pi/6) = 1 ju $

因此，

$ 6 x - pi/6 = 2 n pi + pi/2 dou $

移项，得

$ 6 x = 2 n pi + (2 pi)/3 ju $

所以

$ x = (n pi)/3 + pi/9 ju $
]

#ex([例 4.])[解方程 #h(0.5em) $(cos 2 x)/(1 - sin 2 x) = 0$。]

// p.284
#sol[把方程的两边都乘以 $1 - sin 2 x$，得

$ cos 2 x = 0 ju $

由 $cos 2 x = 0$，得 $2 x = 2 n pi plus.minus pi/2$，$x = n pi plus.minus pi/4$。

因为 $x = n pi + pi/4$ 使原方程的分母等于零，所以它不是原方程的解。原方程的解是 $x = n pi - pi/4$。
]

#ex([例 5.])[解方程 #h(0.5em) $(sin 3 x)/(sin 2 x) = (cos 3 x)/(cos 2 x)$。]

#sol[把方程的两边都乘以最简公分母 $sin 2 x cos 2 x$，得

#eqno([(1)], $sin 3 x cos 2 x = cos 3 x sin 2 x ju$)

移项，得

$ sin 3 x cos 2 x - cos 3 x sin 2 x = 0 dou $

就是

$ sin(3 x - 2 x) = 0 dou \
  sin x = 0 ju $

所以

$ x = n pi ju $

但当 $x = n pi$ 时，$sin 2 x = sin 2 n pi = 0$，原方程的一个分母等于零，所以 $x = n pi$ 不是原方程的解。

原方程没有解。
]

#exercise("8·3")[
  解下列各方程：

  #cols[1\. $cos^2 x + 3 sin x = 3$。][2\. $sin^4 x - cos^4 x = 1/2$。]
  #cols[3\. $cot^2(pi/2 + x) + sec^2 x - 3 = 0$。][4\. $2 sin^2 x/2 = cos((3 pi)/2 + x/2)$。]
  #cols[5\. $2 cos x + 3 = 4 cos x/2$。][6\. $sin^2 x + cos x = -1$。]

  7\. $cos 2 x = cos x$。

  8\. $2 cot^2 x + 2 csc^2 x - 7 cot x + 1 = 0$。
  /* p.285 */
  #cols[9\. $sin(x + pi/4) cos(pi/4 - x) = 1$。][10\. $2 sin^2 x - sin^2 2 x = 0$。]
  #cols[11\. $(cos^2 x/2)/(cos x) = 1$。][12\. $(sin 4 x)/(cos x) = (cos 4 x)/(sin x)$。]
  #cols[13\. $(sin x/2)/(1 + cos x) = 0$。][14\. $tan x = tan 2 x$。]
]

== 可化成一边为零而另一边是若干个因式的积的三角方程

在代数中，我们知道，如果一个方程的一边是零，而另一边是若干个因式的积，我们可以令每一个因式等于零，然后解这些方程。用同样的方法，我们可以解一边是零而另一边是若干个因式的积的三角方程。举例说明如下：

#ex([例 1.])[解方程 #h(0.5em) $sin x cos x + 1 = sin x + cos x$。]

#sol[移项，得

$ sin x cos x - cos x - sin x + 1 = 0 dou $

就是

$ cos x (sin x - 1) - (sin x - 1) = 0 dou \
  (sin x - 1)(cos x - 1) = 0 ju $

这样，我们得到了右边为零，而左边为两个因式的积的方程。

由 $sin x - 1 = 0$，得 $sin x = 1$，$x = 2 n pi + pi/2$。

由 $cos x - 1 = 0$，得 $cos x = 1$，$x = 2 n pi$。

因此，原方程的解是

$ x = 2 n pi + pi/2 fen quad x = 2 n pi ju $
]

// p.286
#ex([例 2.])[解方程 #h(0.5em) $sin 4 x + sin x = 0$。]

#sol[应用把三角函数的和化为积的公式，得

$ 2 sin (5 x)/2 cos (3 x)/2 = 0 ju $

由 $sin (5 x)/2 = 0$，得 $(5 x)/2 = n pi$，$x = (2 n pi)/5$。

由 $cos (3 x)/2 = 0$，得 $(3 x)/2 = n pi + pi/2$，

$ x = (2 n pi)/3 + pi/3 = (2 n + 1) pi/3 ju $

原方程的解是

$ x = (2 n pi)/5 fen quad x = (2 n + 1) pi/3 ju $
]

#ex([例 3.])[解方程 #h(0.5em) $sin 3 x + cos 2 x = 0$。]

#sol[因为 $cos 2 x = sin(pi/2 - 2 x)$，所以原方程可以写成

$ sin 3 x + sin(pi/2 - 2 x) = 0 ju $

把左边的三角函数的和化为积，得

$ 2 sin 1/2 [3 x + (pi/2 - 2 x)] cos 1/2 [3 x - (pi/2 - 2 x)] = 0 dou $

就是

$ 2 sin(x/2 + pi/4) cos((5 x)/2 - pi/4) = 0 ju $

由 $sin(x/2 + pi/4) = 0$，得 $x/2 + pi/4 = n pi$，$x/2 = n pi - pi/4$，$x = 2 n pi - pi/2$。

由 $cos((5 x)/2 - pi/4) = 0$，得 $(5 x)/2 - pi/4 = n pi + pi/2$，$(5 x)/2 = n pi + (3 pi)/4$，$x = (2 n pi)/5 + (3 pi)/10$。

// p.287
原方程的解是

$ x = 2 n pi - pi/2 fen quad x = (2 n pi)/5 + (3 pi)/10 ju $
]

#ex([例 4.])[解方程 #h(0.5em) $sin x + sin 2 x + sin 3 x = 0$。]

#sol[把这个方程写成

$ (sin x + sin 3 x) + sin 2 x = 0 ju $

再把括号中的三角函数的和化为积，得

$ 2 sin 2 x cos x + sin 2 x = 0 ju $
$ therefore quad sin 2 x (2 cos x + 1) = 0 ju $

由 $sin 2 x = 0$，得 $2 x = n pi$，$x = (n pi)/2$。

由 $2 cos x + 1 = 0$，得 $cos x = -1/2$，$x = 2 n pi plus.minus (2 pi)/3$。

因此，原方程的解是

$ x = (n pi)/2 fen quad x = 2 n pi plus.minus (2 pi)/3 ju $
]

#ex([例 5.])[解方程 #h(0.5em) $tan x + tan 2 x + tan 3 x = 0$。]

#sol[我们可以用正弦与余弦的比代替正切，把原方程化成分母含有未知数的三角方程

$ (sin x)/(cos x) + (sin 2 x)/(cos 2 x) + (sin 3 x)/(cos 3 x) = 0 ju $

把第一个和第二个分式通分后相加，得

$ (sin x cos 2 x + cos x sin 2 x)/(cos x cos 2 x) + (sin 3 x)/(cos 3 x) = 0 dou $

就是

$ (sin 3 x)/(cos x cos 2 x) + (sin 3 x)/(cos 3 x) = 0 ju $

两边都乘以最简公分母，得

$ sin 3 x cos 3 x + sin 3 x cos x cos 2 x = 0 dou $

就是

$ sin 3 x (cos 3 x + cos x cos 2 x) = 0 ju $

// p.288
这个方程可以分成下面的两个方程来解：

$ sin 3 x = 0 dou quad cos 3 x + cos x cos 2 x = 0 ju $

如果 $sin 3 x = 0$，那么

$ 3 x = n pi dou \
  x = (n pi)/3 ju $

因为所得的 $x$ 的值不使原方程的分母等于零，所以它是原方程的解。

如果 $cos 3 x + cos x cos 2 x = 0$，那么

$ 4 cos^3 x - 3 cos x + cos x (2 cos^2 x - 1) = 0 dou $

就是

$ 6 cos^3 x - 4 cos x = 0 dou \
  2 cos x (3 cos^2 x - 2) = 0 ju $

$cos x = 0$ 的解不是原方程的解，因为它使原方程的分母等于零。

由 $3 cos^2 x - 2 = 0$，得

$ cos^2 x = 2/3 dou $
$ cos x = plus.minus sqrt(2/3) ju $
$ x = 2 n pi plus.minus arccos sqrt(2/3) fen $
$ x = 2 n pi plus.minus arccos(-sqrt(2/3)) ju $

因为 $x$ 的这些值不使原方程的分母等于零，所以它们都是原方程的解。

因此，原方程的解是

$ x = (n pi)/3 fen quad x = 2 n pi plus.minus arccos sqrt(2/3) dou $
// p.289
$ x = 2 n pi plus.minus arccos(-sqrt(2/3)) ju $
]

#exercise("8·4")[
  解下列各方程：

  #cols[1\. $sin^2 x (1 + sin^2 x) = 0$。][2\. $csc x sin x/2 = 0$。]
  #cols[3\. $cos 2 x tan x = 0$。][4\. $sin x tan x sec x = 0$。]
  #cols[5\. $2 cot x sin x + cot x = 0$。][6\. $5 cos^2 x + 3 sin^2 x = 7 cos x$。]
  #cols[7\. $2 sin^2 x + sin^2 2 x = 0$。][8\. $sin 2 x + sin x = 0$。]

  9\. $sin(50° - x) = cos(50° + x)$。

  10\. $1 - sin x cos x + sin x - cos x = 0$。

  #cols[11\. $sin 5 x = sin 4 x$。][12\. $cos x + cos 3 x = cos 5 x + cos 7 x$。]
  #cols[13\. $cos 15 x = sin 5 x$。][14\. $cos x - cos 3 x = sin 2 x$。]

  15\. $(1 + cos 2 x)/(2 cos x) = (sin 2 x)/(1 - cos 2 x)$。

  16\. $(1 + tan x)/(1 - tan x) = 1 + sin 2 x$。

  17\. $1/(cos(x + (2 pi)/3)) + 1/(cos(x - (2 pi)/3)) = 2 cos x$。
]

== 形如 $a sin x + b cos x = c$ 的三角方程的解法

前面三节中所讲的解三角方程的方法，是三种最常用的方法。此外，某些特殊形式的三角方程有特殊的解法。我们来看下面的例题：

#ex([例 1.])[解方程 #h(0.5em) $2 sin x + 7 cos x = 6$。]

#sol[把方程的两边都除以 2，得

#eqno([(1)], $sin x + 7/2 cos x = 3 ju$)

我们用 §4·9 的方法把方程 (1) 变形，使它的左边成为一个角的正/* p.290 */弦的形式。

令 $tan phi = 7/2$。代入方程 (1)，得

$ sin x + tan phi cos x = 3 dou $

就是

$ sin x + (sin phi)/(cos phi) cos x = 3 ju $

两边都乘以 $cos phi$，得

$ sin x cos phi + cos x sin phi = 3 cos phi dou $

就是

#eqno([(2)], $sin(x + phi) = 3 cos phi ju$)

查表，取角 $phi$ 的一个值：

$ phi = arctan 7/2 = 74°3' ju $
$ therefore quad cos phi = cos 74°3' = 0.2748 ju $

代入方程 (2)，得

$ sin(x + 74°3') = 3 times 0.2748 = 0.8244 ju $
$ therefore quad x + 74°3' &= n dot 360° + arcsin 0.8244 \
  &= n dot 360° + 55°32' fen \
  x + 74°3' &= n dot 360° + 180° - arcsin 0.8244 \
  &= n dot 360° + 180° - 55°32' ju $
$ therefore quad x = n dot 360° - 18°31' fen \
  x = n dot 360° + 50°25' ju $
]

#ex([例 2.])[解方程 #h(0.5em) $sin x - 8 cos x = 14$。]

#sol[令 $tan phi = 8$。代入原方程，得

$ sin x - tan phi cos x = 14 dou $

就是

$ sin x - (sin phi)/(cos phi) cos x = 14 ju $
$ therefore quad sin x cos phi - cos x sin phi = 14 cos phi dou $

就是

$ sin(x - phi) = 14 cos phi ju $

查表，得

$ phi = arctan 8 = 82°53' ju $
$ therefore quad cos phi = cos 82°53' = 0.1239 ju $

因此，

$ sin(x - 82°53') = 14 times 0.1239 = 1.735 ju $

但是角的正弦不能大于 1，所以原方程没有解。
]

// p.291
一般地说，解 $a sin x + b cos x = c$ 的步骤是

把方程的两边都除以 $a$，得

$ sin x + b/a cos x = c/a ju $

令 $tan phi = b/a$，代入后，得

$ sin x + tan phi cos x = c/a dou $

就是

$ sin x + (sin phi)/(cos phi) cos x = c/a ju $

因此，

$ sin x cos phi + cos x sin phi = c/a cos phi dou $

就是

$ sin(x + phi) = c/a cos phi ju $
$ therefore quad x + phi = 2 n pi + arcsin(c/a cos phi) fen \
  x + phi = (2 n + 1) pi - arcsin(c/a cos phi) ju $
$ therefore quad x = 2 n pi - phi + arcsin(c/a cos phi) fen \
  x = (2 n + 1) pi - phi - arcsin(c/a cos phi) ju $

注意，解 $a sin x + b cos x = c$，也可以把方程的两边都除以 $b$，而令 $a/b = tan phi$。

#ex([例 3.])[解方程 #h(0.5em) $6 cos x - 8 sin x = 9$。]

#sol[$ 6 cos x - 8 sin x = 9 dou \
  cos x - 4/3 sin x = 3/2 ju $

令 $tan phi = 4/3$，得

$ cos x - tan phi sin x = 3/2 ju $
$ therefore quad cos x cos phi - sin x sin phi = 3/2 cos phi dou $

// p.292
就是

$ cos(x + phi) = 3/2 cos phi ju $

查表，得

$ phi = arctan 4/3 = 53°8' dou $
$ therefore quad cos phi = cos 53°8' = 0.6000 ju $

因此，

$ cos(x + 53°8') = 3/2 times 0.6000 = 0.9000 ju $
$ therefore quad x + 53°8' &= n dot 360° plus.minus arccos 0.9 \
  &= n dot 360° plus.minus 25°50' ju $
$ x &= n dot 360° + 25°50' - 53°8' \
  &= n dot 360° - 27°18' fen \
  x &= n dot 360° - 25°50' - 53°8' \
  &= n dot 360° - 78°58' ju $
]

#exercise("8·5")[
  解下列各方程：

  #cols[1\. $sin x + cos x = 1$。][2\. $sin x + sqrt(3) cos x = 1$。]
  #cols[3\. $sqrt(3) sin theta - cos theta = sqrt(2)$。][4\. $cos theta - sin theta = sqrt(2)$。]
  #cols[5\. $(2 + sqrt(3)) cos theta = 1 - sin theta$。][6\. $cos 2 x = cos x + sin x$。]
  #cols[7\. $5 sin theta + 2 cos theta = 5$。][8\. $sin x - cos x = 1$。]

  9\. 在直角三角形中，如果一条直角边的 3 倍与另一条直角边的 4 倍的和等于斜边的 5 倍，求两个锐角。
]

== $sin x$ 和 $cos x$ 的齐次方程的解法

在代数中，含有两个未知数 $x$ 和 $y$，并且各项的次数都相同的方程，叫作 $x$ 和 $y$ 的齐次方程。例如，

$ a x + b y = 0 dou quad a x^2 + b x y + c y^2 = 0 $

分别是 $x$ 和 $y$ 的一次齐次方程和二次齐次方程。同样，我们把含有 $sin x$ 和 $cos x$，并且对于 $sin x$ 和 $cos x$ 来说，各项的次/* p.293 */数都相同的三角方程叫作 *$bold(sin x)$ 和 $bold(cos x)$ 的齐次方程*。

$sin x$ 和 $cos x$ 的一次齐次方程和二次齐次方程的标准形式分别是

$ a sin x + b cos x = 0 dou \
  a sin^2 x + b sin x cos x + c cos^2 x = 0 ju $

现在我们举例说明它们的解法如下：

#ex([例 1.])[解方程 #h(0.5em) $5 sin x + 2 cos x = 0$。]

#sol[这是 $sin x$ 和 $cos x$ 的一次齐次方程。

我们知道，$cos x != 0$。因为如果 $cos x = 0$，那么 $sin x$ 等于 1 或者 $-1$，$5 sin x + 2 cos x$ 就等于 5 或者 $-5$，不等于零。

因此，我们可以把方程的两边都除以 $cos x$，得出和原方程同解的方程

$ 5 (sin x)/(cos x) + 2 = 0 dou $

就是

$ 5 tan x + 2 = 0 ju $

解这个方程，得

$ tan x = -2/5 dou $
$ x &= n dot 180° + arctan(-2/5) \
  &= n dot 180° - arctan 2/5 dou $

就是

$ x = n dot 180° - 21°48' ju $
]

#ex([例 2.])[解方程 #h(0.5em) $2 sin^2 x + 3 sin x cos x + cos^2 x = 0$。]

#sol[这是 $sin x$ 和 $cos x$ 的二次齐次方程。它的解法和例 1 的解法是相仿的。

把方程的两边都除以 $cos^2 x$，得

$ 2 tan^2 x + 3 tan x + 1 = 0 ju $
// p.294
$ therefore quad tan x = -1 dou quad tan x = -1/2 ju $

由 $tan x = -1$，得

$ x &= n dot 180° + arctan(-1) \
  &= n dot 180° - 45° ju $

由 $tan x = -1/2$，得

$ x &= n dot 180° + arctan(-1/2) \
  &= n dot 180° - 26°34' ju $

所以原方程的解是

$ x = n dot 180° - 45° fen quad x = n dot 180° - 26°34' ju $
]

#ex([例 3.])[解方程 #h(0.5em) $3 sin^2 x - 4 sin x cos x + 5 cos^2 x = 2$。]

#sol[这个方程表面上虽然不是齐次方程，但是利用 $sin^2 x + cos^2 x = 1$ 的关系，可以把它写成

$ 3 sin^2 x - 4 sin x cos x + 5 cos^2 x = 2 (sin^2 x + cos^2 x) dou $

就是

#eqno([(1)], $sin^2 x - 4 sin x cos x + 3 cos^2 x = 0 ju$)

这样，我们就把原方程化成了 $sin x$ 和 $cos x$ 的二次齐次方程。

把方程 (1) 的两边都除以 $cos^2 x$，得

$ tan^2 x - 4 tan x + 3 = 0 ju $
$ therefore quad tan x = 1 dou quad tan x = 3 ju $

由 $tan x = 1$，得

$ x &= n dot 180° + arctan 1 \
  &= n dot 180° + 45° ju $

由 $tan x = 3$，得

$ x &= n dot 180° + arctan 3 \
  &= n dot 180° + 71°34' ju $

// p.295
所以原方程的解是

$ x = n dot 180° + 45° fen quad x = n dot 180° + 71°34' ju $
]

#ex([例 4.])[解方程 #h(0.5em) $8 sin^2 x/2 + 3 sin x - 4 = 0$。]

#sol[我们可以把这个方程写成

$ 8 sin^2 x/2 + 3 dot 2 sin x/2 cos x/2 - 4 (sin^2 x/2 + cos^2 x/2) = 0 dou $

就是

$ 4 sin^2 x/2 + 6 sin x/2 cos x/2 - 4 cos^2 x/2 = 0 dou \
  2 sin^2 x/2 + 3 sin x/2 cos x/2 - 2 cos^2 x/2 = 0 ju $

把最后这个方程的两边都除以 $cos^2 x/2$，得

$ 2 tan^2 x/2 + 3 tan x/2 - 2 = 0 ju $
$ therefore quad tan x/2 = 1/2 dou quad tan x/2 = -2 ju $

由 $tan x/2 = 1/2$，得

$ x/2 &= n dot 180° + arctan 1/2 \
  &= n dot 180° + 26°34' ju $

由 $tan x/2 = -2$，得

$ x/2 &= n dot 180° + arctan(-2) \
  &= n dot 180° - 63°26' ju $

所以原方程的解是

$ x = n dot 360° + 53°8' fen \
  x = n dot 360° - 126°52' ju $
]

// p.296
#exercise("8·6")[
  解下列各方程：

  1\. $sin(x + pi/6) + sin(pi/3 - x) = 0$。

  2\. $sqrt(2)/(sec x) - 1/(csc x) = 0$。

  3\. $2 sin^2 x - 7 sin x cos x + 6 cos^2 x = 0$。

  #cols[4\. $1 + sin^2 x = 3 sin x cos x$。][5\. $sin^2 x + cos x sin x = 1$。]

  6\. $a sin x = b cos^2 x/2$。

  7\. $a sin^2 x + b sin x cos x + c cos^2 x = 0$。

  8\. $14 cos^2 x/2 + 4 cos x + 3 sin x = 0$。

  9\. $cos^2 5 x + 7 sin^2 5 x = 8 cos 5 x sin 5 x$。

  10\. $sec x = 4 sin x + 6 cos x$。
]

== 三角方程的图像解法

前面各节所研究的三角方程的解法通常叫作解析法。除此以外，我们还可以利用图像来解三角方程。

为了使求出的解尽可能地精确，图像最好画在现成的方格纸上#footnote[这种方格纸又叫作计算纸，可以在文具店里买到。]。

现在我们举例说明三角方程的图像解法如下：

#ex([例 1.])[解方程 #h(0.5em) $sin 2 x = sin x$。]

#sol[这个方程的解就是函数 $y = sin 2 x$ 和 $y = sin x$ 的值相同的时候，自变量 $x$ 的值。由此可知，要解这个方程，可以在同一坐标系中画曲线 $y = sin 2 x$ 和 $y = sin x$，求它们的交点的横坐标。

在图 8·1 中，我们看到，两条曲线在从 $-pi$ 到 $pi$ 的区间内有五个交点。它们的横坐标分别是

$ x_1 = 0, quad x_(2,3) approx plus.minus 1.0, quad x_(4,5) = plus.minus pi ju $

// p.297
#fig("8·1", fig-c8-1())[]

在图中还可以看出，这两个函数的公共周期是 $2 pi$。所以在上面这些值加上 $2 pi$ 的任意整数倍，得到的值都是两条曲线的交点的横坐标。因此，原方程的解是

$ x = n pi fen quad x approx 2 n pi plus.minus 1.0 ju $
]

从上面的这个例题中，我们看到，用图像解法只能求得精确度不很高的近似结果，并且手续也比较麻烦。但是，在实际问题中，我们往往遇到不能用初等方法来解的三角方程。在这种情形，图像解法的作用就变得显著了。我们来看下面的例题：

#ex([例 2.])[已知弓形的面积等于圆的面积的 $1/4$，求弓形的弧所对圆心角的弧度数。]

#sol[如图 8·2，设弓形弧 $A B$ 所对的圆心角的弧度数是 $x$。那么

$ "扇形" A O B "的面积" &= x/(2 pi) dot pi R^2 \
  &= 1/2 R^2 x dou $
$ △A O B "的面积" = 1/2 R^2 sin x ju $

// p.298
#fig("8·2", fig-c8-2())[]

因此，

$ "弓形" A C B "的面积" = 1/2 R^2 x - 1/2 R^2 sin x ju $

根据问题的条件，得到方程

$ 1/2 R^2 x - 1/2 R^2 sin x = 1/4 pi R^2 ju $

把方程的两边都乘以 $2/R^2$，得

$ x - sin x = pi/2 dou $

就是

$ sin x = x - pi/2 ju $

这个方程的未知数既有含于三角函数记号后面的，也有不含于三角函数记号后面的。用初等方法不能求得它的解。但是，我们可以作函数

$ y = sin x "和" y = x - pi/2 $

的图像，求得它们的交点的横坐标（图 8·3）：

$ x approx 2.3 ju $

因此，弓形弧所对的圆心角约为 2.3 弧度（$132°$）。
]

#ex([例 3.])[解方程 #h(0.5em) $x - tan x = 0$。]

#sol[$ x - tan x = 0 dou $

所以

$ x = tan x ju $

// p.299
#fig("8·3", fig-c8-3())[]

作函数

$ y = x "和" y = tan x $

的图像（图 8·4）。从图中可以看到原方程的一个根是 $x = 0$。除此以外，原方程还有无穷多个正根和负根。

因为直线 $y = x$ 和曲线 $y = tan x$ 都是对称于原点的，所以我们只要注意原方程的正根就可以了。

第一个正根约等于 4.5；第二个正根约等于 7.7。因为每支曲线向右上方无限伸展，并且愈来愈靠近直线 $x = n pi + pi/2$，所以数值愈大的正根，愈近似于 $n pi + pi/2$。例如，第三个正根近似于 $3 pi + pi/2$，第四个正根近似于 $4 pi + pi/2$，等等。

原方程的解是

$ x = 0, plus.minus 4.5, plus.minus 7.7, "等等" ju $
]

// p.300
#fig("8·4", fig-c8-4())[]

#exercise("8·7")[
  1\. 下列各方程有多少实根？

  #cols[(1) $cos x - x = 0$；][(2) $x^2 - sin x = 0$。]

  利用函数的图像，解下列各方程（2～4）：

  #cols[2\. $sin x + x = 0$。][3\. $cos x - x = pi/2$。]

  /* p.301 */
  4\. $sin 2 x = tan x$。

  5\. 求 $tan x - x = 0.5$ 的最小正根的近似值（精确到 0.01）。
]

#summary[
  *1. 最简三角方程的解*

  #align(center, table(
    columns: 2,
    align: (center + horizon, left + horizon),
    inset: (x: 0.8em, y: 0.6em),
    stroke: (x, y) => (
      left: if x == 1 { 0.6pt } else { 0pt },
      top: if y <= 1 { 0.6pt } else { 0.4pt },
      bottom: 0.6pt,
    ),
    table.header([方#h(2em)程], align(center)[解]),
    [$sin x = a thin (|a| <= 1)$],
    [$x = 2 n pi + arcsin a$ \ $x = (2 n + 1) pi - arcsin a$],
    [$cos x = a thin (|a| <= 1)$],
    [$cases(reverse: #true, x = 2 n pi + arccos a, x = 2 n pi - arccos a) x = 2 n pi plus.minus arccos a$],
    [$tan x = a$],
    [$x = n pi + arctan a$],
    [$cot x = a$],
    [$x = n pi + arccot a$],
  ))

  *2. 一般三角方程的解法*

  (1) 只含同角的同名三角函数的方程：应用最简三角方程的解法。

  (2) 可化成含同角的同名三角函数的方程：先化成含同角的同名三角函数的方程，然后应用最简三角方程的解法。

  (3) 可化成一边为零而另一边为若干个因式的积的三角方程：令各个因式等于零，解所得的方程。

  *3.* $bold(a sin x + b cos x = c)$ *的解法*

  利用辅助角 $phi = arctan b/a$，把左边化成一个角的正弦来解。

  *4.* $bold(sin x)$ *和* $bold(cos x)$ *的齐次方程的解法*

  化成只含有未知数的正切的三角方程来解。

  *5. 三角方程的图像解法*

  在同一坐标系中，作出方程两边的函数的图像。它们交点的横/* p.302 */坐标就是原方程的解。
]

#review(title: [复习题八])[
  1\. 下列各方程可能有解吗？为什么？

  #cols[(1) $sin x + cos x = sqrt(3)$；][(2) $sin x = sec x$；]
  #cols[(3) $sin^2 x + cos^2 x = sqrt(2)$；][(4) $tan x dot cot x = sqrt(2)$。]

  2\. $a$ 在怎样的范围内，下列各方程才可能有解？

  #cols[(1) $sec x = (1 + a^2)/3$；][(2) $sin x cos x = a$；]
  #cols[(3) $sin x + cos x = a$；][(4) $(a + 1) csc x = 2$。]

  解下列各方程（3～13）：

  #cols[3\. $4 cos x - 3 sec x = 2 tan x$。][4\. $tan 2 x dot tan x = 1$。]

  5\. $sin x + sin 2 x + sin 3 x = 1 + cos x + cos 2 x$。

  #cols[6\. $(sin 2 x)/(sin x) = (cos x)/(cos 2 x)$。][7\. $tan x + tan 2 x = tan 3 x$。]

  8\. $sin^2(x + 15°) - sin^2(x - 15°) = 1/4$。

  9\. $sin x + sin 2 x + sin 3 x = 4 cos x/2 cos x dot cos (3 x)/2$。

  \*10\. $cos x (1 + sin 2 x)(sqrt(3) + tan x) = cos pi/12 + cos(2 x - (5 pi)/12)$。

  \*11\. $3 sin(x - pi/3) + 4 sin(x + pi/6) + 5 sin(5 x + pi/6) = 0$。

  12\. $sin 2 x = cos 2 x - cos^2 x + 1$。

  13\. $sin x + cos x = (cos 2 x)/(1 - sin 2 x)$。

  \*14\. 解方程组 #h(0.5em) $cases(sqrt(3) sin 2 x = sin 2 y dou, sqrt(3) sin^2 x + sin^2 y = 1/2 (sqrt(3) - 1) ju)$

  \*15\. $m$ 在怎样的范围内，方程 $sin^2 x + sin 2 x - 2 cos^2 x = m$ 才有解？又令 $m = 1/2$，解这个方程。

  16\. 如果等腰三角形两腰上的高的和等于底边上的高，求这等腰三角形的各角。

  /* p.303 */
  \*17\. 矩形的一条对角线的长是 $10 "cm"$，面积是 $25 sqrt(3) "cm"^2$，求这对角线和各边所夹的角。

  \*18\. 在一个正方形内作一个内接正方形，使它们面积的比为 $3 rt 2$，求内接正方形的边与原正方形的边间所成的角。

  \*19\. 把 $60°$ 的角分为两部分，使一部分的正弦为另一部分的正弦的两倍。求这两部分的度数。

  \*20\. 利用图像求方程 $x^2 sin x = 1$ 的绝对值最小的正根和负根的近似值（精确到 0.01）。

  \*21\. 利用图像求方程 $tan x = 2 x$ 的最小正根（精确到 0.01）。
]
