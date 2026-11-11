// 第 1 章（中间一段，段 C）：§1·5 三角形内角、外角平分线性质（p.38 起）、分组“相似三角形”、§1·6 相似多边形（p.46–52 前半）。
// 本段到 §1·7 标题之前为止（p.52 中部）。习题 1·5、1·6 都在本段内。
#import "/common/series.typ": *
#import "/common/geo.typ": step
#import "/books/geometry-2/figures/C-1-26-30.typ": *
#import "/books/geometry-2/figures/C-1-31-37.typ": *

// p.38
== 三角形内角、外角平分线性质

*1. 三角形内角平分线定理*　三角形内角的平分线按照夹这个角的两边的比内分对边。

*已知*　在 $△A B C$ 中，$A D$ 是 $∠B A C$ 的平分线（图 1·26）。

*求证*　$display((B D)/(D C) = (A B)/(A C))$。

#fig("1·26", fig-C-1-26(), [])

#analysis[要判定线段 $B D$，$D C$，$A B$，$A C$ 成比例，我们可以应用平行线截得比例线段定理 1。但是这四条线段必须对应地分布在同一个三角形的两边上。为此，过 $C$ 引 $D A$ 的平行线 $C E$，交 $B A$ 的延长线于 $E$。在 $△B C E$ 中，显然有 $display((B D)/(D C) = (B A)/(A E))$，只要能够证得 $A E = A C$ 即可。]

#sol(label: [证])[过 $C$ 引 $C E ∥ D A$，$C E$ 交 $B A$ 的延长线于 $E$。]

#step[$∵ C E ∥ D A$，]

#step[$∴ ∠1 = ∠1'$，$∠2 = ∠2'$。]

#step[$∵ A D$ 是 $∠B A C$ 的平分线，]

#step[$∴ ∠1 = ∠2$。　从而 $∠1' = ∠2'$，]

#step[由此得　$A E = A C$。]

#step[$∵ C E ∥ D A$，]

// p.39
#step[$∴ display((B D)/(D C) = (B A)/(A E))$。]

#step[也就是　$display((B D)/(D C) = (A B)/(A C))$。]

*2. 三角形外角平分线定理*　三角形外角的平分线如果和对边的延长线相交，它按照夹相应内角的两边的比外分对边。

*已知*　在 $△A B C$ 中，外角 $C A E$ 的平分线 $A D$ 交 $B C$ 的延长线于 $D$（图 1·27）。

*求证*　$display((B D)/(D C) = (A B)/(A C))$。

#fig("1·27", fig-C-1-27(), [])

#analysis[要判定线段 $B D$，$D C$，$A B$，$A C$ 成比例，我们可以应用平行线截得比例线段定理 1 或它的推论。但是这四条线段必须对应地分布在同一个三角形的两边上，为此，过 $C$ 引 $C E ∥ D A$，交 $A B$ 于 $E$。在 $△A B D$ 中，显然有 $display((B D)/(D C) = (B A)/(A E))$，只要能证得 $A E = A C$ 即可。]

#sol(label: [证])[过 $C$ 引 $C E ∥ D A$，$C E$ 交 $A B$ 于 $E$。]

#step[$∵ C E ∥ D A$，]

#step[$∴ ∠1 = ∠1'$，$∠2 = ∠2'$。]

// p.40
#step[$∵ A D$ 是 $∠C A E$ 的平分线，]

#step[$∴ ∠1 = ∠2$。　从而 $∠1' = ∠2'$，]

#step[由此得　$A E = A C$。]

#step[$∵ C E ∥ D A$，]

#step[$∴ display((B D)/(D C) = (B A)/(A E))$。]

#step[也就是　$display((B D)/(D C) = (B A)/(A C))$。]

#attention[在这一条定理里，当 $A B > A C$ 时，$A D$ 交 $B C$ 的延长线于 $D$；当 $A B = A C$ 时，$A D ∥ B C$，$A D$ 和 $B C$ 不相交；当 $A B < A C$ 时，$A D$ 交 $C B$ 的延长线于 $D$。]

#ex[例 1.][在 $△A B C$ 中，点 $D$ 按照 $A B$ 和 $A C$ 的比内分 $B C$。试证线段 $A D$ 是 $∠B A C$ 的平分线。]

