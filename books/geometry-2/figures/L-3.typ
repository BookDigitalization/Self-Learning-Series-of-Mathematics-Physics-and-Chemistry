// 第 3 章 §3·7 的插图：图 3·29（原书 p.206）、3·30（p.207）、3·31（p.208）、3·32（p.209）、3·33（p.210）、
// 3·34（p.212）、3·35（p.213）、3·36、3·37（p.214）、3·38（p.216）；习题 3·7 第 6 题（p.217）、第 12、14 题（p.218）；
// 复习题三 第 3、4 题（p.219）、第 17 题（p.221）。页面 120 dpi 坐标。
// 图 3·30、3·33 各含四幅分图，画在同一块画布上，分图号 (1)–(4) 是图里的文字。
#import "L-base.typ": *

// 图 3·29：XY ∥ AB，△ABC₁、△ABC₂ 同底等高，h 为 XY 与 AB 的距离
#let fig-L-3-29(width: 365 * k) = px-canvas(365, 250, origin: (465, 1000), width: width, (p, u) => {
  import cetz.draw: *
  let (C1, C2, A, B) = ((538, 1025), (745, 1025), (580, 1222), (712, 1222))
  seg(p, (482, 1025), (806, 1025))
  seg(p, A, B)
  seg(p, A, C1)
  seg(p, B, C1)
  seg(p, A, C2)
  seg(p, B, C2)
  dseg(p, (500, 1222), (575, 1222))
  dseg(p, (718, 1222), (826, 1222))
  dimv(p, 783, 1025, 1222, lab: $h$, rot: false)
  lbl(p, (478, 1025), $X$, dir: "w", d: 3)
  lbl(p, (806, 1025), $Y$, dir: "e", d: 8)
  lbl(p, C1, $C_1$, dir: "n", d: 10)
  lbl(p, C2, $C_2$, dir: "n", d: 10)
  lbl(p, A, $A$, dir: "s", d: 10)
  lbl(p, B, $B$, dir: "s", d: 10)
})

