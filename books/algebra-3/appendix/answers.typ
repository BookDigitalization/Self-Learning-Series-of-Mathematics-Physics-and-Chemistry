// 习题答案（原书 p.368–）：本文件录到第 4 章答案（含复习题四）为止；第 5 章答案起见 answers-b.typ
#import "/common/series.typ": *

// 原书按章分组：“习题 x·y”后列出有答案的题号；复习题的答案单列（无习题标签，用小标题）。
// 原书只列有答案的题，题号不连续，照录。题号后的“.”不是句末标点，不改；
// 各条末尾的“．”改作“。”，其余分号、逗号一律照原书用全角（数学式内部的逗号、分号照数学式写）。
// 原书答案里“…”（如 p.370 复习题一第 2、6 题）是原书省略，照录。

#let q(n) = h(0.8em) + [#n.] + sym.wj + h(0.2em) + sym.wj
// 答案里有不少分式，行距放宽，免得上下行的分式互相压住
#set par(leading: 0.9em)
#show math.equation.where(block: false): set text(top-edge: "bounds", bottom-edge: "bounds")
#let sec(title) = {
  set par(first-line-indent: 0em)
  block(above: 1.4em, below: 0.6em, sticky: true,
    align(center, text(font: fonts.hei, weight: "bold", size: 1.05em)[#title]))
}

// p.368
= 习题答案

#sec[第一章]

#answers("1·1")[#q(1)前\<后；#q(2)前>后；#q(3)前\<后；#q(4)$a != b$#sym.wj 时，前>后；$a = b$#sym.wj 时，前=后；#q(5)$x > 0$#sym.wj 时，前\<后；$x = 0$#sym.wj 时，前=后。]

#answers("1·2")[#q(2)\(1) $x != 0$#sym.wj，(2) 没有解，(3) 全体实数，(4) $x != -1$#sym.wj；#q(3)\(1) 全体实数，(2) 没有解，(3) $x != -3/2$#sym.wj，(4) 没有解。]

#answers("1·3")[#q(2)\(2) 不一定，(3) 不一定，(4) 一定，(5) 一定；#q(3)\(1) 前\<后，(2) 前>后，(3) 前\<后；#q(4)\(1) $x > 6/7$#sym.wj，(2) $x < -mx(9, 3, 4)$#sym.wj，(3) 全体实数，(4) $x < 0$#sym.wj，(5) $x > -mx(2, 1, 2)$#sym.wj，(6) $x < 0$#sym.wj，(8) $x > 3$#sym.wj；#q(5)\(1) $x < a + b$#sym.wj，(2) $x > -(m^2 + m n + n^2)$#sym.wj，(3) $k > 1$#sym.wj 时，$x > (k - 2)/(k - 1)$#sym.wj；$k < 1$#sym.wj 时，$x < (k - 2)/(k - 1)$#sym.wj；$k = 1$#sym.wj 时，全体实数；(4) $p > q$#sym.wj 时，$x < p + q$#sym.wj；$p < q$#sym.wj 时，$x > p + q$#sym.wj；(5) $m > 2$#sym.wj 时，$x > (m + 3)/(m - 2)$#sym.wj；$m < 2$#sym.wj 时，$x < (m + 3)/(m - 2)$#sym.wj；$m = 2$#sym.wj 时，没有解。]

#answers("1·4(1)")[#q(2)\(1) $x > 1$#sym.wj，(2) $-7 < x < -1$#sym.wj，(3) 没有解，(4) $2 < x < 3$#sym.wj，(5) $5 < x < 27$#sym.wj，(6) $x > 9$#sym.wj，(7) $x < 2$#sym.wj，(8) $x > 0$#sym.wj，(9) 没有解，(10) $x < 0$#sym.wj。]

#answers("1·4(2)")[#q(2)\(1) $x > a$#sym.wj，(2) $x < c$#sym.wj，(3) 没有解，(4) $c < x < b$#sym.wj；#q(3)\(1) 4，5，6，7，(2) 3，4，5。]

#answers("1·5(1)")[#q(1)\(3) $x < -1/2$#sym.wj，$x > 1/2$#sym.wj，(4) $x < -1/3$#sym.wj，$x > 2$#sym.wj，(5) $x < 4$#sym.wj，$x > 9$#sym.wj，(6) $-1 < x < 8$#sym.wj，(7) $x < 1$#sym.wj，$x > 7/2$#sym.wj，/* p.369 */(8) $-1/2 < x < 3$#sym.wj，(9) $-sqrt(10) < x < sqrt(10)$#sym.wj，(10) $x < 1$#sym.wj，$x > 5/2$#sym.wj。]

#answers("1·5(2)")[#q(2)\(1) $x != sqrt(2)$#sym.wj，(2) $x <= -5/6$#sym.wj，$x >= 1$#sym.wj，(3) $-4 < x < 3/2$#sym.wj，(4) $-2/3 <= x <= 3/2$#sym.wj；#q(3)\(1) $x < (3 - sqrt(13))/2$#sym.wj，$x > (3 + sqrt(13))/2$#sym.wj，(2) $2 - sqrt(2) < x < 2 + sqrt(2)$#sym.wj，(3) $(5 - sqrt(33))/4 <= x <= (5 + sqrt(33))/4$#sym.wj，(4) $(1 - sqrt(3))/2 <= x <= (1 + sqrt(3))/2$#sym.wj。]

#answers("1·6")[#q(1)\(1) $-1/3 < x < 2$#sym.wj，(2) $-7/3 < x < 1/3$#sym.wj，(3) $x < -8/5$#sym.wj，$x > 5/2$#sym.wj，(4) $-2 < x < 8/5$#sym.wj；#q(2)\(1) $1 < x < 2$#sym.wj，(2) $-9 < x < 1$#sym.wj，(3) $-9 < x < 5$#sym.wj，(4) $x < 5/2$#sym.wj，$x > 4$#sym.wj；#q(3)\(2) $x < -sqrt(2)$#sym.wj，(3) $x > -sqrt(3)$#sym.wj，(4) $x > sqrt(5)/2$#sym.wj；#q(4)\(2) $x < 0$#sym.wj，(3) $x > 2$#sym.wj，(4) $x < 3$#sym.wj；#q(5)$k < 2$#sym.wj 或 $k > 5$#sym.wj 时为正数，$2 < k < 5$#sym.wj 时为负数，$k = 2$#sym.wj 时为零；#q(6)$1/2$#sym.wj，$2/3$#sym.wj，$3/4$#sym.wj，$4/5$#sym.wj，$5/6$#sym.wj，$6/7$#sym.wj。]

#answers("1·7")[#q(1)\(1) $-1 < x < 3$#sym.wj，(2) $x < -2$#sym.wj，(3) $x < -4$#sym.wj，$x > 3$#sym.wj，(4) $-1 < x < 1$#sym.wj；#q(2)\(1) $x < -2$#sym.wj，$-1 < x < 3$#sym.wj，(2) $x < -4$#sym.wj，$-1 < x < 1$#sym.wj，$x > 3$#sym.wj。]

#answers("1·8")[#q(1)\(1) $1 < x < 3$#sym.wj，$x > 5$#sym.wj，(2) $x < 1$#sym.wj，$3 < x < 5$#sym.wj，(3) $x < -2$#sym.wj，$-1 < x < 1$#sym.wj，$x > 2$#sym.wj，(4) $-2 < x < -1$#sym.wj，$1 < x < 2$#sym.wj；#q(2)\(1) $-3 < x < 0$#sym.wj，$x > 3$#sym.wj，(2) $-5 < x < -4$#sym.wj，$4 < x < 5$#sym.wj，(3) $-3 < x < -1$#sym.wj，$x > 3$#sym.wj，(4) $x < -2$#sym.wj，$3 < x < 8$#sym.wj，(5) $-2 < x < -sqrt(2)$#sym.wj，$sqrt(2) < x < 2$#sym.wj，(6) $-1 < x < 1$#sym.wj，$5/2 < x < 4$#sym.wj。]

#answers("1·9(1)")[#q(1)\(1) 3.64，3.66，(2) 0.81，0.83。]

#answers("1·10")[#q(1)$5/3 <= x < 7/4$#sym.wj；#q(2)$x < -7$#sym.wj；#q(3)$x > 9/2$#sym.wj；#q(4)没有解；#q(5)$-1 < x <= 0$#sym.wj，$1 <= x < 2$#sym.wj；#q(6)$x < -9$#sym.wj，$x > 1$#sym.wj。]

// p.370
#answers("1·12(1)")[#q(4)\(1) 全体实数，(2) $x < -3$#sym.wj，$x > 3$#sym.wj，(3) 没有解，(4) $-3 < x < 3$#sym.wj；#q(5)\(1) $-4 < x < 10$#sym.wj，(2) $x < -7$#sym.wj，$x > 3$#sym.wj，(3) $-mx(2, 1, 2) < x < 1/2$#sym.wj，(4) 全体实数；#q(6)\(1) $x < 1/4$#sym.wj，$x > 3/4$#sym.wj，(2) $1/4 <= x <= 5/12$#sym.wj，(3) $x < -5/4$#sym.wj，$x > 5/4$#sym.wj，(4) $-4 <= x < 0$#sym.wj，$0 < x <= 4$#sym.wj。]

#sec[复习题一]

#q(2)\(1) $x > 1$#sym.wj 时，前>后，…，(2) $x > 0$#sym.wj 时，前\<后，…；#q(3)$b < sqrt(a b) < (a + b)/2 < sqrt((a^2 + b^2)/2) < a$#sym.wj；#q(6)\(1) $a > b$#sym.wj 时，$x < a b$#sym.wj，…，(2) $a > b$#sym.wj 时，$x < b - a$#sym.wj，…；#q(7)\(1) $1 < x < 3/2$#sym.wj，(2) $0 < x < 3$#sym.wj；#q(8)\(1) $3 < x < 12$#sym.wj，(2) $x < 4 - 2sqrt(5)$#sym.wj，$x > 4 + 2sqrt(5)$#sym.wj，(3) $x < -sqrt(3)/2$#sym.wj，$x > sqrt(3)/2$#sym.wj，(4) $sqrt(2) - 1 < x < sqrt(2) + 1$#sym.wj，(5) 没有解，(6) $(-2 - sqrt(6))/2 < x < (-2 + sqrt(6))/2$#sym.wj；#q(9)\(1) $x < -4$#sym.wj，(2) $y > -1$#sym.wj，(3) $-sqrt(2) < x < sqrt(2)$#sym.wj，(4) $y < 2$#sym.wj，$y > 3$#sym.wj；#q(11)\(1) $sqrt(2) < x < sqrt(3)$#sym.wj，$x > sqrt(5)$#sym.wj，(2) $x < -1/2$#sym.wj，$-1/3 < x < -1/4$#sym.wj；#q(12)\(1) $x <= -3/2$#sym.wj，$-2/3 <= x < 2/3$#sym.wj，$x > 3/2$#sym.wj/* 原书作 x<−3/2，−2/3<x<2/3，x>3/2（漏了使分子为零的两个端点 −3/2、−2/3，已订正；2/3、3/2 使分母为零，仍不取；见 REVISIONS.md） */，(2) $x < 1$#sym.wj，$2 < x < 3$#sym.wj，(3) $x < -1$#sym.wj，$0 < x < 1$#sym.wj，$x > 3$#sym.wj，(4) $x < -1$#sym.wj，$-1/3 < x < 1/3$#sym.wj；#q(13)\(1) $2 < x < 3$#sym.wj，(2) $1 < x < 3$#sym.wj；#q(15)\(1) $x < -1$#sym.wj，$x > 4$#sym.wj，(2) $-7/6 <= x <= 1/6$#sym.wj，(3) $1/6 <= x <= 1/2$#sym.wj，(4) $-1 < x < 0$#sym.wj，$0 < x < 1/3$#sym.wj；#q(16)24，35；#q(17)86；#q(18)10，59；11，63；12，67。#q(19)\(1) $1/5 < m < 1$#sym.wj，$m > 1$#sym.wj，(2) $-3/11 < m < -1/5$#sym.wj，$-1/5 < m < 3$#sym.wj；#q(20)\(1) 29，(2) 11。

#sec[第二章]

#answers("2·1")[#q(3)\(1) 全体实数，(2) $x != 1$#sym.wj，(3) $-1 <= x <= 1$#sym.wj，(4) $-1 < x < 1$#sym.wj。]

// p.371
#answers("2·2")[#q(1)\(1) $n = 60t$#sym.wj，(2) $t = n/60$#sym.wj；#q(2)\(4) $y = root(3, x)$#sym.wj，(5) $y = (x + 1)/(x - 1)$#sym.wj，(6) $y = (3x + 12)/(x + 2)$#sym.wj。]

#answers("2·3")[#q(1)$(-infinity, -2)$#sym.wj，$(-2, +infinity)$#sym.wj；#q(2)$(-infinity, +infinity)$#sym.wj；#q(3)$(-infinity, -3/2)$#sym.wj，$(-3/2, 3/2)$#sym.wj，$(3/2, +infinity)$#sym.wj；#q(4)$(-infinity, 0)$#sym.wj，$(0, +infinity)$#sym.wj；#q(5)$[-2, 3]$#sym.wj；#q(6)$[2, +infinity)$#sym.wj。]

#answers("2·4")[#q(1)1，$sqrt(2)/2$#sym.wj，$sqrt(5)/3$#sym.wj，$sqrt(5)/3$#sym.wj，$sqrt(6) - sqrt(3)$#sym.wj，$sqrt(6) - sqrt(3)$#sym.wj；#q(3)$a^2 + 1$#sym.wj，$(1 + a^2)/a^2$#sym.wj，$a^2 + 2a + 2$#sym.wj；#q(5)\(1) 19，(2) $6a^2 b + 2b^3$#sym.wj。]

#answers("2·6")[#q(1)1.56，1.08，156，108；#q(2)1.581，1.732，1.871，3.536。]

#sec[复习题二]

#q(2)\(2) $-1/4$#sym.wj，$-2/5$#sym.wj，0；#q(3)\(1) 3，$2sqrt(2)$#sym.wj，$sqrt(5)$#sym.wj，0，(2) $sqrt(9 - a^2)$#sym.wj，$-3 <= a <= 3$#sym.wj；#q(4)\(1) $x >= 2$#sym.wj，(2) $x > 2$#sym.wj，(3) $-1 <= x < 0$#sym.wj，$x > 0$#sym.wj，(4) $x <= -1$#sym.wj，$x >= 1$#sym.wj；#q(5)\(1)，(2)，(3) $-3 <= x <= 3$#sym.wj，(4) $-3 < x <= 3$#sym.wj，(5)，(6) $-3 < x < 3$#sym.wj；#q(7)\(1) $x != 1$#sym.wj，(2) $x >= 1$#sym.wj，(3) 全体实数，(4) 全体实数；#q(9)\(1) $y = 4/x$#sym.wj，(2) $y = (6 - 2x)/3$#sym.wj，(3) $y = 2 root(3, x)$#sym.wj，(4) $y = 4x^2$#sym.wj。

#sec[第三章]

#answers("3·1(1)")[#q(2)\(1) $p = 4a$#sym.wj，4，(3) $c = pi d$#sym.wj，$pi$#sym.wj，(5) $s = v t$#sym.wj，$v$#sym.wj，(6) $v = s/t$#sym.wj，$1/t$#sym.wj，(8) $W = d V$#sym.wj，$d$#sym.wj，(9) $W = V d$#sym.wj，$V$#sym.wj；#q(3)\(3) $q = 2t$#sym.wj。]

#answers("3·1(3)")[#q(1)\(5) $k > 0$#sym.wj 的时候，$k$ 的值越大，函数上升越快，(6) $k < 0$#sym.wj 的时候，$k$ 的绝对值越大，函数下降越快；#q(2)\(1) $34 degree$#sym.wj，(2) $56 degree$#sym.wj，(3) $146 degree$#sym.wj，(4) $124 degree$#sym.wj/* 原书作 (1) 56°，(2) 34°（前两项对调，已订正：题中直线依次是 y=2/3 x、3/2 x，倾角 34°、56°；见 REVISIONS.md） */。]

#answers("3·2")[#q(3)\(1) $2/3$#sym.wj，2；$2/3$#sym.wj，$-2$#sym.wj；$-2/3$#sym.wj，2；$-2/3$#sym.wj，$-2$#sym.wj，/* p.372 */(2) $34 degree$#sym.wj，$34 degree$#sym.wj，$146 degree$#sym.wj，$146 degree$#sym.wj；#q(5)\(1) $y = (4 - 2x)/3$#sym.wj，(2) $y = (3x - 5)/2$#sym.wj。]

#answers("3·3")[#q(1)\(1) $y = -8/9 x + 10/9$#sym.wj，(2) $y = -6x + 5$#sym.wj，(3) $y = -3/2 x + 1/2$#sym.wj，(4) $y = 7/3 x + 1/3$#sym.wj；#q(2)\(1) $y = -3x + 1/2$#sym.wj，(2) $y = x - 1$#sym.wj，(3) $y = 1/2 x - 3/2$#sym.wj，(4) $y = 1/2 x + 3$#sym.wj，(5) $y = sqrt(3) x + 2$#sym.wj，(6) $y = sqrt(3) x - 2sqrt(3)$#sym.wj。]

#answers("3·4")[#q(2)\(1) $-3/2$#sym.wj，3，(2) $4/5$#sym.wj，$-4$#sym.wj，(3) 0，4；#q(3)\(2) $4/3$#sym.wj，$-8/3$#sym.wj，(3) 2。]

#answers("3·5")[#q(1)\(1) 7.5，$-6.5$#sym.wj，(2) 2.5，3.5，(3) 6，$-6$#sym.wj，(4) $-1$#sym.wj，1；#q(4)\(1) $b_1 != b_2$#sym.wj，(2) $b_1 = b_2$#sym.wj。]

#sec[复习题三]

#q(1)\(2) $k > 0$#sym.wj 时上升，$k < 0$#sym.wj 时下降，(3) $b = 0$#sym.wj 时有此情况；#q(2)\(2) 每秒 24 升；(3) 108 升，(4) $mx(4, 1, 6)$#sym.wj 秒；#q(5)\(1) $x/a + y/b = 1$#sym.wj，(2) $y = m x + b$#sym.wj，(3) $y - b = m(x - a)$#sym.wj；#q(6)\(2) $A(4, 1)$#sym.wj，$B(8, 9)$#sym.wj，$C(2, 3)$#sym.wj；#q(8)$k = -1$#sym.wj；#q(9)\(1) 1，1，(2) 有无穷多组解，(3) 没有解，(4) 3，3；#q(10)$y = 1/250 x + 3/10$#sym.wj，38 克。

#sec[第四章]

#answers("4·1")[#q(1)\(1) 正比例关系，(2) $v$ 是 $r$ 的二次函数；#q(2)\(1) $h$ 是 $t$ 的二次函数，(2) $approx 20$#sym.wj 米，(3) $approx 2.9$#sym.wj 秒。]

#answers("4·2(1)")[#q(1)\(1) 2.3，5.3，2.0，(2) $plus.minus 1.4$#sym.wj，$plus.minus 1.7$#sym.wj，$plus.minus 2.1$#sym.wj，(3) $sqrt(5) approx 2.2$#sym.wj，$sqrt(7) approx 2.6$#sym.wj。]

#answers("4·2(2)")[#q(2)\(1) $y = (x + 1/2)^2 + 3/4$#sym.wj，(2) $y = (x + 1)^2 - 1$#sym.wj，(3) $y = 2(x - 1/4)^2 + 7/8$#sym.wj，(4) $y = (x + 5/2)^2 - 1/4$#sym.wj；/* p.373 */#q(3)对称轴：(1) $x = 1$#sym.wj，(2) $x = -1$#sym.wj，(3) $x = 5/6$#sym.wj，(4) $x = -3$#sym.wj；顶点：(1) $(1, 0)$#sym.wj，(2) $(-1, -8)$#sym.wj，(3) $(5/6, -25/12)$#sym.wj，(4) $(-3, -2)$#sym.wj；开口：(1) 向上，(2) 向上，(3) 向上，(4) 向下。]

#answers("4·3")[#q(1)顶点坐标：(1) $(3, -5)$#sym.wj，(2) $(-1, 8)$#sym.wj，(3) $(1, -1)$#sym.wj，(4) $(2, 3)$#sym.wj；对称轴：(1) $x = 3$#sym.wj，(2) $x = -1$#sym.wj，(3) $x = 1$#sym.wj，(4) $x = 2$#sym.wj。]

#answers("4·4")[#q(1)\(1) $y = x^2 + 3x + 2$#sym.wj，(2) $y = x^2 + 5x + 4$#sym.wj，(3) $y = x^2 - 10x + 23$#sym.wj；#q(2)\(1) $y = 2x^2 - 6x + 4$#sym.wj，(2) $y = 2x^2 + 4x - 6$#sym.wj。]

#answers("4·5(1)")[#q(1)\(1) $x > 3$#sym.wj 时增，$x < 3$#sym.wj 时减，(2) $x = 3$#sym.wj 时，$y_"极小" = -5$#sym.wj；#q(2)\(1) $x > 3$#sym.wj 时减，$x < 3$#sym.wj 时增，(2) $x = 3$#sym.wj 时，$y_"极大" = -3$#sym.wj；#q(3)\(1) $x = 1/2$#sym.wj，$y_"极小" = 0$#sym.wj，(2) $x = 1$#sym.wj，$y_"极小" = 0$#sym.wj，(3) $x = -5/6$#sym.wj，$y_"极大" = mx(4, 1, 12)$#sym.wj，(4) $x = 5$#sym.wj，$y_"极大" = 130$#sym.wj。]

#answers("4·5(2)")[#q(1)$P$，$Q$，$R$，$S$ 是各边的中点；#q(2)800 平方厘米；#q(3)2500 平方米；#q(4)\(1) $y = 3x - (6 - sqrt(3))/4 x^2$#sym.wj，(2) 等边三角形边长 $approx 1.4$#sym.wj 米时。]

#answers("4·6")[#q(1)1.6，$-0.6$#sym.wj；#q(2)没有实数根；#q(3)1.6，$-3.2$#sym.wj；#q(4)1.6，$-1.2$#sym.wj。]

#answers("4·7")[#q(1)$x > 2$#sym.wj，$x < 1$#sym.wj；#q(2)$1/2 < x < 1$#sym.wj；#q(3)全体实数；#q(4)没有解；#q(5)$-0.6 < x < 1.6$#sym.wj；#q(6)$x < -1.6$#sym.wj，$x > 0.6$#sym.wj。]

#answers("4·8")[#q(1)全体实数；#q(2)$1 < x < 3/2$#sym.wj；#q(3)$(1 - sqrt(37))/6 < x < (1 + sqrt(37))/6$#sym.wj；#q(4)$x < -1$#sym.wj，$x > 4/3$#sym.wj；#q(5)全体实数；#q(6)$-2/3 < x < 3$#sym.wj；#q(7)$(-2 - sqrt(19))/5 < x < (-2 + sqrt(19))/5$#sym.wj；#q(8)$x < -5/3$#sym.wj，$x > 1$#sym.wj；#q(9)$x < 3$#sym.wj，$x > 3$#sym.wj；#q(10)没有解。]

// p.374
#sec[复习题四]

#q(2)\(1) $y = (x + 2)^2 - 9$#sym.wj，(2) $x = -5$#sym.wj，$x = 1$#sym.wj 时，$y = 0$#sym.wj；$x < -5$#sym.wj，$x > 1$#sym.wj 时，$y > 0$#sym.wj；$-5 < x < 1$#sym.wj 时，$y < 0$#sym.wj，(3) $x = -2$#sym.wj 时，$y$ 有极小值 $-9$#sym.wj，(4) $x < -2$#sym.wj 时，减；$x > -2$#sym.wj 时，增。

#q(3)

#align(center, block(breakable: false)[
  #set table(fill: none, stroke: none)
  #show table.cell: set text(fill: black)
  #set text(size: 9.5pt)
  #table(
    columns: (auto, auto, auto, auto, auto, auto, auto),
    align: center + horizon,
    inset: (x: 4pt, y: 6pt),
    stroke: (x, y) => (
      top: if y == 0 { 1.2pt } else if y == 1 { 0.5pt } else if y == 2 { 0.5pt } else if y == 3 { 0.5pt } else if y == 4 { 0.5pt } else if y == 5 { 0.5pt } else { 0pt },
      bottom: if y == 5 { 1.2pt } else { 0pt },
      left: if x >= 1 { 0.5pt } else { 0pt },
    ),
    [函数的表示式], [$y = 0$#sym.wj 时 \ $x$ 的值], [$y > 0$#sym.wj 时 \ $x$ 的值], [$y < 0$#sym.wj 时 \ $x$ 的值], [极　值], [$y$ 增加 \ 时 $x$ \ 的值], [$y$ 减小 \ 时 $x$ \ 的值],
    [(1) $y = (x + 2)^2 + 1$], [], [全体实数], [], [$x = -2$#sym.wj， \ $y_"极小" = 1$#sym.wj], [$x > -2$], [$x < -2$],
    [(2) $y = (x + 2)^2$], [$x = -2$], [$x < -2$ \ $x > -2$], [], [$x = -2$ \ $y_"极小" = 0$#sym.wj], [$x > -2$], [$x < -2$],
    [(3) $y = 8 - 2(x + 1)^2$], [$x = -3$ \ $x = 1$], [$-3 < x$ \ $< 1$], [$x < -3$ \ $x > 1$], [$x = -1$ \ $y_"极大" = 8$#sym.wj], [$x < -1$], [$x > -1$],
    [(4) $y = -1/4 (x - 2)^2$], [$x = 2$], [], [$x < 2$ \ $x > 2$], [$x = 2$#sym.wj， \ $y_"极大" = 0$#sym.wj], [$x < 2$], [$x > 2$],
    [(5) $y = -1/2 (x + 1)^2 - 1/2$], [], [], [全体实数], [$x = -1$ \ $y_"极大" =$ \ $-1/2$], [$x < -1$], [$x > -1$],
  )
])

#q(4)$x < 2$#sym.wj，$x > 3$#sym.wj 时是正数，$2 < x < 3$#sym.wj 时是负数，$x = 2$#sym.wj，$x = 3$#sym.wj 时是零，$x = 5/2$#sym.wj 时，有极小值 $-1/4$#sym.wj；#q(5)\(1) 函数值总是正的，$x = 3/4$#sym.wj 时，$y_"极小" = mx(2, 7, 8)$#sym.wj，(2) 函数值在 $x < -3$#sym.wj，$x > 1/2$#sym.wj 时是正的，$-3 < x < 1/2$#sym.wj 时是负的，$x = -3$#sym.wj，$x = 1/2$#sym.wj 时等于零，当 $x = -5/4$#sym.wj，$y_"极小" = -mx(6, 1, 8)$#sym.wj，(3) 函数值在 $3 < x < 4$#sym.wj 时是正的，$x < 3$#sym.wj，$x > 4$#sym.wj 时是负的，$x = 3$#sym.wj，$x = 4$#sym.wj 时等于零，当 $x = 7/2$#sym.wj 时，$y_"极大" = 1/4$#sym.wj，(4) 函数值在 $x < 3/2$#sym.wj，$x > 3/2$#sym.wj 时是负的，$x = 3/2$#sym.wj 时等于零，但不会是正数，当 $x = 3/2$#sym.wj 时，$y_"极大" = 0$#sym.wj；#q(6)\(1) $y = 2x^2 - 16x + 24$#sym.wj，(2) $y = -4x^2 + 4x + 24$#sym.wj；/* p.375 */#q(7)\(1) $y = 3x^2 - 36x + 96$#sym.wj，(2) $y = -2x^2 + 8x - 15$#sym.wj；#q(8)\(1) 2.7，$-0.7$#sym.wj，(2) 2.4，$-0.9$#sym.wj；#q(9)\(1) $-4 < x < -2$#sym.wj，(2) $x < (1 - sqrt(21))/2$#sym.wj，$x > (1 + sqrt(21))/2$#sym.wj，(3) 全体实数，(4) 没有解；#q(10)\(3) (i) 11 秒，(ii) 5 秒，(iii) 176.4 米；#q(11)\(1) $y = 20x - x^2$#sym.wj，(2) $x = 10$#sym.wj（米），$y_"极大" = 100$#sym.wj（平方米），正方形；#q(12)$h = r = (2p)/(4 + pi)$#sym.wj。
