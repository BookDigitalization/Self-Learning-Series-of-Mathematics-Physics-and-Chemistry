// 总复习题（原书 p.304–315；习题答案从 p.316 起，见 answers.typ）
// 三角函数记号按 TERMINOLOGY 4.9 写现代记号（原书 tg、ctg、cosec、arc sin、arc tg……）。
// 原书带 * 的选学题照录星号。题中插图见 figures/r-fig.typ。
#import "/common/series.typ": *
#import "/books/trigonometry/figures/r-fig.typ": *

// 并排小题：与正文段落同样缩进两字
#let rc(..items) = pad(left: 2em, cols(..items))

// p.304
= 总复习题

1\. 求下列各函数的定义域：

#rc[(1) $y = sqrt(-cos x)$；][(2) $y = 1 / (tan x sec x)$；]
#rc[(3) $y = sqrt(sqrt(2) - 2 sin x)$；][(4) $y = lg tan 3 x$；]
#rc[(5) $y = (csc x) / (1 - tan x)$；][(6) $y = sqrt(sin x - cos x)$。]

2\. 下列各等式能否成立，为什么？

#rc[(1) $sin^3 x = -1.5$；][(2) $tan x + cot x = sqrt(3)$；]
(3) $sec x csc x = sqrt(2)$；

(4) $sin x + csc x = (2 a^2) / (a^2 + 1)$#h(1em)（$a != 0$，且 $abs(a) != 1$）。

3\. 在哪一个象限内：

(1) 角的正弦和余弦都随着角的增大而增大？

(2) 角的正弦和正切都随着角的增大而增大？

(3) 角的正割和余割都随着角的增大而增大？

4\. 化下列各式为小于 $45°$ 的正锐角的三角函数：

#rc[(1) $sin 2600°$；][(2) $cos 3114°$；][(3) $tan(-736°14')$；]
#rc[(4) $cot 1122°$；][(5) $sec(-1947°)$；][(6) $csc(-3700°)$。]

5\. 化简下列各式：

(1) $display((tan(pi - alpha)) / (sin(pi - alpha) sin((3 pi) / 2 - alpha))) + display((sin(2 pi - alpha) cos((3 pi) / 2 - alpha)) / (sin((3 pi) / 2 + alpha) cos(alpha - 2 pi)))$；

(2) $cos((4 n + 1) / 4 pi + alpha) + cos((4 n - 1) / 4 pi - alpha)$；

(3) $(2 cos^2(90° + alpha)[sec^2(180° - alpha) + 1]) / (1 - sin^4(alpha - 270°))$ \
#h(2em)$+ cot(270° + alpha)[cot(180° + alpha) + tan(180° + alpha)]$；

// p.305
(4) $tan^2((2 n + 1) / 2 pi + alpha) - tan^2((2 n + 1) / 2 pi - alpha)$；

(5) $(2 cos 660° + sin 630°) / (3 cos 1022° + 2 cos(-671°))$。

6\. 求下列各式的值：

(1) $8 sin 510° cos(-300°) tan 240°$；

(2) $10 cot 315° sin(-150°) cos 225°$；

(3) $display((sin(pi + alpha)) / (sin((3 pi) / 2 - alpha))) - display((tan((3 pi) / 2 + alpha)) / (cot(pi - alpha))) + tan(pi - alpha) + cos 0$；

(4) $display(((a^2 - b^2) cot(pi - alpha)) / (tan(pi / 2 - alpha))) + display(((a^2 + b^2) tan(pi / 2 - alpha)) / (cot(pi - alpha)))$。

\*7\. 求下列各三角函数的最小正周期：

#rc[(1) $cos (pi (x + 1)) / 2$；][(2) $sin 3 x + tan 2 / 5 x$；]
(3) $tan 3 pi x + cot 2 pi x$。

8\. 求证下列各恒等式：

(1) $(1 + sin alpha) / (1 - sin alpha) = (tan alpha + sec alpha)^2$；

