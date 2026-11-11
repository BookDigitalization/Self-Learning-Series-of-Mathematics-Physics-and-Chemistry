// 第 4 章（中间一段）：分组“圆的基本性质”之 §4·3 在同圆（或等圆）中，弦、弧、弦心距之间的关系（p.221）、
// §4·4 圆心角、圆周角、圆内角和圆外角的度量（p.227），含习题 4·3、4·4；到 §4·5 标题（p.236）之前为止。
#import "/common/series.typ": *
#import "/common/geo.typ": step
#import "/books/geometry-1/figures/M-4-11-15.typ": *
#import "/books/geometry-1/figures/M-4-16-19.typ": *
#import "/books/geometry-1/figures/M-4-20-26.typ": *
#import "/books/geometry-1/figures/M-4-27-31.typ": *
#import "/books/geometry-1/figures/M-ex.typ": *

// p.221
== 在同圆（或等圆）中，弦、弧、弦心距之间的关系

圆心到弦的距离叫作*弦心距*。如图 4·11，圆 $O$ 中的 $O M ⊥ A B$，$O M$ 就是弦 $A B$ 的弦心距。

假设图中的 $overparen(A B) = overparen(C D)$。把 $overparen(A B)$ 连同半径 $O A$，$O B$ 依照箭头所指的方向绕着圆心 $O$ 旋转，使点 $A$ 和点 $C$ 重合，那么点 $B$ 就和点 $D$ 重合，因此

$ A B = C D ju $

这时弦心距 $O M$ 和 $O N$ 也重合，所以

$ O M = O N ju $

#fig("4·11", fig-M-4-11(), [])

从此得出下面的定理：

*定理 1*　在同圆或等圆#footnote[如果弦 $A B$ 和 $C D$ 在两个等圆 $O$ 和 $O'$ 中，则应先把圆 $O'$ 和圆 $O$ 重合，再用旋转的方法。]中，相等的弧所对的弦相等；相等的弦的弦心距相等。

反过来，我们用同样的方法容易证明下面的定理：

*定理 2*　在同圆或等圆中，相等的弦所对的劣弧#footnote[劣弧是指小于半圆的弧。]相等；弦心距相等的弦相等。

如图 4·12，圆 $O$ 和 $O'$ 是相等的。设 $A B = C D$。

*求证*　$overparen(A B) = overparen(C D)$。

#sol(label: [证])[请读者参照上面旋转图形的方法自己来证明。]

#fig("4·12", fig-M-4-12(), [])

// p.222
下面来讨论弦和弦心距之间的不等量关系：

*定理 3*　在同圆或等圆中，对两条不相等的弦，大弦的弦心距较小。

*假设*　弦 $A B >$ 弦 $C D$，$O M ⊥ A B$，$O N ⊥ C D$（图 4·13）。

*求证*　$O M < O N$。

#fig("4·13", fig-M-4-13(), [])

#sol(label: [证])[从点 $A$ 作弦 $A E = C D$，因为 $A B > C D$，$∴$ $A B > A E$，则圆心 $O$ 与点 $E$ 落在 $A B$ 的两旁。过点 $O$ 引 $A E$ 的垂线 $O K$。则 $O K$ 和 $A B$ 相交于一点 $S$，构成 $△O M S$。

在 $△O M S$ 中，因为 $O M ⊥ A B$，可知 $O S$ 是直角三角形 $O M S$ 的斜边，因此

$ O S > O M "（斜边大于任一直角边）" ju $

又因 $O S$ 是 $O K$ 的一部分，当然有

$ O K > O S dou $

#step[$∴$ #h(1em) $O K > O M ju$]

但是弦 $A E = C D$，所以它们的弦心距相等，就是

$ O N = O K ju $

从此得 $O N > O M$，即 $O M < O N$。
]

// p.223
*定理 4*　在同圆或等圆中，对两条不相等的弦，弦心距较小的弦较大。

*假设*　$A B$ 和 $C D$ 是圆 $O$ 中的两条弦，又 $O M ⊥ A B$，$O N ⊥ C D$，并且 $O M < O N$（图 4·14）。

*求证*　$A B > C D$。

#fig("4·14", fig-M-4-14(), [])

#sol(label: [证])[我们用反证法。

弦 $A B$ 和 $C D$ 之间只可能有下面三种关系的一种：

$ A B = C D dou quad A B < C D dou quad A B > C D ju $

但是 $A B$ 不可能等于 $C D$，因为这样就要有 $O M = O N$，这和假设 $O M < O N$ 相矛盾。

