// 习题答案（原书 p.309–316，书末最后一页）
#import "/common/series.typ": *

// 原书按章分组：“习题 x·y”后列出有答案的题号；复习题、总复习题的答案单列（无习题标签，用小标题）。
// 原书只列有答案的题，题号不连续，照录。题号后的“.”不是句末标点，不改；
// 各条末尾的“．”改作“。”，其余分号、逗号一律照原书用全角（数学式内部的逗号照数学式写）。
// 习题 2·3 与 2·4 合为一组，标签为 "2·3~2·4"。

#let q(n) = h(0.8em) + [#n.] + sym.wj + h(0.2em) + sym.wj
// 答案里有不少分式、根式，行距放宽，免得上下行互相压住
#set par(leading: 0.9em, justify: false)
#show math.equation.where(block: false): it => math.display(it)
#show math.equation.where(block: false): set text(top-edge: "bounds", bottom-edge: "bounds")
#let sec(title) = {
  set par(first-line-indent: 0em)
  block(above: 1.4em, below: 0.6em, sticky: true,
    align(center, text(font: fonts.hei, weight: "bold", size: 1.05em)[#title]))
}

// p.309
= 习题答案

#sec[第一章]

#answers("1·1")[#q(1)不一定是有理数；#q(2)3.6；#q(4)不一样；#q(5)$a rt b = 5 rt 4$#sym.wj，它们的比没有变化；#q(7)第一个分点把全线段分成 1 与 5 之比，第二个分点恰是已知线段的中点；#q(8)$A C$ 与 $C B$ 分别长 19.2 厘米，28.8 厘米；#q(9)延长 $A B$ 至 $C$#sym.wj，使 $B C$ 长 8 厘米；#q(10)$3 rt 5$ 和 $5 rt 2$#sym.wj。]

#answers("1·2")[#q(5)\(1) $2 rt 9$#sym.wj，(2) $1 rt 6$#sym.wj，(3) $n rt m$#sym.wj，(4) $3 rt 2$#sym.wj，(5) $1 rt 1$#sym.wj；#q(7)\(1) $x = 6$#sym.wj，(2) $x = 4$#sym.wj，(3) $x = 8 a$#sym.wj，(4) $x = 10 / 3$#sym.wj，(5) $x = 3 sqrt(3) a b$#sym.wj；#q(8)\(1) $x = 3$#sym.wj，(2) $x = (2 b) / (a + b)$#sym.wj，(3) $x = 12.5$#sym.wj，(4) $x = (3 b) / (a - b)$#sym.wj；#q(9)是成比例的线段；#q(13)\(1) $1 rt 4$#sym.wj，(2) $2 rt 1$#sym.wj，(3) $34 rt 25$#sym.wj，(4) $a rt b$ 或 $c rt d$#sym.wj；#q(15)\(1) $1 rt 3$ 和 $2 rt 3$#sym.wj，(2) $m rt m + n$ 和 $n rt m + n$#sym.wj；#q(17)$A D = 18 "cm"$#sym.wj，$D B = 12 "cm"$#sym.wj；#q(18)21 cm；#q(19)$A B = 120 "cm"$#sym.wj，$C B = 72 "cm"$#sym.wj；#q(20)$d = 10 "cm"$#sym.wj。]

#answers("1·3")[#q(1)\(1) 平行，(2) 平行，(3) 不平行；#q(5)不正确；#q(11)$A B' = 6 "cm"$#sym.wj，$B' C' = 10 "cm"$#sym.wj，$C' D' = 12 "cm"$#sym.wj；#q(13)$A B = 80 "m"$#sym.wj；#q(14)44 厘米；#q(15)\(1) 14.4 厘米，(2) 2.8 厘米，4.2 厘米，3.6 厘米，5.4 厘米。]

#answers("1·5")[#q(6)\(1) $A D = 8 "cm"$#sym.wj，$D C = 12 "cm"$#sym.wj，(2) $B C = 10 "cm"$#sym.wj，(3) $A C = 1.8 "cm"$#sym.wj；#q(7)第三边为 10 厘米，如果为 15 厘米，与已知条件矛盾；#q(8)$A O rt O D = b + c rt a$#sym.wj；#q(9)\(1) 是，(2) 不是，(3) 不是，(4) 不是；#q(10)$B N = 10.5 "cm"$#sym.wj，$N C = 7.5 "cm"$#sym.wj；#q(11)$A E = D E = 6 "cm"$#sym.wj，$E C = 4 "cm"$#sym.wj；#q(12)$M N = (a b) / (a + b)$#sym.wj。]

#answers("1·6")[#q(1)不都是相似的；#q(3)相似的；#q(6)不相似；#q(7)$sqrt(a b)$/* p.310 */厘米；#q(8)$A D = 80 sqrt(2) ≈ 113$（厘米）；#q(9)$A E = b^2 / a "dm"$#sym.wj。]

#answers("1·7")[#q(13)5 厘米和 12.5 厘米；#q(14)$A' B' = 5 "cm"$#sym.wj；#q(15)$D C = 9 "cm"$#sym.wj；#q(16)$(l m) / (l + m)$#sym.wj；#q(17)42 dm；#q(18)7.2 cm；#q(19)3 厘米和 1.5 厘米。]

#answers("1·8")[#q(6)42.0 米（准确到 0.1）；#q(7)3.6 米（准确到 0.1）；#q(8)$m / n (b - a) + a = 16.15 "m"$#sym.wj；#q(10)岛高 270 尺，$H B$ 为 400 尺。]

#answers("1·9")[#q(8)$D E = 1.25 "m"$#sym.wj；#q(9)$O D = 6 "cm"$#sym.wj。]

#answers("1·10")[#q(4)$A C = 20 "cm"$#sym.wj，$E F = 15 "cm"$#sym.wj；#q(5)$B E = 4.5 "cm"$#sym.wj。]

#answers("1·11")[#q(4)$A' B' = 18 "m"$#sym.wj，$B' C' = 9 "m"$#sym.wj，$C' D' = 12 "m"$#sym.wj，$D' A' = 36 "m"$#sym.wj；#q(5)$A' B' = 30 "cm"$#sym.wj，$B' C' = 22.5 "cm"$#sym.wj，$C' D' = 13.5 "cm"$#sym.wj，$D' A' = 12 "cm"$#sym.wj；#q(6)200 米和 80 米；#q(7)$(a p) / (a + b)$ 和 $(b p) / (a + b)$#sym.wj；#q(8)$(145 m) / (m + n)$ 厘米和 $(145 n) / (m + n)$ 厘米；#q(9)$(p d) / (p - q)$ 和 $(q d) / (p - q)$ 厘米（$p > q$#sym.wj），$(p d) / (q - p)$ 和 $(q d) / (q - p)$ 厘米（$q > p$#sym.wj）；#q(10)54 厘米。]

#answers("1·13")[#q(2)不是位似三角形；#q(4)应该补充一个有关的固定线段，如三角形的某一边或角平分线，高，……等，才能使这样的三角形的大小也固定下来。]

#sec[复习题一]

#q(8)30 cm 和 40 cm；#q(11)4 厘米；#q(12)$(n a + m b) / (m + n)$#sym.wj；#q(13)$(a c) / (b + c)$ 及 $(a b) / (b + c)$#sym.wj；#q(15)$mx(11, 1, 9)$ 厘米；#q(16)菱形的边长是两线段 $p$ 与 $q$ 的比例中项；#q(17)$R = 26 "cm"$#sym.wj，$r = 10 "cm"$#sym.wj；#q(18)$10 sqrt(15)$ 厘米 $≈ 38.7$ 厘米；#q(19)$O M = (R (R + r)) / (R - r)$#sym.wj；#q(22)6 米；#q(28)$r = (a h) / (2 h + a)$#sym.wj。

// p.311
#sec[第二章]

#answers("2·1")[#q(1)由三角形的顶点向对边作垂线；#q(2)利用直角三角形中 $30°$ 角的对边；#q(5)$B D = 6 "cm"$#sym.wj，$A B = 2 sqrt(13) "cm"$#sym.wj，$B C = 3 sqrt(13) "cm"$#sym.wj；#q(6)直角边在斜边上的射影为 9 厘米和 16 厘米，斜边上的高为 12 厘米；#q(7)$A D = mx(1, 12, 13) "dm"$#sym.wj，$C D = mx(4, 8, 13) "dm"$#sym.wj，$A C = 5 "dm"$#sym.wj；#q(8)$B D = 144 "mm"$#sym.wj，$A B = 169 "mm"$#sym.wj，$A C = 65 "mm"$#sym.wj，$B C = 156 "mm"$#sym.wj。]

#answers("2·2")[#q(1)$10 sqrt(2)$ 厘米；#q(2)$h = sqrt(3) / 2 a$#sym.wj；#q(3)3 厘米；#q(4)$sqrt(2) / 2 c$#sym.wj；#q(5)\(1) $c = 20$#sym.wj，$h = 9.6$#sym.wj，$p = 12.8$#sym.wj，$q = 7.2$#sym.wj，(2) $b = 12$#sym.wj，$h = mx(4, 8, 13)$#sym.wj，$p = mx(1, 12, 13)$#sym.wj，$q = mx(11, 1, 13)$#sym.wj，(3) $a = mx(31, 7, 8)$#sym.wj，$c = mx(36, 1, 8)$#sym.wj，$p = mx(28, 1, 8)$#sym.wj，$q = 8$#sym.wj，(4) $a = 10 sqrt(61)$#sym.wj，$b = 12 sqrt(61)$#sym.wj，$h = 60$#sym.wj，$q = 72$#sym.wj，(5) $a = sqrt(10)$#sym.wj，$b = 3 sqrt(10)$#sym.wj，$c = 10$#sym.wj，$h = 3$#sym.wj，(6) $b = 4$#sym.wj，$c = 5$#sym.wj，$h = 2.4$#sym.wj，$q = 3.2$#sym.wj，(7) $a = 9 sqrt(13)$#sym.wj，$b = 6 sqrt(13)$#sym.wj，$c = 39$#sym.wj，$p = 27$#sym.wj，(8) $b = 9$#sym.wj，$p = mx(39, 1, 41)$#sym.wj，$q = mx(1, 40, 41)$#sym.wj，$h = mx(8, 32, 41)$#sym.wj；#q(6)3.2 米；#q(7)$d = 425 "mm"$#sym.wj；#q(8)173 cm；#q(9)$a = 3$#sym.wj，$b = 4$#sym.wj，$c = 5$#sym.wj；#q(10)$mx(9, 1, 6)$ 尺。]

#answers("2·3~2·4")[#q(1)\(1) $a = 7$#sym.wj，(2) $a = 5$#sym.wj，(3) $a = 21$#sym.wj，(4) $a = sqrt(29)$#sym.wj，(5) $a = 10$#sym.wj；#q(2)\(1) $a = 14$#sym.wj，(2) $a = 26$#sym.wj，(3) $a = 21$#sym.wj，(4) $a = 43$#sym.wj；#q(3)$sqrt(25 - 12 sqrt(3))$#sym.wj；#q(4)6.6 cm；#q(5)$b = sqrt(13 - 6 sqrt(2)) "dm"$#sym.wj；#q(7)70 厘米；#q(8)61 米；#q(10)$a = 6.5 "m"$#sym.wj；#q(12)\(1) 是钝角三角形，(2) 是锐角三角形，(3) 是直角三角形，(4) 是钝角三角形，(5) 是直角三角形，(6) 是锐角三角形；#q(13)$sqrt(13)$ 厘米和 $sqrt(37)$ 厘米；#q(14)$sqrt((l_1^2 + l_2^2 - 2 a^2) / 2)$#sym.wj。]

#answers("2·5")[#q(1)11 厘米；#q(2)9 厘米；#q(3)51.15 分米；/* p.312 */#q(5)\(1) 8，(2) 12，(3) 10.34，(4) 12，(5) 36；#q(6)4.8 分米；#q(7)2.4，$sqrt(23.4)$#sym.wj，$sqrt(13.6)$#sym.wj；#q(8)\(1) 8.5，(2) 10.6。]

#answers("2·6")[#q(1)\(1) $A E = 8 "cm"$#sym.wj，(2) $D E = 9 "cm"$#sym.wj；#q(3)$C D = 6 "cm"$#sym.wj，$A B = (sqrt(5) + 1) / 2 a$#sym.wj；#q(4)约有 3940 公里；#q(5)$R$ 为 21 厘米。]

#answers("2·7")[#q(2)8 厘米和 24 厘米；#q(3)24 厘米；#q(6)$a = R - 1 / 2 sqrt(4 R^2 - b^2)$#sym.wj；#q(7)52.5 毫米或 32.5 毫米。]

#sec[复习题二]

#q(1)$C M = (b c) / (2 c ± a)$#sym.wj；#q(2)1 厘米和 4 厘米；#q(4)$(20 sqrt(5) - 30)$ 厘米，$20 sqrt(5)$ 厘米；#q(5)$r = 6 "dm"$#sym.wj；#q(6)200 毫米；#q(7)$3 sqrt(10)$ 分米或 $sqrt(10)$ 分米；#q(8)13 厘米，14 厘米和 15 厘米；#q(9)$(32 ± 18)$ 厘米；#q(10)25.2 米和 19.8 米；#q(11)是直角三角形，只要求出斜边上的高；#q(13)38 分米和 22 分米；#q(14)27 分米和 64 分米；#q(15)$4 / 5 sqrt(5) R$#sym.wj；#q(16)$O_1 O_2 = sqrt(R^2 + 3 r^2)$#sym.wj；#q(17)$12 sqrt(2)$ 厘米；#q(18)$sqrt(a^2 + b^2 - a b)$#sym.wj，$sqrt(a^2 + b^2 + a b)$#sym.wj；#q(19)$R = 20 "cm"$#sym.wj；#q(20)$a / 2$#sym.wj；#q(27)$A B = 2 sqrt(r_1 r_2)$#sym.wj，$B C = 2 r_2 sqrt(r_1 / (r_1 + r_2))$#sym.wj，$A C = 2 r_1 sqrt(r_2 / (r_1 + r_2))$#sym.wj。

#sec[第三章]

#answers("3·1")[#q(2)是等积形，因为 $△A D D' ≌ △B C C'$#sym.wj。]

#answers("3·2")[#q(2)\(1) 为原面积的 9 倍或 $4 / 9$ 倍，(2) 使各边为原正方形的 2 倍或 $1 / 5$#sym.wj；#q(3)2186.25 米；#q(4)132.7 丈；#q(5)$l^2 / 2$ 平方米；#q(6)2.8 米；#q(7)75 米；#q(8)约 28.5 丈；#q(9)\(1) $2 a b - a^2$#sym.wj，/* p.313 */(2) $a h + t (b - a)$#sym.wj，(3) $a d + 2 t (b - a)$#sym.wj，(4) $d h + 2 t (b - d)$#sym.wj。]

#answers("3·3")[#q(1)面积的变化与高成正比；#q(2)15 $"cm"^2$ 能画无数多个；#q(3)9.7 米；#q(7)30 厘米；#q(8)\(1) $1 / 2 a b$#sym.wj，(2) $sqrt(2) / 2 a b$#sym.wj，(3) $sqrt(3) / 2 a b$#sym.wj；#q(9)$30°$#sym.wj。]

#answers("3·4")[#q(2)$m h$#sym.wj；#q(3)$1 / 2 a sqrt(b^2 - a^2 / 4)$#sym.wj；#q(4)$sqrt(3) / 3 h^2$#sym.wj；#q(5)10.4 米；#q(7)24 厘米；#q(18)9.6 厘米；#q(19)6 平方厘米；#q(21)18 厘米，20 厘米，34 厘米。]

#answers("3·5")[#q(1)$105 sqrt(3)$ 平方厘米；#q(2)由 $A C$ 垂直平分 $B D$#sym.wj，得面积为 $1 / 2 a b$#sym.wj；#q(3)25 尺；#q(5)两底分别为 $42 sqrt(2)$ 米，$14 sqrt(2)$ 米，高为 $21 sqrt(2)$ 米；#q(6)得到平行四边形，面积是原梯形面积的 2 倍。]

#answers("3·6")[#q(1)$△A B D$ 与 $△A C D$ 的高相等；#q(3)面积扩大 4 倍，9 倍，16 倍；#q(4)$5 sqrt(2)$ dm；#q(5)分别是 32 平方厘米，72 平方厘米，128 平方厘米；#q(9)9 平方分米，16 平方分米；#q(10)$6 rt 4$#sym.wj；#q(11)$1 rt 3$#sym.wj；#q(12)$4 rt 6$#sym.wj；#q(13)$2 rt 3$#sym.wj；#q(14)$1 rt 2$#sym.wj；#q(16)$4 rt 21 rt 56$#sym.wj；]

#sec[复习题三]

#q(1)$3 sqrt(101)$ 厘米；#q(4)$3 rt 16$#sym.wj；#q(7)7500 平方米；#q(9)等于对应对角线平方之比；#q(11)6912 平方厘米；#q(14)150 平方分米；#q(15)546 平方厘米。

#sec[第四章]

#answers("4·1")[#q(1)\(1) $108°$#sym.wj，(2) $120°$#sym.wj，(3) $135°$#sym.wj，(4) $144°$#sym.wj，(5) $150°$#sym.wj，(6) $156°$#sym.wj；#q(2)\(1) $72°$#sym.wj，(2) $60°$#sym.wj，(3) $45°$#sym.wj，(4) $36°$#sym.wj，(5) $30°$#sym.wj，(6) $24°$#sym.wj。]

#answers("4·2")[#q(7)$R = 1 / 2 sqrt(4 r^2 + a^2)$#sym.wj；#q(8)\(1) $r = sqrt(3) / 6 a$#sym.wj，$R = sqrt(3) / 3 a$#sym.wj，/* p.314 */(2) $r = a / 2$#sym.wj，$R = sqrt(2) / 2 a$#sym.wj，(3) $r = sqrt(3) / 2 a$#sym.wj，$R = a$#sym.wj。]

#answers("4·3")[#q(1)$sqrt(3)$ 分米；#q(2)$2 sqrt(2)$ 分米；#q(5)$(1 + sqrt(2) / 2) a$#sym.wj；#q(6)$R^2 / r^2 Q$#sym.wj；#q(7)$b = 31.5 "mm"$#sym.wj；#q(8)\(1) 正三角形，正方形，正六边形，(2) 475 块；#q(9)$2 (sqrt(2) + 1)$ 厘米；#q(11)$2 sqrt(3) d$#sym.wj，$3 sqrt(3) d^2$#sym.wj；#q(13)$sqrt(3) / 3 R$#sym.wj；#q(14)$1 / 2 (2 - sqrt(2)) a$#sym.wj；#q(15)$a_12 = sqrt(2 - sqrt(3)) R$#sym.wj，$a_3 = sqrt(3) R$#sym.wj；#q(16)$a_8 = sqrt(2 - sqrt(2)) R$#sym.wj，$a_16 = sqrt(2 - sqrt(2 + 2)) R$#sym.wj；#q(17)$3 R^2$#sym.wj；#q(19)$n = 3$#sym.wj，$r = sqrt(3) (2 + sqrt(3)) R$#sym.wj，$n = 4$#sym.wj，$r = (sqrt(2) + 1) R$#sym.wj，$n = 6$#sym.wj，$r = R$#sym.wj。]

#sec[复习题四]

#q(1)等边或等角的多边形内接或外切于一个圆时，一般都是正多边形，但圆内接偶数边等角多边形不一定是正多边形（如矩形），圆外切偶数边的等边多边形也不一定是正多边形（如菱形）；#q(2)5；#q(3)边数相同的必相似，周长之比等于边的比（或边心距、半径的比），面积之比等于边的平方的比（或周长平方、对应对角线平方的比）；#q(4)$sqrt(2) / 2 R$#sym.wj；#q(5)可以求出这正多边形的边长、边心距和外接圆半径；#q(6)$1 / 2 (sqrt(3) - 1)$ 米；#q(7)$n = 6$ 时，$3 sqrt(3) R$#sym.wj，$9 / 8 sqrt(3) R^2$#sym.wj，$n = 8$ 时，$4 sqrt(2) R$#sym.wj，$sqrt(2 sqrt(2)) R^2$#sym.wj；#q(8)$(sqrt(5) + 1)$ 厘米；#q(10)周长的和为 $4 (3 + sqrt(2)) a$#sym.wj，面积的和为 $7 a^2$#sym.wj；#q(11)$sqrt(6) / 3 a$#sym.wj；#q(12)$4 (sqrt(5) - 1)$ 厘米；#q(13)$sqrt(2 + sqrt(2)) a$#sym.wj，$(1 + sqrt(2)) a$#sym.wj，$sqrt(4 + 2 sqrt(2)) a$#sym.wj；#q(15)$2 sqrt(6) "dm"$#sym.wj；#q(16)$a / 3$#sym.wj；#q(19)$B D = 4.2 "m"$#sym.wj，$a_8 = 2.3 "m"$#sym.wj，$h = 2.1 "m"$#sym.wj；#q(20)$A L = (sqrt(2) - 1) R$#sym.wj。

// p.315
#sec[第五章]

#answers("5·1")[#q(1)\(1) 62.83 米，(2) 219.91 厘米；#q(2)\(1) 3.98 厘米，(2) 0.76 分米；#q(4)$2 π R = 21.77 "cm"$#sym.wj，$2 π r = 10.88 "cm"$#sym.wj；#q(5)圆周增加 15.7 厘米，也增加 10%；#q(6)周长增加 $2 π a$#sym.wj；#q(7)直径增加 31.8 厘米；#q(8)342.8 厘米；#q(9)1.1 厘米；#q(10)60 个齿；#q(11)约为 1.257 米/秒；#q(12)$212 "mm"$#sym.wj；#q(14)\(1) $A$ 轮每分钟转 160 次，(2) 皮带长 58.5 尺；#q(15)$R = R_1 + R_2$#sym.wj。]

#answers("5·2")[#q(1)$l = 14.8 "cm"$#sym.wj；#q(3)23.6 厘米；#q(6)$0.81 l$#sym.wj；#q(7)\(1) $π / 3 a$#sym.wj，(2) $sqrt(2) / 4 π a$#sym.wj，(3) $2 / 9 sqrt(3) π a$#sym.wj；#q(8)圆心角 $α$ 约为 $100°$#sym.wj；#q(9)$127°20'$#sym.wj；#q(10)约为 $15 / 1000$#sym.wj；#q(11)$3 (2 sqrt(3) - 3) l ≈ 1.392 l$#sym.wj。]

#answers("5·3")[#q(1)\(1) $3 / 4 π$#sym.wj，(2) $5 / 12 π$#sym.wj，(3) $3 / 8 π$#sym.wj，(4) $1 / 3 π$#sym.wj，(5) $1 / 8 π$#sym.wj，(6) $π / 10$#sym.wj；#q(2)\(1) $45°$#sym.wj，(2) $108°$#sym.wj，(3) $150°$#sym.wj，(4) $67°30'$#sym.wj，(5) $15°$#sym.wj，(6) $160°$#sym.wj；#q(3)2 厘米；#q(4)\(1) $0.95 l$#sym.wj，(2) $0.90 l$#sym.wj，(3) $0.83 l$#sym.wj；#q(5)$R = 318 "mm"$#sym.wj；#q(6)45 米；#q(7)272 毫米。]

#answers("5·4")[#q(1)3183 平方厘米；#q(2)$2 sqrt(π A)$#sym.wj；#q(3)\(1) 314.2 平方厘米，(2) 直径为 $4 sqrt(3 / π)$ 厘米 $≈ 3.91$ 厘米；#q(4)\(1) 增加到 2.25 倍，(2) 减少到 0.25 倍，(3) 增加到 9 倍，(4) 减少到 0.0625 倍；#q(5)$π (R^2 - r^2)$#sym.wj；#q(6)$π / 2 S$#sym.wj；#q(8)每平方厘米的筒重 0.2 kg；#q(9)$0.57 a^2$#sym.wj；#q(10)$3 / 4$#sym.wj；#q(11)$(8 Q) / π ≈ 2.55 Q$#sym.wj；#q(12)$sqrt(3) / 3 π Q ≈ 1.82 Q$#sym.wj；#q(13)$π / 4 a^2$#sym.wj。]

#answers("5·5")[#q(1)$n = (360 S) / (π R^2)$#sym.wj；#q(3)$R = 2.5 "cm"$ 或 $12.5 "cm"$#sym.wj；#q(4)\(1) $(1 - π / 4) r^2 ≈ 0.215 r^2$#sym.wj，(2) $r^2 - π / 4 r^2 ≈ 0.215 r^2$#sym.wj；/* p.316 */#q(6)窗的面积约为 3.7 平方米；#q(7)约 697 平方厘米；#q(8)$1 / 6 (2 π - 3 sqrt(3)) a^2 ≈ 0.18 a^2$#sym.wj；#q(9)$1 / 24 (π + 6) a^2 ≈ 0.38 a^2$#sym.wj。]

#answers("5·6")[#q(1)\(1) $5.79 "cm"^2$#sym.wj，(2) $18.27 "cm"^2$#sym.wj，(3) $39.2 "cm"^2$#sym.wj，(4) $161.8 "cm"^2$#sym.wj；#q(2)88.5 平方厘米；#q(7)$π / 6 R^2$#sym.wj；#q(9)$π / 6 R^2$#sym.wj。]

#sec[复习题五]

#q(1)$R = 107 / (2 (π - 1)) "cm" ≈ 25 "cm"$#sym.wj；#q(2)约 94.2 米；#q(3)扇形 $D C E$ 的面积 $= 1 / 2$ 扇形 $A O B$ 的面积；#q(5)9 秒；#q(6)$40 / 3 π$ 平方米 $≈ 41.9$ 平方米；#q(7)$1 / 18$ 弧度或 $3.18°$#sym.wj；#q(8)\(1) $0.215 r^2$#sym.wj，(2) $0.685 r^2$#sym.wj，(3) $0.054 r^2$#sym.wj；#q(9)$π / 8 (a^2 + b^2) - 1 / 2 a b$#sym.wj；#q(11)$(π - sqrt(3)) / 2 r^2 ≈ 0.705 r^2$#sym.wj。

#sec[总复习题]

#q(5)$A D = C E = 6 / 5 "cm"$#sym.wj，$D E = 12 / 5 "cm"$#sym.wj，$A C = 3 "cm"$#sym.wj；#q(12)$C D = 42 "cm"$#sym.wj；#q(13)$R = 9 "cm"$#sym.wj，$r = 2 sqrt(14) "cm"$#sym.wj；#q(16)$a$ 边被分得的两线段为 $(a c) / (b + c)$#sym.wj，$(a b) / (b + c)$#sym.wj，$b$ 边的两线段为 $(a b) / (a + c)$#sym.wj，$(b c) / (a + c)$#sym.wj，$c$ 边的两线段为 $(a c) / (a + b)$#sym.wj，$(b c) / (a + b)$#sym.wj；#q(25)6 厘米和 8 厘米；#q(26)$sqrt(3)$ 厘米，$2 sqrt(3)$ 厘米，$3 sqrt(3)$ 厘米；#q(30)$(sqrt(2) + 1) d$#sym.wj；#q(31)$S = 96 "cm"^2$#sym.wj，$h = 9.6 "cm"$#sym.wj；#q(33)$10 sqrt(10 + 2 sqrt(5)) "cm"^2 ≈ 38 "cm"^2$#sym.wj；#q(36)$9 π$ 平方厘米；#q(37)$(4 m n A) / (π (m^2 + n^2))$#sym.wj，