(2) $(1 + 2 sin alpha cos alpha) / (cos^2 alpha - sin^2 alpha) = (1 + tan alpha) / (1 - tan alpha)$；

(3) $4 sin x sin(60° + x) sin(60° - x) = sin 3 x$；

(4) $cos^2 x + cos^2(120° + x) + cos^2(240° + x) = 3 / 2$；

(5) $cos^2(alpha - 3 beta) + cos^2 3 beta - 2 cos(alpha - 3 beta) cos alpha cos 3 beta = sin^2 alpha$；

\*(6) $sin 87° - sin 59° - sin 93° + sin 61° = sin 1°$。

\*9\. 若 $sin alpha rt sin alpha / 2 = 8 rt 5$，求 $cot alpha / 4$ 的值。

10\. 若 $sin(pi / 4 - x) = 5 / 13$，$0 < x < pi / 4$，计算 $(cos 2 x) / (cos(pi / 4 + x))$。

11\. 已知 $cos alpha - cos beta = 1 / 2$，$sin alpha - sin beta = -1 / 3$，求 $sin(alpha + beta)$ 的值。

// p.306
12\. 已知 $tan 2 x = 24 / 7$，求 $sin x$ 的值。

13\. 不用查表求下列各式的值：

#rc[(1) $sin 37°30' cos 7°30'$；][(2) $cos 52°30' cos 7°30'$；]
\*(3) $sin^2 10° + cos^2 40° + sin 10° cos 40°$。

14\. 求证#h(1em)$cos x / 2 cos x / 2^2 cos x / 2^3 dots.c cos x / 2^n = (sin x) / (2^n sin x / 2^n)$。

\*15\. 求证#h(1em)$2 cos (45°) / 2^n = sqrt(2 + sqrt(2 + sqrt(2 + dots.c "至" n + 1 "项")))$。

\[提示：利用 $2 cos 45° = sqrt(2)$，$2 cos (45°) / 2 = sqrt(2 + sqrt(2))$，…。\]

16\. 已知 $A + B + C = pi$，求证

$ & sin^3 A + sin^3 B + sin^3 C \
  & quad = 3 cos A / 2 cos B / 2 cos C / 2 + cos (3 A) / 2 cos (3 B) / 2 cos (3 C) / 2 ju $

17\. 已知 $A + B + C = pi$，求证

$ & cos A / 2 + cos B / 2 - cos C / 2 \
  & quad = 4 cos (pi + A) / 4 cos (pi + B) / 4 cos (pi - C) / 4 ju $

\*18\. 已知 $alpha + beta + gamma + delta = 2 pi$，求证

$ & tan alpha + tan beta + tan gamma + tan delta \
  & quad = tan alpha tan beta tan gamma tan delta (cot alpha + cot beta + cot gamma + cot delta) ju $

19\. 已知 $A + B + C = pi$，求证

$ & sin(B + 2 C) + sin(C + 2 A) + sin(A + 2 B) \
  & quad = 4 sin (B - C) / 2 sin (C - A) / 2 sin (A - B) / 2 ju $

20\. 已知 $alpha + beta + gamma = pi$，求证

$ sin^2 alpha + sin^2 beta + sin^2 gamma = 2 + 2 cos alpha cos beta cos gamma ju $

21\. 化下列各式为积的形式：

(1) $1 + cos alpha + cos beta + cos(alpha + beta)$；

(2) $sin^2 alpha - cos^2 beta$；

(3) $sin 10° + sin 20° + sin 30° + sin 40° + sin 50°$；

// p.307
\*(4) $2 cos 10° cos 20° - 2 cos 30° + sin 40°$。

22\. 已知 $alpha + beta + gamma = pi$，$n$ 为整数，求证

$ & sin 2 n alpha + sin 2 n beta + sin 2 n gamma \
  & quad = (-1)^(n + 1) dot 4 sin n alpha sin n beta sin n gamma ju $