*已知*　在 $△A B C$ 中，$display((B D)/(D C) = (A B)/(A C))$（图 1·28）。

*求证*　$A D$ 是 $∠B A C$ 的平分线。

#fig("1·28", fig-C-1-28(), [])

#sol(label: [证])[作 $∠B A C$ 的平分线 $A D'$。依据三角形内角平分线定理得]

#eqno([(1)], $display((B D')/(D' C) = (A B)/(A C)) ju$)

把 (1) 式和已知比例 $display((B D)/(D C) = (A B)/(A C))$ 作比较，得

#eqno([(2)], $display((B D')/(D' C) = (B D)/(D C)) ju$)

// p.41
对 (2) 式应用合比定理，得

$ (B D' + D' C)/(D' C) = (B D + D C)/(D C) dou $

即

$ (B C)/(D' C) = (B C)/(D C) ju $

从而 $D' C = D C$，$D$ 和 $D'$ 重合，$A D$ 和 $A D'$ 重合。因此 $A D$ 是 $∠B A C$ 的平分线。

#attention[这个例题是三角形内角平分线定理的逆定理，证明这条逆定理的方法是同一法。利用图 1·26 也可以证明这条逆定理，请读者自己考虑证明方法。]

#ex[例 2.][已知 $△A B C$ 的三边 $B C$，$C A$，$A B$ 的长分别为 $a$，$b$，$c$。求它的内心 $I$ 分三条角平分线 $A D$，$B E$，$C F$ 所成之比（图 1·29）。]

#fig("1·29", fig-C-1-29(), [])

#sol[三角形的内心是三条角平分线的交点。]

#step[$∵ C F$ 平分角 $A C B$，]

#step[$∴ A C rt C B = A F rt F B$。]

也就是

$ b rt a = A F rt (c - A F) dou $

从而有

$ A F = (b c)/(a + b) ju $

#step[$∵ A I$ 平分角 $C A F$，]

#step[$∴ C I rt I F = A C rt A F$。]

也就是

$ C I rt I F = b rt (b c)/(a + b) = (a + b) rt c ju $

// p.42
同法可得

$ A I rt I D = (b + c) rt a dou \
  B I rt I E = (c + a) rt b ju $

答：内心 $I$ 分三条角平分线所成之比分别为 $A I rt I D = (b + c) rt a$；$B I rt I E = (c + a) rt b$；$C I rt I F = (a + b) rt c$。

#ex[例 3.][在 $△A B C$ 中，点 $D$ 按照 $A B$ 和 $A C$ 的比外分 $B C$。证明线段 $A D$ 是 $△A B C$ 的外角 $C A E$ 的平分线（图 1·30）。]

#fig("1·30", fig-C-1-30(), [])

*已知*　在 $△A B C$ 中，$display((B D)/(D C) = (A B)/(A C))$。

*求证*　$A D$ 是 $△A B C$ 外角 $C A E$ 的平分线。

#sol(label: [证])[过 $△A B C$ 的顶点 $C$ 作线段 $C F ∥ D A$，交 $A B$ 于 $F$。依据平行线的性质定理得]

#eqno([(1)], $∠A F C = ∠E A D dou$)

#eqno([(2)], $∠A C F = ∠C A D ju$)

根据平行线截得比例线段定理 1 的推论，得 $display((B D)/(D C) = (B A)/(A F))$。但是 $display((B D)/(D C) = (A B)/(A C))$，所以 $display((A B)/(A C) = (A B)/(A F))$。就是 $A F = A C$。于是 $△A C F$ 是等腰三角形，$∠A C F = ∠A F C$。再结合 (1) 与 (2)/* p.43 */式，得

$ ∠E A D = ∠A F C = ∠A C F = ∠C A D dou $

所以 $A D$ 是 $△A B C$ 的外角 $C A E$ 的平分线。

#attention[这个例题就是三角形外角平分线定理的逆定理，它的证明也可以采用与例 1 类似的方法，读者可以把它们互相对比。]

#ex[例 4.][已知 $△A B C$ 的三边 $A B$，$B C$，$C A$ 的长各为 $5 "cm"$，$3 "cm"$，$4 "cm"$。在底边 $A B$ 和它的延长线上分别取点 $D$ 和 $D'$，使 $A D = mx(2, 6, 7) "cm"$，$B D' = 15 "cm"$（图 1·31）。]

*求证*　$C D ⊥ C D'$。

#fig("1·31", fig-C-1-31(), [])

#sol(label: [证])[连接 $C D$ 和 $C D'$。]

#step[$∵ A D rt D B = mx(2, 6, 7) rt (5 - mx(2, 6, 7)) = 4 rt 3 = C A rt B C$，]

#step[$∴ C D$ 平分 $∠A C B$。]

#step[$∵ A D' rt D' B = (5 + 15) rt 15 = 4 rt 3 = C A rt B C$，]

#step[$∴ C D'$ 平分 $△A B C$ 的外角 $B C E$。]

#step[$∵ ∠A C B + ∠B C E = 2 d$，]

#step[$∴ ∠D C D' = ∠D C B + ∠B C D'$]

#step[#h(2em)$= display(1/2) ∠A C B + display(1/2) ∠B C E$]

// p.44
#step[#h(2em)$= display(1/2) (∠A C B + ∠B C E)$]

#step[#h(2em)$= display(1/2) ⋅ 2 d$]

#step[#h(2em)$= d$。]

#step[$∴ C D ⊥ C D'$。]

#exercise("1·5")[
  + 在 $△A B C$ 中，$A D$ 和 $A D'$ 分别为 $∠A$ 和它的外角的平分线，它们和对边 $B C$ 的交点分别是 $D$，$D'$。求证 $display((B D)/(D C) = (B D')/(D' C))$。

  + 在 $△A B C$ 中，$A B ≠ A C$。$∠A$ 的平分线交对边 $B C$ 于 $D$。$D'$ 是 $B C$ 延长线上的点，如果以 $D D'$ 为直径的圆通过顶点 $A$，那么 $display((B D)/(D C) = (B D')/(D' C))$。

  + 在 $△A B C$ 中，$∠B$ 与 $∠C$ 的平分线各交 $A C$，$A B$ 于 $D$ 和 $E$，如果 $A B = A C$，那么 $D E ∥ B C$。

  + 在四边形 $A B C D$ 中，如果一组对角 $A$ 和 $C$ 的平分线的交点 $E$ 在对角线 $B D$ 上，那么，另一组对角 $B$ 和 $D$ 的平分线的交点 $F$ 在对角线 $A C$ 上。

    #plainfig((fig-C-ex1-5-4(), [（第 4 题）]))

    ［已知：四边形 $A B C D$ 的对角 $A$ 和 $C$ 的平分线的交点 $E$ 在对角/* p.45 */线 $B D$ 上（如图）。

    求证：$∠B$ 和 $∠D$ 的平分线的交点 $F$ 必在另一对角线 $A C$ 上。

    证：已知 $∠A$ 和 $∠C$ 的平分线的交点 $E$ 在 $B D$ 上，由角平分线定理得 $A B rt A D = B E rt E D$，以及 $C B rt C D = B E rt E D$。从这两个等式就有 $A B rt A D = C B rt C D$，又可以把它改写为

    #eqno([(1)], $A B rt C B = A D rt C D ju$)

    假定 $∠B$ 和 $∠D$ 的平分线分别交对角线 $A C$ 于 $F$ 和 $F'$。那么根据与前面同样的理由，应有 $A B rt C B = A F rt F C$，以及 $A D rt C D = A F' rt F' C$。这时由 (1) 式可以知道 $A F rt F C = A F' rt F' C$，从合比定理得 $(A F + F C) rt F C = (A F' + F' C) rt F' C$，也就是 $A C rt F C = A C rt F' C$。于是 $F C = F' C$，从而可知 $F$ 与 $F'$ 重合。这就是说 $∠B$ 与 $∠D$ 的平分线的交点 $F$ 在对角线 $A C$ 上。］

  + $A C$ 和 $B D$ 是四边形 $A B C D$ 的对角线，如果 $∠B A C$ 和 $∠B D C$ 的平分线的交点在 $B C$ 边上，那么 $∠A B D$ 和 $∠A C D$ 的平分线的交点在 $A D$ 边上。

  + 已知 $B D$ 为 $△A B C$ 中 $∠B$ 的平分线：

    (1) $A B = 10 "cm"$，$B C = 15 "cm"$，$A C = 20 "cm"$。求 $A D$ 和 $D C$；

    (2) $A D rt D C = 8 rt 5$，$A B = 16 "cm"$。求 $B C$；

    (3) $A B rt B C = 2 rt 7$，$D C - A D = 1 "cm"$。求 $A C$。

  + 三角形的两边各为 $9 "cm"$ 和 $6 "cm"$，它们夹角的平分线分第三边成两段，其中的一段等于两边中的一边，求这三角形的第三边。

  + 在 $△A B C$ 中，$B C = a$，$C A = b$，$A B = c$。$∠B$ 和 $∠C$ 的平分线相交于 $O$，$A O$ 的延长线交 $B C$ 于 $D$。求 $A O rt O D$。

    ［提示：可设 $B D = a - C D$；或 $C D = a - B D$。］

  + $D$ 为 $△A B C$ 中 $B C$ 上的一点，由下面的条件分别判定 $A D$ 是否是 $∠A$ 的平分线：

    (1) $A B = 12 "cm"$，$A C = 15 "cm"$，$B D = 8 "cm"$，$D C = 10 "cm"$；

    (2) $A B = 12 "m"$，$A C = 56 "cm"$，$B D rt D C = 14 rt 3$；

    (3) $A B = display(5/11) A C$，$B D = 2 "m"$，$D C = 4.5 "m"$；

    (4) $A B = 6 "m"$，$A C = 28 "m"$，$B D = display(3/17) B C$。

  // p.46
  + $A M N P$ 为 $△A B C$ 的内接菱形，点 $M$，$N$ 和 $P$ 分别在 $A B$，$B C$ 和 $C A$ 上。如果 $A B = 21 "cm"$，$B C = 18 "cm"$，$C A = 15 "cm"$；求 $B N$ 和 $N C$ 的长。

    ［提示：菱形的对角线平分菱形的角。］

  + 在 $△A B C$ 中，$A B = 15 "cm"$，$A C = 10 "cm"$。$A D$ 为 $∠A$ 的平分线，由点 $D$ 引直线平行于 $A B$，并和 $A C$ 相交于 $E$。求 $A E$，$E C$ 和 $D E$。

  + 在等腰三角形 $A B C$ 中，$A C = b$，$A B = B C = a$。$A N$ 和 $C M$ 为 $∠A$ 与 $∠C$ 的平分线。求 $M N$ 的长。

  #par(hanging-indent: 1.4em)[\*13. 自已知 $△A B C$ 的顶点 $A$，引动直线 $A K$，交 $B C$ 于 $K$。求证 $△A K C$ 的内心的轨迹是一条线段。]
]

=== 相似三角形

== 相似多边形

图 1·32 和图 1·33 是同一地段的平面图，在绘图时由于应用了不同的比例尺，因此它们的大小不同，但形状是一样/* p.47 */的。如果用量角器和直尺分别度量它们的每一个角和每一条边，我们得到下面的关系：(1) 它们的对应角相等，即 $∠A = ∠A'$，$∠B = ∠B'$，$∠C = ∠C'$，$∠D = ∠D'$；(2) 它们的对应边都成比例，即 $display((A B)/(A' B') = (B C)/(B' C') = (C D)/(C' D') = (D A)/(D' A'))$。

#grid(columns: (auto, auto), column-gutter: 1.5em, align: bottom,
  fig("1·32", fig-C-1-32(), []),
  fig("1·33", fig-C-1-33(), []))

