// 习题 3·8 第 4、10 题（原书 p.191）；习题 3·10 第 3、5、6、8、13 题（p.197、p.198）；页面 200 dpi 坐标。
// 第 13 题的河流、树只按原图轮廓用曲线重画（示意），三角形与虚线按原图坐标。
#import "K-base.typ": *

// 直线 a1a2 与 b1b2 的交点
#let K-isect(a1, a2, b1, b2) = {
  let (x1, y1) = a1
  let (x2, y2) = a2
  let (x3, y3) = b1
  let (x4, y4) = b2
  let d = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4)
  let t = ((x1 - x3) * (y3 - y4) - (y1 - y3) * (x3 - x4)) / d
  (x1 + (x2 - x1) * t, y1 + (y2 - y1) * t)
}

// ───────── 习题 3·8 ─────────
// 第 4 题：在 AB 两端画 ∠CAB = ∠DBA，在 AC、BD 上各截取 5 条相等线段，连线把 AB 分成 6 等分
#let fig-K-q3-8-4(width: 340 * k) = px-canvas(340, 165, origin: (520, 385), width: width, (p, u) => {
  import cetz.draw: *
  let A = (535, 399)
  let B = (832, 526)
  let yb(x) = 522 + (x - 537) * 4 / 295
  let tx = (590, 645, 695, 747, 800)
  let bx = (569, 622, 675, 727, 780)
  seg(p, A, (835, 399), stroke: dsh)
  seg(p, (537, 522), B, stroke: dsh)
  K-b(p, A, B)
  for i in range(5) {
    seg(p, (tx.at(i), 399), (bx.at(i), yb(bx.at(i))), stroke: dsh)
    line(p(tx.at(i), 394), p(tx.at(i), 404), stroke: lt)
    line(p(bx.at(i), yb(bx.at(i)) - 5), p(bx.at(i), yb(bx.at(i)) + 5), stroke: lt)
  }
  lbl(p, (528, 397), $A$, dir: "c", d: 0)
  lbl(p, (846, 397), $C$, dir: "c", d: 0)
  lbl(p, (566, 537), $D$, dir: "c", d: 0)
  lbl(p, (843, 530), $B$, dir: "c", d: 0)
})

// 第 10 题：直线 AB 与两条平行线 l₁、l₂
#let fig-K-q3-8-10(width: 335 * k) = px-canvas(335, 240, origin: (515, 830), width: width, (p, u) => {
  import cetz.draw: *
  K-b(p, (591, 851), (527, 1052))
  K-b(p, (665, 898), (824, 898))
  K-b(p, (665, 1001), (824, 1001))
  lbl(p, (596, 841), $B$, dir: "c", d: 0)
  lbl(p, (524, 1057), $A$, dir: "c", d: 0)
  lbl(p, (836, 900), $l_1$, dir: "c", d: 0)
  lbl(p, (836, 1004), $l_2$, dir: "c", d: 0)
})

// ───────── 习题 3·10 ─────────
// 第 3 题：四边形 ABCD 中 AD = BC，P、M、N 为 BD、DC、AB 的中点
#let fig-K-q3-10-3(width: 310 * k) = px-canvas(310, 205, origin: (145, 160), width: width, (p, u) => {
  import cetz.draw: *
  let (D, C, A, B) = ((164, 174), (437, 174), (195, 340), (400, 346))
  let M = (300, 174)
  let N = (300, 342)
  let P = K-mid(D, B)
  K-b(p, D, C)
  K-b(p, C, B)
  K-b(p, B, A)
  K-b(p, A, D)
  K-b(p, D, B)
  K-b(p, M, N)
  K-b(p, P, M)
  K-b(p, P, N)
  ticks(p, A, D, 1)
  ticks(p, B, C, 1)
  lbl(p, (152, 164), $D$, dir: "c", d: 0)
  lbl(p, (447, 168), $C$, dir: "c", d: 0)
  lbl(p, (305, 160), $M$, dir: "c", d: 0)
  lbl(p, (190, 352), $A$, dir: "c", d: 0)
  lbl(p, (300, 357), $N$, dir: "c", d: 0)
  lbl(p, (412, 352), $B$, dir: "c", d: 0)
  lbl(p, (270, 262), $P$, dir: "c", d: 0)
})

// 第 5 题：▱ABCD 中 M、N 是 AB、CD 的中点，DM、BN 与 AC 相交于 E、F
#let fig-K-q3-10-5(width: 330 * k) = px-canvas(330, 170, origin: (520, 180), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D) = ((534, 334), (767, 327), (826, 194), (599, 200))
  let M = K-mid(A, B)
  let N = K-mid(C, D)
  let E = K-isect(D, M, A, C)
  let F = K-isect(B, N, A, C)
  K-b(p, A, B)
  K-b(p, B, C)
  K-b(p, C, D)
  K-b(p, D, A)
  K-b(p, A, C)
  K-b(p, D, M)
  K-b(p, B, N)
  lbl(p, (590, 190), $D$, dir: "c", d: 0)
  lbl(p, (715, 184), $N$, dir: "c", d: 0)
  lbl(p, (838, 189), $C$, dir: "c", d: 0)
  lbl(p, (739, 224), $F$, dir: "c", d: 0)
  lbl(p, (641, 272), $E$, dir: "c", d: 0)
  lbl(p, (527, 345), $A$, dir: "c", d: 0)
  lbl(p, (654, 344), $M$, dir: "c", d: 0)
  lbl(p, (777, 339), $B$, dir: "c", d: 0)
})

