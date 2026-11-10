// 习题答案（原书 p.231–241，书末最后一页）
#import "/common/series.typ": *

// 原书按章分组：“习题 x·y”后列出有答案的题号；复习题、总复习题的答案单列（无习题标签，用小标题）。
// 原书只列有答案的题，题号不连续，照录。题号后的“.”不是句末标点，不改；
// 各条末尾的“．”改作“。”，其余分号、逗号一律照原书用全角（数学式内部的逗号照数学式写）。
// 原书个别印得不清、疑似原书错误之处见 books/algebra-4/notes/appendix.md。

#let q(n) = h(0.8em) + [#n.] + sym.wj + h(0.2em) + sym.wj
// 答案里有不少分式，行距放宽，免得上下行的分式互相压住
#set par(leading: 0.9em)
#show math.equation.where(block: false): set text(top-edge: "bounds", bottom-edge: "bounds")
#let sec(title) = {
  set par(first-line-indent: 0em)
  block(above: 1.4em, below: 0.6em, sticky: true,
    align(center, text(font: fonts.hei, weight: "bold", size: 1.05em)[#title]))
}

// p.231
= 习题答案

#sec[第一章]

#answers("1·1")[#q(1)25，20；#q(2)15。]

#answers("1·2")[#q(1)\(2) 60，(3) 120，(4) 120；#q(2)\(1) 16，12，(2) 64，24，(3) 256，24；#q(3)\(1) 504，(2) 729。]

#answers("1·3(1)")[#q(1)\(1) 120，(2) 5040，(3) 5，(4) 3；#q(2)\(1) $mx(11, 2, 3)$#sym.wj，(2) $49/792$#sym.wj，(3) 4，(4) $mx(2, 1, 2)$#sym.wj。]

#answers("1·3(2)")[#q(1)\(1) 120，(2) 360；#q(2)60；#q(3)720；#q(4)20。]

#answers("1·4")[#q(1)\(1) 1，(2) 210；#q(3)120。]

#answers("1·5(1)")[#q(1)325；#q(2)\(1) 24，(2) 96，(3) 48；#q(3)\(1) 48，(2) 288/* 原书作 672 */，(3) 240，(4) 480；#q(4)30，15，15。]

#answers("1·5(2)")[#q(1)\(1) 100，(2) 36，(3) 52，(4) 48；#q(2)\(1) 48，(2) 360。]

#answers("1·6")[#q(1)2401；#q(2)810000；#q(3)900，648，9，243；#q(4)\(1) 60，(2) 243。]

#answers("1·7")[#q(1)\(1) 10，(2) 60；#q(3)\(1) 20，10，(2) 10，20。]

#answers("1·8(1)")[#q(3)\(1) 8，(2) 7；#q(4)\(1) 28，(2) 56；#q(5)\(1) 120，(2) 210。]

#answers("1·8(2)")[#q(1)\(1) 4，(2) 4，(3) 12，(4) 16，(5) 16；#q(2)\(1) 10，(2) 26，(3) 20，(4) 16；#q(4)116；#q(5)\(1) 217，(2) 494。]

#answers("1·9")[#q(1)\(1) 999，(2) 198；#q(2)\(1) 2，(2) 4。]

#answers("1·10")[#q(1)\(1) 60，(2) 360，(3) 90；#q(2)\(1) 60，(2) 15，(3) 15；#q(3)\(1) 2520，(2) 576，(3) 216。]

// p.232
#answers("1·11(1)")[#q(1)\(1) $95/990$#sym.wj，(2) $97/990$#sym.wj；#q(2)\(1) $8/25$#sym.wj，(2) $17/25$#sym.wj；#q(3)\(1) $1/216$#sym.wj，(2) $29/216$#sym.wj；#q(4)\(1) $188/295$#sym.wj，(2) $96/295$#sym.wj。]

#answers("1·11(2)")[#q(1)\(1) $3/4$#sym.wj，(2) $1/16$#sym.wj，(3) $3/16$#sym.wj，(4) $7/16$#sym.wj；#q(2)$approx 97.0"%"$#sym.wj；#q(3)\(1) $approx 13.5"%"$#sym.wj，(2) $approx 99.3"%"$#sym.wj；#q(4)\(1) $32/243$#sym.wj，(2) $11/243$#sym.wj。]

#sec[复习题一]

#q(2)\(1) 4，(2) 46，(3) 56；#q(3)\(1) 1630，(2) 288，(3) 21，(4) 479；#q(4)\(1) 10080，(2) 30240，(3) 1152；#q(5)\(1) 360，(2) 3888；#q(6)\(1) $64/125$#sym.wj，(2) $48/125$#sym.wj，(3) $112/125$#sym.wj。

#sec[第二章]

#answers("2·1")[#q(1)\(2) $a_n = (n + 2)/(2n)$#sym.wj；#q(2)\(1) $a_n = n^2$#sym.wj，(2) $a_n = n^2 + 1/(n + 1)$#sym.wj。]

#answers("2·3")[#q(2)\(2) $n = 1$#sym.wj，$n >= 10$#sym.wj。]

#sec[复习题二]

#q(3)$n >= 3$#sym.wj。

#sec[第三章]

#answers("3·1")[#q(3)\(1) $-560$#sym.wj，(2) 160。]

#answers("3·3(1)")[#q(1)\(1) $T_4 = 220 a^9 b sqrt(b)$#sym.wj，$T_9 = 495 a^4 b^4$#sym.wj，(2) $103680 x^8 y^2$#sym.wj，$1180980 x^2 y^8$#sym.wj；#q(2)\(1) $C_12^6 a^6 x^6$#sym.wj，(2) $35/2 x$#sym.wj，$70/x$#sym.wj。]

#answers("3·3(2)")[#q(1)\(1) $C_19^8 x^11 a^8$#sym.wj，(2) $C_19^11 x^8 a^11$#sym.wj；#q(2)\(1) $T_7 = C_15^6 = 5005$#sym.wj，(2) 没有；#q(3)252；#q(4)$n = 8$#sym.wj。]

#answers("3·4")[#q(1)\(1) $C_10^5 a^5 b^5$#sym.wj，(2) $C_17^8 x^8$#sym.wj，$C_17^9 x^9$#sym.wj；#q(4)$C_16^8 a^8 b^8$#sym.wj。]

// p.233
#answers("3·5")[#q(2)\(1) $90 root(3, 2)$#sym.wj，(2) $-C_10^5 x^7 sqrt(x)$#sym.wj；#q(3)$10 x^6$#sym.wj，$-10 x^9$#sym.wj。]

#answers("3·6")[#q(1)127；#q(2)511。]

#answers("3·7")[#q(1)1.12；#q(2)0.984；#q(3)0.99；#q(4)1.009；#q(5)1.03；#q(6)0.9964；#q(7)731.921；#q(8)1.030；#q(9)3128；#q(10)255.5。]

#sec[复习题三]

#q(4)3003；#q(5)$-84$#sym.wj；#q(6)\(1) $1 + 2x - 26 x^2$#sym.wj，(2) $135 x^4$#sym.wj，(3) $-168$#sym.wj，(4) $-51$#sym.wj；#q(8)\(1) $2^n$#sym.wj，(2) $2^(n(n + 1) \/ 2)$#sym.wj；#q(10)1；#q(11)\(1) 1.26，(2) 31.84。

#sec[第四章]

#answers("4·2(1)")[#q(1)1，$i$#sym.wj，$-i$#sym.wj，$i$#sym.wj；#q(2)\(1) $-1 + i$#sym.wj，(2) $-1$#sym.wj，(3) $k$#sym.wj 为奇数时：$i$#sym.wj，偶数时：1。]

#answers("4·2(2)")[#q(2)\(1) $-sqrt(2) + i$#sym.wj，(2) $-sqrt(2)/2 i$#sym.wj，(3) 3，(4) $1 - i$#sym.wj；#q(4)\(3) 0，(4) $(2 sqrt(2) - 10) i$#sym.wj；#q(5)\(1) $plus.minus 5i$#sym.wj，(2) $plus.minus 3/2 i$#sym.wj，(3) $plus.minus 2$#sym.wj，$plus.minus 2i$#sym.wj，(4) $plus.minus 2$#sym.wj，$plus.minus sqrt(5) i$#sym.wj。]

#answers("4·3")[#q(4)\(1) $x = 4/3, y = -5/4$#sym.wj，(2) $x = 4, y = 3$#sym.wj，(3) $x = -8, y = 3$#sym.wj 或 $x = 3, y = -8$#sym.wj，(4) $x = 1, y = 3$#sym.wj 或 $x = -1, y = -3$#sym.wj；#q(5)\(1) $m = -1$#sym.wj，$m = 6$#sym.wj，(2) $m = 4$#sym.wj，(3) $m = -1$#sym.wj。]

#answers("4·4(1)")[#q(3)\(2) 2，(4) 是；#q(4)以原点为中心，1 和 2 为半径的两个同心圆所构成的圆环（边界在内）。]

#answers("4·4(2)")[#q(1)\(1) 0，(2) $pi$#sym.wj，(3) $pi/2$#sym.wj，(4) $3/2 pi$#sym.wj；#q(2)\(1) $pi/3$#sym.wj，(2) $5/3 pi$#sym.wj，(3) $2/3 pi$#sym.wj，(4) $4/3 pi$#sym.wj；#q(3)\(1) $212 degree 20'$#sym.wj，(2) $67 degree 23'$#sym.wj。]

#answers("4·4(3)")[#q(1)\(1) $5(cos 36 degree 52' + i sin 36 degree 52')$#sym.wj，(2) $13(cos 247 degree 23' + i sin 247 degree 23')$#sym.wj，(3) $6(cos 330 degree + i sin 330 degree)$#sym.wj，(4) $5 sqrt(2) (cos 135 degree + i sin 135 degree)$#sym.wj，(5) $5(cos pi + i sin pi)$#sym.wj，(6) $13(cos 0 + i sin 0)$#sym.wj，(7) $6(cos pi/2 + i sin pi/2)$#sym.wj，/* p.234 */(8) $4(cos 3/2 pi + i sin 3/2 pi)$#sym.wj；#q(2)\(1) $2 + 2 sqrt(3) i$#sym.wj，(2) $-4$#sym.wj，(3) $-4i$#sym.wj，(4) $2 sqrt(3) - 2i$#sym.wj；#q(3)$r[cos(-theta) + i sin(-theta)]$#sym.wj 或 $r[cos(2 pi - theta) + i sin(2 pi - theta)]$#sym.wj；#q(4)\(1) 2，$11/6 pi$#sym.wj，(2) 3，$5/4 pi$#sym.wj，(3) $sqrt(3)$#sym.wj，$15 degree$#sym.wj，(4) 1，$4/3 pi$#sym.wj。]

#answers("4·5(1)")[#q(1)\(1) $7/6 - 5/12 i$#sym.wj，(2) $-2 sqrt(2) i$#sym.wj，(3) $2b + 2a i$#sym.wj，(4) $(y - x) + 5(y - x) i$#sym.wj，(5) $2i$#sym.wj；#q(2)\(1) $-(sqrt(3) + 1)/2 + (sqrt(3) - 1)/2 i$#sym.wj，(2) $2 + 2 sqrt(3) i$#sym.wj；#q(3)\(1) $x = 4, y = 2$#sym.wj，(2) $x = -1, y = -2$#sym.wj，(3) $x = 9/2, y = 18$#sym.wj；#q(5)\(1) $z = 2 + 3i$#sym.wj，(2) $z = 3/2 - 2i$#sym.wj。]

#answers("4·5(2)")[#q(2)\(2) $3 + i$#sym.wj，(3) $sqrt(10)$#sym.wj，(4) $sqrt(2)$#sym.wj；#q(3)$2/3 sqrt(3) + i$#sym.wj；#q(4)60.83 公斤。]

#answers("4·6(1)")[#q(1)\(1) $18 + 15i$#sym.wj，(2) $6 - 17i$#sym.wj，(3) $0.11 - 0.07i$#sym.wj，(4) 1；#q(2)\(1) $(a^2 + b)^2$#sym.wj，(2) $(a - b) + (a - b) i$#sym.wj；#q(3)\(2) (i) $(x + 2i)(x - 2i)$#sym.wj，(ii) $(x + a)(x - a)(x + a i)(x - a i)$#sym.wj，(iv) $(x + 1/2 + sqrt(3)/2 i)(x + 1/2 - sqrt(3)/2 i)$#sym.wj；#q(4)\(1) 6，$-4$#sym.wj，(2) 1，11。]

#answers("4·6(2)")[#q(1)\(1) $sqrt(3) + sqrt(3) i$#sym.wj，(2) 16，(3) $sqrt(2)(cos theta + i sin theta)$#sym.wj，(4) $-sqrt(2)/2 + sqrt(2)/2 i$#sym.wj。]

#answers("4·7")[#q(1)\(1) $-1 + i$#sym.wj，(2) $-1/5 - 2/5 i$#sym.wj，(3) $1/2$#sym.wj，(4) $cos(-75 degree) + i sin(-75 degree)$#sym.wj，(5) $-sqrt(6)/4 + sqrt(2)/4 i$#sym.wj；#q(2)\(1) $1/2$#sym.wj，(2) $3/2 - 3/2 i$#sym.wj；#q(3)\(1) $z = 6 + 2i$#sym.wj，(2) $z = -1/2 + sqrt(3)/2 i$#sym.wj；#q(4)$u = 1 + i, v = 2 - i$#sym.wj；#q(5)1。]

#answers("4·8(1)")[#q(1)\(1) $-119 - 120i$#sym.wj，(2) $-117 + 44i$#sym.wj，(3) $1/8 i$#sym.wj，(4) $2 + 2 sqrt(3) i$#sym.wj；#q(2)\(1) 82，(2) $1/318 (44 - 5i)$#sym.wj；#q(3)\(1) $-1$#sym.wj，(2) $-i$#sym.wj。]

// p.235
#answers("4·8(2)")[#q(1)\(1) $243i$#sym.wj，(2) $729i$#sym.wj，(3) 4096，(4) 1；#q(2)\(1) 2，(2) $-16$#sym.wj，(3) 0，(4) $-64$#sym.wj。]

// 6 题 cos nθ 公式里第三项，原书作 sin^22 θ（多印了一个 2），已订正为 sin^2 θ
#answers("4·8(3)")[#q(2)$n = 6$#sym.wj，$-1$#sym.wj；#q(3)$n = 4$#sym.wj；#q(4)$n = 3$#sym.wj/* 原书作 n = 4 */；#q(6)$cos n theta = cos^n theta - C_n^2 cos^(n-2) theta sin^2 theta /* 原书作 sin^22 θ（多印一个 2） */ + C_n^4 cos^(n-4) theta sin^4 theta - dots.c$#sym.wj，最后一项，当 $n$#sym.wj 为偶数时为 $(-1)^(n/2) sin^n theta$#sym.wj，奇数时为 $(-1)^((n-1)/2) dot n cos theta sin^(n-1) theta$#sym.wj；$sin n theta = C_n^1 cos^(n-1) theta sin theta - C_n^3 cos^(n-3) theta sin^3 theta + C_n^5 cos^(n-5) theta sin^5 theta - dots.c$#sym.wj，最后一项，当 $n$#sym.wj 为偶数时为 $(-1)^((n-2)/2) n cos theta sin^(n-1) theta$#sym.wj，奇数时为 $(-1)^((n-1)/2) sin^n theta$#sym.wj。]

// 1 题 (2) 原书漏印 sin（i(6k−1)10°），已补
#answers("4·9(1)")[#q(1)\(1) $2[cos (3k + 1)/6 pi + i sin (3k + 1)/6 pi] (k = 0, 1, 2, 3)$#sym.wj，(2) $sqrt(2) [cos (6k - 1) 10 degree + i /* 原书漏印 sin */ sin (6k - 1) 10 degree] (k = 0, 1, 2, 3, 4, 5)$#sym.wj；#q(2)\(1) $plus.minus (sqrt(2)/2 - sqrt(2)/2 i)$#sym.wj，(2) $root(4, 2) [cos (k 360 degree + 315 degree)/4 + i sin (k 360 degree + 315 degree)/4] (k = 0, 1, 2, 3)$#sym.wj，(3) $root(6, 2) [cos (3k + 1) 20 degree + i sin (3k + 1) 20 degree] (k = 0, 1, 2, 3, 4, 5)$#sym.wj，(4) $root(10, 18) [cos (k 360 degree + 135 degree)/5 + i sin (k 360 degree + 135 degree)/5] (k = 0, 1, 2, 3, 4)$#sym.wj；#q(3)\(1) $-1$#sym.wj，$1/2 plus.minus sqrt(3)/2 i$#sym.wj，(2) $2(1 plus.minus i)$#sym.wj，$2(-1 plus.minus i)$#sym.wj；#q(4)\(1) $-a$#sym.wj，$-a omega$#sym.wj，$-a omega^2$#sym.wj，(2) $a$#sym.wj，$a omega$#sym.wj，$a omega^2$#sym.wj，(3) $plus.minus (sqrt(2)/2 plus.minus sqrt(2)/2 i) a$#sym.wj，(4) $plus.minus a$#sym.wj，$plus.minus a i$#sym.wj。]

#sec[复习题四]

#q(1)\(1) 0，(2) 0；#q(5)\(1) $x = 2, y = 1$#sym.wj，(2) $x = 4, y = 3$#sym.wj，(3) $(1/2, -2)$#sym.wj，$(1/2, 1)$#sym.wj，$(2, -2)$#sym.wj，$(2, 1)$#sym.wj，(4) $x = -1, y = 5$#sym.wj；#q(6)\(1) $64(cos 2 theta + i sin 2 theta)$#sym.wj，(2) $8i (cos 13/12 pi + i sin 13/12 pi)$#sym.wj；#q(7)\(1) 0，(2) 1；#q(8)\(1) $x^4 + 2x^2 + 9$#sym.wj，(2) $x^4 - 2x^2 + 9$#sym.wj；#q(11)\(1) $plus.minus (1 + 2i)$#sym.wj，(2) $plus.minus sqrt(2)/2 (sqrt(15) + i)$#sym.wj，(3) $plus.minus sqrt(2)/2 (sqrt(11) - i)$#sym.wj，(4) $plus.minus sqrt(2)/2 (1 - sqrt(15) i)$#sym.wj；#q(12)\(1) $147/229 + 72/229 i$#sym.wj，(2) $147/229 - 72/229 i$#sym.wj；#q(13)\(1) $z^2 - z + 1 = 0$#sym.wj，/* p.236 */(2) $2z^2 - 2z + 5 = 0$#sym.wj；#q(16)$cases(x = 0, y = 0)$#sym.wj，$cases(x = 1, y = 1)$#sym.wj，$cases(x = omega, y = omega^2)$#sym.wj，$cases(x = omega^2, y = omega)$#sym.wj；#q(17)\(1) $z = 3/4 + i$#sym.wj，(2) $z = -1/2 plus.minus sqrt(3)/2 i$#sym.wj。

#sec[第五章]

#answers("5·1(1)")[#q(1)\(1) 44，(2) 45，(3) 8，(4) $mx(2, 3, 8)$#sym.wj；#q(2)\(1) $-11$#sym.wj，(2) $-8$#sym.wj；#q(3)$a = 4, b = 5$#sym.wj。]

#answers("5·1(3)")[#q(1)\(1) $(x - 1)(x + (1 + sqrt(3) i)/2)(x + (1 - sqrt(3) i)/2)$#sym.wj，(2) $(x + 1)(x - (1 + sqrt(3) i)/2)(x - (1 - sqrt(3) i)/2)$#sym.wj，(3) $(x + 1 + i)(x + 1 - i)(x - 1 + i)(x - 1 - i)$#sym.wj，(4) $(x - (1 + sqrt(3) i)/2)(x - (1 - sqrt(3) i)/2)(x + (1 + sqrt(3) i)/2)(x + (1 - sqrt(3) i)/2)$#sym.wj；#q(2)\(1) $x^4 - 15 x^2 - 10x + 24$#sym.wj，(2) $36 x^4 - 13 x^2 + 1$#sym.wj；#q(3)\(1) $x^2 - (sqrt(2) + sqrt(3)) x + sqrt(6)$#sym.wj，(2) $x^3 - (1 + i) x^2 - x + (1 + i)$#sym.wj。]

#answers("5·1(4)")[#q(1)$p = -2, q = -5, r = 6$#sym.wj；#q(2)$a = -50, b = -10$#sym.wj，商是 $x + 5$#sym.wj；#q(3)\(1) $plus.minus (3 x^2 - 2x - 3)$#sym.wj，(2) $plus.minus (2 x^2 - 3x + 5)$#sym.wj；#q(4)$(x - 1)^3 (x + 3)^3$#sym.wj。]

#answers("5·2(1)")[#q(1)\(1) 商 $3 x^3 + x^2 - 2x - 1$#sym.wj，余 $-4$#sym.wj，(2) 商 $2 x^4 - 2 x^3 + 4 x^2 - 3x + 2$#sym.wj，余 $-23$#sym.wj，(3) 商 $x^2 + 3x + 2$#sym.wj，余 0，(4) 商 $x^3 - x^2 + x - 1$#sym.wj，余 0；#q(2)\(1) $-5639$#sym.wj，(2) 1741；#q(3)\(1) $mx(1, 8, 9)$#sym.wj，(2) $mx(12, 4, 9)$#sym.wj。]

#answers("5·2(2)")[#q(1)\(1) 商 $x^2 + 4$#sym.wj，余 0，(2) 商 $x^3 + x^2 + x + 2$#sym.wj，余 $-3$#sym.wj；#q(2)\(2) $(2x - 3)(3x + 4)(x + i)(x - i)$#sym.wj；#q(3)$k = -9$#sym.wj，$(2x + 3)(x - 1)(x + 3)$#sym.wj。]

#answers("5·3(1)")[#q(2)\(2) 2；#q(3)$(-1 plus.minus sqrt(3) i)/2$#sym.wj；#q(4)\(1) 4，(2) 2，2，2，$-1/2$#sym.wj。]

// p.237 起第 3 题
#answers("5·3(2)")[#q(1)2，2，$-3/2$#sym.wj；#q(2)$1/2$#sym.wj，$-1/2$#sym.wj，$2/3$#sym.wj；/* p.237 */#q(3)$1 plus.minus sqrt(2) i$#sym.wj，$1 plus.minus sqrt(2) i$#sym.wj；#q(4)1，$1 + i$#sym.wj，$2i$#sym.wj；#q(5)$k = -2$#sym.wj，根是 $-2$#sym.wj，$-2 plus.minus sqrt(5)$#sym.wj。]

#answers("5·3(3)")[#q(1)\(1) $-3/5$#sym.wj，(2) 3，(3) 0，(4) $9/4$#sym.wj；#q(2)\(1) $y^3 - p y^2 + q y - r = 0$#sym.wj，(2) $r y^3 + q y^2 + p y + 1 = 0$#sym.wj，(3) $y^3 + k p y^2 + k^2 q y + k^3 r = 0$#sym.wj，(4) $r y^3 - q y^2 + p y - 1 = 0$#sym.wj；#q(3)\(1) $2 y^3 + 15 y^2 + 37y + 31 = 0$#sym.wj，(2) $31 y^3 + 37 y^2 + 15y + 2 = 0$#sym.wj。]

#answers("5·4")[#q(1)\(1) $2 plus.minus sqrt(7) i$#sym.wj，$-8/3$#sym.wj，(2) $1 plus.minus sqrt(3) i$#sym.wj，$1 + sqrt(3)$#sym.wj；#q(2)\(1) $(x + 2)(x - 2 + i)(x - 2 - i) = 0$#sym.wj，即 $x^3 - 2 x^2 - 3x + 10 = 0$#sym.wj，(2) $(x - 2 + i)(x - 2 - i)(x + 1 + i)(x + 1 - i) = 0$#sym.wj，(3) $x(x + i)(x - i)(x - 1 + sqrt(2) i)(x - 1 - sqrt(2) i) = 0$#sym.wj，(4) $(x + 1 - sqrt(3) i)(x + 1 + sqrt(3) i)(x - 1 + sqrt(3) i)(x - 1 - sqrt(3) i) = 0$#sym.wj；#q(3)\(1) $x^3 + x^2 + x - 3 = 0$#sym.wj，(2) 1，$-1 - sqrt(2) i$#sym.wj；#q(4)$1 plus.minus i$#sym.wj，$1 plus.minus 2i$#sym.wj。]

#answers("5·5(1)")[#q(1)\(1) $-2$#sym.wj，3，4，(2) $-1$#sym.wj，2，$-1/2$#sym.wj，(3) 2，$1/2$#sym.wj，$-1/2$#sym.wj，$-1/3$#sym.wj，(4) 3，3，$-1/2$#sym.wj，$(-1 plus.minus sqrt(3) i)/2$#sym.wj；#q(4)\(1) $-1$#sym.wj，$-1$#sym.wj，$-1$#sym.wj，$(1 plus.minus sqrt(7) i)/2$#sym.wj，(2) 1，$-3$#sym.wj，$(-3 plus.minus sqrt(11) i)/2$#sym.wj，(3) $-1$#sym.wj，$3/2$#sym.wj，$1 plus.minus i$#sym.wj，(4) $1/2$#sym.wj，$plus.minus root(4, 2)$#sym.wj，$plus.minus root(4, 2) i$#sym.wj；#q(5)\(1) $(x + 3)(x + 4)(x - 4)$#sym.wj，(2) $(x + 3)(2x - 1)(3 x^2 + 2x - 4)$#sym.wj。]

#answers("5·5(2)")[#q(1)\(1) $1 plus.minus sqrt(2)$#sym.wj，2，(2) $sqrt(2) plus.minus 1$#sym.wj，2；#q(2)$a = b = 1$#sym.wj，根是 1，$1 plus.minus sqrt(2)$#sym.wj；#q(3)$x^4 + 2 x^3 - 5 x^2 + 6x + 2 = 0$#sym.wj；#q(4)$1 plus.minus sqrt(2)$#sym.wj，$-1$#sym.wj；#q(5)$sqrt(3) plus.minus sqrt(2) i$#sym.wj，$-sqrt(3) plus.minus sqrt(2) i$#sym.wj，$-1$#sym.wj。]

#answers("5·6(1)")[#q(1)\(1) $root(4, 4) (cos (4k + 1)/8 pi + i sin (4k + 1)/8 pi) (k = 0, 1, 2, 3)$#sym.wj，(3) $root(10, 8) (cos (8k + 7)/20 pi + i sin (8k + 7)/20 pi) (k = 0, 1, 2, 3, 4)$#sym.wj，(5) $root(4, 2) (cos (12k + 11)/24 pi + i sin (12k + 11)/24 pi) (k = 0, 1, 2, 3)$#sym.wj；#q(2)\(2) $-3/2$#sym.wj，$(-3 plus.minus 3 sqrt(3) i)/4$#sym.wj，(4) $5/2 sqrt(2) (-1 plus.minus i)$#sym.wj，$5/2 sqrt(2) (1 plus.minus i)$#sym.wj，/* p.238 */(6) $plus.minus 1/2 i$#sym.wj，$(-sqrt(3) plus.minus i)/4$#sym.wj，$(sqrt(3) plus.minus i)/4$#sym.wj。]

// 1 题 (3) 的根指数（原书印得不清）按 x^3 = 1 ± i 推得为 6，见 notes/appendix.md
#answers("5·6(2)")[#q(1)\(1) $root(3, 2)$#sym.wj，$root(3, 2) ((-1 plus.minus sqrt(3) i)/2)$#sym.wj，$root(3, 3)$#sym.wj，$root(3, 3) ((-1 plus.minus sqrt(3) i)/2)$#sym.wj，(2) $plus.minus sqrt(2)/2$#sym.wj，$plus.minus sqrt(2)/2 i$#sym.wj，$plus.minus sqrt(3)/3 i$#sym.wj，$plus.minus sqrt(3)/3$#sym.wj，(3) $root(6, 2) (cos (8k + 1)/12 pi + i sin (8k + 1)/12 pi) (k = 0, 1, 2)$#sym.wj，$root(6, 2) (cos (8k + 7)/12 pi + i sin (8k + 7)/12 pi) (k = 0, 1, 2)$#sym.wj，(4) $plus.minus 1$#sym.wj，$plus.minus i$#sym.wj，$(sqrt(6) plus.minus sqrt(6) i)/2$#sym.wj，$(-sqrt(6) plus.minus sqrt(6) i)/2$#sym.wj；#q(2)\(1) 0，0，0，0，$root(4, 6) (-sqrt(2)/2 plus.minus sqrt(2)/2 i)$#sym.wj，$root(4, 6) (sqrt(2)/2 plus.minus sqrt(2)/2 i)$#sym.wj，$-sqrt(2)/2 plus.minus sqrt(2)/2 i$#sym.wj，$sqrt(2)/2 plus.minus sqrt(2)/2 i$#sym.wj，$root(4, 5) (-sqrt(2)/2 plus.minus sqrt(2)/2 i)$#sym.wj，$root(4, 5) /* 原书作 ∜4（扫描所印；由 y = −2 得 x⁴ = −5，应为 ∜5） */ (sqrt(2)/2 plus.minus sqrt(2)/2 i)$#sym.wj，(2) $plus.minus i$#sym.wj，$plus.minus sqrt(5) i$#sym.wj，$1 plus.minus 2i$#sym.wj，$-1 plus.minus 2i$#sym.wj。]

#answers("5·6(3)")[#q(1)$plus.minus i$#sym.wj，$(-1 plus.minus sqrt(3) i)/2$#sym.wj；#q(2)$-2 plus.minus sqrt(3)$#sym.wj，$(1 plus.minus sqrt(15) i)/4$#sym.wj；#q(3)$(3 plus.minus sqrt(5))/2$#sym.wj，$(-1 plus.minus 2 sqrt(2) i)/3$#sym.wj；#q(4)$-1$#sym.wj，2，$1/2$#sym.wj，$-2 plus.minus sqrt(3)$#sym.wj；#q(5)$-1$#sym.wj，$(1 plus.minus sqrt(3) i)/2$#sym.wj，$(3 plus.minus sqrt(5))/2$#sym.wj；#q(6)2，$1/2$#sym.wj，$(1 plus.minus sqrt(3) i)/2$#sym.wj，$(-3 plus.minus sqrt(5))/2$#sym.wj。]

#answers("5·6(4)")[#q(1)1，$plus.minus i$#sym.wj，$(-3 plus.minus sqrt(7) i)/4$#sym.wj/* 原书作 ±(−3±√7 i)/4，多一个 ± */；#q(2)1，$(3 plus.minus sqrt(5))/2$#sym.wj，$(-1 plus.minus 2 sqrt(2) i)/3$#sym.wj；#q(3)$plus.minus 1$#sym.wj，2，$1/2$#sym.wj，$-3$#sym.wj，$-1/3$#sym.wj。]

#answers("5·6(5)")[#q(1)2，2，$-1/2$#sym.wj，$-1/2$#sym.wj；#q(2)$1 plus.minus sqrt(2)$#sym.wj，$(1 plus.minus sqrt(5))/2$#sym.wj；#q(3)$-1 plus.minus sqrt(2)$#sym.wj，$-2$#sym.wj，$1/2$#sym.wj；#q(4)$-1 plus.minus sqrt(2)$#sym.wj，$(-1 plus.minus sqrt(5))/2$#sym.wj，$-2$#sym.wj，$1/2$#sym.wj。]

#sec[复习题五]

#q(1)\(1) 商 $x^2 - x + 2$#sym.wj，余 $-12$#sym.wj，(2) 商 $x^3 + 2x - 3$#sym.wj，余 20；#q(2)\(1) $-3$#sym.wj，/* p.239 */(2) $-7693$#sym.wj；#q(3)\(1) $a = -52, b = -15$#sym.wj，(2) $a = 24, b = 2$#sym.wj，(3) $a = 3, b = -4$#sym.wj，(4) $a = 2, b = 3, c = 3$#sym.wj；#q(4)\(1) $-x$#sym.wj；#q(6)\(1) $k = 25$#sym.wj，根是 $-3$#sym.wj，$-3 plus.minus sqrt(2)$#sym.wj，(2) $k = plus.minus 6$#sym.wj，根是 $plus.minus 1$#sym.wj，$plus.minus 2$#sym.wj，$minus.plus 3$#sym.wj，(3) $k = -92$#sym.wj，根是 1，2，4，6；#q(7)\(2) $2 plus.minus sqrt(3)$#sym.wj，$(5 plus.minus sqrt(7) i)/4$#sym.wj；#q(8)\(1) $-6$#sym.wj，(2) $-13$#sym.wj；#q(9)\(1) $y^3 - 6 y^2 + 8y - 8 = 0$#sym.wj，(2) $y^3 + 2 y^2 + 5y - 1 = 0$#sym.wj；#q(10)\(1) $plus.minus i$#sym.wj，$-2 plus.minus i$#sym.wj，(2) $-i$#sym.wj，$(1 plus.minus sqrt(3) i)/2$#sym.wj；#q(11)\(1) $2 plus.minus sqrt(3)$#sym.wj，$-1/3$#sym.wj，$-3/2$#sym.wj，(2) $sqrt(3)$#sym.wj，$2 plus.minus i$#sym.wj；#q(12)\(1) $(x - 2 - 3i)(x - sqrt(2))(x + 3) = 0$#sym.wj，(2) $(x - 2 - 3i)(x - 2 + 3i)(x - sqrt(2))(x + 3) = 0$#sym.wj，(3) $(x - 2 - 3i)(x - 2 + 3i)(x - sqrt(2))(x + sqrt(2))(x + 3) = 0$#sym.wj；#q(13)\(1) 1，$plus.minus 5/2$#sym.wj，(2) $-3$#sym.wj，$1/2$#sym.wj，(3) $1/2$#sym.wj，$-2/3$#sym.wj，$3/4$#sym.wj，(4) 没有有理根；#q(14)\(1) $x^2 (x - 2)(x + 3)(x^2 + x + 1)$#sym.wj，(2) $x^2 (x - 2)(x + 3)(x - (-1 + sqrt(3) i)/2)(x - (-1 - sqrt(3) i)/2)$#sym.wj；#q(16)\(1) $-1$#sym.wj，$(1 plus.minus sqrt(3) i)/2$#sym.wj，2，$-1 plus.minus sqrt(3) i$#sym.wj，(2) $plus.minus sqrt(2)$#sym.wj，$plus.minus sqrt(2) i$#sym.wj，$plus.minus sqrt(3)$#sym.wj，$plus.minus sqrt(3) i$#sym.wj，(3) 1，$(-1 plus.minus sqrt(3) i)/2$#sym.wj，$(7 plus.minus 3 sqrt(5))/2$#sym.wj，(4) $root(3, i)$#sym.wj，$root(3, 2 + 2i)$#sym.wj。

#sec[第六章]

#answers("6·1(1)")[#q(1)\(1) 17，(2) $-1/3$#sym.wj，(3) 1，(4) $-2 b^3$#sym.wj；#q(3)\(1) $x = 1, y = -2$#sym.wj，(2) $-3$#sym.wj，1，(3) $a + b$#sym.wj，$a - b$#sym.wj，(4) $a$#sym.wj，$b$#sym.wj。]

// 2 题 (2) 末句原书作“k≠0 或 k≠1”，已订正为“且”
#answers("6·1(2)")[#q(1)\(1) 有唯一解，(2) 有无限多组解，(3) 无解，(4) 有唯一解；#q(2)\(1) $k != plus.minus 1$#sym.wj 时，$x = k/(k + 1)$#sym.wj，$y = (2k + 1)/(k + 1)$#sym.wj，$k = 1$#sym.wj 时，有无限多组解，$k = -1$#sym.wj 时，无解，(2) $k = 0$#sym.wj 或 $k = 1$#sym.wj 时，有无穷多组解，$k != 0$#sym.wj 且/* 原书作“或” */ $k != 1$#sym.wj 时，有唯一解 $x = k + 1, y = k - 1$#sym.wj。]

#answers("6·2(1)")[#q(1)\(1) 18，(2) 74；/* p.240 */#q(2)\(1) $a^3 + b^3 + c^3 - 3 a b c$#sym.wj，(2) $2 x y z$#sym.wj。]

#answers("6·2(2)")[#q(2)\(1) 0，(2) $mx(1, 19, 108)$#sym.wj；#q(4)\(1) 16，(2) 36。]

#answers("6·3")[#q(2)\(1) $-94$#sym.wj，(2) 5；#q(3)\(1) 27，(2) 92；#q(4)\(1) $-2000$#sym.wj，(2) $mx(1, 1, 12)$#sym.wj。]

#answers("6·4(1)")[#q(1)\(1) $x = 1, y = 2, z = 3$#sym.wj，(2) $x = mx(1, 6, 7), y = 1, z = 5/7$#sym.wj，(3) $x = 1, y = 3, z = 5$#sym.wj，(4) $x = (a + b)/2, y = (b + c)/2, z = (c + a)/2$#sym.wj；#q(2)\(1) 无穷多组解，(2) 无解，(3) 无解，(4) 无解，(5) 无穷多组解，(6) 无穷多组解。]

#answers("6·4(2)")[#q(1)\(1) $x = k, y = 0, z = -k$#sym.wj，(2) $x = 0, y = 2k, z = k$#sym.wj，(3) $x = 0, y = k, z = 2k$#sym.wj，(4) $x = k, y = -k, z = k$#sym.wj。]

#sec[复习题六]

#q(1)\(3) $x = 1, y = 1, z = 1$#sym.wj，(4) $x = -5, y = 5, z = 15$#sym.wj；#q(2)\(1) 无解，(2) 无穷多组解，(3) 无解，(4) 无穷多组解，(5) 无解，(6) 无解，(7) 无穷多组解，(8) 无穷多组解；#q(3)\(1) 44，(2) 8，(3) 27，(4) $a(a - b)(b - c)$#sym.wj，(5) 0，(6) $a^2 (c - b) + b^2 (a - c) + c^2 (b - a)$#sym.wj；#q(4)\(1) $4 a b c$#sym.wj，(2) 0，(3) $8 a b c$#sym.wj；#q(6)\(1) $x = 2$#sym.wj，$x = -3$#sym.wj，(2) 2，(3) $x = 4$#sym.wj；#q(7)\(1) $x = y = z = 0$#sym.wj，(2) $x = k, y = -k, z = -k$#sym.wj，(3) $x = y = z = 0$#sym.wj，(4) $x = y = z = 0$#sym.wj，(5) $x = k(a + b + c), y = -k, z = -k$#sym.wj，(6) $x = -2k, y = -2k, z = k$#sym.wj；#q(8)$k = 0$#sym.wj，$-3 plus.minus 2 sqrt(21)$#sym.wj。

#sec[总复习题]

#q(1)\(2) 90，45；#q(2)\(2) 1，(3) 4，(4) 没有；#q(3)\(1) 1 或 4，(2) 4，(3) 6；#q(4)\(1) $x = 15, y = 5$#sym.wj，(2) $m = 34, n = 14$#sym.wj；#q(6)\(1) 42，(2) $1/7$#sym.wj；#q(7)\(1) 100000，(2) 0.00001，(3) 50000，50000，(4) 0.01008；#q(8)\(1) 280，(2) 560；#q(9)\(1) 1960，(2) 3115，(3) 3850，(4) 2940，(5) 1058400；#q(10)\(1) 7，(2) 25，(3) 10；/* p.241 */#q(12)$n = 8, x = 4, y = 1/2$#sym.wj；#q(15)\(1) $cases(x = 0, y = 0)$#sym.wj，$cases(x = 1, y = 1/3)$#sym.wj，(2) 无解，(3) $cases(x = 0, y = 0)$#sym.wj，$cases(x = 3/2, y = 3/4)$#sym.wj，(4) $cases(x = 3/2, y = 3/4)$#sym.wj；#q(16)\(1) $cases(x = 1/3, y = 0)$#sym.wj，(2) $cases(x = 1, y = 3)$#sym.wj，$cases(x = -1, y = -3)$#sym.wj，$cases(x = 3/4, y = 4)$#sym.wj，$cases(x = -3/4, y = -4)$#sym.wj；#q(17)\(1) $3/2 - 2i$#sym.wj，(2) $cases(u = (-1 + 7i)/5, v = (-1 - 7i)/5)$#sym.wj，$cases(u = 1 - i, v = 1 + i)$#sym.wj；#q(19)\(1) $2 x^3 - 3 x^2 - 11x + 6$#sym.wj，(2) $x^4 - 3/2 x^3 + x^2 - 3/2 x + 1$#sym.wj，(3) $2 x^3 - 9 x^2 + 7x + 6$#sym.wj；#q(20)\(1) 1，1，$-2$#sym.wj，$-4$#sym.wj，(2) 2，3，$-3$#sym.wj，$-4$#sym.wj，(3) $-1$#sym.wj，2，$1/2$#sym.wj，$-2 plus.minus sqrt(3)$#sym.wj，(4) 1，$2 plus.minus sqrt(3)$#sym.wj，$3 plus.minus 2 sqrt(2)$#sym.wj；#q(21)\(1) 3，$-5$#sym.wj，$2 - sqrt(3)$#sym.wj，(2) 1，$plus.minus i$#sym.wj；#q(22)\(3) $9/8$#sym.wj；#q(23)\(1) $x > 3$#sym.wj，(2) $-1 < x < 7$#sym.wj；#q(25)\(1) 0，(2) 0，(3) $9 omega$#sym.wj，(4) $9 omega^2$#sym.wj。