我们把对应角相等、对应边都成比例的两个多边形叫作*相似多边形*。

表示两个图形相似，我们用符号“∽”，读作“相似于”。在图 1·32 和 1·33 里，显然有四边形 $A B C D$ ∽ 四边形 $A' B' C' D'$。

两个相似多边形的任一组对应边的比叫作*相似比*（也叫作*相似系数*）。在图 1·32 和图 1·33 里，我们分别量得 $A B = 1.3 "cm"$，$A' B' = 2.6 "cm"$。相似四边形 $A B C D$ 和 $A' B' C' D'$ 的相似比为 $1 \/ 2$。在这里我们规定：如果多边形 $I$ 和多边形 $I I$ 的相似比等于 $K$，那么多边形 $I$ 的一条边是多边形 $I I$ 的一条对应边的 $K$ 倍。当 $K = 1$，即多边形 $I$ 和多边形 $I I$ 的每一组对应边相等时，则它们不仅相似，而且全等。#edot[因此全等多边形是相似多边形当相似比等于 1 时的特例]。

判定两个多边形相似，必须指出它们同时符合两个条件：(1)#edot[对应角相等]，(2)#edot[对应边都成比例]。正方形和矩形的对应角相等，但是对应边不都成比例，因此它们不是相似形。正方/* p.48 */形和菱形的对应边都成比例，但是对应角不等，因此它们也不是相似形（图 1·34）。

