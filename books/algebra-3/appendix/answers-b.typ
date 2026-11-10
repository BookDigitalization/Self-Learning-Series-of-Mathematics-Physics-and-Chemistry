// 习题答案（续：第 5 章答案起，到书末；原书 p.375 下半–384）。接在 answers.typ 之后，不另起一级标题。
#import "/common/series.typ": *

// 原书按章分组：“习题 x·y”后列出有答案的题号；复习题、总复习题的答案单列。
// 原书只列有答案的题，题号不连续，照录。题号后的“.”不是句末标点，不改；
// 习题 9·2(1) 第 3 题题号后原书漏印点，统一补上。
// 各条末尾的“．”改作“。”，其余分号、逗号一律照原书用全角。
// 本文件是续篇：set/show 规则在被 include 的文件里只管本文件，故这里重复 answers.typ 的设置。

#let q(n) = h(0.8em) + [#n.] + sym.wj + h(0.2em) + sym.wj
// 答案里有不少分式，行距放宽，免得上下行的分式互相压住
#set par(leading: 0.9em)
#show math.equation.where(block: false): set text(top-edge: "bounds", bottom-edge: "bounds")
#let sec(title) = {
  set par(first-line-indent: 0em)
  block(above: 1.4em, below: 0.6em, sticky: true,
    align(center, text(font: fonts.hei, weight: "bold", size: 1.05em)[#title]))
}

// p.375（本页下半起；上半是复习题四的答案，见 answers.typ）
#sec[第五章]

#answers("5·1")[#q(1)$A'(-2, +3)$#sym.wj，$B'(-3, -1)$#sym.wj，$C'(0, 1)$#sym.wj，$D'(-1, 0)$#sym.wj；#q(3)\(1) $approx 1.2$#sym.wj，(2) $approx 2.1$#sym.wj。]

#answers("5·2(1)")[#q(1)\(1) 非，(2) 奇，(3) 偶，(4) 偶，(5) 奇，(6) 非；#q(2)$b = 0$ 时是偶函数；不能是奇函数。]

#answers("5·2(2)")[#q(2)\(1) $-4 <= x <= 4$#sym.wj，(2) $1 <= y <= 5$#sym.wj，(3) 偶函数，(4) 有界函数。]

#answers("5·2(3)")[#q(1)\(3) 减函数；#q(2)\(2) 奇函数，(3) 减函数。]

#answers("5·3")[#q(3)\(1) $(-infinity, 0)$ 和 $(0, +infinity)$#sym.wj，(2) 偶函数，(3) 减函数，(4) 有下界，$y = 0$ 是它的一个下界，但没有上界。]

#answers("5·4")[#q(1)除 (3) 以外都是；#q(2)$y = 6/x$#sym.wj。]

#answers("5·5")[#q(1)\(1) $approx 3.2$#sym.wj，(2) $approx 4.6$#sym.wj；#q(2)\(1) 0，$plus.minus 2.8$#sym.wj，(2) $approx 2.5$#sym.wj；#q(4)\(1) $[0, +infinity)$#sym.wj，(2) 不具有奇偶性，增函数，有下界，$y = 0$ 是它的一个下界，但无上界；#q(5)\(1) $l = sqrt(A) (0 < A < +infinity)$#sym.wj，(2) $l = root(3, V) (0 < V < +infinity)$#sym.wj。]

#answers("5·6")[#q(1)\(1) $(-infinity, 1)$ 和 $(1, +infinity)$#sym.wj，(2) $y = (1 + x)/x$#sym.wj，(3) $(-infinity, 0)$ 和 $(0, +infinity)$#sym.wj；#q(2)\(1) $(-infinity, +infinity)$#sym.wj，(2) $y = root(3, x - 1)$#sym.wj，(3) $(-infinity, +infinity)$#sym.wj。]

#answers("5·7")[#q(1)\(1) $y = plus.minus sqrt(4 - x^2)$#sym.wj，(2) $y = plus.minus sqrt(x^2 - 4)$#sym.wj，(3) $y = plus.minus sqrt(x^2 + 4)$#sym.wj；#q(3)\(1) $y = root(4, x + 1)$#sym.wj，$y = -root(4, x + 1)$#sym.wj，(2) $y = sqrt(1/x)$#sym.wj，$y = -sqrt(1/x)$#sym.wj。]

// p.376
#sec[复习题五]

#q(3)\(1) 一定是偶函数，(2) 一定是偶函数；
#block(breakable: false)[
#q(4)
#{
  set table(fill: none)
  show table.cell: set text(fill: black)
  align(center, block(breakable: false, above: 0.8em, below: 0.8em, table(
    columns: 5, align: center + horizon, stroke: 0.5pt, inset: (x: 8pt, y: 6pt),
    [函　数], [定义域], [奇偶性], [有界性], [增减性],
    [$y = x^4$], [$(-infinity, +infinity)$], [偶], [有下界], [$x < 0$ 时减 \ $x > 0$ 时增],
    [$y = 1/root(3, x)$], [$(-infinity, 0)$ \ $(0, +infinity)$], [奇], [无], [减],
  )))
}
]
#q(5)\(1) $y = root(4, x)$#sym.wj，$y = -root(4, x)$#sym.wj，(2) $y = x^(-3)$#sym.wj；#q(6)\(1) $y = -1 + sqrt(15 + 2x - x^2)$#sym.wj，$-3 <= x <= 5$#sym.wj，$-1 <= y <= 3$#sym.wj；$y = -1 - sqrt(15 + 2x - x^2)$#sym.wj，$-3 <= x <= 5$#sym.wj，$-5 <= y <= -1$#sym.wj；(2) $y = 1 + sqrt(x^2 + 2x - 24)$#sym.wj，$x <= -6$#sym.wj，$x >= 4$#sym.wj，$y >= 1$#sym.wj；$y = 1 - sqrt(x^2 + 2x - 24)$#sym.wj，$x <= -6$#sym.wj，$x >= 4$#sym.wj，$y <= 1$#sym.wj。

