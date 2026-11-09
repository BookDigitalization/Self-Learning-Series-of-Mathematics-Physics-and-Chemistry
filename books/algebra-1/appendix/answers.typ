// 习题答案（原书 p.285–302）
#import "/common/series.typ": *

// 原书按章分组：“习题 x·y”后列出有答案的题号；复习题、总复习题的答案单列。
// 原书只列有答案的题，题号不连续，照录。题号后的“.”不是句末标点，不改；
// 原书偶有漏印题号后的点（习题 1·17 第 1 题、3·5(1) 第 4 题等），统一补上。
// 各条末尾的“．”改作“。”，其余分号、逗号一律照原书用全角。

#let q(n) = h(0.8em) + [#n.] + sym.wj + h(0.2em) + sym.wj
#let rt = math.class("normal", ":")
// 答案里有不少分式，行距放宽，免得上下行的分式互相压住
#set par(leading: 0.9em)
#show math.equation.where(block: false): set text(top-edge: "bounds", bottom-edge: "bounds")
#let sec(title) = {
  set par(first-line-indent: 0em)
  block(above: 1.4em, below: 0.6em, sticky: true,
    align(center, text(font: fonts.hei, weight: "bold", size: 1.05em)[#title]))
}

// p.285
= 习题答案

#sec[第一章]

#answers("1·1")[#q(8)349；#q(9)10；#q(10)719；#q(11)50；#q(12)1；#q(13)30.5；#q(14)20；#q(15)2.1144；#q(16)0.04；#q(17)$27/700$#sym.wj；#q(18)$mx(7, 1, 5)$#sym.wj；#q(19)$1/25$#sym.wj；#q(20)1。]

#answers("1·6")[#q(3)\(2) 10，(3) 56，(4) 1.64，(5) 0.06。]

#answers("1·8")[#q(2)\(11) $mx(3, 2, 3)$#sym.wj，(12) $-mx(2, 1, 12)$#sym.wj，(13) $-mx(3, 5, 6)$#sym.wj，(14) $mx(2, 2, 35)$#sym.wj，(15) 9.33，(16) $-46.937$#sym.wj，(17) 2.396，(18) 18.96，(19) $mx(3, 19, 30)$#sym.wj，(20) $-mx(8, 113, 300)$#sym.wj；#q(3)\(1) 0，(2) 19，(3) 0，(4) 0。]

#answers("1·9")[#q(1)$-124$#sym.wj；#q(2)$-189$#sym.wj；#q(3)390；#q(4)1.5；#q(5)$mx(39, 2, 3)$#sym.wj；#q(6)$mx(11, 2, 11)$#sym.wj；#q(7)9.04；#q(8)7。]

#answers("1·10")[#q(2)\(13) $-11$#sym.wj，(14) $-33$#sym.wj，(15) $-5$#sym.wj，(16) $-5.7$#sym.wj，(17) $mx(1, 3, 4)$#sym.wj，(18) $-mx(5, 11, 30)$#sym.wj，(19) $-7/8$#sym.wj，(20) 14。]

#answers("1·11")[#q(1)$-mx(5, 1, 3)$#sym.wj；#q(2)400；#q(3)$-mx(18, 3, 35)$#sym.wj；#q(4)9.69；#q(5)$-1/3$#sym.wj；#q(6)$-3$#sym.wj；#q(7)$-3.635$#sym.wj；#q(8)$-mx(26, 1, 3)$#sym.wj。]

#answers("1·12")[#q(1)30；#q(2)$-50$#sym.wj；#q(3)$-16$#sym.wj；#q(4)$-5$#sym.wj；#q(5)$-1$#sym.wj；#q(6)24.3；#q(7)$-6$#sym.wj；#q(8)$77/150$#sym.wj；#q(9)$-0.57$#sym.wj；#q(10)$-27.68$#sym.wj。]

#answers("1·13(1)")[#q(13)1；#q(14)$-mx(2, 1, 3)$#sym.wj；#q(15)3.48；#q(16)$-mx(2, 7, 8)$#sym.wj。]

// p.286
#answers("1·13(2)")[#q(1)9600；#q(2)0.6；#q(3)$-1.2$#sym.wj；#q(4)$mx(40, 1, 2)$#sym.wj；#q(5)$-100000$#sym.wj；#q(6)218.88；#q(7)0.01；#q(8)$-0.004$#sym.wj；#q(9)4；#q(10)$-10$#sym.wj。]

#answers("1·14")[#q(1)3874000；#q(2)$-6$#sym.wj；#q(3)0；#q(4)19；#q(5)$-3700000$#sym.wj；#q(6)74；#q(7)$-20600$#sym.wj；#q(8)$-43$#sym.wj。]

#answers("1·15")[#q(15)$-9/110$#sym.wj；#q(16)$-mx(3, 1, 3)$#sym.wj；#q(17)$-2$#sym.wj；#q(18)$-1/6$#sym.wj；#q(19)$11/100$#sym.wj；#q(20)$-mx(1, 1, 20)$#sym.wj。]

#answers("1·17")[#q(1)3401；#q(2)8；#q(3)375；#q(4)$-61$#sym.wj；#q(5)100；#q(6)$-mx(27, 4, 5)$#sym.wj。]

#answers("1·20")[#q(1)14；#q(2)$1/4$#sym.wj；#q(3)9；#q(4)$1/2$#sym.wj；#q(5)$-mx(4, 1, 3)$#sym.wj；#q(6)$-3$#sym.wj；#q(7)$-16$#sym.wj；#q(8)$-mx(7, 8, 45)$#sym.wj；#q(9)$-mx(3, 1, 2)$#sym.wj；#q(10)$-24$#sym.wj。]

#sec[复习题一]

#q(17)$-2500$#sym.wj；#q(18)781；#q(19)600；#q(20)3；#q(21)$-75$#sym.wj；#q(22)$-1$#sym.wj；#q(23)$-mx(4, 5, 6)$#sym.wj；#q(24)21；#q(25)$mx(6, 9, 16)$#sym.wj；#q(26)$-mx(29, 7, 12)$#sym.wj；#q(27)$-47/48$#sym.wj；#q(28)$-1/4$#sym.wj；#q(29)$-16$#sym.wj；#q(30)$-0.0431$#sym.wj；#q(31)1；#q(32)0；#q(33)$-mx(6, 17, 18)$#sym.wj；#q(34)$-10125$#sym.wj；#q(35)483；#q(36)$mx(2, 3, 7)$#sym.wj。

#sec[第二章]

#answers("2·3")[#q(1)\(2) $a+10$#sym.wj，(3) $1/5 a$#sym.wj，(4) $a+1/5$#sym.wj；（下略）#q(6)$x/(5x-3)$#sym.wj，$(x-1)/(5x-3-1)$#sym.wj；#q(7)$x/(x^2-6)$#sym.wj，$(x^2-6)/x$#sym.wj；#q(8)$(-x+6+3)/x^2$#sym.wj；#q(9)\(1) $2a$#sym.wj，(2) $a b$#sym.wj，(3) $50/a$#sym.wj，(4) $d/a$#sym.wj；#q(10)\(1) $3a-3b$（公里），/* p.287 */(2) $2b+3a$（公里），(3) $d/b-d/a$（小时）；#q(11)\(1) $a^2$#sym.wj，(2) $4a$#sym.wj；#q(12)\(1) $a^2+b^2$ 平方厘米，(2) $a^2-b^2$ 平方厘米，(3) $4a+4b$ 厘米，(4) $4a-4b$ 厘米。]

#answers("2·4")[#q(3)\(1) 8，(2) $-0.008$#sym.wj，(3) $mx(2, 2, 63)$#sym.wj，(4) $1/18$#sym.wj；#q(4)\(1) $-2$#sym.wj，(2) 26，(3) 5.107，(4) $mx(19, 5, 27)$#sym.wj；#q(5)\(1) $-16$#sym.wj，(2) 6，(3) $-0.36$#sym.wj，(4) $-mx(5, 17, 144)$#sym.wj；#q(6)\(1) 4，(2) 0.64，(3) $mx(84, 1, 36)$#sym.wj，(4) $mx(1, 781, 900)$#sym.wj；#q(7)\(1) $mx(1, 12, 13)$#sym.wj，(2) $1/13$#sym.wj，(3) $1/25$#sym.wj，(4) $1/181$#sym.wj；#q(8)\(1) $21/31$#sym.wj，(2) $21/31$#sym.wj，(3) $mx(1, 60, 79)$#sym.wj，(4) $79/139$#sym.wj；#q(11)\(2) 1.62 平方厘米；#q(12)\(2) 0.52 平方厘米。]

#sec[复习题二]

#q(9)\(1) $1/4$#sym.wj，$-35/36$#sym.wj，(2) $-37$#sym.wj，$-5.743$#sym.wj；#q(10)\(1) 4，0，(2) 1，1.69；#q(11)\(1) 24，$mx(4, 1, 6)$#sym.wj，(2) 3，$mx(8, 1, 3)$#sym.wj；#q(12)\(1) $-mx(2, 11, 12)$#sym.wj，$-1/12$#sym.wj，(2) $7/19$#sym.wj，$7/19$#sym.wj；#q(13)4；#q(14)$mx(27, 1, 12)$#sym.wj；#q(15)2；#q(16)486；#q(17)\(1) 10，(2) 0.1；#q(18)$(x+y)^2-(x^2+y^2)$#sym.wj；#q(19)$(x y)/(x+y)$#sym.wj；#q(20)$x(26-x)$#sym.wj；#q(21)$x+48/x$#sym.wj；#q(22)$x(25-x)$#sym.wj；#q(23)$pi x^2+pi (15-x)^2$#sym.wj；#q(24)$2 pi x+2 pi dot 3x$#sym.wj；#q(25)$((x+2x)(x-3))/2$#sym.wj；#q(26)当 $a>0$ 时、$-a$ 是负数，当 $a=0$ 时、$-a=0$#sym.wj，当 $a<0$ 时、$-a$ 是正数；#q(27)当 $b>0$ 时、$a+b>a$#sym.wj，$b=0$ 时、$a+b=a$#sym.wj，$b<0$ 时、$a+b<a$#sym.wj；#q(28)$b>0$ 时、$a-b<a$#sym.wj，$b=0$ 时、$a-b=a$#sym.wj，$b<0$ 时、$a-b>a$#sym.wj；#q(29)$a>0$ 时、$3a>a$#sym.wj，$a=0$ 时、$3a=a$#sym.wj，$a<0$ 时、$3a<a$#sym.wj；#q(30)$a>0$ 时、$a/3<a$#sym.wj，$a=0$ 时、/* p.288 */$a/3=a$#sym.wj，$a<0$ 时、$a/3>a$#sym.wj；#q(31)$a$ 是正数或零；#q(32)$a$ 是负数；#q(33)$a=b$ 或 $a=-b$#sym.wj，即 $a$ 与 $b$ 可能相等，可能是相反的数；#q(34)$a>0$ 时、$a>b$#sym.wj，$a<0$ 时、$a<b$#sym.wj，$a$ 不会等于 $b$、$a$ 不会等于 $0$#sym.wj。

#sec[第三章]

#answers("3·3")[#q(5)\(1) 0.525，(2) 7.111。]

#answers("3·4(1)")[#q(4)\(1) $-9a$#sym.wj，(2) 0，(3) $-18a^2 b^3-14a^3 b^2$#sym.wj，(4) $-5a^2 x^3+2a^3 x^2$#sym.wj，(5) $7a b x^2-4a b^2 x-3a^2 b x$#sym.wj，(6) $-3a^2 x^2 y^3+5a^2 x^3 y^2-3a^3 x^2 y^2$#sym.wj；#q(5)\(1) $-40a$#sym.wj，(2) $13/60 a b$#sym.wj，(3) $-5/6 x^2 y-5/12 x y^2$#sym.wj，(4) $10a^3 x^2-6a^2 x^3$#sym.wj，(5) $-3/4 a b x^2-1/3 a b x-1/3 a b^2 x$#sym.wj，(6) $-5a^2 b^3 x y-11a^3 b^2 x y$#sym.wj。]

#answers("3·4(2)")[#q(3)\(1) $11a$#sym.wj，(2) $-4a^2$#sym.wj，(3) $-a^2 b$#sym.wj，(4) 0，(5) $-5a^3-3a^2+3a$#sym.wj，(6) $8a b-7a c$#sym.wj；#q(4)\(1) $5a$#sym.wj，(2) $6a$#sym.wj，(3) $5a^2$#sym.wj，(4) $13/12 a^2 b^3$#sym.wj；#q(5)\(1) $2x^2 y-2x y^2$#sym.wj，(2) $-14y^2-9y$#sym.wj。]

#answers("3·4(3)")[#q(1)\(1) $3x^3-3x^2+14$#sym.wj，(2) $-4a^3+7a^2-5a+2$#sym.wj，(3) $10a^2-a b$#sym.wj，(4) $19/12 x^2-11/12 x y-2y^2$#sym.wj；#q(2)\(1) $-2a^4-10a^2+5a-6$#sym.wj，(2) $-a^2-mx(4, 2, 3) b^2+1/4 c^2$#sym.wj，(3) $2x^4-3.73x^3 y+2.7x^2 y^2+3.46x y^3+2.4y^4$#sym.wj，(4) 0；#q(3)\(1) $4a-3b$#sym.wj，(2) $4a+4b$#sym.wj，(3) $6a^2$#sym.wj，(4) $-10a b+12b^2$#sym.wj，(5) $2b x+2a y$#sym.wj，(6) $-x^3-10x^2 y+3x y^2+y^3$#sym.wj；#q(4)\(1) $6a+2b$#sym.wj，(2) $2a^3-10a^2+8a-20$#sym.wj，(3) $-3x^3+x^2+12x-14$#sym.wj，(4) $-12x^2 y-2y^3$#sym.wj。]

#answers("3·4(4)")[#q(1)$8x^4+2x^3+6x^2+7x-14$#sym.wj；#q(2)$-14x^3-2x^2+8x+7$#sym.wj；#q(3)$4x^4-x^3-3x-9$#sym.wj；#q(4)$-3a^2+a b+7b^2$#sym.wj；#q(5)$-2x y$#sym.wj；#q(6)$4/3 x^2+1/2 x y$#sym.wj；#q(7)$4/3 x^3-3/4 x^2+x-mx(5, 2, 3)$#sym.wj；#q(8)$2a^4+12a^2 b^2+2b^4$#sym.wj；/* p.289 */#q(9)$-a^3-0.2a$#sym.wj；#q(10)$1/30 a^2-1/15 b^2$#sym.wj；#q(11)$4y-6z$#sym.wj；#q(12)$5x^3-x-23$#sym.wj；#q(13)$12x^7+3x^6-8x^5+2x^4-11x^3-3x^2$#sym.wj；#q(14)$-2a b+4b^2$#sym.wj；#q(15)$6x^3+2x^2+x+11$#sym.wj；#q(16)$a^3+a^2 b+6a b^2+b^3$#sym.wj；#q(17)$3a^2 b-3a b^2$#sym.wj；#q(18)$29/30 a^3+1/10 a^2-3/4 a+19/18$#sym.wj。]

#answers("3·5(1)")[#q(1)$2a+4b-2c$#sym.wj；#q(2)$10x-5y-3z$#sym.wj；#q(3)$12x y-3y^2$#sym.wj；#q(4)$10a-5b$#sym.wj；#q(5)$-a+5b+2c$#sym.wj；#q(6)$-2x-5y+4z$#sym.wj；#q(7)$2a-3c+x+2y$#sym.wj；#q(8)$2a^3-3a^2-5a+5$#sym.wj；#q(9)$13x-36y$#sym.wj；#q(10)$x-y+3z$#sym.wj；#q(11)$14x-20y$#sym.wj；#q(12)$-4x^3+8x^2-4x-12$#sym.wj。]

#answers("3·5(2)")[#q(3)$-2a+(3b+5c)$#sym.wj；#q(4)$3x-(6y+5z)$#sym.wj；#q(5)$-2a+(3b-5c)$#sym.wj；#q(6)$-2a-(3b+5c)$#sym.wj；#q(7)$x^2-(3x+5)$#sym.wj；#q(8)$x^2+(3x-5)$#sym.wj；#q(9)$a^3-(3a^2 b+b^3)$#sym.wj；#q(10)$a^3+(3a^2 b+b^3)$#sym.wj。]

#answers("3·6(1)")[#q(1)$x^15$#sym.wj；#q(2)$x^4$#sym.wj；#q(3)$x^28$#sym.wj；#q(4)$x^8$#sym.wj；#q(5)$x^(a+b+c)$#sym.wj；#q(6)$x^(a+1)$#sym.wj；#q(7)$x^(2a)$#sym.wj；#q(8)$x^(3a+1)$#sym.wj；#q(9)$a^(4n+2)$#sym.wj；#q(10)$x^(a+2b+1)$#sym.wj。]

#answers("3·6(2)")[#q(15)$-9x^(a+1)$#sym.wj；#q(16)$72x^n$#sym.wj；#q(17)$4(a-b)^6$#sym.wj；#q(18)$-75 dot 10^15$#sym.wj。]

#answers("3·6(3)")[#q(11)$-2a^4 b^2-4/3 a^3 b^3+4/5 a^2 b^4$#sym.wj；#q(12)$4x^(m+1) y^2-8x^(n+1) y^2+24x^(2n+1) y^2$#sym.wj；#q(13)$-7x^(2a) y^(2b) z^(2c)+9x^(a+1) y^(b+1) z^(c+1)$#sym.wj；#q(14)$5x-3y+9z$#sym.wj；#q(15)$4x^2-6x y-2y^2$#sym.wj；#q(16)$2a^3-4a b^2+2b^3$#sym.wj；#q(17)$x-7/6$#sym.wj；#q(18)$-19x+18$#sym.wj。]

#answers("3·6(4)")[#q(25)$6a^4-10a^3-13a^2+35a-28$#sym.wj；#q(26)$2x^4+3x^3+3x^2+12x-20$#sym.wj；#q(27)$x^3+1/6 x^2+1/12 x-1/12$#sym.wj；#q(28)$x^3-0.5x^2-0.44x+0.1$#sym.wj；#q(29)$3/2 x^4+1/4 x^3-17x^2-5/2 x+20$#sym.wj；#q(30)$1/6 x^4-5/2 x^3-mx(2, 1, 9) x^2+5/3 x+4/3$#sym.wj。]

#answers("3·6(5)")[#q(6)$3x^5-14x^4+11x^3+11x^2+13x-30$#sym.wj；#q(7)$2x^6+19x^5+51x^4+34x^3-35x^2-23x+12$#sym.wj；#q(8)$4x^6-5x^5+8x^4-10x^3-8x^2-5x-4$#sym.wj；#q(9)$x^4+3x^3-x^2+2x+15$#sym.wj；#q(10)$5x^7-12x^5+19x^4-13x^3+15x^2+8x-16$#sym.wj；/* p.290 */#q(15)$a^5-2a^4 b+2a^3 b^2-2a^2 b^3+a b^4-b^5$#sym.wj；#q(16)$24a^9 b-26a^5 b^5+4a^4 b^6-6a^3 b^7-5a^2 b^8+4a b^9-3b^10$#sym.wj；#q(17)$x^6-y^6$#sym.wj；#q(18)$4/5 a^6-3/20 a^5-2/5 a^4+67/360 a^3-1/12 a^2+1/6 a-5/27$#sym.wj；#q(19)$x^3+3x y+y^3-1$#sym.wj；#q(20)$x^3+y^3+z^3-3x y z$#sym.wj。]

#answers("3·7(1)")[#q(1)$x^4$#sym.wj；#q(2)$a^8$#sym.wj；#q(3)$x^4$#sym.wj；#q(4)$a^6$#sym.wj；#q(5)$a^36$#sym.wj；#q(6)$a^15$#sym.wj；#q(7)$b^12$#sym.wj；#q(8)$b^7$#sym.wj；#q(9)$y^25$#sym.wj；#q(10)$y^10$#sym.wj；#q(11)$a^(2m n)$#sym.wj；#q(12)$a^(2m+n)$#sym.wj；#q(13)$a^(m+2)$#sym.wj；#q(14)$a^(2m)$#sym.wj；#q(15)$a^320$#sym.wj；#q(16)$a^36$#sym.wj；#q(17)$a^24$#sym.wj；#q(18)$a^9$#sym.wj；#q(19)$a^(m n p)$#sym.wj；#q(20)$a^(m+n+p)$#sym.wj；#q(21)$a^16$#sym.wj；#q(22)$a^20$#sym.wj；#q(23)$a^(2m+3n)$#sym.wj；#q(24)$x^(2m+3n)$#sym.wj；#q(25)$a^11$#sym.wj；#q(26)$a^25$#sym.wj；#q(27)$2a^5$#sym.wj；#q(28)$2a^6$#sym.wj；#q(29)$a^6+a^5$#sym.wj；#q(30)$a^5+a^6$#sym.wj。]

#answers("3·7(2)")[#q(1)$81a^8 b^12$#sym.wj；#q(2)$16a^20 b^12 c^4$#sym.wj；#q(3)$-a^101 b^202 c^303$#sym.wj；#q(4)$1/8 x^6 y^3$#sym.wj；#q(5)$-8/27 a^9 b^3 c^6$#sym.wj；#q(6)$81/16 a^8 x^4$#sym.wj；#q(7)$0.027a^6$#sym.wj；#q(8)$81a^8 b^12 x^4 y^4$#sym.wj；#q(9)$4a^4 b^8 x^2 y^6$#sym.wj；#q(10)$x^(2m) y^m$#sym.wj；#q(11)$x^(2m) y^2$#sym.wj；#q(12)$x^(2m) y^(2n)$#sym.wj；#q(13)$x^(m n) y^n$#sym.wj；#q(14)$72a^12$#sym.wj；#q(15)$x^14 y^23$#sym.wj；#q(16)$-a^27 b^28$#sym.wj；#q(17)$-2a^12$#sym.wj；#q(18)$-a^18 b^20 c^3$#sym.wj；#q(19)$324a^9 b^11$#sym.wj；#q(20)$a^(3m+2n) b^(2m+3n) c^(2m+3)$#sym.wj；#q(21)$10a^6$#sym.wj；#q(22)$28a^9$#sym.wj；#q(23)$a^36+a^12$#sym.wj；#q(24)$25a^10+27a^9$#sym.wj。]

#answers("3·8(1)")[#q(1)$a^5$#sym.wj；#q(2)$b$#sym.wj；#q(3)$a^15$#sym.wj；#q(4)$x^90$#sym.wj；#q(5)$x$#sym.wj；#q(6)$x^(m+n)$#sym.wj；#q(7)$a^9$#sym.wj；#q(8)$a^10$#sym.wj；#q(9)$b$#sym.wj；#q(10)$x^2$#sym.wj；#q(11)$a^6$#sym.wj；#q(12)$a^8$#sym.wj；#q(13)1；#q(14)$x^m$#sym.wj；#q(15)$x^(m+n)$#sym.wj；#q(16)$x^(2m+5n)$#sym.wj；#q(17)$a^15$#sym.wj；#q(18)$a^13$#sym.wj；#q(19)1；#q(20)$x^(2m+10)$#sym.wj。]

#answers("3·8(2)")[#q(10)$-6a^m$#sym.wj；#q(11)$9a^5$#sym.wj；#q(12)$-27a^3 b^3 c^3$#sym.wj；#q(13)$18a^3 b^5$#sym.wj；#q(14)$12a^4 b^4$#sym.wj；#q(15)9；#q(16)$8a^(m+2)$#sym.wj；#q(17)$-3a^n b^n$#sym.wj；#q(18)$2x^9$#sym.wj；#q(19)$32/27 a^4 b^5$#sym.wj；#q(20)$0.04a^2$#sym.wj。]

#answers("3·8(3)")[#q(5)$-30a^2 b+40a b^2 c-20b c^2$#sym.wj；#q(6)$-3/4 a^2 x^2+1/2 a x^3+9/8 x^4$#sym.wj；#q(7)$1/3 a^4-a^2+3a$#sym.wj；#q(8)$-a^(m+2) b^(n+2)+3a^(m+1) b^n$#sym.wj。]

#answers("3·8(4)")[#q(5)$x^2+x+2$#sym.wj；#q(6)$x^2-2x+2$#sym.wj；#q(7)$6a^2-7a+8$#sym.wj；#q(8)$-10x^3+8x^2-6x+4$#sym.wj。]

#answers("3·8(5)")[#q(6)$a^2+2a b+3b^2$#sym.wj；#q(7)$a^4-2a^3 b+4a^2 b^2-8a b^3+16b^4$#sym.wj；/* p.291 */#q(8)$-a^2+3a b-5b^2$#sym.wj；#q(9)$a+b+c$#sym.wj；#q(10)$a-b-c$#sym.wj。]

#answers("3·9")[#q(5)$2x-9$ 余 $31x+17$#sym.wj；#q(6)$x^2-x+5$ 余 $x+15$#sym.wj。]

#answers("3·10(2)")[#q(1)$16a^4-b^6$#sym.wj；#q(2)$9a^4 b^2-25x^4$#sym.wj；#q(3)$9a^2-4b^2$#sym.wj；#q(4)$9a^2-25b^4$#sym.wj；#q(5)$4a^6-9b^4$#sym.wj；#q(6)$25x^6-36y^4$#sym.wj；#q(7)$y^2-x^2$#sym.wj；#q(8)$169b^2-144a^2$#sym.wj；#q(9)$9y^6-25x^4$#sym.wj；#q(10)$9b^4-49a^6$#sym.wj；#q(11)9991；#q(12)39999；#q(13)6375；#q(14)884；#q(15)999975；#q(16)0.9996；#q(17)$x^4-y^4$#sym.wj；#q(18)$a^4-1$#sym.wj；#q(19)$a^8-b^8$#sym.wj；#q(20)$81a^4-16b^4$#sym.wj；#q(21)$a^8-b^4$#sym.wj；#q(22)$x^16-y^16$#sym.wj；#q(23)$a^2+a b-2b^2$#sym.wj；#q(24)$9a^4+9a^2 b-4b^2$#sym.wj；#q(25)$6a^2+5a b-6b^2$#sym.wj；#q(26)$a^4-a^2 b^2-2b^4$#sym.wj；#q(27)$a^2+a b-a c-b c$#sym.wj；#q(28)$b^4-9a^4$#sym.wj；#q(29)$x^4-3x^2-54$#sym.wj；#q(30)$a^4-b^4$#sym.wj。]

#answers("3·10(4)")[#q(1)$a^2-2a b-2a c+b^2+2b c+c^2$#sym.wj；#q(2)$4a^2+12a b+4a c+9b^2+6b c+c^2$#sym.wj；#q(3)$9a^2-12a b+24a c+4b^2-16b c+16c^2$#sym.wj；#q(4)$25a^2+10a b-20a c+b^2-4b c+4c^2$#sym.wj；#q(5)$4a^2+12a b+9b^2-16c^2$#sym.wj；#q(6)$25a^2-30a b+9b^2-16c^2$#sym.wj；#q(7)$a^2-4b^2+12b c-9c^2$#sym.wj；#q(8)$49a^2-70a c+25c^2-9b^2$#sym.wj；#q(9)$4a^2+12a c+9c^2-25b^2$#sym.wj；#q(10)$a^4-b^4+2b^2 c^2-c^4$#sym.wj；#q(11)$9a^4-30a^2 b^2+25b^4-4c^4$#sym.wj；#q(12)$9x^4-13x^2+4$#sym.wj；#q(14)$-24x y$#sym.wj；#q(15)$2a^2-2b^2$#sym.wj；#q(16)$18a^2-12a b$#sym.wj；#q(17)$4a b+4a c$#sym.wj；#q(18)$8a b-24a c$#sym.wj；#q(19)$4a b+8b^2-12b c$#sym.wj；#q(20)$24x y$#sym.wj。]

#answers("3·10(6)")[#q(1)$a^6-1$#sym.wj；#q(2)$64a^6-b^6$#sym.wj；#q(3)$x^6-y^6$#sym.wj；#q(4)$64a^12-729b^12$#sym.wj；#q(5)$a^9-1$#sym.wj；#q(6)$x^9+y^9$#sym.wj；#q(7)$9x^3$#sym.wj；#q(8)$2y^3$#sym.wj；#q(9)0；#q(10)$-2x^3 y^3$#sym.wj。]

#answers("3·10(7)")[#q(7)$27x^6-54x^5+36x^4-8x^3$#sym.wj；#q(8)$125x^9+150x^6 a+60x^3 a^2+8a^3$#sym.wj；#q(9)$1/8 a^3 x^3-1/4 a^2 b x^2+1/6 a b^2 x-1/27 b^3$#sym.wj；#q(10)$1/27 a^9-1/6 a^7+1/4 a^5-1/8 a^3$#sym.wj。]

#answers("3·10(8)")[#q(1)$a^3+3a^2 b+3a^2 c+3a b^2+6a b c+3a c^2+b^3+3b^2 c+3b c^2+c^3$#sym.wj；#q(2)$a^3-6a^2 b-3a^2 c+12a b^2+12a b c+3a c^2-8b^3-12b^2 c-6b c^2-c^3$#sym.wj；#q(7)$2a^3+6a b^2$#sym.wj；#q(8)$6a^2 b+2b^3$#sym.wj；#q(9)$72a^2 b+54b^3$#sym.wj；/* p.292 */#q(10)$-12x^4 y^2-16y^6$#sym.wj。]

#answers("3·10(10)")[#q(31)$a^2+2a b+b^2+3a+3b-28$#sym.wj；#q(32)$x^2-2x y+y^2-7x+7y+12$#sym.wj；#q(33)$3a^2+6a b+3b^2-13a-13b-10$#sym.wj；#q(34)$10a^2-20a b+10b^2+27a-27b-28$#sym.wj。]

#sec[复习题三]

#q(8)$8a^3-2a^2 b-2a b^2$#sym.wj；#q(9)$-4x^3-3x^2-7x+4$#sym.wj；#q(10)$26a^3 b^2$#sym.wj；#q(11)$-6b c^3+5a c^4-4a^2 b^2 c^6$#sym.wj；#q(12)$-2a^2-a^4$#sym.wj；#q(13)$2x^5+x^4-7x^3+8x^2+5x-15$#sym.wj；#q(14)$x^3+4x^2 y+5x y^2+2y^3$#sym.wj；#q(15)$x^3-3x^2+2$#sym.wj；#q(16)$a^4+a^3 b+a^2 b^2+a b^3+b^4$#sym.wj；#q(17)$x^3-4x^2+8x$#sym.wj；#q(18)$-6x^4+12x^3+9x^2+15x$#sym.wj；#q(19)$2x$#sym.wj；#q(20)$-20x+27$#sym.wj；#q(21)$-6x$#sym.wj；#q(22)$-10a+24b$#sym.wj；#q(23)$8x+11$#sym.wj；#q(24)$-5a+5b+9c$#sym.wj；#q(25)$-4x+2y-2z$#sym.wj；#q(26)$a^18+a^16$#sym.wj；#q(27)$-3a^4 b^5$#sym.wj；#q(28)$a^16 b^7+a^8 b^6$#sym.wj；#q(29)$x^12 y^9-x^3 y^2$#sym.wj；#q(30)$2a^8$#sym.wj；#q(31)$a^(3m+n+8)$#sym.wj；#q(32)$a^(n+5)$#sym.wj；#q(33)$a^(m n-m)$#sym.wj；#q(34)$a^n$#sym.wj；#q(35)$a^(2m)+5a^m+6$#sym.wj；#q(36)$a^m+2$#sym.wj；#q(37)$a^(2m)-2a^m+1$#sym.wj；#q(38)$a^(4m)-a^(2m)-2a^m-1$#sym.wj；#q(39)$2x^2-24x+18$#sym.wj；#q(40)$-9x^2-12y^2$#sym.wj；#q(41)$-a^2+4b^2+9c^2+12b c-8a b+12a c$#sym.wj；#q(42)$54x^2 y-36x y^2$#sym.wj；#q(43)$-3a^2 b-4a b^2-b^3$#sym.wj；#q(44)$16x$#sym.wj；#q(45)$-2x^2+9x y-2y^2$#sym.wj；#q(46)$47x+11$#sym.wj；#q(47)$18a^2 b+54b^3$#sym.wj，$-19$#sym.wj；#q(48)$-16b^3$#sym.wj，54；#q(49)$-15x^4-10x^2+80$#sym.wj；#q(50)$-63x^6+36x^4 y^2+36x^2 y^4-63y^6$#sym.wj。

#sec[第四章]

#answers("4·2(2)")[#q(1)$(x+y)(a+b+c)$#sym.wj；#q(2)$(x-y)(a-b-c)$#sym.wj；#q(3)$(a+b+c)(x-2y)$#sym.wj；#q(4)$(a+2b-3c)(x+1)$#sym.wj；#q(5)$(x+1)(3x-2)$#sym.wj；#q(6)$(x-3)^2 (x-4)$#sym.wj；#q(7)$(a-b)^2$#sym.wj；#q(8)$a b(x-y)(a+1)$#sym.wj；#q(9)$(3x-y)(4x+3y)$#sym.wj；#q(10)$(x-a)(x^2-2a x+a^2-a)$#sym.wj；#q(11)$a(x-2a)^2 (a x-2a^2-1)$#sym.wj；#q(12)$(a-b)(x-y)(x-2y-a-b)$#sym.wj；#q(13)$(a-3)(a^3+a^2+6)$#sym.wj；#q(14)$(a-3)(a^3+a^2-5)$#sym.wj；#q(15)$(b+c-d)(x-y)$#sym.wj；/* p.293 */#q(16)$(a-2b+3c)(5x+y)$#sym.wj；#q(17)$(x+2)(x-3)(x^2-x-10)$#sym.wj；#q(18)$(x+1)(2x-3)(3x-1)$#sym.wj；#q(19)$(3x-2)(5x^2-10x+4)$#sym.wj；#q(20)$(a-b)^2 (a+b)^2 (a+b-1)$#sym.wj。]

#answers("4·3")[#q(1)$(b+c+2)(a+x)$#sym.wj；#q(2)$(x-y+a)(a+b)$#sym.wj；#q(3)$(1+x)(a x-b)$#sym.wj；#q(4)$(x-y)(a-b)$#sym.wj；#q(5)$(x^2+y^2)(a+b)$#sym.wj；#q(6)$(a+1)(b+1)$#sym.wj；#q(7)$(b-1)(a-1)$#sym.wj；#q(8)$(b-1)(a+1)$#sym.wj；#q(9)$(a-1)(b+1)$#sym.wj；#q(10)$(x-3y)(x+y)$#sym.wj；#q(11)$(x+2y-3a)(2x-1)$#sym.wj；#q(12)$(x+1)(x^4+1)$#sym.wj；#q(13)$(x-1)(x^4+1)$#sym.wj；#q(14)$a(x-1)(x^4+1)$#sym.wj；#q(15)$(x-1)(a x^4+1)$#sym.wj；#q(16)$a^2 (x-1)(x^4+1)$#sym.wj。]

#answers("4·4(1)")[#q(9)$(2x-3y+2a)(2x-3y-2a)$#sym.wj；#q(10)$(a+2b+x-3y)(a+2b-x+3y)$#sym.wj；#q(11)$3(7a-b)(3b-a)$#sym.wj；#q(12)$(a^2+2a b+3x+3y)(a^2+2a b-3x-3y)$#sym.wj；#q(13)$(a+c)(2b-a-c)$#sym.wj；#q(14)$(3a+b)(b-a)$#sym.wj；#q(15)$(3x-4y+5z)(-x+2y-3z)$#sym.wj；#q(16)$(5x-y-z)(-x+5y+5z)$#sym.wj。]

#answers("4·4(2)")[#q(1)$(a^2+x^2 y^2)(a+x y)(a-x y)$#sym.wj；#q(2)$(a^4 b^4+1)(a^2 b^2+1)(a b+1)(a b-1)$#sym.wj；#q(3)$(a^2+4)(a+2)(a-2)$#sym.wj；#q(4)$(4a^2 b^4+c^4)(2a b^2+c^2)(2a b^2-c^2)$#sym.wj；#q(5)$a(a^4+b)(a^4-b)$#sym.wj；#q(6)$a^2 b(b+2)(b-2)$#sym.wj；#q(7)$(x-y)(x+y+1)$#sym.wj；#q(8)$(x+y)(x-y-1)$#sym.wj；#q(9)$(x+y)(x-y+1)$#sym.wj；#q(10)$(x-y)(x+y-1)$#sym.wj；#q(11)$(a+2b)(a-2b-1)$#sym.wj；#q(12)$(a-2b)(a+2b-2)$#sym.wj；#q(13)$(a+2b)(a^2-2a b-1)$#sym.wj；#q(14)$(x+y)(5x-5y+1)$#sym.wj；#q(15)$(x+y)(3x-3y-1)$#sym.wj；#q(16)$(x-y)(2x+2y-1)$#sym.wj；#q(17)$(a-b)(a+b+1)$#sym.wj；#q(18)$(a+b)(a-b+1)$#sym.wj；#q(19)$(a-b)(a^2+a b+1)$#sym.wj；#q(20)$a(a+b)(a-b-1)$#sym.wj。]

#answers("4·4(3)")[#q(1)$(x-6)^2$#sym.wj；#q(2)$(x+4)^2$#sym.wj；#q(3)$(2a-5b)^2$#sym.wj；#q(4)$(3x+2y)^2$#sym.wj；#q(5)$(y-25x)^2$#sym.wj；#q(6)$(x-19)^2$#sym.wj；#q(7)$(3x y^2+5z)^2$#sym.wj；#q(8)$(x^3+12)^2$#sym.wj；#q(9)$(1-3a b^3)^2$#sym.wj；#q(10)$(7a-8b^2)^2$#sym.wj；#q(11)9；#q(12)20；#q(13)$48x^2 y$#sym.wj；#q(14)$4d^4$#sym.wj；#q(15)$a(a-2b)^2$#sym.wj；#q(16)$x^2 (a^2+2y)^2$#sym.wj；#q(17)$b^2 (4a b-c^2)^2$#sym.wj；#q(18)$(3a-3b+1)^2$#sym.wj；#q(19)$(a+2b-5)^2$#sym.wj；#q(20)$(a+b)^2 (2x-3y)^2$#sym.wj。]

#answers("4·4(4)")[#q(1)$(x+y+3a)(x+y-3a)$#sym.wj；/* p.294 */#q(2)$(2x+a+3)(2x-a-3)$#sym.wj；#q(3)$(x+2a+b)(x+2a-b)$#sym.wj；#q(4)$(3a+x-2)(3a-x+2)$#sym.wj；#q(5)$(1+x-y)(1-x+y)$#sym.wj；#q(6)$(a^2+x-2a)(a^2-x+2a)$#sym.wj；#q(7)$(a-y+b-x)(a-y-b+x)$#sym.wj；#q(8)$(a+b-1)^2$#sym.wj；#q(9)$(a-b)(3a-3b-5)$#sym.wj；#q(10)$(a-2b)(a-2b-a^2-2a b)$#sym.wj。]

#answers("4·4(5)")[#q(5)$(a^4+b^4)(a^8-a^4 b^4+b^8)$#sym.wj；#q(6)$(4a-1)(16a^2+4a+1)$#sym.wj；#q(7)$lr((1/2 x-1/3 y)) lr((1/4 x^2+1/6 x y+1/9 y^2))$#sym.wj；#q(8)$(x+y+2)(x^2+2x y+y^2-2x-2y+4)$#sym.wj；#q(9)$(7m-5n^2)(49m^2+35m n^2+25n^4)$#sym.wj；#q(10)$(1-2a-2b)(1+2a+2b+4a^2+8a b+4b^2)$#sym.wj。]

#answers("4·4(6)")[#q(1)$(a+2b)(a^2-2a b+4b^2)(a-2b)(a^2+2a b+4b^2)$#sym.wj；#q(2)$(a^2+b^2)(a^4-a^2 b^2+b^4)(a+b)(a^2-a b+b^2)(a-b)(a^2+a b+b^2)$#sym.wj；#q(3)$(x+y)(x^2-x y+y^2+6)$#sym.wj；#q(4)$(x-y)(x^2+x y+y^2-x+y)$#sym.wj；#q(5)$(x-y)(x^2+x y+y^2-x-y-1)$#sym.wj；#q(6)$(a-b)(a^2+a b+b^2-a+b-1)$#sym.wj；#q(7)$(a+b)(a^2-a b+b^2+a+b)$#sym.wj；#q(8)$(a+b)(a^2-a b+b^2+a-b+1)$#sym.wj；#q(9)$(a+2b)(a^2-2a b+4b^2+2)$#sym.wj；#q(10)$(a^2+b^2)(a^4-a^2 b^2+b^4+1)$#sym.wj。]

#answers("4·4(7)")[#q(1)$(2a-b)^3$#sym.wj；#q(2)$(3x+2y)^3$#sym.wj；#q(3)$(3x-4y)^3$#sym.wj；#q(4)$(1+4x^2 y^2)^3$#sym.wj；#q(5)$(x^2-2y)^3$#sym.wj；#q(6)$lr((3x-1/3 y))^3$#sym.wj；#q(7)$a(a-1)^3$#sym.wj；#q(8)$(1-x+y)^3$#sym.wj；#q(9)$(x+y)^3 (x-y)^3$#sym.wj；#q(10)$(1+2a b)^3 (1-2a b)^3$#sym.wj。]

#answers("4·5(1)")[#q(17)$a(a-2b)(a-22b)$#sym.wj；#q(18)$a^2 (a+3b)(a+6b)$#sym.wj；#q(19)$(a^2-8)(a+1)(a-1)$#sym.wj；#q(20)$(a+1)(a^2-a+1)(a+2)(a^2-2a+4)$#sym.wj。]

#answers("4·5(2)")[#q(10)$(a-13b)(a+4b)$#sym.wj；#q(11)$(a^2+8b^2)(a^2-7b^2)$#sym.wj；#q(12)$(x y+11)(x y-4)$#sym.wj；#q(13)$(a-10)(a-6)$#sym.wj；#q(14)$(a-12)(a+5)$#sym.wj；#q(15)$(a+30)(a+2)$#sym.wj；#q(16)$(a+15)(a-4)$#sym.wj；#q(17)$(x-12y)(x-8y)$#sym.wj；#q(18)$(x-12y)(x+8y)$#sym.wj；#q(19)$(x+16y)(x-6y)$#sym.wj；#q(20)$(x+4y)(x+24y)$#sym.wj。]

#answers("4·6")[#q(1)$3(x-2y)(x^2+2x y+4y^2)(x+2y)(x^2-2x y+4y^2)$#sym.wj；#q(2)$y^3 (2x+y^2)(4x^2-2x y^2+y^4)(2x-y^2)(4x^2+2x y^2+y^4)$#sym.wj；/* p.295 */#q(3)$(a-b)^2 (a^2+a b+b^2)$#sym.wj；#q(4)$(2y+5)(3x-2)$#sym.wj；#q(5)$3(x+1)(x-2)(x^2+2x+4)$#sym.wj；#q(6)$(x+a)(x+a-b)$#sym.wj；#q(7)$-(x-7)(x+6)$#sym.wj；#q(8)$a(a^2+9b^2)(a+3b)(a-3b)$#sym.wj；#q(9)$(x+3)(x-3)(x+2)(x^2-2x+4)$#sym.wj；#q(10)$(x+4)(x-4)(x+2)(x-2)$#sym.wj；#q(11)$(x+y)(x-y)(x+3y)(x-3y)$#sym.wj；#q(12)$(a+3b c)^2 (a-3b c)^2$#sym.wj；#q(13)$(x-a)(x+b)(x-b)$#sym.wj；#q(14)$(a+3b-2c)(a-3b+2c)$#sym.wj；#q(15)$(x-y)(x^2+x y+y^2)(x^6+x^3 y^3+y^6)$#sym.wj；#q(16)$(a+b)(a-b+1)$#sym.wj；#q(17)$(2+2b+a)(2-2b-a)$#sym.wj；#q(18)$(x-7)(x+2)(x-2)$#sym.wj；#q(19)$(a+b+c-d)(a+b-c+d)(c+d+a-b)(c+d-a+b)$#sym.wj；#q(20)$(b x+a)(a x+b)$#sym.wj。]

#answers("4·8")[#q(1)$13a^3 b^2$#sym.wj，$156a^5 b^4 c^2 d^2$#sym.wj；#q(2)$b$#sym.wj，$a^5 b^7 c(a+b)(a-b)$#sym.wj；#q(3)$(x-y)(y-z)(x+z)$#sym.wj，$(x-y)(y-z)(x+z)$#sym.wj；#q(4)$x-1$#sym.wj，$(x-1)(x-2)(x-3)(x+2)$#sym.wj；#q(5)$(x+y)(x-y)$#sym.wj，$(x+y)^2 (x-y)^2$#sym.wj；#q(6)$a+b$#sym.wj，$(a+b)^2 (a^2-a b+b^2)^2 (a^2+b^2)(a-b)$#sym.wj。]

#sec[复习题四]

#q(15)$a^2 (a+b)(a-b)$#sym.wj；#q(16)$x(m-n)(a x-3)$#sym.wj；#q(17)$3b(c-d)(a+3b)$#sym.wj；#q(18)$(x+y)(x-y)^2$#sym.wj；#q(19)$x(x+1)^2 (x^2-x+1)$#sym.wj；#q(20)$(x-1)(a+1)$#sym.wj；#q(21)$(x-1)(b-1)$#sym.wj；#q(22)$(x+1)(a-b)$#sym.wj；#q(23)$(x-y)(a+b-c)$#sym.wj；#q(24)$3(x y-4)(x y+1)$#sym.wj；#q(25)$(a-b)(a+b-1)$#sym.wj；#q(26)$(a+2b+3c)(a+2b-3c)$#sym.wj；#q(27)$(a+b)(a+b-4)$#sym.wj；#q(28)$c(a^2+c^2)(a+c)(a-c)$#sym.wj；#q(29)$(a+x)(a-x-b)$#sym.wj；#q(30)$(x^2+15)(x+3)(x-3)$#sym.wj；#q(31)$x(x-8)(x+3)$#sym.wj；#q(32)$(a x-1)(a^3 x^3-a x-1)$#sym.wj；#q(33)$(a-b)(5a+5b-3)$#sym.wj；#q(34)$(2+x)(2-x+x^3)$#sym.wj；#q(35)$b(a^4+b^4)(a^8-a^4 b^4+b^8)$#sym.wj；#q(36)$(a+b)(a+b+2c)$#sym.wj；#q(37)$a(a-b)(2a+3b)$#sym.wj；#q(38)$(x+y-z)(x-y+z)(x+y+z)(x-y-z)$#sym.wj；#q(39)$(x+y-3)(x+y+2)$#sym.wj；#q(40)$(a+b+c)(a+b-c)(c+a-b)(c-a+b)$#sym.wj；#q(41)$(a+x+b+y)(a+x-b-y)$#sym.wj；/* p.296 */#q(42)$(x^2-3y^2)(x^4+3x^2 y^2+9y^4-x^2-3y^2)$#sym.wj；#q(43)$(x^4+y^4)(x^8-x^4 y^4+y^8)(x^2+y^2)(x^4-x^2 y^2+y^4)(x+y)(x^2-x y+y^2) times (x-y)(x^2+x y+y^2)$#sym.wj；#q(44)$(x-1)(x+2)(x^2-2x+4)$#sym.wj；#q(45)707；#q(46)324；#q(47)1.72；#q(48)315.6；#q(49)10.2；#q(50)$-24$#sym.wj；#q(51)$a^4-2a^2 b^2+b^4$#sym.wj；#q(52)$a^6-3a^4 b^2+3a^2 b^4-b^6$#sym.wj；#q(53)$12a^2 b+16b^3$#sym.wj；#q(54)$-12a^2 b^2$#sym.wj；#q(55)$2b^6$#sym.wj；#q(56)$mx(7, 1, 5)$#sym.wj；#q(57)25；#q(58)$-1000$#sym.wj；#q(59)$-0.0003$#sym.wj；#q(60)0；#q(61)$(x^2+x y+y^2)(x^2-x y+y^2)$#sym.wj；#q(62)$(2x^2+2x+1)(2x^2-2x+1)$#sym.wj；#q(63)$(x^2+x y+3y^2)(x^2-x y+3y^2)$#sym.wj；#q(64)$(2a^2+2a b-5b^2)(2a^2-2a b-5b^2)$#sym.wj；#q(65)$(x+y+z)(x+y-z)(x-y+z)(x-y-z)$#sym.wj。

#sec[第五章]

#answers("5·1")[#q(2)\(1) $a != 5$#sym.wj，(2) $a != -4$#sym.wj，(3) $x != 3$#sym.wj，(4) $x != 0$#sym.wj；#q(7)\(1) 0，(2) 0，(3) 6，(4) $mx(1, 1, 3)$#sym.wj；#q(8)\(1) 0，(2) $-1/6$#sym.wj；#q(9)\(1) 25，(2) 0；#q(10)\(1) 3，(2) 0；#q(11)\(1) 1，(2) $mx(1, 3, 5)$#sym.wj；#q(12)\(1) $mx(1, 2, 23)$#sym.wj，(2) $89/104$#sym.wj。]

#answers("5·3")[#q(5)$(x-12)/(x-3)$#sym.wj；#q(6)$(x^2-x+1)/(x^2-x-3)$#sym.wj；#q(7)$-(x^2-x-1)/(x-5)$#sym.wj；#q(8)$-(x^2+x-3)/(x^2-2x+1)$#sym.wj；#q(9)$-(x-7)/(x^2+x-5)$#sym.wj；#q(10)$(3x^3-2x^2+x+1)/(3x^3-2x^2+x-1)$#sym.wj。]

#answers("5·4(1)")[#q(1)$a^8$#sym.wj；#q(2)$1/a^3$#sym.wj；#q(3)$1/x^12$#sym.wj；#q(4)1；#q(5)$-1$#sym.wj；#q(6)1；#q(7)$1/a^8$#sym.wj；#q(8)$1/a^18$#sym.wj；#q(9)$a^4$#sym.wj；#q(10)$1/a^5$#sym.wj；#q(11)$a^m$#sym.wj；#q(12)$1/a^n$#sym.wj；#q(13)$1/a^n$#sym.wj；#q(14)$1/a^(3m+n)$#sym.wj；#q(15)$1/a^(2n)$#sym.wj；#q(16)$a^(2m+2n-2)$#sym.wj。]

#answers("5·4(2)")[#q(6)$1/(a^8 b)$#sym.wj；#q(7)$(-1)/(18a b y^5)$#sym.wj；#q(8)$(-a^2 b^13)/(x^10 y^2)$#sym.wj；#q(9)$(a b^2)/10$#sym.wj；#q(10)$1/(3a^(m+1) b^(n+3))$#sym.wj。]

// p.297
#answers("5·4(3)")[#q(11)$(a^2+1)/a$#sym.wj；#q(12)$(x+y)/(x-y)$#sym.wj；#q(13)$(a-b)/a^2$#sym.wj；#q(14)$(a^2+b^2)/((a^2+a b+b^2)(a^2-a b+b^2))$#sym.wj；#q(15)$(a+b+c+d)/(a-b+c+d)$#sym.wj；#q(16)$(x-y+z)^2/((y+z+x)(y+z-x))$#sym.wj；#q(17)$1/(x-1)$#sym.wj，(1) $1/30$#sym.wj，(2) $-1/50$#sym.wj；#q(18)$(x-1)/(x-3)$#sym.wj，(1) $4/5$#sym.wj，(2) 21；#q(19)$-1/a$#sym.wj；#q(20)$-1$#sym.wj；#q(21)$(a+b)^2/(a-b)^3$#sym.wj；#q(22)$1/(a-b)$#sym.wj；#q(23)$1/(a^2+a b+b^2)$#sym.wj；#q(24)$-(a+b)^2$#sym.wj；#q(25)$-(a^2+a b+b^2)^3$#sym.wj；#q(26)$-(x+y)/(x-6y)$#sym.wj；#q(27)$-((a+2)(a+3))/((a-2)(a-3))$#sym.wj；#q(28)$-(a+c)/(a-c)$#sym.wj；#q(29)$(b+c)^2/(b-c)^2$#sym.wj；#q(30)$(-1)/(a+b)$#sym.wj。]

#answers("5·6(1)")[#q(6)$x$#sym.wj；#q(7)1；#q(8)0；#q(9)0；#q(10)0。]

#answers("5·6(2)")[#q(1)$(18x+7)/(12x^2)$#sym.wj；#q(2)$(-3a^2+8a b+5b^2)/(15a^2 b^2)$#sym.wj；#q(3)$(-8x^2 y^2-4x y-7x^2+11y^2)/(x^3 y^3)$#sym.wj；#q(4)$4/((x-7)(x-3))$#sym.wj；#q(5)$(2x)/((1+x)(1-x))$#sym.wj；#q(6)$(2x^3)/((1+x+x^2)(1-x+x^2))$#sym.wj；#q(7)$(a b)/(a^2+a b+b^2)$#sym.wj；#q(8)$(-(a^2+3a b))/((a+b)(a-b)^2)$#sym.wj；#q(9)$(-6)/((x-3)(x-2)(x-4))$#sym.wj；#q(10)$(a-12)/((a+3)(a+4)(a-2))$#sym.wj；#q(11)$(-(x-3))/((x-1)(x+1))$#sym.wj；#q(12)$(2x^3-x^2 y+x y^2-y^3)/(y(x+y)(x-y))$#sym.wj。]

#answers("5·6(3)")[#q(1)$-(x+z)/(x z)$#sym.wj；#q(2)$(x^2+x y+y^2)/(y(x+y))$#sym.wj；#q(3)0；#q(4)0；#q(5)$(b+c-3a)/((a-b+c)(a+b-c)(b+c-a))$#sym.wj；#q(6)$(b^2-c^2+a c-a b)/((a+b+c)(a+b-c)(a+c-b))$#sym.wj；#q(7)$1/(x+2)$#sym.wj；#q(8)0；#q(9)0；#q(10)0。]

#answers("5·6(4)")[#q(9)$x+2+3/(x-1)$#sym.wj；#q(10)$a+1+1/(a-1)$#sym.wj；#q(11)$2x+1-5/(x+1)$#sym.wj；#q(12)$x-1+(3x-3)/(x^2+x-2)$#sym.wj。]

// p.298
#answers("5·7(1)")[#q(17)1；#q(18)$1/(a^2+b^2)^2$#sym.wj；#q(19)$(x^2-y^2)/y^2$#sym.wj；#q(20)$-(x+1)/x$#sym.wj；#q(21)$-(a-3)/(a+4)$#sym.wj；#q(22)$-((x+1)(x-7))/((x+5)(x-4))$#sym.wj；#q(23)$-1$#sym.wj；#q(24)$(a^2-a b+b^2)/((a^3-b^3)(a-b))$#sym.wj。]

#answers("5·7(2)")[#q(1)$(2a-2b)/a$#sym.wj；#q(2)$x$#sym.wj；#q(3)$3-x^2$#sym.wj；#q(4)1；#q(5)0；#q(6)$-1$#sym.wj；#q(7)5；#q(8)4；#q(9)0；#q(10)$a/(a+b)$#sym.wj。]

#answers("5·8")[#q(7)$-(a+b)^6/(a-b)^3$#sym.wj；#q(8)$-(25(x+y))/(8x^6 y)$#sym.wj；#q(9)4；#q(10)$(x-y)/x$#sym.wj。]

#answers("5·9(1)")[#q(7)$(a+x)/a$#sym.wj；#q(8)$-(12a(x+y))/(5x^3 y)$#sym.wj；#q(9)$((a+4)(a-1))/(5(a+2)(a+1))$#sym.wj；#q(10)1。]

#answers("5·9(2)")[#q(6)0；#q(7)$(m^2-n^2+2m n)/(m+n)$#sym.wj；#q(8)$(2x)/(x-y)$#sym.wj；#q(9)$a-b$#sym.wj；#q(10)$(x^2-a^2)/(a x+b x+c x-b c)$#sym.wj。]

#answers("5·10")[#q(1)$(a+1)/(a-1)$#sym.wj；#q(2)$c(1-c)$#sym.wj；#q(3)$(a b)/(a-b)$#sym.wj；#q(4)$3(a-x)$#sym.wj；#q(5)$-(x+1)/(x^2 (x+3))$#sym.wj；#q(6)$-x^3/(2x+1)$#sym.wj；#q(7)$(x-4)/(x-5)$#sym.wj；#q(8)$(a^2-a+1)/(2a-1)$#sym.wj；#q(9)$y$#sym.wj；#q(10)$(1+x^2)/(1+x)$#sym.wj。]

#sec[复习题五]

#q(11)$1/5$#sym.wj；#q(12)$mx(1, 1, 15)$#sym.wj；#q(13)$-2/9$#sym.wj；#q(14)$-1/3$#sym.wj；#q(15)0；#q(16)0；#q(17)$-mx(2, 1, 25)$#sym.wj；#q(18)$mx(7, 4, 5)$#sym.wj；#q(19)$-1/4$#sym.wj；#q(20)1；#q(21)$1/2$#sym.wj；#q(22)$-mx(1, 2, 13)$#sym.wj；#q(23)$x != 0$#sym.wj；#q(24)$x != 2$#sym.wj；#q(25)$x != -3$#sym.wj；#q(26)$x != 3$#sym.wj；/* p.299 */#q(27)$x y(x+2y)$#sym.wj；#q(28)$(x^2+x y+y^2)/(x^2+y^2)$#sym.wj；#q(29)$(x+3)/(x+9)$#sym.wj；#q(30)$(3(x-3b))/(2(x+3b))$#sym.wj；#q(31)$(x^2-25)/((x+3)(x-2))$#sym.wj；#q(32)$(x^2-2b x+c^2)/(x^2+2b x-c^2)$#sym.wj；#q(33)$2/(2a+3b)$#sym.wj；#q(34)$(x^3-x^2+2x-1)/((x+1)(x-1)(x^2-x+1))$#sym.wj；#q(35)$(3x^2-11)/((x-1)(x-2)(x-3))$#sym.wj；#q(36)$(x^2+x+1)/(x^2-x+1)$#sym.wj；#q(37)$x/(x-1)$#sym.wj；#q(38)$(x+3)/((x+1)(x+4))$#sym.wj；#q(39)$(a+b)/(a-b)$#sym.wj；#q(40)1；#q(41)$(a d f+a e)/(b d f+b e+c f)$#sym.wj；#q(42)$(x+y-z)(x-y-z)$#sym.wj；#q(43)$mx(1, 41, 151)$#sym.wj；#q(44)$1/100$#sym.wj；#q(45)2；#q(46)$mx(1, 9, 17)$#sym.wj；#q(47)$(x+4)/((x+1)(x+2))$#sym.wj；#q(48)$x$#sym.wj；#q(49)$1/(c(a-b-c))$#sym.wj；#q(50)$(12-3x)/(7-4x)$#sym.wj；#q(51)$(x+1)/((2y-x)(2x^2+y+2))$#sym.wj；#q(52)$(a+2)/a^(n+1)$#sym.wj。

#sec[第六章]

#answers("6·2")[#q(11)7；#q(12)7.642；#q(13)$10001/9999$#sym.wj；#q(14)$9/5$#sym.wj。]

#answers("6·3")[#q(1)$-5b rt 3a$#sym.wj；#q(2)$-1 rt x^2$#sym.wj；#q(3)$(b-1) rt (b+1)$#sym.wj；#q(4)$(a-x+y) rt (a+x+y)$#sym.wj；#q(5)$(2a-2b) rt (b-a+c)$#sym.wj；#q(6)$(a^2-1) rt 3a^2$#sym.wj，$1/4$#sym.wj；#q(7)$(a-2b) rt (a+b)$#sym.wj，4.3；#q(8)$-x^3 rt 1$#sym.wj，0.008。]

#answers("6·6")[#q(11)$mx(9, 3, 5)$#sym.wj；#q(12)$26/45$#sym.wj；#q(13)$mx(11, 2, 3)$#sym.wj；#q(14)$-1$#sym.wj；#q(15)$b/a$#sym.wj；#q(16)$(a-b)^3/(a+b)$#sym.wj；#q(17)$(a^2-b^2)^2$#sym.wj；#q(18)$-(a+1)$#sym.wj；#q(19)$a^2-1$#sym.wj，$7/9$#sym.wj；#q(20)$(3(a+b))/a$#sym.wj，$mx(1, 1, 2)$#sym.wj。]

#answers("6·8")[#q(1)7 辆；#q(2)2 天；#q(3)25 天；#q(4)200 公里；#q(5)每小时 45 公里；#q(6)$(b c)/a$ 公里；#q(7)每小时 $(a b)/c$ 公里；#q(8)$5/6 b$ 小时；#q(9)\(1) $a$ 与 $b$ 是成正比例的量，(2) $x$ 与 $y$ 不是成正比例的量；/* p.300 */#q(10)\(1) $a$ 与 $b$ 是成反比例的量，(2) $x$ 与 $y$ 不是成反比例的量；#q(11)$b_2=mx(13, 1, 2)$#sym.wj，$b_3=-mx(4, 1, 2)$#sym.wj，$a_4=80/3$#sym.wj，$a_5=-32/9$#sym.wj；#q(12)$b_2=6$#sym.wj，$b_3=-18$#sym.wj，$a_4=48/5$#sym.wj，$a_5=-72$#sym.wj；#q(13)$y_1=(80b^2)/3$#sym.wj，$y_2=(5b(a+b))/(3a)$#sym.wj，$x_3=(-48a^2)/5$#sym.wj，$x_4=(3a(a+b))/(5b)$#sym.wj；#q(14)$y_1=(15a^2 b^2 (a^2-b^2))/16$#sym.wj，$y_2=15a^3 b^3 (a-b)$#sym.wj，$x_3=-(15a^2 b^2 (a^2-b^2))/16$#sym.wj，$x_4=15a^3 b^3 (a-b)$#sym.wj。]

#sec[复习题六]

#q(9)$(x-y)/(x y)$#sym.wj；#q(10)$(a^2+a b+b^2)(a^2-a b+b^2)$#sym.wj；#q(11)$(a+b-c)/(a-b-c)$#sym.wj；#q(12)$((x-1)(x+1)(x+2))/(x-2)^3$#sym.wj；#q(13)$10b^2$#sym.wj；#q(14)$(a-b)^3/(a^2-a b+b^2)$#sym.wj；#q(15)$a^2-1$#sym.wj；#q(16)$a^12 b^3$#sym.wj；#q(17)$-36$#sym.wj，20；#q(18)$-112$#sym.wj，84；#q(19)$(a^2-b^2)^2/(3a^2 b)$#sym.wj；#q(20)$-3a^2 b$#sym.wj。

#sec[总复习题]

#q(1)5、6、7、8、9、10、11、12、13、14、15，6、8、10、12、14，5、7、9、11、13、15，5、7、11、13；#q(2)4、5、$-4$、$-5$#sym.wj，4、5，$-4$、$-5$#sym.wj；#q(3)$-2$、$-1$、0、1、2，1、2，$-1$、$-2$#sym.wj；#q(4)$-3$、$-2$、$-1$、0、1、2、3，1、2、3，$-1$、$-2$、$-3$#sym.wj；#q(5)\(1) $-81$#sym.wj，(2) $32/243$#sym.wj，(3) $+1$#sym.wj，(4) 0；#q(6)\(1) $-16$#sym.wj，(2) $mx(23, 1, 6)$#sym.wj；#q(7)\(1) $mx(5, 5, 6)$#sym.wj，(2) $-mx(11, 11, 12)$#sym.wj；#q(8)\(1) $mx(10, 1, 3)$#sym.wj，(2) $-mx(1, 1, 8)$#sym.wj；#q(9)\(1) $-13/15$#sym.wj，(2) $-1/3$#sym.wj；#q(10)\(1) $1/36$#sym.wj，(2) $mx(69, 4, 9)$#sym.wj；#q(11)$mx(1, 101, 180)$#sym.wj；#q(12)$-mx(6, 1, 4)$#sym.wj；#q(13)$-470$#sym.wj；/* p.301 */#q(14)39.9；#q(15)$mx(3, 11, 20)$#sym.wj；#q(16)$mx(5, 23, 24)$#sym.wj；#q(17)$mx(5, 5, 6)$#sym.wj，$mx(5, 5, 6)$#sym.wj，0；#q(18)1.85，8.79，6.94；#q(19)$mx(2, 5, 6)$#sym.wj，$mx(7, 5, 6)$#sym.wj，5；#q(20)1.903，8.393，6.49；#q(21)$2/3$#sym.wj；#q(22)0；#q(23)21；#q(24)$mx(3, 1, 4)$#sym.wj；#q(25)$mx(3, 3, 4)$#sym.wj；#q(26)$2209/225$#sym.wj；#q(27)$-8.6$#sym.wj；#q(28)$-4.7$#sym.wj；#q(29)$-1/2<1/3<5/2$#sym.wj；#q(30)$-0.17 < -1/6 < 5$#sym.wj；#q(31)$-mx(4, 1, 3)$#sym.wj；#q(32)$-mx(3, 1, 2)$#sym.wj；#q(33)19；#q(34)$17/54$#sym.wj；#q(35)$-4/5 x^n y^m$#sym.wj；#q(36)$2x^3 y^n z^(n+1)$#sym.wj；#q(37)$-64a^12$#sym.wj；#q(38)$27a^3 b^6 c^9$#sym.wj；#q(39)$-x^26$#sym.wj；#q(40)$126a^3 b^6 c^9$#sym.wj；#q(41)$5x-13y+25z$#sym.wj；#q(42)$6x^4-6x^3 y-7x^2 y^2+17x y^3-6y^4$#sym.wj；#q(43)$-9a^5+3a^4 b+35a^3 b^2-43a^2 b^3-24a b^4+30b^5$#sym.wj；#q(44)$3a^2+5a-7$#sym.wj；#q(45)$2x^2-3x-4$#sym.wj；#q(46)$x^6-x^5 y+x^4 y^2-x^3 y^3+x^2 y^4-x y^5+y^6$#sym.wj；#q(47)$x^6+x^5 y+x^4 y^2+x^3 y^3+x^2 y^4+x y^5+y^6$#sym.wj；#q(48)\(1) $-2x^3-5x^2-x+6$#sym.wj，(2) $15x^4-11x^3+20x^2-27x+7$#sym.wj；#q(49)\(1) $a^2+4a b-6a c+4b^2-12b c+9c^2$#sym.wj，(2) $a^2-4b^2-12b c-9c^2$#sym.wj；#q(50)\(1) $a^2-6a c+9c^2-4b^2$#sym.wj，(2) $9c^2-a^2+4a b-4b^2$#sym.wj；#q(51)\(1) $a^2+2a c+c^2-4b^2+8b d-4d^2$#sym.wj，(2) $a^2-b^2-4c^2-9d^2+4b c-6b d+12c d$#sym.wj；#q(52)\(1) $81a^20-72a^10 b^8+16b^16$#sym.wj，(2) $64x^12-432x^6 y^9+729y^18$#sym.wj；#q(53)$a^18+3a^12 b^9+3a^6 b^18+b^27$#sym.wj；#q(54)$a^32-b^32$#sym.wj；#q(55)$2x^2-78$#sym.wj；#q(56)$18x+1$#sym.wj；#q(57)\(1) 89996，(2) 255.64；#q(58)\(1) 3588.01，(2) 252004；#q(59)$-15x y-3x z$#sym.wj，$-15$#sym.wj；#q(60)$-8x^3$#sym.wj，64；#q(61)$(a+b)(a^2-a b+b^2+a-b)$#sym.wj；#q(62)$(x^2-3y^2)(x^4+3x^2 y^2+9y^4-x^2-3y^2)$#sym.wj；#q(63)$(x-y)(z-x+y)$#sym.wj；#q(64)$(x-2y+z+1)(x-2y-z-1)$#sym.wj；#q(65)$(x+3)(x-3)(x^2+1)$#sym.wj；#q(66)$(a-b-1)/(a+b)$#sym.wj；#q(67)$(9x+9y-3)/(x^2+x y+y^2)$#sym.wj；#q(68)$(1-x)/(1+x)^2$#sym.wj；#q(69)$(2(a-2))/(5a(a+1))$#sym.wj；#q(70)$(4x^2-3x+1)/(x^2-x-3)$#sym.wj；/* p.302 */#q(71)$(2x-2)/(x^2+x+1)$#sym.wj；#q(72)$(-2a(2a-b))/(2a+b)$#sym.wj；#q(73)$(m^2-n^2+2m n)/(m+n)$#sym.wj；#q(74)$a/(a+b)$#sym.wj；#q(75)$(2x)/(x-y)$#sym.wj；#q(76)$a-b$#sym.wj；#q(77)$(a+b)^2/(1/a+1/b)$#sym.wj；#q(78)$lr((a/b+b/a))^2$#sym.wj；#q(79)$10a^2+a$#sym.wj；#q(80)$100(x^2-6)+10x+(x^2-4)=101x^2+10x-604$#sym.wj；#q(81)$lr(|a+b|)+lr(|a|)+lr(|b|)$#sym.wj；#q(82)$lr(|a-b|)+lr(|a|)+lr(|b|)$#sym.wj；#q(83)$(1/b)/(1/a)=a/b$#sym.wj；#q(84)$4a$#sym.wj；#q(85)$lr((a/4))^2=a^2/16$#sym.wj；#q(86)$a^(2m+3n)$#sym.wj；#q(87)$a^(2m+2) b^(2n+4)$#sym.wj；#q(88)$a^m$#sym.wj；#q(89)$a^n$#sym.wj；#q(90)$a$#sym.wj；#q(91)$a^(2m)+2a^m b^n+b^(2n)$#sym.wj；#q(92)$a^(2m)-2a^m b^n+b^(2n)$#sym.wj；#q(93)$a^(2m)-b^(2n)$#sym.wj；#q(94)$a^(3m)-3a^(2m) b^n+3a^m b^(2n)-b^(3n)$#sym.wj；#q(95)$(a^m+1)^2$#sym.wj；#q(96)$(a^(2m)+b^(4n))(a^m+b^(2n))(a^m-b^(2n))$#sym.wj；#q(97)$(a^m+b^(2n))(a^(2m)-a^m b^(2n)+b^(4n))$#sym.wj；#q(98)$a^2 (a^m-1)^2$#sym.wj；#q(99)$a^3 (a^(m+1)+b)(a^(2m+2)-a^(m+1) b+b^2)$#sym.wj；#q(100)$a^2 (a^(m+2)-b^m)(a^(2m+4)+a^(m+2) b^m+b^(2m))$#sym.wj。