\*23\. 求证 $cos (2 pi) / 7 + cos (4 pi) / 7 + cos (6 pi) / 7 = -1 / 2$。

\*24\. 求证 $cos pi / 5 - cos (2 pi) / 5 = 1 / 2$。

\*25\. 已知 $(cos x) / a = (cos(x + alpha)) / b = (cos(x + 2 alpha)) / c = (cos(x + 3 alpha)) / d$，求证

$ (a + c) / b = (b + d) / c ju $

26\. $x$ 为何值时，下列各公式是正确的？

#rc[(1) $sin x = sqrt(1 - cos^2 x)$；][(2) $cos x / 2 = sqrt((1 + cos x) / 2)$；]
#rc[(3) $sqrt(1 + sin 2 x) = sin x + cos x$；][(4) $cot x / 2 = (sin x) / (1 - cos x)$。]

27\. $alpha$ 为何值时，下列各等式成立？

#rc[(1) $sqrt(tan^2 alpha - sin^2 alpha) = tan alpha sin alpha$；][(2) $sqrt((1 - cos alpha) / (1 + cos alpha)) = cot alpha - csc alpha$；]
(3) $sqrt(sec^2 alpha + csc^2 alpha) = -tan alpha - cot alpha$；

(4) $sqrt((1 + sin alpha) / (1 - sin alpha)) + sqrt((1 - sin alpha) / (1 + sin alpha)) = -2 sec alpha$。

28\. 已知 $cos 2 theta = 3 / 5$，求 $sin^4 theta + cos^4 theta$ 的值。

29\. 不用查表求下列各式的值：

(1) $(2 sin 1200° - sin 630°) / (tan 960° + 2 cos(-660°))$；

(2) $tan 10° cot 20° sin 35° cos 40° csc 50° sec 55° cot 70° tan 80°$；

(3) $(sin 70° + sin 10°) / (cos 70° - cos 10°)$。

30\. 已知 $tan^2 alpha + sec alpha = 5$，求 $cos alpha$。

31\. 已知 $2 tan alpha + 3 sin beta = 7$，$tan alpha - 6 sin beta = 1$，求 $sin alpha$ 及 $sin beta$。

\*32\. 求函数 $y = 3 sqrt(3) cos 2 x + 3 sin 2 x$ 的振幅和周期。

// p.308
\*33\. 求证

$ cos pi / 15 cos (2 pi) / 15 cos (3 pi) / 15 cos (4 pi) / 15 cos (5 pi) / 15 cos (6 pi) / 15 cos (7 pi) / 15 = 1 / 2^7 ju $

34\. 求证 $sin pi / 10 sin (13 pi) / 10 = -1 / 4$。

\*35\. 求证 $(1 + sqrt(3)) cos alpha + (1 - sqrt(3)) sin alpha = 2 sqrt(2) cos(alpha + 15°)$。

\*36\. 求证 $sin 47° + sin 61° - sin 11° - sin 25° = cos 7°$。

37\. 已知 $cot alpha = 3 / 4$，$tan beta = 7$，且 $0 < alpha < pi / 2$，$0 < beta < pi / 2$，求证

$ alpha + beta = (3 pi) / 4 ju $

38\. 地球的半径为 6400 km，求赤道上一分的弧的长。

// 原书作“公尺”，按 TERMINOLOGY 4.1 改“米”
39\. 距塔 1 km 处，对于塔的视角为 $1°$，塔高多少米？

40\. 从地面上的一点测得月球的视角为 $alpha$，设观测者到月球中心的距离为 $d$，证明月球的直径为 $2 d tan alpha / 2$。又如果月球到地心的距离是 $d_1$，而地球的半径为 $R$，证明在月球上观测地球的视角为 $2 arctan R / d_1$。

41\. 一条铁道的转弯处成圆弧形，圆弧的半径是 2 km，一列火车用每小时 30 km 的速度通过，问在 10 秒间转过几度？