#sec[第六章]

#answers("6·1")[#q(1)\(1) $1/4$#sym.wj，(2) $2/27$#sym.wj；#q(2)\(1) $0.1^(1/3) > 0.1^(1/2)$#sym.wj，(2) $3^(1/2) > 5^(1/3)$#sym.wj，
#cols[
(3) $a^(1/2) cases(> a^(1/3) "，如果 " a > 1 "，", = a^(1/3) "，如果 " a = 1 "，", < a^(1/3) "，如果 " 0 < a < 1 "，")$
][
(4) $a^(-1/2) cases(< a^(-1/3) "，如果 " a > 1 "，", = a^(-1/3) "，如果 " a = 1 "，", > a^(-1/3) "，如果 " 0 < a < 1 "；")$#sym.wj
]
#q(3)\(8) $10^(-3 alpha)$#sym.wj，(9) $10^(beta - alpha - 1)$#sym.wj，(10) $10^(beta - alpha/2)$#sym.wj。]

#answers("6·2(1)")[#q(2)不同的地方：$y = 3^x$ 是增函数，$y = (1/3)^x$ 是减函数；#q(3)利用 $y = (1/2)^x = 2^(-x)$#sym.wj；$y = 4^x = 2^(2x)$ 来画。]

#answers("6·2(2)")[#q(2)\(1) $a < 1$#sym.wj，(2) $a > 1$#sym.wj，(3) $a < 1$#sym.wj；#q(3)\(1) $x > y$#sym.wj，(2) $x < y$#sym.wj，(3) $x > y$#sym.wj，(4) $x < y$#sym.wj。]

// p.377 起（习题 6·2(3) 的答案自 p.376 末行起）
#answers("6·2(3)")[#q(1)\(2) $x = 0$ 和 $x = 1$ 时，$y_1 = y_2$#sym.wj；$0 < x < 1$ 时，$y_1 > y_2$#sym.wj；$x < 0$ 和 $x > 1$ 时，$y_1 < y_2$#sym.wj；#q(2)\(1) $x < 1$#sym.wj，$x > 3$#sym.wj，(2) $1 < x < 3$#sym.wj，/* p.377 */(3) 若 $a > 1$，则 $x < 1$#sym.wj，$x > 3$#sym.wj；若 $0 < a < 1$，则 $1 < x < 3$#sym.wj。]

#answers("6·3")[#q(1)\(1) $log_2 16 = 4$#sym.wj，(3) $log_2 4 = 2$#sym.wj，(5) $log_2 1 = 0$#sym.wj；#q(3)\(1) $x = log_10 5$#sym.wj，(3) $x = log_(0.5) 2$#sym.wj；#q(4)\(3) 7，(4) 25；#q(5)\(1) 2，(2) $-3$#sym.wj，(3) $-2$#sym.wj，(4) $-4/3$#sym.wj；#q(6)\(1) $1/8$#sym.wj，(2) $1/100$#sym.wj，(3) 3，(4) 3；#q(7)\(1) 3，(2) 2，(3) 3，(4) 3。]