// 图 3·30（四幅分图）：例 1 的作法 (1)–(4)
#let fig-L-3-30(width: 625 * k) = px-canvas(625, 630, origin: (205, 645), width: width, (p, u) => {
  import cetz.draw: *
  // (1) 等腰：MN 为 BC 的垂直平分线
  {
    let (A, A1, B, C) = ((270, 729), (414, 729), (356, 876), (474, 876))
    seg(p, (232, 729), (482, 729))
    seg(p, A, B); seg(p, A, C); seg(p, A1, B); seg(p, A1, C); seg(p, B, C)
    dseg(p, (415, 672), (417, 910))
    lbl(p, (232, 729), $X$, dir: "w", d: 7)
    lbl(p, (482, 729), $Y$, dir: "e", d: 8)
    lbl(p, A, $A$, dir: "n", d: 10)
    lbl(p, A1, $A'$, dir: "ne", d: 10)
    lbl(p, B, $B$, dir: "s", d: 10)
    lbl(p, C, $C$, dir: "s", d: 10)
    lbl(p, (415, 668), $N$, dir: "n", d: 4)
    lbl(p, (417, 914), $M$, dir: "s", d: 6)
    lbl(p, (373, 948), [(1)], dir: "c", d: 0)
  }
  // (2) 有一个底角等于 α
  {
    let (A, A1, B, C) = ((567, 729), (710, 729), (652, 876), (766, 876))
    seg(p, (543, 729), (757, 729))
    seg(p, A, B); seg(p, A, C); seg(p, A1, B); seg(p, A1, C); seg(p, B, C)
    lbl(p, (543, 729), $X$, dir: "w", d: 7)
    lbl(p, (757, 729), $Y$, dir: "e", d: 8)
    lbl(p, A, $A$, dir: "n", d: 10)
    lbl(p, A1, $A'$, dir: "ne", d: 10)
    lbl(p, B, $B$, dir: "s", d: 10)
    lbl(p, C, $C$, dir: "s", d: 10)
    // 已知角 α
    poly(p, ((613, 657), (591, 712), (649, 711)))
    lbl(p, (610, 698), $α$, dir: "c", d: 0)
    lbl(p, (670, 866), $α$, dir: "c", d: 0)
    lbl(p, (659, 946), [(2)], dir: "c", d: 0)
  }
  // (3) 顶角等于 β：在 BC 上作含已知圆周角 β 的弧
  {
    let (A, A1, A2, B, C) = ((244, 1038), (300, 1038), (448, 1038), (333, 1185), (417, 1185))
    seg(p, (217, 1038), (481, 1038))
    seg(p, A, B); seg(p, A, C); seg(p, A1, B); seg(p, A1, C); seg(p, A2, B); seg(p, A2, C); seg(p, B, C)
    circle(p(375, 1099), radius: 96, stroke: dsh)
    lbl(p, (217, 1038), $X$, dir: "w", d: 7)
    lbl(p, (481, 1038), $Y$, dir: "e", d: 8)
    lbl(p, A, $A$, dir: "nw", d: 8)
    lbl(p, A1, $A'$, dir: "ne", d: 10)
    lbl(p, A2, $A''$, dir: "ne", d: 12)
    lbl(p, B, $B$, dir: "s", d: 10)
    lbl(p, C, $C$, dir: "s", d: 10)
    lbl(p, (315, 1067), $β$, dir: "c", d: 0)
    lbl(p, (434, 1066), $β$, dir: "c", d: 0)
    // 已知角 β
    poly(p, ((282, 985), (226, 1017), (288, 1018)))
    lbl(p, (265, 1008), $β$, dir: "c", d: 0)
    lbl(p, (376, 1236), [(3)], dir: "c", d: 0)
  }
  // (4) BC 边上的中线等于 l：以 BC 的中点 O 为圆心、l 为半径作圆弧
  {
    let (A, A1, A2, B, C, O) = ((538, 1036), (598, 1036), (744, 1036), (629, 1183), (714, 1183), (671, 1183))
    seg(p, (522, 1036), (772, 1036))
    seg(p, A, B); seg(p, A, C); seg(p, A1, B); seg(p, A1, C); seg(p, A2, B); seg(p, A2, C); seg(p, B, C)
    dseg(p, O, A1)
    dseg(p, O, A2)
    carc(p, O, 5.7, 176.7, 164, stroke: dsh)
    // 已知线段 l
    seg(p, (557, 1003), (724, 1003))
    tickat(p, (557, 1003), (724, 1003), (557, 1003), s: 4)
    tickat(p, (557, 1003), (724, 1003), (724, 1003), s: 4)
    lbl(p, (634, 993), $l$, dir: "c", d: 0)
    lbl(p, (644, 1118), $l$, dir: "c", d: 0)
    lbl(p, (710, 1119), $l$, dir: "c", d: 0)
    lbl(p, (522, 1036), $X$, dir: "w", d: 7)
    lbl(p, (772, 1036), $Y$, dir: "e", d: 8)
    lbl(p, A, $A$, dir: "n", d: 10)
    lbl(p, A1, $A'$, dir: "n", d: 10)
    lbl(p, A2, $A''$, dir: "ne", d: 12)
    lbl(p, B, $B$, dir: "s", d: 10)
    lbl(p, C, $C$, dir: "s", d: 10)
    lbl(p, O, $O$, dir: "s", d: 10)
    lbl(p, (663, 1234), [(4)], dir: "c", d: 0)
  }
})

// 图 3·31：五边形 ABCDE 化为等积四边形 AFDE（CF ∥ BD）
#let fig-L-3-31(width: 370 * k) = px-canvas(370, 260, origin: (470, 990), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D, E, F) = ((552, 1197), (672, 1197), (778, 1072), (598, 1008), (497, 1115), (825, 1197))
  seg(p, E, A); seg(p, A, F); seg(p, F, D); seg(p, D, E); seg(p, D, C); seg(p, C, B)
  dseg(p, D, B)
  dseg(p, C, F)
  lbl(p, D, $D$, dir: "n", d: 9)
  lbl(p, E, $E$, dir: "w", d: 9)
  lbl(p, C, $C$, dir: "ne", d: 9)
  lbl(p, A, $A$, dir: "s", d: 9)
  lbl(p, B, $B$, dir: "s", d: 9)
  lbl(p, F, $F$, dir: "se", d: 9)
})