$A B$ 也不可能小于 $C D$，因为这样就要有 $O M > O N$，这和假设 $O M < O N$ 相矛盾。

因而 $A B > C D$ 成立。
]

#ex[例 1.][求证圆的直径是最大的弦。]

*假设*　圆 $O$ 中 $A B$ 是直径，$C D$ 是不通过圆心的任意弦（图 4·15）。

*求证*　$A B > C D$。

#fig("4·15", fig-M-4-15(), [])

#analysis[要证明直径 $A B$ 大于弦 $C D$，只要连接两条半径 $O C$ 和 $O D$，/* p.224 */则在 $△O C D$ 中有 $O C + O D > C D$。但 $O C + O D = A B$。这样就证得了 $A B > C D$。]

#sol(label: [证])[连接 $O C$，$O D$，因为题设 $C D$ 是不通过圆心的任意弦，所以一定可以作出 $△O C D$。在 $△O C D$ 中，

$ O C + O D > C D "（三角形内两边之和大于第三边）" ju $

但是

$ O C + O D = A B "（直径等于同圆半径的 2 倍）" dou $

#step[$∴$ #h(1em) $A B > C D ju$]
]

#ex[例 2.][已知等腰三角形的腰长是 2 厘米，顶角等于 $120°$。求它的外接圆的直径之长。]

#sol[如图 4·16，圆 $O$ 是等腰三角形 $A B C$ 的外接圆，其中 $∠A = 120°$，$A B = A C = 2 "cm"$。

作 $∠A$ 的平分线 $A M$，则 $A M$ 必垂直平分 $B C$。根据 §4·2 定理 2 可知 $A M$ 经过圆心 $O$。连半径 $O C$，则因为 $O A = O C$，而 $∠O A C = 60°$，所以 $△A O C$ 是一个等边三角形。

#step[$∴$ #h(1em) $O A = A C = 2 "cm" ju$]

从此得，

直径 $A P = 2 O A = 2 "cm" times 2 = 4 "cm" ju$

#align(right)[答：外接圆的直径等于 4 厘米。]]

#fig("4·16", fig-M-4-16(), [])

#ex[例 3.][过圆 $O$ 内一点 $P$ 引两条相等的弦 $A B$ 和 $C D$（图/* p.225 */ 4·17）。求证 $O P$ 平分 $∠D P B$，也就是 $∠O P D = ∠O P B$。]

#fig("4·17", fig-M-4-17(), [])

#analysis[要证明 $∠O P D = ∠O P B$，可以利用等弦的弦心距相等的关系。作辅助线 $O M ⊥ A B$，$O N ⊥ C D$，则有

$ O M = O N dou $

只要证得直角三角形 $O N P$ 和 $O M P$ 全等就可以了。]

#sol(label: [证])[从圆心 $O$ 作 $O M ⊥ A B$，$O N ⊥ C D$。因为 $A B = C D$，则有

$ O M = O N ju $

在直角三角形 $O N P$ 和 $O M P$ 中，已证得

$ O N = O M dou quad O P = O P dou $

#step[$∴$ #h(1em) $△O N P ≌ △O M P$（斜边和直角边对应相等的两直角三角形全等）。]

#step[$∴$ #h(1em) $∠O P N = ∠O P M$。]

也就是 $O P$ 平分 $∠D P B$。]

#ex[例 4.][在圆 $O$ 中引两条不等的平行弦 $A B$ 和 $C D$（图 4·18）。求证]

$ A C = B D ju $

#fig("4·18", fig-M-4-18(), [])

#remark([分析 1], [要证明弦 $A C = B D$，只需证明它们所对的劣弧 $overparen(C B A)$ 等于 $overparen(B A D)$ 就可以了。])

#sol(label: [证 1])[因为 $A B ∥ D C$，

#step[$∴$ #h(1em) $overparen(B C) = overparen(A D)$（平行弦之间所夹的弧相等）。]

等式两边各加 $overparen(A B)$，则有

$ overparen(A B) + overparen(B C) = overparen(A B) + overparen(A D) dou $

就是

$ overparen(C B A) = overparen(B A D) dou $

#step[$∴$ #h(1em) $A C = B D$（等弧对等弦）。]
]

本例的证明又可如下来考虑：

// p.226
#remark([分析 2], [如图 4·19。由题设 $A B ∥ D C$，可知 $A B C D$ 是一梯形，而 $A C$，$B D$ 都是梯形的对角线。要证明梯形的对角线相等，只要证得 $A B C D$ 是一个等腰梯形就可以了。])