#answers("6·4")[#q(1)\(2) 0.5，0.7，0.9，1.0，(3) 2.5，3.2，5.1，6.3；#q(3)\(1) $x < 0$#sym.wj，(2) $x < 1$#sym.wj，(3) $x > -1$#sym.wj，(4) 全体实数；#q(5)\(2) 2，3，(3) 2，3，(4) $-3$#sym.wj，$-2$#sym.wj，(5) $-1$#sym.wj，0，(6) 0，1；#q(6)\(1) $m > n$#sym.wj，(2) $m < n$#sym.wj，(3) $m > n$#sym.wj，(4) $m < n$#sym.wj；#q(7)\(1) $-4/3 < x < 0$#sym.wj，$x > 0$#sym.wj，(2) $x = -1$#sym.wj，$x = 4$ 时，$y_1 = y_2$#sym.wj；$-4/3 < x < -1$#sym.wj，$x > 4$ 时，$y_1 > y_2$#sym.wj；$-1 < x < 0$#sym.wj，$0 < x < 4$ 时，$y_1 < y_2$#sym.wj。]

#answers("6·5(1)")[#q(1)\(1) 0.9030，(2) $-0.9030$#sym.wj，(3) 0.1761，(4) $-0.1174$#sym.wj，(5) $-0.5229$#sym.wj，(6) $-0.6990$#sym.wj，(7) 0.2330，(8) 3.3010；#q(2)\(1) $log_n a + log_n b - log_n c$#sym.wj，(2) $log_n 2 + log_n (a - b)$#sym.wj，(3) $log_n (a - b) + log_n (a + b)$#sym.wj，(4) $log_n (a - b) + log_n (a^2 + a b + b^2)$#sym.wj，(5) $3/4 log_n a - 1/4 log_n b$#sym.wj，(6) $1/2 [log_n 5 + log_n (a + b) - log_n 3 - log_n (a - b)]$#sym.wj；#q(3)\(1) $log_10 C = log_10 2 + log_10 pi + log_10 r$#sym.wj，(3) $log_10 V = log_10 4 + log_10 pi + 3 log_10 r - log_10 3$#sym.wj，(5) $log_10 V = log_10 pi + 2 log_10 r + log_10 h$#sym.wj；#q(4)\(2) $log_10 r = 1/2 [log_10 A - log_10 pi]$#sym.wj，(4) $log_10 r = log_10 A - (log_10 2 + log_10 pi + log_10 h)$#sym.wj。]

// 习题 6·5(2) 第 3 题 (2) 分母第二个根号的指数：扫描印得像 8，按题目（(a+b) 的指数 −1/3）应为 3，取 3
#answers("6·5(2)")[#q(2)\(1) $m^5 dot root(3, n^2/p)$#sym.wj，(2) $((a + b) d sqrt(d))/root(4, c^3)$#sym.wj；#q(3)\(1) $(m^5 dot sqrt(m + n) dot root(6, m - n))/sqrt(m n)$#sym.wj，(2) $(root(4, b) dot root(6, a - b))/(root(3, a^2) dot root(3, a + b))$#sym.wj。]

// p.378
// 复习题六第 11 题 (4)：左边外层及内层根指数扫描印得像 8，按算式（2/3 次幂）应为 3，取 3
#sec[复习题六]

// 复习题六第 5 题 (2)(3)：原书印作 0≤a<1 与 1<a<0（应为 0<a<1，疑原书印误，照录）
#q(3)\(3) $a > 1$ 时，$-1/2 < x < 2$#sym.wj；$0 < a < 1$ 时，$x < -1/2$#sym.wj，$x > 2$#sym.wj；#q(4)\(3) $a > 1$ 时，$-1/3 < x < 0$#sym.wj，$0 < x < 1$#sym.wj；$0 < a < 1$ 时，$-1/2 < x < -1/3$#sym.wj，$x > 1$#sym.wj；#q(5)\(1) $a > 1$#sym.wj，(2) $0 <= a < 1$#sym.wj，(3) $1 < a < 0$#sym.wj，(4) $a > 1$#sym.wj；#q(6)\(2) $x > |y|$#sym.wj；#q(9)$log_10 r = 1/2 [log_10 (s - a) + log_10 (s - b) + log_10 (s - c) - log_10 s]$#sym.wj；#q(10)\(1) $log x = log c + 1/3 log a - 2 log b - 1/2 log d$#sym.wj，(3) $log x = 3/2 log a + log b - 1/6 log c$#sym.wj；#q(11)\(1) $(a (a + b)^n)/root(n, a - b)$#sym.wj，(2) $(b (b - c)^m)/root(m, b + c)$#sym.wj，(3) $root(3, a b)/(a + b)$#sym.wj，(4) $display(root(3, ((a root(3, (a + b)))/((a - b)^2 sqrt(b)))^2) = root(3, (a^2 root(3, (a + b)^2))/((a - b)^4 b)))$#sym.wj。

