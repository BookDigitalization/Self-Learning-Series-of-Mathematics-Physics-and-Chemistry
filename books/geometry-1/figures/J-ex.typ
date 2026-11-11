// 习题 3·3（原书 p.172–174）、3·4（p.177–178）、3·5（p.181）、3·6（p.183–184）的插图；页面 200 dpi 坐标。
// 只按原图描出点位；平行四边形等按已知条件取成严格的几何关系。
#import "J-base.typ": *

// ───── 习题 3·3 ─────
// 第 3 题：E、F 分别是 AB、CD 的中点
#let fig-J-e33-3(width: 350 * k) = px-canvas(350, 200, origin: (150, 140), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D) = ((172, 306), (405, 306), (471, 172), (238, 172))
  let (E, F) = ((290, 306), (353, 172))
  poly(p, (A, B, C, D), close: true)
  seg(p, D, E)
  seg(p, F, B)
  lbl(p, D, $D$, dir: "nw", d: 11)
  lbl(p, F, $F$, dir: "n", d: 10)
  lbl(p, C, $C$, dir: "ne", d: 11)
  lbl(p, A, $A$, dir: "sw", d: 11)
  lbl(p, E, $E$, dir: "s", d: 10)
  lbl(p, B, $B$, dir: "se", d: 11)
})

// 第 4 题：三条平行线 l₁、l₂、l₃
#let fig-J-e33-4(width: 270 * k) = px-canvas(270, 160, origin: (565, 160), width: width, (p, u) => {
  import cetz.draw: *
  seg(p, (594, 177), (812, 177))
  seg(p, (594, 224), (812, 224))
  seg(p, (594, 299), (812, 299))
  lbl(p, (580, 177), $l_1$, dir: "c", d: 0)
  lbl(p, (585, 226), $l_2$, dir: "c", d: 0)
  lbl(p, (588, 299), $l_3$, dir: "c", d: 0)
})

// 第 5 题：DE、CF 垂直于 AB 或其延长线（△AED、△BFC 画阴影线）
#let fig-J-e33-5(width: 390 * k) = px-canvas(390, 190, origin: (470, 490), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D) = ((497, 640), (763, 640), (832, 505), (562, 505))
  let (E, F) = ((562, 640), (832, 640))
  J-hatch(p, (A, D, E), 1, 1, 6)
  J-hatch(p, (B, C, F), 1, 1, 6)
  poly(p, (A, B, C, D), close: true)
  seg(p, B, F)
  seg(p, D, E)
  seg(p, C, F)
  lbl(p, D, $D$, dir: "nw", d: 11)
  lbl(p, C, $C$, dir: "ne", d: 11)
  lbl(p, A, $A$, dir: "sw", d: 11)
  lbl(p, E, $E$, dir: "s", d: 11)
  lbl(p, B, $B$, dir: "s", d: 11)
  lbl(p, F, $F$, dir: "se", d: 11)
})

// 第 14 题（同时是提示里的“如图”）：MN 过对角线交点 O
#let fig-J-e33-14(width: 360 * k) = px-canvas(360, 195, origin: (520, 1060), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D) = ((540, 1222), (779, 1222), (849, 1085), (610, 1085))
  let O = (694.5, 1153.5)
  let M = (729, 1085)
  let N = (660, 1222)
  poly(p, (A, B, C, D), close: true)
  seg(p, A, C)
  seg(p, M, N)
  lbl(p, D, $D$, dir: "nw", d: 11)
  lbl(p, C, $C$, dir: "ne", d: 11)
  lbl(p, M, $M$, dir: "n", d: 10)
  lbl(p, A, $A$, dir: "sw", d: 11)
  lbl(p, N, $N$, dir: "s", d: 10)
  lbl(p, B, $B$, dir: "se", d: 11)
  lbl(p, O, $O$, dir: "se", d: 10)
})

// ───── 习题 3·4 ─────
// 第 1 题：方格纸上的四点 A、B、C、D
#let fig-J-e34-1(width: 350 * k) = px-canvas(350, 340, origin: (330, 495), width: width, (p, u) => {
  import cetz.draw: *
  for x in (368, 402, 436, 470, 503, 537, 570, 604, 638) {
    seg(p, (x, 505), (x, 825), stroke: lw)
  }
  for y in (529, 562, 596, 630, 664, 698, 732, 766, 800) {
    seg(p, (340, y), (668, y), stroke: lw)
  }
  let (A, B, C, D) = ((402, 664), (570, 562), (402, 766), (570, 664))
  // 两条直线：斜率相同（向右每 168 像素升 102 像素）
  seg(p, (340, 702.5), (641, 518.6), stroke: lb)
  seg(p, (340, 804.5), (662, 608), stroke: lb)
  for c in (A, B, C, D) {
    J-ring(p, c, r: 4)
  }
  lbl(p, B, $B$, dir: "se", d: 13)
  lbl(p, A, $A$, dir: "se", d: 13)
  lbl(p, D, $D$, dir: "se", d: 13)
  lbl(p, C, $C$, dir: "se", d: 13)
})