#sol(label: [证 2])[请读者自己完成。]

#fig("4·19", fig-M-4-19(), [])

#exercise("4·3")[
  + 通过圆内的一已知点，试作一弦使之被这点平分。

    ［提示：利用直径垂直于弦的性质。］

  + 过圆上一定点 $A$，引弦 $A B$ 和 $A C$ 分别等于这圆的半径，连接 $B C$。求圆心到 $B C$ 的距离。

    ［提示：连接 $O A$，$O B$，$O C$，证明 $O C A B$ 是一个菱形。再由菱形的性质即可求得圆心 $O$ 到 $B C$ 的距离。］

  + 过圆上一点引两条互相垂直的弦。如果圆心到这两条弦的距离分别为 30 厘米和 10 厘米，求这两弦之长。

  + 在已知圆中任意引两条直径，顺次连接它们的端点所组成的四边形是一个矩形。

  + 在同一圆中，已知弦 $A B = 12 "cm"$，$C D = 8 "cm"$，这两弦的弦心距哪一个大？

  + 在圆 $O$ 中，弦 $A B = C D$（如图），求证：(1) $overparen(A C) = overparen(B D)$；(2) $∠1 = ∠2$。

    #plainfig((fig-M-ex43-q6(), [（第 6 题）]))

  + 已知一条直线和这直线外的一点，求以已知点为圆心作一个圆，使这圆在已知直线上截取定长线段。

    ［提示：自已知点画已知直线的垂线，在已知直线上垂足的两旁各取一点，使这点与垂足间的距离等于定长线段的一半。再以已知点为圆心，这点到直线上刚取的那个点之长为半径的圆就是所求的。］

  + 过圆外一点 $M$，引圆 $O$ 的两条割线 $M B A$ 和 $M D C$，连接 $M O$。/* p.227 */如果 $∠O M A = ∠O M C$，求证 $overparen(A B) = overparen(C D)$。

    #plainfig((fig-M-ex43-q8(), [（第 8 题）]), (fig-M-ex43-q10(), [（第 10 题）]))

  + 在上题的圆中，$M B A$ 和 $M D C$ 是割线。已知弦 $A B = C D$。求证 $B M = D M$。

    ［提示：连 $O M$，过圆心 $O$ 作 $A B$ 和 $C D$ 的垂线，再证明两直角三角形全等。］

  + 如图。$A B$ 是圆 $O$ 的直径，已知 $B C$ 弦长 4 厘米，求弦 $A C$ 中点至点 $O$ 的距离。

    ［提示：应用三角形的中位线性质。］

  + 圆内一弦与直径相交成 $30°$ 的角，且分直径成 1 厘米和 5 厘米两部分。求这弦的弦心距。

  + \* 求已知圆内等弦的中点的轨迹。

    ［提示：等弦的中点的轨迹是以这圆的圆心为圆心，弦心距为半径的圆。］
]

== 圆心角、圆周角、圆内角和圆外角的度量

*1. 圆心角*　顶点在圆心上的角叫作*圆心角*。如图 4·20 的 $∠A O B$ 和 $∠A' O B'$ 都是。

下面我们来研究圆心角和它所对的弧的关系。

把圆心角 $A' O B'$ 依照图 4·20 中箭头所指的方向旋转，先/* p.228 */使 $O B'$ 落到 $O B$ 的位置。如果 $O A'$ 落到 $O A$ 的位置，那么圆心角 $A' O B'$ 所对的 $overparen(A' B')$ 也就落到 $overparen(A B)$ 的位置。这样就可以知道在一个圆中有下面的定理：

#fig("4·20", fig-M-4-20(), [])

#fig("4·21", fig-M-4-21(), [])

*定理*　在同圆或等圆中，相等的圆心角所对的弧相等。

反过来，用同样的方法可以得到

*定理*　在同圆或等圆中，相等的弧所对的圆心角相等。

我们已经知道一个周角是 $360°$，如果把一个圆心角分成 360 等分，这时整个圆周也被分成 360 等分。我们把每一份叫作*$1°$ 的弧*。由此可以看到，$n°$ 的圆心角所对的弧是 $n°$ 的弧。反过来，$n°$ 的弧所对的圆心角是 $n°$。从此得出

*圆心角定理*　圆心角的度数等于它所对的弧的度数。