#sec[第七章]

#answers("7·1")[#q(1)\(1) $-5$#sym.wj，(2) 5，(3) $-7$#sym.wj，(4) 7；#q(2)\(1) $overline(3).4771$#sym.wj，(3) $overline(1).4771$#sym.wj，(5) $2.4771$#sym.wj；#q(3)\(1) 24 位，(2) 48 位；#q(4)\(2) $-1.4362$#sym.wj，(4) $-1.5043$#sym.wj，(6) $-4.5011$#sym.wj；#q(5)\(2) $overline(2).1606$#sym.wj，(4) $overline(1).9160$#sym.wj，(6) $overline(4).9749$#sym.wj。]

#answers("7·2")[0.3010；0.8727；0.9286；0.1461；0.2271；0.1316；0.7448；0.8110。]

#answers("7·3(1)")[#q(3)\(1) 2.7353，(3) 1.1784，(5) $overline(2).6567$#sym.wj，(7) 5.2238；#q(4)\(2) 0.2400，(4) 2.4575，(6) 0.4972，(8) 2.1847；#q(5)\(2) 8.3086，(4) $overline(4).6166$#sym.wj。]

#answers("7·3(2)")[#q(1)\(1) 1.5851，(3) 1.8062；#q(2)\(2) 0.5631，(4) 0.1933；#q(3)\(1) 1.8630，(3) 0.3955。]

#answers("7·3(3)")[#q(1)\(2) $overline(2).1381$#sym.wj，(4) $overline(2).4937$#sym.wj，(6) $overline(1).2183$#sym.wj，/* p.379 */(8) 1.7188；#q(2)\(1) $overline(3).7296$#sym.wj，(3) $overline(1).1409$#sym.wj，(5) $overline(1).9309$#sym.wj，(7) $overline(2).7708$#sym.wj。]

#answers("7·3(4)")[#q(1)\(1) $overline(1).1192$#sym.wj，(2) 1.4266，(3) $overline(1).7288$#sym.wj，(4) $overline(3).1810$#sym.wj；#q(2)\(1) 1.4898，(2) 0.6965，(3) $overline(1).5037$#sym.wj，(4) $overline(1).3109$#sym.wj。]

#answers("7·4")[#q(1)\(3) 0.4380，(6) 0.06570，(9) 8.387，(12) 34.82；#q(2)\(1) 0.1465，(2) 0.05828，(3) 0.007103，(4) 0.8448。]

#answers("7·5")[#q(1)\(1) 66.16，(2) 26.46，(3) 30.89，(4) 4.972；#q(2)\(1) 149000，(2) 87.70，(3) 2.242，(4) 186.5；#q(3)\(1) $-62.3$#sym.wj，(2) $-0.0629$#sym.wj；#q(4)\(1) 766.7 平方厘米，(2) 2.671 米，(3) 1.32 立方米，(4) 20.0 平方米，(5) 24.73 平方厘米。]

#answers("7·6")[#q(1)\(1) 1.585，(2) $-1.737$#sym.wj；#q(2)\(1) 0.01254，(2) 0.002138，(3) 0.5533，(4) 0.2079。]

#sec[复习题七]

#q(2)\(1) $x > 10$#sym.wj，(2) $x < -10$#sym.wj，(3) $x < -sqrt(10)$#sym.wj，$x > sqrt(10)$#sym.wj，(4) $0 < x < 1/10$#sym.wj，$x > 10$#sym.wj，(5) $x > 1$#sym.wj，(6) $0 < x < 1$#sym.wj；#q(3)1，2，3，4，5，6，8，9，10，12，15，16，$dots.c$#sym.wj，96，100 共 34 个；#q(4)$lg 1/3 < 0$#sym.wj，从 $lg 1/3 = lg 1/3$ 推出 $2 lg 1/3 > lg 1/3$ 是错的；#q(5)\(1) 8102 立方厘米，678 立方厘米，(2) 3.628 厘米；#q(6)4460 克；#q(7)26.9 公斤；#q(8)404 米。

#sec[第八章]