42\. 电动机的滑轮，每分钟转 900 周，按度数和弧度数求这滑轮每秒内旋转的角。

43\. 机器的轴每秒旋转 50 次，按弧度求角速度；再按米求轴上距旋转中心为 0.05 m 的点的线速度。

44\. 求下列各式的值。

(1) $arccos(cos (6 pi) / 5)$；

(2) $sin(2 arctan 3 / 4)$；

(3) $tan(1 / 2 arcsin 5 / 13)$；

(4) $sin(2 arctan 1 / 3) + cos(arctan 2 sqrt(3))$。

45\. 求 $tan arccos {sin[arccos(-1 / 2)]}$ 的值。

// p.309
46\. 求 $sec {2 arcsin[tan(arccot x)]}$ 的值。

47\. 计算 $cos[arctan(-1 / 3) + arctan 2 / 3]$ 的值。

48\. 求 $arctan(cot (11 pi) / 4)$ 的值。

49\. 等式 $arccos(-1 / 2) = arcsin sqrt(3) / 2$ 有没有错误？如果有的话把它改正。

\*50\. $a$ 是什么值的时候，$arccos a - arccos(-a)$ 的值是正数？是负数？等于零？

51\. 求证 $arccos 3 / 7 + arccos 9 / 11 = arccos(-13 / 77)$。

52\. 求证 $arccos 1 / sqrt(2) + arctan sqrt(2) / 2 = arctan (sqrt(2) + 1) / (sqrt(2) - 1)$。

// 原书作“求适合下列各等式的 x”，按 TERMINOLOGY 4.7“适合（方程、等式）→满足”
53\. 求满足下列各等式的 $x$：

#rc[(1) $arcsin x = 2 arcsin sqrt(2) x$；][(2) $arccos x = arctan x$；]
(3) $arctan(x - 1) + arctan x + arctan(x + 1) = arctan 3 x$；

\*(4) $arcsin 2 / (3 sqrt(x)) + arcsin sqrt(1 - x) = arcsin 1 / 3$。

54\. 解下列各三角方程：

#rc[(1) $sin abs(x) = 1$；][(2) $abs(sin x) = 1$；][(3) $cos x^2 = 1$。]

解下列方程（55～69）：

55\. $sin(x + 25°) sin(x - 20°) = sin(70° + x) sin(65° - x)$。

56\. $sin x sin 2 x sin 3 x = 1 / 4 sin 4 x$。

57\. $tan 3 / 5 x dot cot 5 / 3 x = 1 - sec 3 / 5 x dot csc 5 / 3 x$。

58\. $sin 3 x = cos x - sin x$。

59\. $sin x sin 3 x = 1 / 2$。

60\. $sec x + csc x = 2 sqrt(2)$。

61\. $cos 5 x + cos 3 x + sin 5 x + sin 3 x = 2 cos(pi / 4 - 4 x)$。

// p.310
62\. $sec^2 x = (2 - cos x - sin x) / (1 - sin x)$。

63\. $sin^4 x / 3 + cos^4 x / 3 = 5 / 8$。

64\. $cos^4 x + sin^4 x - 2 sin 2 x + 3 / 4 sin^2 2 x = 0$。

65\. $sin 2 x sin x + cos^2 x = sin 5 x sin 4 x + cos^2 4 x$。

66\. $sin^3 x - sin^2 x cos x - 3 sin x cos^2 x + 3 cos^3 x = 0$。

\*67\. $sqrt(1 + sin x) - sqrt(1 - sin x) = 2 cos x$。

68\. $cos^2 x + cos^2 2 x + cos^2 3 x + cos^2 4 x = 2$。

69\. $sin 3 x tan 2 x sec x = 0$。

70\. 解方程组#h(1em)$cases(x + y = pi / 3 dou, tan x + tan y = 2 / sqrt(3) ju)$