#fig("1·34", fig-C-1-34(), [])

在日常生活里，我们经常遇到形状相同的图形，例如原来照片和放大后的照片，用不同比例尺绘制的同一机械零件的图样等等。

#ex[例 1.][锐角等于 $60°$ 的两个菱形是相似的。]

*已知*　菱形 $A B C D$ 的 $∠A = 60°$，菱形 $A' B' C' D'$ 的 $∠A' = 60°$（图 1·35）。

*求证*　菱形 $A B C D$ ∽ 菱形 $A' B' C' D'$。

#fig("1·35", fig-C-1-35(), [])

#sol(label: [证])[$∵$ 菱形 $A B C D$ 的 $∠A = 60°$，$∴$ 其他的三个角为：$∠B = 120°$，$∠C = 60°$，$∠D = 120°$。同样菱形 $A' B' C' D'$ 的 $∠A' = 60°$，其他三角各为：$∠B' = 120°$，$∠C' = 60°$，$∠D' = 120°$。从而有]

#eqno([(1)], $∠A = ∠A' dou quad ∠B = ∠B' dou quad ∠C = ∠C' dou quad ∠D = ∠D' ju$)

$∵$ 菱形是等边的，$∴ A B = B C = C D = D A$；$A' B' = B' C' = C' D' = D' A'$。从而有