#answers("8·1(1)")[#q(1)\(2) $-4$#sym.wj，(4) $-1/2$#sym.wj，(6) $-5$#sym.wj；#q(2)\(1) 2，(3) 2，3；#q(3)\(1) 2.4771，(2) 0.7597，(3) 3.322，(4) 2.262；#q(4)\(1) 5，(3) 9。]

#answers("8·1(2)")[#q(1)\(1) 3，(2) 3，(3) 1，(4) $-2$#sym.wj；#q(2)\(1) 2，/* p.380 */(2) 3；#q(3)\(1) 2，1，(2) 0，$1/4$#sym.wj；#q(4)\(1) 0，(2) 1，3。]

#answers("8·2(1)")[#q(1)\(1) 9，(2) 300，(3) $mx(33, 1, 3)$#sym.wj，(4) $sqrt(3)$#sym.wj；#q(2)\(1) $sqrt(2)$#sym.wj，(2) 25；#q(3)\(1) 5，(2) 6，14，(3) $sqrt(2) plus.minus 1$#sym.wj，(4) 100，1000；#q(4)\(1) 7，$-1$#sym.wj，(2) 5，4。]

// 习题 8·2(2) 第 1 题 (2)(4) 的根指数：扫描印得像 8，按题目取 3，见报告
#answers("8·2(2)")[#q(1)\(1) 10，$1/10000$#sym.wj，(2) $1/10$#sym.wj，$root(3, 100)$#sym.wj，(3) 10，$1/1000$#sym.wj，(4) 10，$1/root(3, 100)$#sym.wj；#q(2)\(1) 2，16，(2) $5 root(3, 5)$#sym.wj，$1/25$#sym.wj。]

#answers("8·3")[#q(1)$approx -1.7$#sym.wj，2；#q(2)$approx -0.8$#sym.wj，2，4；#q(3)$approx 2.8$#sym.wj；#q(4)$approx 1.8$#sym.wj。]

#answers("8·4")[#q(1)\(1) 2，1，(2) 10000，10，(3) 100，10，(4) $17/2$#sym.wj，$-7/2$#sym.wj；#q(2)\(1) 2，4，(2) 5，3；#q(3)\(1) 100，10，(2) 13，11。]

#sec[复习题八]

#q(1)\(1) $-1$#sym.wj，$mx(3, 1, 2)$#sym.wj，(2) 同解，(3) 同解；#q(2)\(1) $-mx(1, 1, 2)$#sym.wj，2，(2) 同解，(3) $f(x) > 0$#sym.wj，$phi(x) > 0$ 时才同解；#q(3)\(1) 1，0.2031，(2) 3，(3) 37，(4) 4；#q(4)\(1) 80，(2) 10，$1/1000$#sym.wj，(3) 100，(4) $10^10$#sym.wj；#q(5)\(1) 3，(2) 64，(3) 1，$-1$#sym.wj，(4) 10；#q(6)\(1) 17，9，(2) 10，4；4，10；(3) 1，1；2，4；(4) 16，25；25，16；#q(7)4 年；#q(8)10 年。

#sec[第九章]

#answers("9·1(1)")[#q(1)\(2) 2，4，6，$dots.c$#sym.wj，$2n$#sym.wj，$dots.c$#sym.wj，(4) $1^3$#sym.wj，$2^3$#sym.wj，$3^3$#sym.wj，$dots.c$#sym.wj，$n^3$#sym.wj，$dots.c$#sym.wj；#q(2)\(3) $-1$#sym.wj，$-1$#sym.wj，$-1$#sym.wj，$-1$#sym.wj，$-1$#sym.wj，(4) $1/2$#sym.wj，$-2/3$#sym.wj，$3/4$#sym.wj，$-4/5$#sym.wj，$5/6$#sym.wj；#q(3)\(1) $10n$#sym.wj，50，(2) $(n + 1)/n$#sym.wj，$6/5$#sym.wj，(3) $1/(n(n + 1))$#sym.wj，$1/(5 dot.c 6)$#sym.wj，/* p.381 */(4) $(-1/3)^n$#sym.wj，$-1/243$#sym.wj；#q(4)\(1) 99，9800，(2) $a_10 = 120$#sym.wj，$a_15 = 255$#sym.wj。]

#answers("9·1(3)")[#q(2)\(1) 有穷，递增，有界，(2) 无穷，递增，有界，(3) 无穷，常数，有界，(4) 有穷，摆动，有界，(5) 无穷，摆动，无界；#q(3)\(1) $c_n = 3 - 2/10^n$#sym.wj，(3) 无穷，递增，有界。]