// 图 3·32：作面积与 △ABC 相等的正方形 FHIJ（FJ 为 ½AB 与 CD 的比例中项）
#let fig-L-3-32(width: 560 * k) = px-canvas(560, 220, origin: (240, 915), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D) = ((272, 1101), (469, 1101), (404, 924), (404, 1101))
  tri(p, A, B, C)
  dseg(p, C, D)
  lbl(p, A, $A$, dir: "sw", d: 9)
  lbl(p, B, $B$, dir: "se", d: 9)
  lbl(p, C, $C$, dir: "n", d: 9)
  lbl(p, D, $D$, dir: "s", d: 9)
  let (E, F, G) = ((520, 1101), (615, 1101), (784, 1101))
  let (H, I, J) = ((742, 1101), (742, 974), (615, 974))
  seg(p, E, G)
  poly(p, (F, H, I, J), close: true)
  carc(p, (652, 1101), 0, 180, 132.3, stroke: dsh)
  dimh(p, 521, 615, 1114, lab: $1/2 A B$, gapw: 42)
  dimh(p, 615, 784, 1114, lab: $C D$, gapw: 26)
  lbl(p, (604, 1038), $x$, dir: "c", d: 0)
  lbl(p, E, $E$, dir: "nw", d: 9)
  lbl(p, G, $G$, dir: "ne", d: 9)
  lbl(p, J, $J$, dir: "nw", d: 9)
  lbl(p, I, $I$, dir: "ne", d: 9)
  lbl(p, (626, 1088), $F$, dir: "c", d: 0)
  lbl(p, (754, 1088), $H$, dir: "c", d: 0)
})