71\. 解方程组#h(1em)$cases(sin x sin y = 3 / 4 dou, tan x tan y = 3 ju)$

72\. 解方程组#h(1em)$cases(sin^2 x + sin^2 y = 3 / 4 dou, x + y = 75° ju)$

\*73\. 如果方程 $x^2 + p x + q = 0$ 的两个根是 $tan theta$ 和 $tan(pi / 4 - theta)$，又这个方程的两个根的比是 $3 rt 2$，求 $p$，$q$ 的值。

\*74\. 设 $A$，$B$，$C$ 都是正的锐角，求证

$ sin A + sin B + sin C > sin(A + B + C) ju $

\[提示：化 $sin A + sin B + sin C - sin(A + B + C)$ 为积的形式。\]

75\. 在 $△A B C$ 中，求证 $cos A + cos B + cos C > 1$。

\*76\. 在 $△A B C$ 中，求证

$ (cos B / 2 sin(B / 2 + C)) / (cos C / 2 sin(C / 2 + B)) = (a + c) / (a + b) ju $

\*77\. 如果 $a$，$b$，$c$ 为三角形的三边，且 $a^4 + b^4 + c^4 = 2 c^2 (a^2 + b^2)$，试/* p.311 */证角 $C$ 为 $45°$ 或 $135°$。

\[提示：将上式化为 $(a^2 + b^2 - c^2) / (2 a b) = plus.minus sqrt(2) / 2$。\]

// “各顶点”原书作“各角顶”，按 TERMINOLOGY 4.8“角顶→顶点”
\*78\. 在等腰直角三角形内，作一个等边三角形，使它的各顶点在原三角形的各边上，它的一边平行于原三角形的斜边。设原三角形的直角边为 $a$，求证所作等边三角形的面积为 $2 a^2 sin 60° sin^2 15°$。

\*79\. 若 $△A B C$ 的内切圆半径为 $r$，求证 $B C$ 边上的高

$ A D = (2 r cos B / 2 cos C / 2) / (cos (B + C) / 2) ju $

\*80\. 等腰三角形 $A B C$ 中，$A = 100°$，底角 $B$ 的平分线交 $A C$ 于 $D$，求证 $A D + B D = B C$。

\*81\. 在等腰三角形 $A B C$ 中，已知：$A B = B C = b$，$A C = a$，$∠A B C = 20°$。求证 $a^3 + b^3 = 3 a b^2$。

\[提示：利用 $sin 30° = 3 sin 10° - 4 sin^3 10°$。\]

82\. 用 $cos 10°$ 表示

$ & cos 10° + cos 20° + cos 30° + cos 40° + cos 50° \
  & quad + cos 60° + cos 70° + cos 80° ju $

// “杆顶”原书作“竿顶”，按 TERMINOLOGY 4.8
83\. 某人在 $A$ 处看杆顶的国旗，由 $A$ 向前走 11 m 至 $B$，由 $B$ 向前走 5 m 至 $C$，已知在 $A$，$B$，$C$ 测得杆顶的仰角分别为 $alpha$，$2 alpha$，$3 alpha$。求旗杆的高度。

#plainfig((fig-r-83(), [（第 83 题）]))

\*84\. 在 $△A B C$ 中，求证

$ Delta = 4 R r cos A / 2 cos B / 2 cos C / 2 ju $

// “连接”原书作“连结”，按 TERMINOLOGY 4.5
85\. 在一角内作互相外切的两个圆，同时这两个圆都与角的两边相切。连接每一个圆与角的两边的切点的弦，依次等于 $2 a$ 和 $2 b$。求该角。

\*86\. 半径为 $R$ 的圆内一点 $P$ 和圆心的距离为 $a$，经过 $P$ 点引直径和两条互相垂直的弦，其中一弦和直径成 $alpha$ 角。求以此两弦为对角线的内接四边形的面积。