// 第 6 题：AD 是中线，GD = AD/3，延长 AD 至 S 使 DS = GD
#let fig-K-q3-10-6(width: 300 * k) = px-canvas(300, 280, origin: (170, 845), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((365, 852), (187, 1042), (445, 1043))
  let (D, E, F) = (K-mid(B, C), K-mid(A, C), K-mid(A, B))
  let G = ((A.at(0) + B.at(0) + C.at(0)) / 3, (A.at(1) + B.at(1) + C.at(1)) / 3)
  let S = (2 * D.at(0) - G.at(0), 2 * D.at(1) - G.at(1))
  K-b(p, A, B)
  K-b(p, B, C)
  K-b(p, A, C)
  K-b(p, A, D)
  K-b(p, B, E)
  K-b(p, C, F)
  seg(p, D, S, stroke: dsh)
  seg(p, B, S, stroke: dsh)
  seg(p, C, S, stroke: dsh)
  lbl(p, (362, 842), $A$, dir: "c", d: 0)
  lbl(p, (262, 948), $F$, dir: "c", d: 0)
  lbl(p, (415, 948), $E$, dir: "c", d: 0)
  lbl(p, (172, 1046), $B$, dir: "c", d: 0)
  lbl(p, (454, 1046), $C$, dir: "c", d: 0)
  lbl(p, (342, 1000), $G$, dir: "c", d: 0)
  lbl(p, (323, 1053), $D$, dir: "c", d: 0)
  lbl(p, (292, 1115), $S$, dir: "c", d: 0)
})

// 第 8 题：P 是 ∠AOB 内的定点
#let fig-K-q3-10-8(width: 315 * k) = px-canvas(315, 180, origin: (515, 910), width: width, (p, u) => {
  import cetz.draw: *
  let (O, B, A) = ((530, 977), (802, 920), (802, 1077))
  let S = (755, 930)
  let N = (729, 1049)
  let M = (627, 1012)
  let P = K-mid(S, N)
  K-b(p, O, B)
  K-b(p, O, A)
  K-b(p, S, N)
  seg(p, M, P, stroke: dsh)
  K-ring(p, P, r: 2.5)
  lbl(p, (521, 977), $O$, dir: "c", d: 0)
  lbl(p, (815, 917), $B$, dir: "c", d: 0)
  lbl(p, (815, 1080), $A$, dir: "c", d: 0)
  lbl(p, (753, 918), $S$, dir: "c", d: 0)
  lbl(p, (757, 990), $P$, dir: "c", d: 0)
  lbl(p, (615, 1025), $M$, dir: "c", d: 0)
  lbl(p, (720, 1060), $N$, dir: "c", d: 0)
})

// 第 13 题：用三角形中位线测量不可到达的点 B（河流与树按原图示意重画）
#let fig-K-q3-10-13(width: 355 * k) = px-canvas(355, 290, origin: (520, 430), width: width, (p, u) => {
  import cetz.draw: *
  let A = (547, 510)
  let B = (750, 510)
  let V = (617, 705)
  // 河岸
  let bank1 = ((675, 445), (655, 465), (650, 490), (652, 515), (665, 550), (695, 580), (725, 600), (760, 620), (790, 645), (805, 675), (808, 680))
  let bank2 = ((780, 445), (745, 450), (715, 475), (707, 497), (725, 525), (748, 552), (772, 563), (800, 575), (825, 595), (847, 630), (855, 647))
  catmull(..bank1.map(t => p(..t)), tension: 0.5, stroke: lb)
  catmull(..bank2.map(t => p(..t)), tension: 0.5, stroke: lb)
  // 水纹
  let rip = (
    ((695, 450), (672, 475), (668, 505), (675, 535), (698, 562), (728, 582)),
    ((715, 455), (690, 480), (686, 510), (694, 540), (718, 568), (748, 586)),
    ((735, 470), (708, 495), (706, 520), (722, 548), (750, 570)),
    ((760, 575), (792, 595), (820, 622), (836, 648)),
    ((775, 590), (803, 612), (824, 640), (832, 662)),
    ((740, 588), (775, 610), (800, 640), (812, 670)),
  )
  for r in rip {
    catmull(..r.map(t => p(..t)), tension: 0.5, stroke: (paint: black, thickness: 0.5pt, dash: "dashed"))
  }
  // 树
  line(p(750, 462), p(741, 478), p(730, 486), p(739, 492), p(754, 495), p(772, 488), p(765, 477), p(758, 470), close: true, fill: black, stroke: none)
  // 三角形与中位线（虚线）
  seg(p, A, B, stroke: dsh)
  seg(p, A, V, stroke: dsh)
  seg(p, V, B, stroke: dsh)
  seg(p, K-mid(A, V), K-mid(V, B), stroke: dsh)
  lbl(p, (537, 505), $A$, dir: "c", d: 0)
  lbl(p, (762, 512), $B$, dir: "c", d: 0)
})
