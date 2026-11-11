// 习题答案（原书 p.305–312，书末最后一页）
#import "/common/series.typ": *
#import "/books/geometry-1/figures/Q-ans.typ": *

// 原书按章分组：“习题 x·y”后列出有答案的题号；复习题、总复习题的答案单列（无习题标签，用小标题）。
// 原书只列有答案的题，题号不连续，照录。题号后的“.”不是句末标点，不改；
// 各条末尾的“．”改作“。”，各题之间的分号、逗号一律照原书用全角（数学式内部的逗号照数学式写）。
// 绪论的“习题”原书不编号，没有习题标签，用 intro-ans 单独排。

#let q(n) = h(0.8em) + [#n.] + sym.wj + h(0.2em) + sym.wj
#set par(leading: 0.9em)
#show math.equation.where(block: false): set text(top-edge: "bounds", bottom-edge: "bounds")
#let sec(title) = {
  set par(first-line-indent: 0em)
  block(above: 1.4em, below: 0.6em, sticky: true,
    align(center, text(font: fonts.hei, weight: "bold", size: 1.05em)[#title]))
}
#let intro-ans(body) = {
  set par(first-line-indent: 0em)
  block(above: 1.2em, below: 0.6em, sticky: true, text(font: fonts.hei, weight: "bold")[习题])
  body
}

// p.305
= 习题答案

#sec[绪论]

#intro-ans[#q(1)例如铅笔匣子是一个物体，但如果只研究它的形状和大小，而不管其他性质时，就可以把铅笔匣子看作是一个长方体形状的几何体。#q(2)有 6 个面，12 条棱，8 个顶点。]

#sec[第一章]

#answers("1·1")[#q(1)因为经过两点可以确定一条直线；#q(2)两只钉，理由同上题；#q(3)过一点 $A$ 可画无数条直线，只要在点 $A$ 外再取一点，这样的两点所确定的直线都是，过 $A$#sym.wj，$B$ 两点只能画一条直线；#q(4)可画 6 条；#q(5)两点只能确定一条直线。]

#answers("1·3")[#q(3)缩小的线段长为 $4.6 "cm"$#sym.wj，$3.4 "cm"$#sym.wj；#q(4)6 条，即 $A B$#sym.wj，$A C$#sym.wj，$A D$#sym.wj，$B C$#sym.wj，$B D$ 和 $C D$#sym.wj；#q(5)\(1) $A B$#sym.wj，(2) $A B$#sym.wj，$B C$#sym.wj，(3) $A B$#sym.wj，$C D$#sym.wj，(4) $A D$#sym.wj，(5) $A B$#sym.wj，$B D$ 或 $A C$#sym.wj，$C D$#sym.wj；#q(6)\(1) $M B$#sym.wj，(2) $M B$#sym.wj，(3) $A B$#sym.wj，(4) $A M$ 或 $M B$#sym.wj；#q(7)$7.5 "cm"$#sym.wj；#q(8)$1/2 l$#sym.wj；#q(9)如图；

#plainfig((fig-Q-a1-3-9(), [（习题 1·3 第 9 题）]))

#q(11)$M N = 1/2 A C = O C$#sym.wj。]

// p.306
#answers("1·4")[#q(1)圆 $M$ 和圆 $N$ 是等圆，它们有两个交点 $A$ 和 $B$#sym.wj，如图；#q(3)如图，(1) 能画一条直径 $A B$#sym.wj，(2) $A C$#sym.wj，(3) 能画 2 条，$A D$ 和 $A E$#sym.wj；#q(4)量出旗杆底部和花台边缘上任意三个点的距离，如果都相等，则旗杆居中，否则不居中。

#plainfig((fig-Q-a1-4-1(), [（习题 1·4 第 1 题）]), (fig-Q-a1-4-3(), [（习题 1·4 第 3 题）]))]

#answers("1·5")[#q(2)6 点钟时，时针与分针组成平角，12 点钟时组成周角；#q(4)$∠1$ 是 $∠A O B$#sym.wj，$∠2$ 是 $∠C O D$#sym.wj，$∠3$ 是 $∠A O C$#sym.wj，$∠4$ 是 $∠A O D$#sym.wj。]

#answers("1·7")[#q(1)直角；#q(2)\(1) $∠A O B$#sym.wj，$∠B O C$#sym.wj，(2) $∠B O C$#sym.wj，$∠C O D$#sym.wj，(3) $∠A O B$#sym.wj，(4) $∠A O B$#sym.wj，$∠C O D$#sym.wj，(5) $∠A O C$#sym.wj，(6) $∠A O B$#sym.wj，$∠B O D$ 或 $∠A O C$#sym.wj，$∠C O D$#sym.wj；#q(3)$∠A O E = 4 ∠A O B$#sym.wj，$∠A O D = ∠B O E = 3 ∠B O C$#sym.wj，$∠A O C = ∠C O E = ∠B O D = 1/2 ∠A O E$#sym.wj；#q(7)$∠1 = 65°$#sym.wj，$∠2 = 35°$#sym.wj，$∠3 = 80°$#sym.wj，$∠1 + ∠2 + ∠3 = 180°$（精确到 $1°$）；#q(8)$48°12'$#sym.wj，$25°12'$#sym.wj；#q(9)$90°$#sym.wj，$45°$#sym.wj，$90°$#sym.wj，$135°$#sym.wj，$180°$#sym.wj；#q(12)$∠A O C = 120°$#sym.wj，$∠B O C = 30°$#sym.wj；#q(13)\(1) $124°33'$#sym.wj，(2) $46°47'49''$#sym.wj，(3) $166°36'48''$#sym.wj，(4) $20°27'30''$#sym.wj；#q(14)$54°$#sym.wj，$36°$#sym.wj；#q(15)$45°$#sym.wj；#q(16)$22°30'$#sym.wj，$67°30'$#sym.wj；#q(17)$120°$#sym.wj；#q(18)$22°30'$#sym.wj；#q(20)$60°$#sym.wj，$120°$#sym.wj。]

#answers("1·8")[#q(2)三点钟，九点钟；#q(3)书的相邻的两条边，门框的相/* p.307 */邻的两条木条等；#q(4)如图；#q(5)\(2) $165°$#sym.wj，(3) $114°$#sym.wj；#q(6)$90°$#sym.wj，垂直的；#q(7)$135°$#sym.wj；#q(8)能，不能；#q(9)如图，先作一条不通过点 $P$ 的直线 $A B$#sym.wj，再作 $P M ⊥ A B$#sym.wj，过 $P$ 作 $P N = P M$#sym.wj，过点 $N$ 作 $C D ⊥ P N$#sym.wj，则 $A B$ 和 $C D$ 就与已知点 $P$ 的距离相等。这类直线可以画出很多。

#plainfig((fig-Q-a1-8-4(), [（习题 1·8 第 4 题）]), (fig-Q-a1-8-9(), [（习题 1·8 第 9 题）]))]

#answers("1·9")[#q(1)$∠B O C = ∠D O C$#sym.wj，$∠A O C = ∠E O C$#sym.wj，$∠A O D = ∠E O B$#sym.wj；#q(4)$55°7'30''$#sym.wj；#q(5)$26°$#sym.wj；#q(6)$135°$#sym.wj；#q(7)$∠2 = 70°$#sym.wj，$∠3 = 14°$#sym.wj，$∠4 = 96°$#sym.wj，$∠6 = 14°$#sym.wj；#q(8)是；#q(9)等角的补角相等；#q(10)$∠1$ 和 $∠3$#sym.wj，$∠2$ 和 $∠4$#sym.wj，$∠5$ 和 $∠7$#sym.wj，$∠6$ 和 $∠8$ 是对顶角，又 $∠1 = 110°$#sym.wj，$∠3 = 110°$#sym.wj，$∠4 = 70°$#sym.wj，$∠6 = 74°$#sym.wj，$∠7 = 106°$#sym.wj，$∠8 = 74°$#sym.wj；#q(11)$67°30'$#sym.wj。]

#answers("1·11")[#q(1)\(1) 同位角相等，(2) $∠1 = ∠5$ 或 $∠3 = ∠7$#sym.wj，(3) 内错角相等，(4) 同旁内角的和等于 $180°$#sym.wj，(5) $∠1 = ∠5$ 或 $∠4 = ∠8$#sym.wj，(6) $∠9 + ∠10 = 180°$#sym.wj；#q(2)$A B ∥ C D$#sym.wj，因为内错角相等；#q(3)$A M ∥ N D$#sym.wj，因为内错角 $∠D N M = ∠A M N$#sym.wj；#q(10)一条。]

#answers("1·12")[#q(1)同位角有 $∠1 = ∠4$#sym.wj，$∠3 = ∠7$#sym.wj，内错角有 $∠1 = ∠9$#sym.wj，$∠3 = ∠10$#sym.wj，同旁内角有 $∠1 + ∠8 = 2 d$#sym.wj，$∠3 + ∠11 = 2 d$#sym.wj；#q(3)$65°$#sym.wj；#q(4)其余三个角都是 $90°$#sym.wj；#q(8)$A B ∥ C D$#sym.wj，$A D ∥ B C$#sym.wj，$∠C = 60°$#sym.wj；#q(9)同位角相等；#q(11)$∠A = 47°$#sym.wj，$∠B = 50°$#sym.wj，$∠A C B = 83°$#sym.wj；#q(12)$70°$#sym.wj；#q(13)$110°$#sym.wj，$70°$#sym.wj；#q(14)$∠4 = 55°$#sym.wj，$∠5 = 125°$#sym.wj；#q(15)$∠1 + ∠2 + ∠3 = 180°$#sym.wj；#q(16)不对，这两直线不一定是平行。]

#answers("1·13")[#q(1)$65°$#sym.wj，$115°$#sym.wj；#q(2)不对；#q(4)$25°$#sym.wj，$155°$#sym.wj。]

#sec[复习题一]

#q(1)圆是射线上一点绕着它的端点旋转一周所画出的线，是首尾相接的线，没有端点。圆弧是圆的部分，它有两个端点；#q(2)共同点：它们都与圆有两个公共点，区别：割线是直线，弦是线段，直径是过圆心的线段；#q(3)直角，因为 $180°$ 的一半是 $90°$#sym.wj；#q(4)是的，因为钝角比直角大，而锐角比直角小；#q(5)小于一平角，因为两个比直角小的角之和一定小于 $180°$#sym.wj；#q(6)锐角，因为它们的和等于 $90°$#sym.wj；#q(7)不一定，只有当两直线平行时内错角才会相等；#q(8)两直线平行，第三条/* p.308 */直线分别与它们垂直；#q(10)重合，相交和平行；#q(12)剪刀、卡钳和比例规等；#q(15)南偏东 $48°$#sym.wj；#q(16)$∠D = 135°$#sym.wj，$∠C = 90°$#sym.wj；#q(23)$∠D S H = 5/8 d$#sym.wj。

#sec[第二章]

#answers("2·1")[#q(1)有 8 个三角形，即 $△A O B$#sym.wj，$△B O C$#sym.wj，$△C O D$#sym.wj，$△D O A$#sym.wj，$△A B C$#sym.wj，$△A D C$#sym.wj，$△A B D$#sym.wj，$△C B D$#sym.wj；#q(2)\(1) 因为 $5 + 12 > 13$#sym.wj，能，(2) 因为 $3 + 8 < 12$#sym.wj，不能，(3) 能，(4) 和 (5) 都不能；#q(3)\(1) 能，(2)，(3)，(4) 都不能；#q(4)一腰大于底边的一半；#q(5)腰长 $0.3 "m"$#sym.wj；#q(7)$8 "cm"$#sym.wj，$12 "cm"$#sym.wj，$16 "cm"$#sym.wj；#q(8)腰 $= 12 "mm"$#sym.wj，底 $= 8 "mm"$#sym.wj。]

#answers("2·2")[#q(1)$47°30'$#sym.wj；#q(2)$∠A = 49°$#sym.wj，$∠B = 25°18'$#sym.wj，$∠C = 105°42'$#sym.wj；#q(3)$65°$#sym.wj，$60°$#sym.wj，$45°$#sym.wj；#q(4)$∠1 = ∠2 = 45°$#sym.wj，$A E ∥ B C$#sym.wj；#q(5)不能，能；#q(6)直角三角形；#q(7)锐角三角形；#q(10)$∠4 = 20°$#sym.wj；#q(11)$∠C = 67°$#sym.wj；#q(12)3 个，1 个，1 个。]

#answers("2·3")[#q(4)两条直角边就是高，只要画斜边上的高，三条高相交于直角的顶点；#q(5)三线合一；#q(6)$10 "cm"$ 或 $6 "cm"$#sym.wj；#q(7)$135°$#sym.wj；#q(8)$5/6 d$#sym.wj。]

#answers("2·5")[#q(1)建筑物的图样如天安门和人民大会堂，人脸的正面照相，乒乓板等等；#q(2)和它相同的图形；#q(7)如图；

#plainfig((fig-Q-a2-5-7(), [（习题 2·5 第 7 题）]))

#q(8)有 3 条，在每一个内角的平分线上；#q(9)$39°$#sym.wj；#q(10)$60°$#sym.wj；#q(11)$4/9 d$#sym.wj，$7/9 d$#sym.wj，$7/9 d$#sym.wj；#q(12)\(1) $30°$#sym.wj，(2) $17°30'$#sym.wj，(3) $40°$#sym.wj；/* p.309 */#q(13)$45°$#sym.wj；#q(15)不能，如果底角是直角或钝角，则底角之和就已等于或大于 $180°$#sym.wj；#q(18)等腰三角形底的中线必垂直其底。]

#answers("2·7")[#q(6)$D E = 1.85 "m"$#sym.wj，$D C = 3.7 "m"$#sym.wj，$C B = 3.7 "m"$#sym.wj；#q(8)$1/2 a$#sym.wj；#q(9)$20 "cm"$#sym.wj；#q(11)$5 "cm"$#sym.wj；#q(12)$8 "cm"$#sym.wj。]

#answers("2·9")[#q(1)两个能够完全重合的三角形是全等三角形，它们的对应角和对应边相等；]

#answers("2·12")[#q(1)$a > c > b$#sym.wj；#q(2)$∠A > ∠C > ∠B$#sym.wj；#q(3)\(1) 腰 $<$ 底，(2) 腰 $>$ 底；#q(5)对钝角的边最大。]

#answers("2·13")[#q(2)目标 $P$ 离 $C$ 岛较近。]

#sec[复习题二]

#q(2)$∠x = 153°$#sym.wj；#q(4)$∠E F C = ∠C + ∠D = 30° + 40° = 70°$#sym.wj，又 $∠A B C = 70°$#sym.wj，$∴ B A ∥ D E$#sym.wj；#q(6)$A C = 10 "cm"$#sym.wj；#q(7)$12.5 "cm"$#sym.wj；#q(10)等腰直角三角形；#q(11)$150°$#sym.wj；#q(14)三个外角度数之比顺次为 $5 rt 4 rt 3$#sym.wj；#q(16)$90°$#sym.wj；#h(0.8em)22 有两解：(1) $70°$#sym.wj，$70°$#sym.wj，$40°$#sym.wj，(2) $70°$#sym.wj，$55°$#sym.wj，$55°$#sym.wj。

#sec[第三章]

#answers("3·1")[#q(1)五个顶点，五个内角和五条对角线；#q(3)四边形没有稳定性，连接一条对角线成为两个三角形时形状就能固定；#q(4)\(1) $4 3/7 "cm"$#sym.wj，$6 9/14 "cm"$#sym.wj，$8 6/7 "cm"$#sym.wj，$11 1/14 "cm"$#sym.wj，(2) $24 "mm"$#sym.wj，$16 "mm"$#sym.wj，$12 "mm"$#sym.wj。]

#answers("3·2")[#q(1)\(1) $900°$#sym.wj，(2) $1260°$#sym.wj，(3) $1440°$#sym.wj；#q(2)八边形；#q(3)六边形；#q(4)\(1) $108°$#sym.wj，(2) $72°$#sym.wj；#q(5)16 边形；#q(6)\(1) $97.5°$#sym.wj，$97.5°$#sym.wj，$97.5°$#sym.wj，$67.5°$#sym.wj，(2) $77°38'$#sym.wj，$82°50'$#sym.wj，$96°23'$#sym.wj，$103°9'$#sym.wj；#q(7)\(1) 增加 $180°$#sym.wj，(2) 增加 $360°$#sym.wj，(3) 增加 $540°$#sym.wj，(4) 增加 $1440°$#sym.wj，外角和不变；#q(8)$180°$#sym.wj。]

// p.310
#answers("3·3")[#q(1)$17.5 "cm"$#sym.wj，$12.5 "cm"$#sym.wj；#q(2)$102°40'$#sym.wj，$77°20'$#sym.wj；#q(7)\(1) 和 (2) 都不能，(3) 能；#q(8)$144°$#sym.wj，$36°$#sym.wj；#q(12)3 种。]

#answers("3·4")[#q(1)因为 $A C ∥ B D$#sym.wj，$A C = B D$#sym.wj。]

#answers("3·6")[#q(5)$27°30'$#sym.wj，$62°30'$#sym.wj；#q(6)\(1) 没有，(2) 有，对称中心；#q(7)$15 "cm"$#sym.wj，$10 "cm"$#sym.wj。]

#answers("3·8")[#q(13)$3.5 "cm"$#sym.wj。]

#answers("3·10")[#q(4)$P M < P N$#sym.wj；#q(7)$30 "cm"$#sym.wj，各边长为 $7.5 "cm"$#sym.wj，$10 "cm"$#sym.wj，$12.5 "cm"$#sym.wj；#q(9)$29 "cm"$#sym.wj；#q(10)$12 "cm"$#sym.wj；#q(12)$3.35 "cm"$#sym.wj，$2.65 "cm"$#sym.wj。]

#answers("3·11")[#q(1)$112°$#sym.wj，$104°$#sym.wj；#q(2)$20 "cm"$#sym.wj；#q(4)$34 "cm"$#sym.wj；#q(6)$60°$#sym.wj，$120°$#sym.wj；#q(7)$30°$#sym.wj，$150°$#sym.wj。]

#answers("3·12")[#q(1)$21 "cm"$#sym.wj；#q(2)$20 "cm"$#sym.wj；#q(3)$12 "cm"$#sym.wj，$36 "cm"$#sym.wj；#q(5)不能；#q(6)$96 "cm"$#sym.wj。]

#sec[复习题三]

#q(1)矩形，等腰梯形，正方形；#q(2)平行四边形，矩形，菱形，正方形；#q(3)菱形，正方形；#q(4)菱形和正方形等边，矩形和正方形等角，正方形等边也等角；#q(5)$4 "cm"$#sym.wj；#q(7)$8 "cm"$#sym.wj，$16 "cm"$#sym.wj；#q(9)不是平行四边形，因为对角线不互相平分；#q(11)$80°$#sym.wj；#q(12)$50 "cm"$#sym.wj；#q(15)$18.4 "cm"$#sym.wj，$27.6 "cm"$#sym.wj；#q(18)$12 "cm"$#sym.wj，$16 "cm"$#sym.wj。

#sec[第四章]

#answers("4·1")[#q(1)以 $A$ 为圆心，$r$ 为半径的圆；#q(4)$12 "cm"$#sym.wj；#q(6)$7.5 "cm"$#sym.wj。]

#answers("4·3")[#q(2)半径的一半；#q(3)$20 "cm"$#sym.wj，$60 "cm"$#sym.wj；#q(5)$C D$#sym.wj；#q(10)$2 "cm"$#sym.wj；#q(11)$1 "cm"$#sym.wj。]

#answers("4·4")[#q(1)$45°$#sym.wj；#q(2)$67.5°$#sym.wj，$112.5°$#sym.wj；#q(3)$30°$#sym.wj，$60°$#sym.wj，$90°$#sym.wj；#q(4)$36°$#sym.wj，$144°$#sym.wj；#q(5)$60°$#sym.wj，$60°$#sym.wj，$60°$#sym.wj；#q(6)$80°36'$#sym.wj，$49°42'$#sym.wj，$49°42'$#sym.wj；#q(7)\(1) $33°45'$#sym.wj，(2) $33°45'$#sym.wj，(3) $78°45'$#sym.wj；#q(8)$22°30'$#sym.wj；#q(9)\(1) $50°37.5'$#sym.wj，(2) $35°55.5'$#sym.wj；#q(14)$124°$#sym.wj，$56°$#sym.wj；#q(15)\(1) $26°$#sym.wj，$52°$#sym.wj，(2) $24°$#sym.wj，$86°$#sym.wj，(3) $90°$#sym.wj，$60°$#sym.wj；#q(16)\(1) $39°20'$#sym.wj，(2) $70°$#sym.wj，(3) $50°$#sym.wj；/* p.311 */#q(17)\(1) $104°$#sym.wj，$234°$#sym.wj，(2) $20°$#sym.wj，$98°$#sym.wj，(3) $57°$#sym.wj，$153°$#sym.wj。]

#answers("4·5")[#q(1)\(1) 不一定，(2) 不一定，(3) 能，(4) 能，(5) 不一定，(6) 能；#q(4)$130°$#sym.wj，$130°$#sym.wj，$50°$#sym.wj；#q(5)$60°$#sym.wj，$80°$#sym.wj，$120°$#sym.wj，$100°$#sym.wj；#q(6)$75°$#sym.wj，$75°$#sym.wj，$105°$#sym.wj，$105°$#sym.wj；#q(7)$70°$#sym.wj，$110°$#sym.wj，$60°$#sym.wj。]

#answers("4·7")[#q(1)\(1) 2，(2) 1，(3) 0；#q(2)\(1) 相交，(2) 相切，(3) 相离；#q(3)对的；#q(5)不对；#q(6)$15 "cm"$#sym.wj；#q(7)$45°$#sym.wj；#q(14)$5.6 "cm"$#sym.wj。]

#answers("4·8")[#q(1)$s - c$#sym.wj；#q(3)$1/2 R$#sym.wj；#q(4)$1/3 h$#sym.wj；#q(5)$1/2 (b + c - a)$#sym.wj，$1/2 (c + a - b)$#sym.wj，$1/2 (a + b - c)$#sym.wj；#q(6)$p_1 + p_2 + p_3$#sym.wj。]

#answers("4·9")[#q(2)\(1) 不一定，(2) 有，(3) 有，(4) 不一定，(5) 不一定，(6) 不一定；#q(4)$9 "cm"$#sym.wj，$12 "cm"$#sym.wj，$15 "cm"$#sym.wj，$12 "cm"$#sym.wj；#q(6)$2 "cm"$#sym.wj。]

#answers("4·10")[#q(1)$45°$#sym.wj，$135°$#sym.wj；#q(2)$79°30'$#sym.wj，$100°30'$#sym.wj。]

#answers("4·11")[#q(1)\(1) 外离，(2) 外切，(3) 内切，(4) 相交；#q(2)$d - r_1 - r_2$#sym.wj；#q(4)\(1) $7 "cm"$#sym.wj，(2) $3 "cm"$#sym.wj，(3) 0；#q(5)\(1) $d > 5 "cm"$#sym.wj，(2) $1 "cm" < d < 5 "cm"$#sym.wj，(3) $d < 1 "cm"$（$d$ 表示圆心距）；#q(7)$1 "cm"$#sym.wj，$2 "cm"$#sym.wj，$3 "cm"$#sym.wj。]

#answers("4·13")[#q(1)$r$#sym.wj；#q(7)$14 "cm"$#sym.wj。]

#answers("4·15")[#q(2)$25 "cm"$#sym.wj；#q(3)$60°$#sym.wj；#q(5)$4 "cm"$#sym.wj；#q(6)$2 a "cm"$#sym.wj；#q(7)$30 "mm"$#sym.wj；#q(9)可以的。]

#sec[复习题四]

#q(1)内切圆有一条外公切线，相交圆有两条外公切线，外切圆有两条外公切线和一条内公切线，外离两圆有四条公切线；#q(2)是，因为平行四边形的角都是直角；#q(3)是，因为它的邻边相等；#q(4)证其圆心距等于两半径之和或差，或证其连心线过它们的交点；#q(5)因为内心和某一旁心总与三角形某一角的两边都等距离；#q(6)是，是；#q(7)是；#q(9)$r$#sym.wj，$r$#sym.wj，$r → 2 r$#sym.wj；#q(11)$75°30'$#sym.wj；#q(14)$A B = 4 "cm"$/* 原书作 弧 AB */#sym.wj，$overparen(A E) = 60°$#sym.wj，$overparen(E B) = 120°$#sym.wj；#q(17)$49°30'$ 或 $94°30'$#sym.wj；#q(18)\(1) 存在一点到这四点等距离，(2) 这四点所成四边形的对角互补或它的外角等于内/* p.312 */对角，(3) 相邻两点到其余两点的视角相等；#q(19)$r$#sym.wj；#q(21)圆 $M$ 和 $N$ 外切，/* 原书漏 外切， */圆 $A$ 和 $N$ 外切，圆 $A$ 和 $M$ 内切；#q(22)$80°$#sym.wj，$70°$#sym.wj，$100°$#sym.wj，$110°$#sym.wj；#q(24)$102°$/* 原书作 78° */#sym.wj，$78°$/* 原书作 102° */#sym.wj；#q(25)$|a - b|$#sym.wj。

#sec[总复习题]

#q(1)$2 "cm"$#sym.wj；#q(2)$3 "cm"$#sym.wj，$6 "cm"$#sym.wj，$12 "cm"$#sym.wj；#q(3)6 个交点，15 个交点；#q(4)$10 "cm"$#sym.wj；#q(5)$C C' = 6 "cm"$#sym.wj，$B B' = 7 "cm"$#sym.wj；#q(6)$P Q = 3.8 "cm"$#sym.wj，$B C = 11.4 "cm"$#sym.wj；#q(24)$A P = 13 "cm"$#sym.wj。