// p.312
\*87\. 半径 $R$ 和 $r$ 的两圆与直线 $A D$ 切于 $A$ 点，并且位于 $A D$ 的一侧。一条平行于 $A D$ 的直线交两圆于点 $B$ 和点 $C$。$B$，$C$ 位于中心线的一侧。求 $△A B C$ 的外接圆的半径。

88\. 求内接于半径为 10 cm 的圆的五角星形的面积。

89\. 已知正 $n$ 边形的一边长是 $a$，求它的内切圆半径，外接圆半径和面积。

\*90\. 在 $△A B C$ 中，已知 $a tan A + b tan B = (a + b) tan (A + B) / 2$，求证原三角形为等腰三角形。

\[提示：求证 $a / b = (cos A) / (cos B)$。\]

91\. 在 $△A B C$ 中，已知 $sin A rt sin C = sin(A - B) rt sin(B - C)$。求证 $a^2 + c^2 = 2 b^2$。

92\. 在 $△A B C$ 中，已知 $(tan A - tan B) / (tan A + tan B) = (c - b) / c$，求证 $A = 60°$。

\*93\. 已知平行六面体交于一点的棱长为 $a$，$b$，$c$。其中两棱互相垂直，另一棱与这两棱各成角 $alpha$，求平行六面体的体积。

\*94\. 直三棱柱的底是一个周长为 $2 p$ 的等腰三角形，每个相等的角为 $alpha$。过下底面等腰三角形的底边以及与上底面相对的顶点引一截面，截面三角形的底角为 $beta$，求这个柱体的体积。

\*95\. 正棱锥的高为 $h$，已知它的底面正多边形的内角和为 $n dot 90°$，又知锥体侧面积和底面积的比为 $k$。求锥体的体积。

\*96\. 在球面上一点引三个相等且彼此间的夹角为 $2 alpha$ 的弦。若球的半径为 $R$，求弦长。

\*97\. 一梯形的上底为 $a$，下底为 $2 a$，一腰为 $b$，且此腰和下底间的夹角为 $alpha$，求这梯形绕已知腰旋转后所得的体积。

\*98\. 锥体 $S A B C$ 的底是 $△A B C$。$A B$ 和 $A C$ 所成的角为 $alpha$，且 $A B = A C = a$。$S B C$ 面垂直于锥体的底，$S B A$，$S C A$ 面与底成 $phi$ 角。求锥体的侧面积。

99\. 某人向一塔前进，在离塔基 $m$ 处，测得塔顶上旗杆的张角 $alpha$ 为最大，求证旗杆的长为 $2 m tan alpha$，塔高为 $m tan(pi / 4 - alpha / 2)$。

\[提示：过旗杆的两端和测点所作的圆，与地平线相切于测点。\]

// p.313
100\. 两杆相距 12 m，在两杆底部互相测得一杆的仰角为另一杆的仰角的 2 倍，如果在两杆距离的中点，测得两杆的两个仰角互为余角，求两杆的长。

101\. 某人在高处望见正东海面上一船首，它的俯角为 $30°$，当该船向正南航行 $a$ 海里后，望其船首的俯角为 $15°$，这人的视点高出海面多少？

102\. 有一个圆形的水池，设 $A$，$B$ 为池外的两点，从 $A$ 点测得和圆池相切的视线 $A D$，$A C$ 与 $A B$ 所成的角是 $∠D A B = alpha$，$∠C A B = beta$；从 $B$ 点测得和圆池相切的视线与 $A B$ 所成的角是 $∠E B A = alpha'$，$∠F B A = beta'$。如果 $A B = a$，求水池的半径。

#plainfig((fig-r-102(), [（第 102 题）]), (fig-r-104(), [（第 104 题）]))

103\. 某人在地面上 $B$ 处测得对面山顶 $P$ 的仰角是 $65°$，向山脚走前 800 m，就走上一个坡度是 $30°$ 的山坡，再走前 800 m，测得 $P$ 的仰角是 $78°$；求山的高度。