#answers("9·2(1)")[#q(1)\(1) $4n - 1$#sym.wj，(2) $15 - 4n$#sym.wj，(3) $5/3 - 2/3 n$#sym.wj；#q(2)\(1) 67，(2) 11，(3) $-6$#sym.wj，(4) 2；#q(3)\(1) $3/5$#sym.wj，$1/5$#sym.wj，$-1/5$#sym.wj，$-3/5$#sym.wj，(2) $a$#sym.wj，$(a p + b)/(p + 1)$#sym.wj，$(a(p - 1) + 2b)/(p + 1)$#sym.wj；#q(4)\(1) $-12$#sym.wj，(2) 0，(3) 0；#q(5)\(1) 8，(2) $plus.minus 6$#sym.wj，$plus.minus 8$#sym.wj，$plus.minus 10$#sym.wj；$plus.minus 10$#sym.wj，$plus.minus 8$#sym.wj，$plus.minus 6$#sym.wj（四解）。]

#answers("9·2(2)")[#q(1)\(1) 22，584.8，(2) 22，99，(3) 34，$-10 1/6$#sym.wj，(4) 4，1430，(5) 7，28，(6) 0.1，51，(7) $-38$#sym.wj，$-360$#sym.wj，(8) $-45$#sym.wj，45，(9) 4.5，10，(10) 26，$-7$#sym.wj；#q(2)\(1) $n^2 + 2n$#sym.wj，(2) $6n - 3$#sym.wj；#q(3)\(1) $122.5 approx 123$（米），(2) 20.0 秒；#q(4)180 下；#q(5)6 秒；#q(6)4 条；#q(7)\(1) 25，(2) 1；#q(8)\(1) 10，2.5，19，(2) 5，5，6。]

#answers("9·3(1)")[#q(1)\(3) $3 - 2 sqrt(2)$#sym.wj，$(sqrt(2) - 1)^(n - 2)$#sym.wj，(4) $(a - b)^3/(a + b)$#sym.wj，$(a - b)^(n - 1)/(a + b)^(n - 3)$#sym.wj；#q(2)\(1) $1/64$#sym.wj，(3) 2916；#q(3)\(2) $plus.minus 3$#sym.wj，(4) $1/2$#sym.wj；#q(4)\(1) 7；#q(5)\(2) 160，80，40，20，10，5；#q(6)$-16$#sym.wj，$1/2$#sym.wj；1，2；#q(7)$approx 15.47$ 升；#q(8)$approx 25 %$#sym.wj。]

#answers("9·3(2)")[#q(2)\(1) 96，189，(2) 7，$mx(15, 7, 8)$#sym.wj，(3) 4，1，(4) 3，2186；$-3$#sym.wj，1094；(5) 3，18；$-4$#sym.wj，32；(6) $-2$#sym.wj，10，(7) 3584，7161，(8) 27，8，(9) 3，6，(10) 3，$-1$#sym.wj；#q(3)\(1) 1，2，10，(2) 1，3，4；#q(4)192 盏；#q(5)\(1) 2048 平方厘米，(2) 4092 平方厘米。]

#answers("9·4")[#q(1)\(3) 5，(4) $a^2 + b^2$#sym.wj；#q(2)\(3) $plus.minus 2$#sym.wj，(4) $plus.minus |a^2 - b^2|$#sym.wj；/* p.382 */#q(3)3，5，7；#q(4)3 cm，4 cm，5 cm，直角三角形；#q(6)\(1) 2，4，8，(2) 1，3，9；$-1$#sym.wj，3，$-9$#sym.wj，(3) 1，4，16；#q(7)17，10，3 或 8，10，12；#q(8)45，15，5 或 5，15，45；#q(9)12，16，20，25；#q(10)5，12，19，26。]

#answers("9·5")[#q(1)\(1) $1 - 1/2$#sym.wj，$1 - (1/2)^2$#sym.wj，$1 - (1/2)^3$#sym.wj，$dots.c$#sym.wj，$1 - (1/2)^n$#sym.wj，$dots.c$#sym.wj，(2) 这个数列是递增数列，又是有界数列，所以它一定有极限；#q(2)\(1) 1，(2) $-1/3$#sym.wj，(3) $2/9$#sym.wj，(4) $1/2$#sym.wj，(5) $mx(2, 2, 3)$#sym.wj，(6) $mx(4, 1, 2)$#sym.wj，(7) 0，(8) $8/243$#sym.wj；#q(3)\(1) 5，1。]