#remark([注意], [$1°$ 的弧是指任何一个圆来说的，不管圆的半径的大小，总是把整个圆周的 360 分之 1 叫作 $1°$ 的弧。例如图 4·22 中，是两个圆心相同半径不等的圆（同心圆），$∠A O B = d$，所以 $overparen(A B)$ 是 $90°$ 的弧，$overparen(A' B')$ 也是 $90°$ 的弧，它们都是自己的圆周的四分之一（就是 $frac(90, 360)$）。但是 $overparen(A B)$ 并不等于 $overparen(A' B')$。这是因为它们的圆的半径不等的关系。因此，相等的弧和相同度数的弧的意义是不同的。如图 4·20 中的 $overparen(A' B')$ 和 $overparen(A B)$ 是#edot[相等的弧]，也是#edot[相同度数的弧]。如图 4·22 中的 $overparen(A B)$ 和 $overparen(A' B')$ 是#edot[相同度数的弧]，但不是#edot[相等的弧]。前面所讲的量角器，就是根据圆心角定理制作的。])

// p.229
*2. 圆周角*　顶点在圆上，并且两边和圆相交的角叫作*圆周角*。如图 4·23 的 $∠P$。下面我们来研究圆周角和它所对的弧的关系。

#fig("4·22", fig-M-4-22(), [])

#fig("4·23", fig-M-4-23(), [])

前面已经知道，圆心角的度数等于它所对的弧的度数，所以研究圆周角时也可以研究它和同弧上的圆心角的关系。

如图 4·24(1) 的情况，圆周角 $A P B$ 的一边 $A P$ 通过圆心 $O$。那么连接 $O B$ 就可以证得，$∠A O B$ 是等腰 $△P O B$ 的外角，所以 $∠A O B = 2 ∠P$。就是 $∠P = frac(1, 2) ∠A O B$。

#fig("4·24", fig-M-4-24(), [])

如图 4·24 的 (2) 或 (3) 的情况，圆周角 $A P B$ 的边都不通过圆心。只要经过 $P$ 作直径 $P S$，连接 $O A$ 和 $O B$，就可以得/* p.230 */

图 4·24 (2) 中，

$ ∠A P B &= ∠A P S + ∠S P B \
  &= frac(1, 2) ∠A O S + frac(1, 2) ∠S O B \
  &= frac(1, 2) ∠A O B fen $

图 4·24 (3) 中，

$ ∠A P B &= ∠A P S - ∠B P S \
  &= frac(1, 2) ∠A O S - frac(1, 2) ∠B O S \
  &= frac(1, 2) ∠A O B ju $

因此，不管是哪种情况，圆周角都等于对同弧的圆心角的一半。由于圆心角的度数等于它所对的弧的度数，所以得出

*圆周角定理*　圆周角的度数等于它所对的弧的度数的一半。

从上述定理，可以推知下面的重要推论。

*推论 1*　半圆上的圆周角是直角。

例如，图 4·25 的 $overparen(A Q B)$/* 原书作 弧 APB */ 的度数 $= 180°$，所以

$ ∠A P B = frac(1, 2) times 180° = 90° ju $

#fig("4·25", fig-M-4-25(), [])

#fig("4·26", fig-M-4-26(), [])

*推论 2*　同一条弧上的圆周角都相等。

// p.231
例如，图 4·26 的 $∠A P B = ∠A Q B = ∠A R B$。

*3. 圆内角*　角的顶点在圆内的角叫作*圆内角*。如图 4·27 的 $∠A P D$。

我们研究圆内角可以从与它相等的圆周角来考虑。过点 $C$ 作 $C S$ 平行于 $A B$，则有

$ ∠A P D = ∠C ju $

因为 $∠C$ 的度数等于 $overparen(D A S)$ 的度数的一半。但是

$ overparen(D A S) = overparen(D A) + overparen(A S) ju $

又 $overparen(A S) = overparen(B C)$（平行弦之间所夹的弧相等），

所以 $∠A P D$ 的度数等于 $(overparen(D A) + overparen(B C))$ 的度数的一半。

从此得出

*圆内角定理*　圆内角的度数等于它所对的弧与它对顶角所对的弧的度数之和的一半。

#fig("4·27", fig-M-4-27(), [])

#fig("4·28", fig-M-4-28(), [])

*4. 圆外角*　角的顶点在圆外，并且两边都和圆相交的角叫作*圆外角*。如图 4·28 的 $∠A P D$。

我们研究圆外角也可从与它相等的圆周角来考虑。过点 $C$ 作 $C S$ 平行于 $A B$，则有