// 图 3·33（四幅分图）：作与 △ABC 等积的等边三角形
#let fig-L-3-33(width: 630 * k) = px-canvas(630, 480, origin: (195, 785), width: width, (p, u) => {
  import cetz.draw: *
  // (1)
  {
    let (A, B, C, D) = ((220, 912), (392, 908), (338, 803), (338, 910))
    tri(p, A, B, C)
    dseg(p, C, D)
    lbl(p, A, $A$, dir: "sw", d: 9)
    lbl(p, B, $B$, dir: "se", d: 9)
    lbl(p, C, $C$, dir: "n", d: 9)
    lbl(p, D, $D$, dir: "s", d: 9)
    lbl(p, (305, 977), [(1)], dir: "c", d: 0)
  }
  // (2) 三等分，EF = 2/3 AB
  {
    let O = (555, 822)
    let F = (734, 822)
    let E = lerp(O, F, 1 / 3)
    let G2 = lerp(O, F, 2 / 3)
    let q(i) = (O.at(0) + 32.5 * i, O.at(1) + 21.3 * i)
    seg(p, O, F)
    dseg(p, O, q(4.8))
    dseg(p, q(3), F)
    dseg(p, q(2), G2)
    dseg(p, q(1), E)
    dimh(p, E.at(0), F.at(0), 808, lab: $2/3 A B$, gapw: 44)
    lbl(p, O, $O$, dir: "w", d: 9)
    lbl(p, E, $E$, dir: "nw", d: 7)
    lbl(p, F, $F$, dir: "ne", d: 8)
    lbl(p, (657, 973), [(2)], dir: "c", d: 0)
  }
  // (3) GH = √3 CD
  {
    let (G, H, I) = ((228, 1172), (398, 1172), (228, 1067))
    dseg(p, G, H)
    dseg(p, G, I)
    line(p(..I), p(..H), stroke: dsh, mark: arw2)
    rtmark(p, G, H, I, s: 8)
    dimv(p, 209, 1067, 1172, lab: $C D$)
    dimh(p, 228, 402, 1196, lab: $sqrt(3) C D$, gapw: 58)
    wl(p, (313, 1119), $2 C D$, ang: -31.7deg)
    lbl(p, I, $I$, dir: "nw", d: 8)
    lbl(p, G, $G$, dir: "sw", d: 9)
    lbl(p, H, $H$, dir: "se", d: 9)
    lbl(p, (305, 1243), [(3)], dir: "c", d: 0)
  }
  // (4) 以 A'C' 为边作等边三角形
  {
    let (M, N, A1, C1) = ((490, 1167), (787, 1167), (607, 1167), (607, 1022))
    let B1 = (A1.at(0) + 145 * calc.sqrt(3) / 2, 1167 - 72.5)
    seg(p, M, N)
    carc(p, ((490 + 787) / 2, 1167), 0, 180, 148.5, stroke: (paint: black, thickness: 1.1pt, dash: "dashed"))
    tri(p, A1, B1, C1)
    ring(p, A1, r: 2.5)
    dimh(p, 490, 607, 1196, lab: $2/3 A B$, gapw: 44)
    dimh(p, 607, 787, 1196, lab: $sqrt(3) C D$, gapw: 58)
    lbl(p, M, $M$, dir: "w", d: 9)
    lbl(p, N, $N$, dir: "e", d: 9)
    lbl(p, A1, $A'$, dir: "n", d: -10)
    lbl(p, C1, $C'$, dir: "nw", d: 9)
    lbl(p, B1, $B'$, dir: "e", d: 10)
    lbl(p, (726, 1234), [(4)], dir: "c", d: 0)
  }
})

// 图 3·34：正方形 ABCD 与周长为其 5/4、面积相等的矩形 A'B'C'D'
#let fig-L-3-34(width: 570 * k) = px-canvas(570, 200, origin: (190, 380), width: width, (p, u) => {
  import cetz.draw: *
  poly(p, ((217, 389), (369, 389), (369, 541), (217, 541)), close: true)
  lbl(p, (217, 389), $D$, dir: "nw", d: 8)
  lbl(p, (369, 389), $C$, dir: "ne", d: 8)
  lbl(p, (217, 541), $A$, dir: "sw", d: 8)
  lbl(p, (369, 541), $B$, dir: "se", d: 8)
  lbl(p, (288, 530), $a$, dir: "c", d: 0)
  poly(p, ((442, 462), (738, 462), (738, 535), (442, 535)), close: true)
  lbl(p, (442, 462), $D'$, dir: "nw", d: 9)
  lbl(p, (738, 462), $C'$, dir: "ne", d: 9)
  lbl(p, (442, 535), $A'$, dir: "sw", d: 9)
  lbl(p, (738, 535), $B'$, dir: "se", d: 9)
  dimv(p, 417, 464, 535, lab: $x = a/2$)
  dimh(p, 442, 738, 561, lab: $y = 2a$, gapw: 38)
})

// 图 3·35：过顶点 A 的线段三等分 △ABC 的面积
#let fig-L-3-35(width: 250 * k) = px-canvas(250, 280, origin: (630, 630), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((791, 647), (647, 832), (850, 834))
  let D = lerp(B, C, 1 / 3)
  let E = lerp(B, C, 2 / 3)
  tri(p, A, B, C)
  seg(p, A, D)
  seg(p, A, E)
  let q(i) = (647 + 52 * i, 832 + 15.5 * i)
  dseg(p, B, (862, 896))
  dseg(p, q(1), D)
  dseg(p, q(2), E)
  dseg(p, q(3), C)
  lbl(p, A, $A$, dir: "n", d: 9)
  lbl(p, B, $B$, dir: "w", d: 9)
  lbl(p, C, $C$, dir: "e", d: 9)
  lbl(p, D, $D$, dir: "ne", d: 13)
  lbl(p, E, $E$, dir: "ne", d: 13)
})

// 图 3·36：过 P 平分 △ABC 面积的线段 PQ（MQ ∥ AP，M 为 BC 中点）
#let fig-L-3-36(width: 300 * k) = px-canvas(300, 230, origin: (160, 225), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, P) = ((359, 239), (185, 437), (437, 436), (236, 436))
  let M = lerp(B, C, 0.5)
  let Q = isect(M, (M.at(0) + A.at(0) - P.at(0), M.at(1) + A.at(1) - P.at(1)), A, C)
  tri(p, A, B, C)
  seg(p, P, Q)
  dseg(p, A, P)
  dseg(p, A, M)
  dseg(p, M, Q)
  lbl(p, A, $A$, dir: "n", d: 9)
  lbl(p, B, $B$, dir: "sw", d: 9)
  lbl(p, C, $C$, dir: "se", d: 9)
  lbl(p, P, $P$, dir: "s", d: 10)
  lbl(p, M, $M$, dir: "s", d: 10)
  lbl(p, Q, $Q$, dir: "e", d: 9)
})