#answers("9·6")[#q(2)\(1) $mx(5, 1, 3)$#sym.wj，(4) $mx(2, 1, 4)$#sym.wj，(5) $mx(8, 1, 3)$#sym.wj，(6) $3/2 sqrt(6)$#sym.wj，(7) $(5 + 3 sqrt(3))/2$#sym.wj，(8) $1/(1 + x)$#sym.wj，(9) $(a + 1)/(2(a - 1)^2)$#sym.wj；#q(3)\(1) $1/9$#sym.wj，$1/9000$#sym.wj，(2) $4/33$#sym.wj，$1/"8,250,000"$#sym.wj；#q(4)\(1) $2/5$#sym.wj，(2) 9，(3) 1.28，(4) $mx(7, 1, 2)$#sym.wj，(5) 243 或 486，(6) 18 或 54；#q(5)\(1) $4(2 + sqrt(2)) a$#sym.wj，(2) $2a^2$#sym.wj；#q(6)12 米。]

#answers("9·7")[#q(1)\(1) $4/9$#sym.wj，(2) $523/999$#sym.wj，(3) $26/45$#sym.wj，(4) $mx(15, 419, 990)$#sym.wj，(5) $13/90$#sym.wj，(6) $mx(3, 1, 3)$#sym.wj；#q(2)\(1) $13/99$#sym.wj，(2) $5/36$#sym.wj；#q(3)\(1) $0.4 dot(6) dot(5)$#sym.wj，(2) $-0.0 dot(0) dot(1)$#sym.wj，(3) $0.2 dot(3) 7 dot(0)$#sym.wj，(4) 10。]

#sec[复习题九]

#q(2)\(4) 第 7 项，(5) 第 100 项起，(6) 极限是 1；#q(3)2；#q(4)\(1) $-14$#sym.wj，(2) $-32$#sym.wj；#q(5)\(1) 15，(2) $mx(60, 3, 4)$#sym.wj；#q(6)\(1) 1，3，5，(2) 1，2，4；#q(8)$-2$#sym.wj，2，6，18；#q(10)\(3) (i) 385，(ii) 2485；#q(11)\(1) $(a(1 - a^n))/(1 - a) - (n(n + 1))/2$#sym.wj，(2) $(x(1 - x^n))/(1 - x) + (y^n - 1)/((y - 1) y^n)$#sym.wj；#q(12)\(1) $13/24$#sym.wj，(2) $mx(1, 1, 2)$#sym.wj；#q(14)\(1) $1/2$#sym.wj，(2) $1/3$#sym.wj；#q(15)\(1) $6a$#sym.wj，/* p.383 */(2) $sqrt(3)/3 a^2$#sym.wj；#q(16)\(1) $2 pi R^2$#sym.wj，(2) $4R^2$#sym.wj；#q(17)\(2) $n/(n + 1)$#sym.wj，(3) 1。

#sec[总复习题]