// p.232
$ ∠A P D = ∠S C D ju $

因为 $∠S C D$ 的度数等于 $overparen(S D)$ 的度数的一半。但是

$ overparen(S D) = overparen(A D) - overparen(A S) dou $

又 $overparen(A S) = overparen(B C)$（平行弦之间所夹的弧相等），

就是

$ overparen(S D) = overparen(A D) - overparen(B C) dou $

所以 $∠A P D$ 的度数等于 $(overparen(A D) - overparen(B C))$ 的度数的一半。

从此得出

*圆外角定理*　圆外角的度数等于它所截两条弧的度数之差的一半。

#ex[例 1.][如图 4·29 的 $overparen(A B)$ 和 $overparen(B C)$ 的度数分别是 $80°$ 和 $110°$。求 $△A B C$ 的三内角的度数。]

#fig("4·29", fig-M-4-29(), [])

#sol[因为一个整圆的度数是 $360°$，

$ ∴ quad overparen(C A) "的度数" &= 360° - (80° + 110°) \
  &= 170° ju $

因此，得

$ ∠A &= frac(1, 2) overparen(B C) "的度数" = frac(1, 2) times 110° = 55° dou \
  ∠B &= frac(1, 2) overparen(A C) "的度数" = frac(1, 2) times 170° = 85° dou \
  ∠C &= frac(1, 2) overparen(A B) "的度数" = frac(1, 2) times 80° = 40° ju $

#align(right)[答：$∠A = 55°$，$∠B = 85°$，$∠C = 40°$。]]

#ex[例 2.][已知一直角三角形的一直角边和斜边，求作此直角三角形。]

*已知*　线段 $a$，$c$。

// p.233
*求作*　直角三角形 $A B C$，使它的斜边 $A B = c$，直角边 $B C = a$。

#sol(label: [作法])[如图 4·30。作线段 $A B = c$，以 $A B$ 为直径画半圆。]

#fig("4·30", fig-M-4-30(), [])

以 $B$ 为圆心，$a$ 为半径画弧，使交半圆于点 $C$。

连接 $B C$ 和 $A C$，则 $△A B C$ 就是所要作的直角三角形。

#sol(label: [证])[因为 $∠A C B$ 是半圆上的圆周角，

#step[$∴$ #h(1em) $∠A C B$ 是直角。]

由作图知 $A B = c$，$B C = a$。

#step[$∴$ #h(1em) $△A B C$ 是所要作的直角三角形。]
]

#ex[例 3.][在圆周上任取四个点把圆周分成四段弧，求证连接相对两弧的中点的直线互相垂直。]

*已知*　$P$，$M$，$Q$，$N$ 依次是 $overparen(C D)$，$overparen(D A)$，$overparen(A B)$，$overparen(B C)$ 的中点（图 4·31）。

*求证*　$P Q ⊥ M N$。

#fig("4·31", fig-M-4-31(), [])

#sol(label: [证])[因为 $P$，$M$，$Q$，$N$ 是 $overparen(C D)$，$overparen(D A)$，$overparen(A B)$ 和 $overparen(B C)$ 的中点，则有

$ overparen(D P) &= overparen(P C) dou \
  overparen(M D) &= overparen(M A) dou \
  overparen(B Q) &= overparen(Q A) dou \
  overparen(N B) &= overparen(N C) ju $

// p.234
把上面等式的左边和左边相加，右边和右边相加，得

$ overparen(D P) + overparen(M D) + overparen(B Q) + overparen(N B) = overparen(P C) + overparen(M A) + overparen(Q A) + overparen(N C) dou $

就是 $overparen(M P) + overparen(Q N) = overparen(M Q) + overparen(P N)$。等式两边弧的度数，因为它们都是整圆的度数的一半，所以都等于 $180°$。

设 $P Q$ 与 $M N$ 相交于 $S$，则圆内角 $∠M S P$ 等于 $(overparen(M P) + overparen(Q N))$ 的度数的一半。

$ ∴ quad ∠M S P = frac(1, 2) times 180° = 90° ju $

就是

$ P Q ⊥ M N ju $
]