#eqno([(2)], $display((A B)/(A' B') = (B C)/(B' C') = (C D)/(C' D') = (D A)/(D' A')) ju$)

由 (1)，(2) 两式可知，菱形 $A B C D$ ∽ 菱形 $A' B' C' D'$。

// p.49
#ex[例 2.][工厂铺地用矩形水泥砖，半砖 $E F D A$ 和整砖 $A B C D$ 相似。求水泥砖的两条邻边的比（图 1·36）。]

#fig("1·36", fig-C-1-36(), [])

*已知*　矩形 $E F D A$ ∽ 矩形 $A B C D$，并且 $A E = display(1/2) A B$。

*求*　$display((A B)/(D A))$。

#sol[设 $A B = a$，$D A = b$，则 $A E = display(1/2) a$。这里 $D A$ 是矩形 $E F D A$ 的长边，同时它又是矩形 $A B C D$ 的短边。$∵$ 矩形 $E F D A$ ∽ 矩形 $A B C D$，]

#step[$∴ display((A B)/(D A) = (D A)/(A E))$。即 $display(a/b = b/(a\/2))$。]

从上式得

$ a^2 = 2 b^2 dou quad (a^2)/(b^2) = 2 dou quad a/b = sqrt(2) ju $

#align(right)[答：$display((A B)/(D A)) = sqrt(2)$。]

#ex[例 3.][两个相似梯形的中位线分原梯形为两组对应相似梯形。]

*已知*　梯形 $A B C D$ ∽ 梯形 $A' B' C' D'$。中位线 $E F$ 分梯形 $A B C D$ 为四边形 $A B F E$ 和 $E F C D$；中位线 $E' F'$ 分梯形 $A' B' C' D'$ 为四边形 $A' B' F' E'$ 和 $E' F' C' D'$（图 1·37）。