// 第 2 题：ABCD 和 ABEF 都是平行四边形
#let fig-J-e34-2(width: 370 * k) = px-canvas(370, 195, origin: (150, 1060), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D) = ((173, 1164), (407, 1164), (472, 1083), (238, 1083))
  let (E, F) = ((507, 1222), (273, 1222))
  poly(p, (A, B, C, D), close: true)
  poly(p, (A, B, E, F), close: true)
  seg(p, D, F)
  seg(p, C, E)
  lbl(p, D, $D$, dir: "nw", d: 11)
  lbl(p, C, $C$, dir: "ne", d: 11)
  lbl(p, A, $A$, dir: "w", d: 11)
  lbl(p, B, $B$, dir: "ne", d: 11)
  lbl(p, F, $F$, dir: "s", d: 10)
  lbl(p, E, $E$, dir: "s", d: 10)
})

// 第 3 题：∠B、∠D 的平分线与对角线 AC 交于 M、N
#let fig-J-e34-3(width: 350 * k) = px-canvas(350, 190, origin: (530, 1060), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D) = ((553, 1219), (787, 1219), (852, 1082), (618, 1082))
  let (M, N) = ((735, 1135.6), (670, 1165.4))
  poly(p, (A, B, C, D), close: true)
  seg(p, A, C)
  seg(p, D, M)
  seg(p, M, B)
  seg(p, D, N)
  seg(p, N, B)
  anglearc(p, D, A, C, 17)
  anglearc(p, B, A, C, 17)
  lbl(p, D, $D$, dir: "nw", d: 11)
  lbl(p, C, $C$, dir: "ne", d: 11)
  lbl(p, M, $M$, dir: "n", d: 10)
  lbl(p, N, $N$, dir: "s", d: 10)
  lbl(p, A, $A$, dir: "sw", d: 11)
  lbl(p, B, $B$, dir: "se", d: 11)
})

// 第 7 题：天平示意图（A、B、C、D 为活动关节）
#let fig-J-e34-7(width: 420 * k) = px-canvas(420, 290, origin: (280, 490), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, D, C) = ((378, 549), (378, 669), (587, 519), (587, 639))
  let (O1, O2) = ((484, 533.8), (484, 653.8))
  line(p(..A), p(..D), stroke: lb)
  line(p(..B), p(..C), stroke: lb)
  // 立柱
  line(p(484, 495), p(484, 727), stroke: lb)
  // 竖杆与秤盘
  line(p(..A), p(378, 719), p(324, 719), p(324, 697), stroke: lb)
  line(p(292, 681), p(292, 696), p(354, 696), p(354, 684), stroke: lb)
  line(p(..D), p(..C), p(587, 683), p(650, 683), p(650, 654), stroke: lb)
  line(p(618, 640), p(618, 653), p(680, 653), p(680, 641), stroke: lb)
  // 底座
  rect(p(452, 745), p(520, 727), stroke: lb)
  J-hatch(p, ((452, 727), (520, 727), (520, 745), (452, 745)), 1, 1, 6)
  line(p(374, 762), p(387, 745), p(590, 745), p(603, 762), stroke: lb)
  for c in (A, B, C, D, O1, O2) {
    J-ring(p, c, r: 3.5)
  }
  lbl(p, A, $A$, dir: "w", d: 11)
  lbl(p, B, $B$, dir: "w", d: 11)
  lbl(p, D, $D$, dir: "e", d: 11)
  lbl(p, C, $C$, dir: "e", d: 11)
})

// ───── 习题 3·5 ─────
// 第 2 题：已知 □ABCD 和对称中心 O（C′ 是 C 关于 O 的对称点）
#let fig-J-e35-2(width: 400 * k) = px-canvas(400, 330, origin: (440, 750), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D) = ((475, 970), (645, 972), (690, 776), (518, 774))
  let O = (745, 912)
  let C1 = (800, 1048)
  poly(p, (A, B, C, D), close: true)
  seg(p, C, C1, stroke: dsh)
  J-ring(p, O, r: 3)
  J-ring(p, C1, r: 3)
  lbl(p, D, $D$, dir: "nw", d: 11)
  lbl(p, C, $C$, dir: "ne", d: 11)
  lbl(p, A, $A$, dir: "sw", d: 11)
  lbl(p, B, $B$, dir: "se", d: 11)
  lbl(p, O, $O$, dir: "e", d: 11)
  lbl(p, C1, $C'$, dir: "se", d: 11)
})