104\. 开垦了一块四边形的荒地 $A B C D$，现测得 $A B = 187.5 "m"$，$∠C A D = 56°30'$，$∠B A C = 48°5'$，$∠A B D = 37°30'$，$∠C B D = 65°10'$。求这块荒地的面积。

105\. 某人在一直向北的路上前进，至某处时见远处两建筑物在同一方向，与路的方向成角 $alpha$，再向前行 $c$ 后见两建筑物的张角为 $beta$，且较近建筑物在正东。求证两建筑物的距离为 $(2 c sin alpha sin beta) / (cos(2 alpha + beta) + cos beta)$。

// p.314
106\. 某人测得岩石的仰角为 $47°12'$，依 $32°$ 的斜坡向岩上行 100 m，测得其仰角为 $77°32'$。求这岩高出第一测点的高度。

107\. 有不可到达的 $A$ 与 $B$ 两点，除 $D$ 点外，没有其他的点可望见 $A$ 和 $B$。任取一点 $C$ 可望见 $A$ 和 $D$，测得 $C D$ 为 200 m；$∠A D C = 89°$；$∠A C D = 50°30'$。又任取一点 $E$ 可望见 $D$ 与 $B$，测得 $D E$ 为 200 m；$∠B D E = 54°30'$；$∠B E D = 88°30'$。在 $D$ 点测得 $∠A D B = 72°30'$。求 $A$ 与 $B$ 间的距离。

#plainfig((fig-r-107(), [（第 107 题）]), (fig-r-108(), [（第 108 题）]))

108\. 在距塔基 40 m 的斜面上，测得塔所张的角为 $41°19'$；更远 60 m 处，测得塔所张的角为 $23°45'$。求塔高（精确到 0.1 m）。

109\. 一只船以每小时 15 海里的速度向船坞 $A$ 行驶，于 $A$ 的正西 10 海里处的一点 $B$ 测得此船的方向为东偏北 $42°$。若这船于三刻钟内抵坞，求初测时与 $B$ 的距离。

110\. 由平地上的一点 $O$ 测得山坡上的两点 $P$ 与 $Q$ 的仰角各为 $38°$ 与 $25°$；由 $O$ 至山麓 $A$ 的距离为 500 m，而 $A Q$ 的长为 320 m。已知各点都在同一竖直面内，求 $P Q$ 的长和山坡的斜度。

111\. 一架飞机以每小时 180 km 的等速度向东飞行，一人见此机在其北而仰角为 $9°30'$。一分钟后其方向变为北偏东 $62°$。若此机的高/* p.315 */度为一定，求它的高和第二次观测时的仰角。

\*112\. 某人在岸上望见海中两浮标在一直线上，此线与海岸线所成的角为 $alpha$。此人沿岸向前走一距离 $a$，这两浮标对于此人所张的角为 $alpha$，再向前走一距离 $b$，见所张的角仍为 $alpha$。设海岸为一直线，此人的高度不计，求证两浮标间的距离为 $(a + b / 2) sec alpha - (2 a (a + b)) / (2 a + b) cos alpha$。

// “现于”原书作“今于”，按 TERMINOLOGY 4.7“今（现在义）→现”
113\. 有每边长 80 m 的正三角形地。现于这三角形中建一塔，由三角形的各顶点测得塔顶的仰角的正切各为 $sqrt(3) + 1$，$sqrt(2)$，$sqrt(2)$。求塔高。

\*114\. 在曲柄机构的装置中，$O A$ 为 20 cm 长的曲柄绕 $O$ 而转动；连此曲柄为一 50 cm 长的轴 $A P$，$P$ 在过 $O$ 的直线上左右移动，当 $P$ 由最远点移至全程的 $1 / 4$，$1 / 2$，$3 / 4$ 处时，求 $O A$ 与 $O P$ 间所成的角。

#plainfig((fig-r-114(), [（第 114 题）]))