#q(4)\(1) $1/2 < x <= 2$#sym.wj，$x >= 3$#sym.wj，(2) $-20 < x < 23$#sym.wj；#q(5)\(1) $-mx(21, 8, 13) < x < -mx(1, 1, 2)$#sym.wj，(2) $-2 < x < 1$#sym.wj，$1 < x < 2$#sym.wj；#q(6)\(2) $k <= -12$#sym.wj，$k >= -4$#sym.wj；#q(7)\(1) $x = m + 5$#sym.wj，$y = -(m + 7)$#sym.wj，(2) $m > -5$#sym.wj，$m < -7$#sym.wj，(3) $m > -6$#sym.wj；#q(8)\(1) $-sqrt(6) < x <= -sqrt(2)$#sym.wj，$sqrt(2) <= x < sqrt(6)$#sym.wj，(2) $-2 < x < 0$#sym.wj，$0 < x < 2$#sym.wj；#q(10)\(2) (i) 全体实数，(ii) $x != plus.minus 1$#sym.wj，(iii) $3 <= x <= 5$#sym.wj，(iv) 全体实数，(v) $x != 3$#sym.wj，(vi) $x < -1/2$#sym.wj，$x > 1/2$#sym.wj；#q(12)\(1) $y = 1 - x^2$#sym.wj，(2) $y = x^2 + 4x + 3$#sym.wj，(3) $y = -x^2 + 10x - 23$#sym.wj，(4) $y = x^2 - 2x$#sym.wj；#q(13)\(1) $x < 1/2$ 或 $x > 2$ 时，$y > 0$#sym.wj；$1/2 < x < 2$ 时，$y < 0$#sym.wj；$x = 1/2$ 或 $x = 2$ 时，$y = 0$#sym.wj；$x = 5/4$ 时，$y_"极小" = -mx(1, 1, 8)$#sym.wj，(2) $(-5 - sqrt(41))/4 < x < (-5 + sqrt(41))/4$ 时，$y > 0$#sym.wj；$x < (-5 - sqrt(41))/4$ 或 $x > (-5 + sqrt(41))/4$ 时，$y < 0$#sym.wj；$x = (-5 plus.minus sqrt(41))/4$ 时，$y = 0$#sym.wj；$x = -5/4$ 时，$y_"极大" = mx(5, 1, 8)$#sym.wj；#q(14)\(2) (i) 奇，(ii) 偶，(iii) 非，(iv) 非，(v) 偶，(vi) 奇；#q(18)\(2) $y = -2 + 2 sqrt(2 + x - x^2)$#sym.wj，$-1 <= x <= 2$#sym.wj，$-2 <= y <= 1$#sym.wj；$y = -2 - 2 sqrt(2 + x - x^2)$#sym.wj，$-1 < x < 2$#sym.wj，$-5 < y < -2$#sym.wj；#q(19)\(1) 对称于直线 $y = x$#sym.wj，(2) (i) $y = (x + 5)/3$#sym.wj，(ii) $y = x^2 + 8x + 16$#sym.wj，(iii) $y = x^3 - 3x^2 + 3x - 1$#sym.wj，(iv) $y = log_2 (x - 1)$#sym.wj；#q(20)\(1) $root(4, b)$#sym.wj，(2) $x - 1/x$#sym.wj，(3) $sqrt(1 + x^2)/(1 + x^2)$#sym.wj；#q(23)\(1) $-1/2 < x < 1$#sym.wj，(2) $-4 < x <= 1/2$#sym.wj，(3) $0 < x < 4$#sym.wj，(4) $x > 2$#sym.wj；#q(24)\(1) $x < 0$#sym.wj，(2) $x > 0$#sym.wj，$y$#sym.wj，$z$ 同号，/* p.384 */(3) $x != 0$#sym.wj，$y != 0$#sym.wj；#q(27)\(2) 0.6532，0.4471，0.5485，1.5920，(3) 4 位，(4) 6 个，(5) 186 次，(6) 110 次，(7) $(sqrt(5))^99 < (root(3, 9))^110$#sym.wj；#q(28)\(1) $approx 677000$#sym.wj，(2) $approx -1.33$#sym.wj；#q(29)\(1) $approx 297$（平方厘米），(2) $approx 4.2$（厘米）；#q(31)\(1) $3/2$#sym.wj，(2) $-1$#sym.wj，(3) 2 或 $-2$#sym.wj，(4) 4，(5) $1/2$#sym.wj，(6) 13，(7) 16，(8) 3 或 7；#q(32)\(1) $1/2$#sym.wj，$sqrt(2)/5$#sym.wj，(2) 1，1；4，2，(3) 3，4，(4) 3，4；#q(35)$a_1 = a_2 = a_3 != 0$ 时，这三个数既成等差数列，也成等比数列；#q(36)\(1) $-1$#sym.wj，3，7，$dots.c$#sym.wj，$4n - 5$#sym.wj，$dots.c$#sym.wj，(2) 55；#q(37)$a_1 = 0.5$#sym.wj，$d = 0.5$#sym.wj；#q(38)$a_1 = 1/2$#sym.wj，$q = 2$#sym.wj；$a_1 = 2$#sym.wj，$q_1 = 1/2$#sym.wj；#q(40)\(1) 6，2，$2/3$#sym.wj，$dots.c$#sym.wj，$6(1/3)^(n - 1)$#sym.wj，$dots.c$#sym.wj，(2) 3；#q(41)\(1) $0.6767 dots.c$#sym.wj，(2) $0.111 dots.c$#sym.wj；#q(42)\(1) 比 999 大的自然数；(2) 比 555 大的自然数，(3) 比 9 大的自然数；#q(44)\(1) 13，(2) 比 13 大的自然数，(3) 1；#q(45)\(1) 8，(2) 比 7 大的自然数，(3) 2；#q(46)\(1) 3，4；$-8$#sym.wj，$-1.5$#sym.wj，(2) $-4$#sym.wj，$-1/2$#sym.wj；$-1/2$#sym.wj，$-4$#sym.wj；1，2。