// ───── 习题 3·6 ─────
// 第 2 题：矩形、菱形、正方形的对称轴（点划线）
#let fig-J-e36-2(width: 710 * k) = px-canvas(710, 210, origin: (110, 640), width: width, (p, u) => {
  import cetz.draw: *
  // 矩形
  rect(p(148, 785), p(305, 702), stroke: lb)
  line(p(227, 660), p(227, 817), stroke: dashdot)
  line(p(123, 743), p(335, 743), stroke: dashdot)
  // 菱形
  line(p(381, 743), p(487, 690), p(592, 743), p(487, 797), close: true, stroke: lb)
  line(p(350, 743), p(618, 743), stroke: dashdot)
  line(p(487, 655), p(487, 830), stroke: dashdot)
  // 正方形
  line(p(628, 743), p(803, 743), stroke: dashdot)
  line(p(713.5, 647), p(713.5, 835), stroke: dashdot)
  line(p(630, 830), p(797, 658), stroke: dashdot)
  line(p(630, 658), p(797, 830), stroke: dashdot)
  rect(p(662, 795), p(765, 690), stroke: lb)
  seg(p, (662, 690), (765, 795))
  seg(p, (765, 690), (662, 795))
})

// 解直线的交点（p1 + s·d1 = p2 + t·d2 的交点）
#let J-isect(p1, d1, p2, d2) = {
  let cr(a, b) = a.at(0) * b.at(1) - a.at(1) * b.at(0)
  let s = cr((p2.at(0) - p1.at(0), p2.at(1) - p1.at(1)), d2) / cr(d1, d2)
  (p1.at(0) + d1.at(0) * s, p1.at(1) + d1.at(1) * s)
}
// 顶点 v 处角 ∠(a, v, b) 的平分线方向
#let J-bis(v, a, b) = {
  let un(q) = {
    let (dx, dy) = (q.at(0) - v.at(0), q.at(1) - v.at(1))
    let l = calc.sqrt(dx * dx + dy * dy)
    (dx / l, dy / l)
  }
  let (u1, u2) = (un(a), un(b))
  (u1.at(0) + u2.at(0), u1.at(1) + u2.at(1))
}

// 第 10 题：平行四边形各角的平分线围成矩形 PSQR
#let fig-J-e36-10(width: 340 * k) = px-canvas(340, 185, origin: (350, 295), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D) = ((375, 453), (607, 453), (670, 316), (438, 316))
  let dA = J-bis(A, B, D)
  let dB = J-bis(B, A, C)
  let dC = J-bis(C, B, D)
  let dD = J-bis(D, A, C)
  let Q = J-isect(A, dA, B, dB)
  let P = J-isect(C, dC, D, dD)
  let S = J-isect(A, dA, D, dD)
  let R = J-isect(B, dB, C, dC)
  poly(p, (A, B, C, D), close: true)
  seg(p, A, Q)
  seg(p, B, Q)
  seg(p, D, P)
  seg(p, C, P)
  for r in (14, 19) {
    anglearc(p, A, B, D, r)
    anglearc(p, C, B, D, r)
  }
  anglearc(p, D, A, C, 17)
  anglearc(p, B, A, C, 17)
  lbl(p, D, $D$, dir: "nw", d: 11)
  lbl(p, C, $C$, dir: "ne", d: 11)
  lbl(p, A, $A$, dir: "sw", d: 11)
  lbl(p, B, $B$, dir: "se", d: 11)
  lbl(p, S, $S$, dir: "w", d: 10)
  lbl(p, Q, $Q$, dir: "n", d: 10)
  lbl(p, R, $R$, dir: "e", d: 10)
  lbl(p, P, $P$, dir: "s", d: 10)
})

// 第 13 题：正方形 ABCD，AE = BF = CG = DH，四个角上的三角形画阴影线
#let fig-J-e36-13(width: 280 * k) = px-canvas(280, 250, origin: (390, 700), width: width, (p, u) => {
  import cetz.draw: *
  let (A, D, B, C) = ((420, 720), (622, 720), (420, 923), (622, 923))
  let (E, F, G, H) = ((420, 786), (486, 923), (622, 857), (556, 720))
  for tri in ((A, E, H), (D, H, G), (C, G, F), (B, F, E)) {
    J-hatch(p, tri, 1, -1, 6)
  }
  poly(p, (A, D, C, B), close: true)
  poly(p, (E, F, G, H), close: true)
  lbl(p, A, $A$, dir: "nw", d: 11)
  lbl(p, H, $H$, dir: "n", d: 10)
  lbl(p, D, $D$, dir: "ne", d: 11)
  lbl(p, E, $E$, dir: "w", d: 11)
  lbl(p, G, $G$, dir: "e", d: 11)
  lbl(p, B, $B$, dir: "sw", d: 11)
  lbl(p, F, $F$, dir: "s", d: 10)
  lbl(p, C, $C$, dir: "se", d: 11)
})