// 图 3·37：作 B'C' ∥ BC，使 △AB'C' 的面积为 △ABC 的三分之一（N、M 为 AB 的三等分点）
#let fig-L-3-37(width: 250 * k) = px-canvas(250, 245, origin: (560, 215), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((724, 245), (568, 439), (790, 437))
  let L = calc.sqrt(calc.pow(B.at(0) - A.at(0), 2) + calc.pow(B.at(1) - A.at(1), 2))
  let (ux, uy) = ((B.at(0) - A.at(0)) / L, (B.at(1) - A.at(1)) / L)
  let N = lerp(A, B, 1 / 3)
  let M = lerp(A, B, 2 / 3)
  let ln = calc.sqrt(L / 3 * 2 * L / 3)
  let P = (N.at(0) - uy * ln, N.at(1) + ux * ln)
  let t = 1 / calc.sqrt(3)
  let B1 = lerp(A, B, t)
  let C1 = lerp(A, C, t)
  let O = lerp(A, B, 0.5)
  let ang(v, c) = calc.rem(calc.atan2(v.at(0) - c.at(0), -(v.at(1) - c.at(1))).deg() + 360, 360)
  tri(p, A, B, C)
  seg(p, B1, C1)
  carc(p, O, ang(A, O), ang(B, O), L / 2, stroke: dsh)
  carc(p, A, ang(P, A), ang(B1, A), L * t, stroke: dsh)
  dseg(p, P, A)
  dseg(p, P, N)
  tickat(p, A, B, M, s: 4)
  lbl(p, A, $A$, dir: "ne", d: 9)
  lbl(p, B, $B$, dir: "sw", d: 9)
  lbl(p, C, $C$, dir: "se", d: 9)
  lbl(p, P, $P$, dir: "n", d: 9)
  lbl(p, B1, $B'$, dir: "nw", d: 8)
  lbl(p, C1, $C'$, dir: "e", d: 10)
  lbl(p, M, $M$, dir: "w", d: 9)
  lbl(p, N, $N$, dir: "e", d: 9)
})