// p.50
*求证*　四边形 $A B F E$，$E F C D$，$A' B' F' E'$，$E' F' C' D'$ 都是梯形；并且梯形 $A B F E$ ∽ 梯形 $A' B' F' E'$，梯形 $E F C D$ ∽ 梯形 $E' F' C' D'$。

#fig("1·37", fig-C-1-37(), [])

#sol(label: [证])[$∵ E F ∥ A B$，$∴ A B F E$ 是梯形。同理可证 $E F C D$，$A' B' F' E'$，$E' F' C' D'$ 都是梯形。]

$∵$ 梯形 $A B C D$ ∽ 梯形 $A' B' C' D'$，依据相似多边形的定义，有

#eqno([(1)], $∠A = ∠A' dou quad ∠B = ∠B' dou quad ∠C = ∠C' dou quad ∠D = ∠D' dou$)

#eqno([(2)], $display((A B)/(A' B') = (B C)/(B' C') = (C D)/(C' D') = (D A)/(D' A')) ju$)

$∵ E F ∥ C D$，$E' F' ∥ C' D'$，$∴$ (1) 的四个等式可以写为

#eqno([(3)], $cases(reverse: #true,
  ∠A = ∠A' dou quad ∠B = ∠B' dou,
  ∠B F E = ∠C = ∠C' = ∠B' F' E' dou,
  ∠F E A = ∠D = ∠D' = ∠F' E' A' ju,
)$)

这表示梯形 $A B F E$ 和 $A' B' F' E'$ 的对应角相等。

等式 (2) 的部分可以写为 $display((A B)/(A' B') = (display(1/2) B C)/(display(1/2) B' C') = (display(1/2) D A)/(display(1/2) D' A'))$，

// p.51
即

#eqno([(4)], $display((A B)/(A' B') = (B F)/(B' F') = (E A)/(E' A')) ju$)

从等式 $display((A B)/(A' B') = (C D)/(C' D'))$ 应用等比定理，得

#eqno([(5)], $display((A B)/(A' B') = (A B + C D)/(A' B' + C' D') = (display(1/2) (A B + C D))/(display(1/2) (A' B' + C' D'))) ju$)

#step[$∵ E F = display(1/2) (A B + C D)$，$E' F' = display(1/2) (A' B' + C' D')$，]

#step[$∴$ (5) 式成为]

#eqno([(6)], $display((A B)/(A' B') = (E F)/(E' F')) ju$)

从 (4)，(6) 两式得

#eqno([(7)], $display((A B)/(A' B') = (B F)/(B' F') = (E F)/(E' F') = (E A)/(E' A')) ju$)

这表示梯形 $A B F E$ 和 $A' B' F' E'$ 的对应边都成比例。由 (3) 和 (7)，依据相似多边形的定义，梯形 $A B F E$ ∽ 梯形 $A' B' F' E'$。用同法可证梯形 $E F C D$ ∽ 梯形 $E' F' C' D'$。

#exercise("1·6")[
  + 所有的矩形都相似吗？所有的菱形呢？为什么？

  + 举出一个日常生活中经常遇到的相似形的例子。

  + 两个四边形中，如果它们的对应边成比例，并且有三个角对应相等，这两个四边形是否相似？

  + 证明所有的正方形都相似。

  + 证明有一个锐角对应相等的两个菱形相似。

  + 窗玻璃的内外框都是矩形，而且内外框间的宽度都是一样的。/* p.52 */这两个矩形是否相似？

  + 已知梯形的两底分别为 $a$ 厘米与 $b$ 厘米。如果一直线平行于底，并且把梯形分成两个小的相似梯形。求这直线夹在两腰间的线段之长。

  + 在 §1·6 的例 2（图 1·36）中，如果已知砖长 $A B = 160 "cm"$，求砖的宽 $A D$。

  + 在 ▱$A B C D$ 中，已知 $A B = a "dm"$，$B C = b "dm"$。直线 $E F$ 截平行四边形成两个小的平行四边形，其中 $E F D A$ 和 $A B C D$ 相似。求 $A E$ 的长。

  + 求作一个四边形，使它和一个已知四边形相似，并且对应边的比等于 2。
]