#exercise("4·4")[
  + 已知圆周角等于 $22°30'$，求它所对的弧的度数。

  + 求分圆周成 $3 rt 5$ 的弦上的圆周角的度数。

  + 求连接圆周上成 $1 rt 2 rt 3$ 的三个分点所成的三角形的三个内角。

  + 一条弦分圆周成两部分，其中一部分是另一部分的 4 倍。求这弦所对的圆周角。

  + 以圆的直径为一边作等边三角形，求圆周被这三角形其他两边截成的三条弧的度数。

  + 已知圆内接等腰三角形的腰所对的弧为 $99°24'$，求等腰三角形的内角。

  + 圆上有四个点 $A$，$B$，$C$，$D$，分圆成四条弧，这四条弧的度数的比为 $overparen(A B) rt overparen(B C) rt overparen(C D) rt overparen(D A) = 2 rt 3 rt 5 rt 6$。求下列相交直线所成的角：

    #cols[(1) $A B$ 和 $C D$；][(2) $B C$ 和 $A D$；][(3) $A C$ 和 $B D$。]

  + 如图。过圆外一点 $N$ 向圆引两条割线 $M N$ 和 $P N$，交圆于 $A$，$B$，$C$，$D$。如果弧的度数的比为 $overparen(A B) rt overparen(B C) rt overparen(C D) rt overparen(D A) = 4 rt 6 rt 5 rt 9$，求 $∠A N D$。

  + 自圆上一点 $A$ 引直径 $A B$ 和弦 $A C$。如果：(1) 弧的度数之比为 $overparen(A C) rt overparen(C B) = 7 rt 9$；(2) $overparen(A C)$ 的度数比 $overparen(C B)$ 的度数大 $36°18'$；求 $∠B A C$。

    #plainfig((fig-M-ex44-q8(), [（第 8 题）]), (fig-M-ex44-q10(), [（第 10 和 11 题）]))

  // p.235
  + 如图。已知 $A B$ 是直径，$∠1 > ∠2$。求证 $A C < A D$。

    ［提示：先证得 $overparen(A C) < overparen(A D)$。］

  + 如图。已知 $A B$ 是直径，$A C < A D$。求证 $∠1 > ∠2$。

  + 以大圆的半径为直径作一小圆，求证大圆中过这条半径端点的弦被小圆所平分。

    ［提示：利用小圆的半圆上的圆周角是直角，从而得到垂直于弦的直径平分这弦。］

  + 以锐角三角形的两边分别为直径作圆，求证这两个圆的交点在第三边上。

    ［提示：应用半圆周上的圆周角是直角的性质。］

  + 等腰三角形的顶角为 $56°$，以它的一腰为直径作半圆，它被底边分成两部分，求这两条弧的度数。

  + 弦 $A B$ 和 $C D$ 相交于点 $M$。如果：

    (1) $∠A M C = 39°$，$overparen(A C) = frac(1, 2) overparen(D B)$；

    (2) $∠A M C = 55°$，$overparen(B D)$ 的度数比 $overparen(A C)$ 的度数大 $62°$；

    (3) $∠A M C = 75°$，$overparen(B D) rt overparen(A C) = 2 rt 3$；

    求 $overparen(A C)$ 和 $overparen(B D)$ 的度数。

  + 从圆外一点 $N$ 向圆引割线 $N B A$ 和 $N D C$，如果：

    (1) $overparen(A C)$ 的度数是 $112°20'$，$overparen(B D)$ 的度数是 $33°40'$；

    (2) $overparen(A B)$ 的度数是 $120°$，$overparen(B D) rt overparen(D C) rt overparen(C A) = 1 rt 3 rt 8$；

    (3) $overparen(A B)$ 的度数是 $38°$，$overparen(D C)$ 的度数是 $72°$，$overparen(B D) rt overparen(A C) = 3 rt 7$；/* p.236 */

    求两割线所成的角。

  + 过圆外一点 $M$ 向圆引两条割线 $M B A$ 和 $M D C$，如果：

    (1) $∠M = 65°$，弧的度数之比为 $overparen(B D) rt overparen(A C) = 4 rt 9$；

    (2) $∠M = 39°$，$overparen(B D)$ 和 $overparen(A C)$ 的度数之和为 $118°$；

    (3) $∠M = 48°$，$overparen(A B)$ 和 $overparen(C D)$ 的度数分别是 $37°$ 和 $113°$；

    求 $overparen(B D)$ 和 $overparen(A C)$ 的度数。

  + 已知直角三角形 $A B C$ 中，$∠C = 90°$。利用半圆周上的圆周角等于直角，求作下列条件的直角三角形：

    (1) 已知 $∠A$ 和 $c$ 边；

    (2) 已知 $c$ 边和 $c$ 边上的高 $h$。
]