// 图 3·38：以两正方形边长为直角边作直角三角形，斜边为边的正方形面积等于二者之和
#let fig-L-3-38(width: 590 * k) = px-canvas(590, 275, origin: (205, 315), width: width, (p, u) => {
  import cetz.draw: *
  poly(p, ((226, 460), (324, 460), (324, 362), (226, 362)), close: true)
  lbl(p, (226, 362), $D$, dir: "nw", d: 8)
  lbl(p, (324, 362), $C$, dir: "ne", d: 8)
  lbl(p, (226, 460), $A$, dir: "sw", d: 8)
  lbl(p, (324, 460), $B$, dir: "se", d: 8)
  poly(p, ((360, 464), (494, 464), (494, 330), (360, 330)), close: true)
  lbl(p, (360, 330), $D'$, dir: "nw", d: 9)
  lbl(p, (494, 330), $C'$, dir: "ne", d: 9)
  lbl(p, (360, 464), $A'$, dir: "sw", d: 9)
  lbl(p, (494, 464), $B'$, dir: "se", d: 9)
  let (O, A2, B2) = ((542, 564), (542, 466), (675, 564))
  let C2 = (B2.at(0) + 98, B2.at(1) - 133)
  let D2 = (A2.at(0) + 98, A2.at(1) - 133)
  poly(p, (A2, B2, C2, D2), close: true)
  dseg(p, O, A2)
  dseg(p, O, B2)
  rtmark(p, O, A2, B2, s: 8)
  lbl(p, D2, $D''$, dir: "nw", d: 11)
  lbl(p, C2, $C''$, dir: "e", d: 12)
  lbl(p, A2, $A''$, dir: "w", d: 12)
  lbl(p, B2, $B''$, dir: "se", d: 12)
  lbl(p, O, $O$, dir: "w", d: 9)
})

// ───────── 习题 3·7 ─────────
// 第 6 题（p.217）：AB = m，BC = n，以 AC 为直径作半圆，DB ⊥ AC，DF = l，FE ∥ AC，以 DE 为边作正方形 DEKH
#let fig-L-ex3-7-q6(width: 285 * k) = px-canvas(285, 200, origin: (595, 440), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((652, 605), (724, 605), (868, 605))
  let D = (724, 605 - calc.sqrt(72 * 144))
  let tt0 = (572 - D.at(1)) / (605 - D.at(1))
  let F = lerp(D, C, tt0)
  let E = lerp(D, A, tt0)
  let G = (724, 572)
  let (vx, vy) = (E.at(0) - D.at(0), E.at(1) - D.at(1))
  let H = (D.at(0) - vy, D.at(1) + vx)
  let K = (E.at(0) - vy, E.at(1) + vx)
  seg(p, A, C)
  carc(p, (760, 605), 0, 180, 108)
  seg(p, D, A); seg(p, D, C); seg(p, D, B); seg(p, E, F)
  poly(p, (D, E, K, H), close: true)
  lbl(p, H, $H$, dir: "n", d: 9)
  lbl(p, K, $K$, dir: "w", d: 9)
  lbl(p, D, $D$, dir: "ne", d: 9)
  lbl(p, (737, 564), $G$, dir: "c", d: 0)
  lbl(p, F, $F$, dir: "ne", d: 9)
  lbl(p, (684, 586), $E$, dir: "c", d: 0)
  lbl(p, A, $A$, dir: "sw", d: 9)
  lbl(p, B, $B$, dir: "s", d: 9)
  lbl(p, C, $C$, dir: "se", d: 9)
})

// 第 12 题（p.218）：矩形 ABCD 化为等积正方形
#let fig-L-ex3-7-q12(width: 320 * k) = px-canvas(320, 185, origin: (130, 495), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D, E, F) = ((269, 640), (433, 640), (433, 542), (269, 542), (171, 640), (269, 513))
  seg(p, (142, 640), B)
  seg(p, B, C); seg(p, C, D)
  seg(p, A, F)
  seg(p, (142, 513), F)
  seg(p, (142, 513), (142, 640))
  seg(p, E, F); seg(p, F, B)
  carc(p, (302, 640), 0, 180, 131.5)
  lbl(p, F, $F$, dir: "n", d: 9)
  lbl(p, D, $D$, dir: "w", d: 9)
  lbl(p, C, $C$, dir: "ne", d: 9)
  lbl(p, E, $E$, dir: "s", d: 10)
  lbl(p, A, $A$, dir: "s", d: 10)
  lbl(p, B, $B$, dir: "s", d: 10)
})

// 第 14 题（p.218）：△ADE 与 △ABC 等积，∠A 为公共角
#let fig-L-ex3-7-q14(width: 285 * k) = px-canvas(285, 195, origin: (535, 465), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((724, 482), (550, 639), (772, 586))
  let D = lerp(B, A, 0.264)
  let tE = (640 - A.at(1)) / (C.at(1) - A.at(1))
  let E = lerp(A, C, tE)
  tri(p, A, B, C)
  seg(p, D, E)
  dseg(p, C, E)
  lbl(p, A, $A$, dir: "n", d: 9)
  lbl(p, B, $B$, dir: "w", d: 9)
  lbl(p, D, $D$, dir: "nw", d: 9)
  lbl(p, C, $C$, dir: "ne", d: 9)
  lbl(p, E, $E$, dir: "se", d: 9)
})

// ───────── 复习题三 ─────────
// 第 3 题（p.219）：E、F、G、H 为四边形 ABCD 各边中点
#let fig-L-rev3-q3(width: 240 * k) = px-canvas(240, 215, origin: (215, 1000), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D) = ((237, 1176), (432, 1172), (434, 1044), (312, 1018))
  let (E, F, G, H) = (lerp(A, B, 0.5), lerp(B, C, 0.5), lerp(C, D, 0.5), lerp(D, A, 0.5))
  poly(p, (A, B, C, D), close: true)
  seg(p, E, H)
  seg(p, F, G)
  dseg(p, G, H)
  dseg(p, E, F)
  lbl(p, A, $A$, dir: "sw", d: 9)
  lbl(p, B, $B$, dir: "se", d: 9)
  lbl(p, C, $C$, dir: "ne", d: 9)
  lbl(p, D, $D$, dir: "n", d: 9)
  lbl(p, E, $E$, dir: "s", d: 10)
  lbl(p, F, $F$, dir: "e", d: 9)
  lbl(p, G, $G$, dir: "n", d: 9)
  lbl(p, H, $H$, dir: "w", d: 9)
})

// 第 4 题（p.219）：D、E、F 为 △ABC 三边中点，M、N 为 DF、FE 的中点
#let fig-L-rev3-q4(width: 250 * k) = px-canvas(250, 230, origin: (610, 985), width: width, (p, u) => {
  import cetz.draw: *
  let (C, A, B) = ((627, 1180), (803, 1180), (839, 1004))
  let (D, E, F) = (lerp(A, B, 0.5), lerp(C, A, 0.5), lerp(C, B, 0.5))
  let (M, N) = (lerp(D, F, 0.5), lerp(F, E, 0.5))
  tri(p, A, B, C)
  seg(p, D, F)
  seg(p, F, E)
  seg(p, M, A)
  seg(p, N, A)
  seg(p, N, M)
  lbl(p, B, $B$, dir: "ne", d: 9)
  lbl(p, C, $C$, dir: "sw", d: 9)
  lbl(p, A, $A$, dir: "s", d: 10)
  lbl(p, D, $D$, dir: "e", d: 9)
  lbl(p, E, $E$, dir: "s", d: 10)
  lbl(p, F, $F$, dir: "nw", d: 9)
  lbl(p, M, $M$, dir: "n", d: 9)
  lbl(p, N, $N$, dir: "w", d: 9)
})

// 第 17 题（p.221）：CL 为 ∠ACB 的平分线，CL' 为外角平分线，CB : CA = 1 : 2，M 为 CA 的中点
#let fig-L-rev3-q17(width: 530 * k) = px-canvas(530, 235, origin: (270, 165), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, L, L1) = ((284, 364), (491, 364), (505, 243), (429, 364), (693, 364))
  let M = lerp(A, C, 0.5)
  let Yp = (620, 243 + (620 - 505) * -0.547)
  seg(p, A, B)
  seg(p, A, C); seg(p, C, B); seg(p, C, L); seg(p, C, L1); seg(p, L, M)
  dseg(p, B, (776, 364))
  dseg(p, C, Yp)
  pdot(p, (776, 364), r: 2)
  anglearc(p, C, A, L, 18)
  anglearc(p, C, L, B, 18)
  anglearc(p, C, B, Yp, 27)
  lbl(p, A, $A$, dir: "w", d: 9)
  lbl(p, L, $L$, dir: "s", d: 10)
  lbl(p, B, $B$, dir: "s", d: 10)
  lbl(p, L1, $L'$, dir: "s", d: 11)
  lbl(p, C, $C$, dir: "n", d: 10)
  lbl(p, M, $M$, dir: "nw", d: 9)
})
