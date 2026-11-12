// 解析几何 段 B：图 1·16–图 1·29（原书 p.15–29）及习题 1·1~1·5 第 2 题、习题 1·6 第 6、7、11、12 题插图（p.20、p.29、p.30）。
// 读坐标时的页面渲染 200 dpi（页宽约 1031 像素）；k = 0.0152 cm/像素，图的大小约为原图的 1.1 倍（正文宽约 15cm）。
#import "/common/geo.typ": *
#let k = 0.0152cm

// 带箭头的轴线
#let B-ax(p, a, b) = {
  import cetz.draw: *
  line(p(..a), p(..b), stroke: lw, mark: arw)
}
#let B-t(p, pt, body) = lbl(p, pt, body, dir: "c", d: 0)
// 点（实心）
#let B-d(p, c) = pdot(p, c, r: 2.4)

// ───────── 图 1·16（p.15）─────────
#let fig-B-1-16(width: 350 * k) = px-canvas(350, 280, origin: (595, 975), width: width, (p, u) => {
  import cetz.draw: *
  let rows = (1001, 1092, 1183)
  let P1 = 664
  let P2 = 835
  let Ps = (772, 866, 623)
  for (i, y) in rows.enumerate() {
    B-ax(p, (600, y), (907, y))
    B-t(p, (920, y - 2), $x$)
    B-d(p, (P1, y))
    B-d(p, (P2, y))
    B-d(p, (Ps.at(i), y))
    B-t(p, (P1, y + 17), $P_1$)
    B-t(p, (P2, y + 17), $P_2$)
    B-t(p, (Ps.at(i), y + 17), $P$)
    B-t(p, (740, y + 40), text(style: "italic")[(#("abc".at(i)))])
  }
})

// ───────── 图 1·17（p.17）─────────
#let fig-B-1-17(width: 350 * k) = px-canvas(350, 40, origin: (330, 400), width: width, (p, u) => {
  import cetz.draw: *
  let y = 413
  B-ax(p, (333, y), (664, y))
  B-t(p, (674, y + 2), $x$)
  line(p(378, y), p(378, y - 6), stroke: lt)
  line(p(402, y), p(402, y - 6), stroke: lt)
  for x in (463, 521, 597) { B-d(p, (x, y)) }
  B-t(p, (378, y + 16), $O$)
  B-t(p, (402, y + 16), $1$)
  B-t(p, (463, y + 16), $P_1 (x_1)$)
  B-t(p, (521, y + 16), $P (x)$)
  B-t(p, (597, y + 16), $P_2 (x_2)$)
})

// ───────── 图 1·18（p.18）─────────
#let fig-B-1-18(width: 300 * k) = px-canvas(300, 50, origin: (140, 760), width: width, (p, u) => {
  import cetz.draw: *
  let y = 780
  B-ax(p, (145, y), (417, y))
  B-t(p, (433, y + 1), $x$)
  for x in (226, 257, 283) { line(p(x, y), p(x, y - 8), stroke: lt) }
  for x in (201, 311, 338) { B-d(p, (x, y)) }
  B-t(p, (201, y + 17), $A$)
  B-t(p, (311, y + 17), $B$)
  B-t(p, (343, y + 17), $O$)
})

// ───────── 图 1·19（p.18）─────────
#let fig-B-1-19(width: 400 * k) = px-canvas(400, 50, origin: (485, 760), width: width, (p, u) => {
  import cetz.draw: *
  let y = 783
  B-ax(p, (490, y), (867, y))
  B-t(p, (881, y - 2), $x$)
  for x in (571, 624, 652, 680, 734, 760) { line(p(x, y), p(x, y - 8), stroke: lt) }
  for x in (543, 598, 709, 788) { B-d(p, (x, y)) }
  B-t(p, (543, y + 18), $B (-2)$)
  B-t(p, (598, y + 18), $O$)
  B-t(p, (718, y + 18), $A (4)$)
  B-t(p, (796, y + 18), $P (x)$)
})

// ───────── 图 1·20、1·21（p.21）─────────
#let fig-B-1-20(width: 330 * k) = px-canvas(330, 250, origin: (140, 1030), width: width, (p, u) => {
  import cetz.draw: *
  let O = (282, 1185)
  B-ax(p, (184, 1185), (425, 1185))
  B-ax(p, (282, 1277), (282, 1054))
  B-t(p, (432, 1184), $x$)
  B-t(p, (282, 1040), $y$)
  B-d(p, (282, 1129))
  B-d(p, (338, 1185))
  B-t(p, (268, 1129), $1$)
  B-t(p, (339, 1200), $1$)
  B-t(p, (272, 1198), $O$)
})
#let fig-B-1-21(width: 340 * k) = px-canvas(340, 270, origin: (535, 1010), width: width, (p, u) => {
  import cetz.draw: *
  let O = (621, 1210)
  let M = (733, 1210)
  let N = (621, 1099)
  let P = (733, 1099)
  B-ax(p, (542, 1210), (808, 1210))
  B-ax(p, (621, 1274), (621, 1035))
  dseg(p, N, P)
  dseg(p, P, M)
  seg(p, O, M, stroke: lb)
  seg(p, O, N, stroke: lb)
  B-d(p, (650, 1210))
  circle(p(..M), radius: 2.4, fill: white, stroke: lw)
  B-d(p, N)
  B-d(p, P)
  B-t(p, (822, 1209), $x$)
  B-t(p, (619, 1021), $y$)
  B-t(p, (604, 1099), $N$)
  B-t(p, (776, 1096), $P (a, b)$)
  B-t(p, (604, 1156), $b$)
  B-t(p, (680, 1190), $a$)
  B-t(p, (611, 1224), $O$)
  B-t(p, (650, 1226), $1$)
  B-t(p, (732, 1227), $M$)
})

// ───────── 图 1·22（p.23）─────────
#let fig-B-1-22(width: 300 * k) = px-canvas(300, 200, origin: (595, 185), width: width, (p, u) => {
  import cetz.draw: *
  B-ax(p, (600, 348), (875, 348))
  B-ax(p, (726, 385), (726, 210))
  B-t(p, (880, 345), $x$)
  B-t(p, (725, 195), $y$)
  B-t(p, (717, 357), $O$)
  B-t(p, (665, 300), $upright("II")(-, +)$)
  B-t(p, (792, 300), $upright("I")(+, +)$)
  B-t(p, (665, 387), $upright("III")(-, -)$)
  B-t(p, (792, 387), $upright("IV")(+, -)$)
})

// ───────── 图 1·23（p.24）─────────
// 单位长 27.6 像素；点按坐标算出（原图为手绘）。
#let fig-B-1-23(width: 450 * k) = px-canvas(450, 360, origin: (295, 215), width: width, (p, u) => {
  import cetz.draw: *
  let un = 27.6
  let ox = 485
  let oy = 411.5
  let X = x => ox + un * x
  let Y = y => oy - un * y
  B-ax(p, (300, oy), (725, oy))
  B-ax(p, (ox, 565), (ox, 252))
  B-t(p, (740, oy + 3), $x$)
  B-t(p, (ox + 1, 232), $y$)
  B-t(p, (ox - 10, oy - 9), $O$)
  for n in (-5, -4, -3, -2, -1, 1, 2, 3, 4, 5, 6) {
    line(p(X(n), oy), p(X(n), oy - 5), stroke: lt)
    B-t(p, (X(n) - if n < 0 { 1 } else { 0 }, oy + 14), if n < 0 { $-#str(-n)$ } else { $#str(n)$ })
  }
  for n in (-4, -3, -2, -1, 1, 2, 3) {
    line(p(ox - 5, Y(n)), p(ox, Y(n)), stroke: lt)
    B-t(p, (ox + 17, Y(n)), if n < 0 { $-#str(-n)$ } else { $#str(n)$ })
  }
  let A = (X(-5), Y(3))
  let B = (X(6), Y(0.8))
  let C = (X(5.2), Y(-2 * calc.sqrt(3)))
  let D = (X(-10 / 3), Y(-calc.sqrt(3)))
  dseg(p, A, (ox, A.at(1)))
  dseg(p, A, (A.at(0), oy))
  dseg(p, B, (ox, B.at(1)))
  dseg(p, B, (B.at(0), oy))
  dseg(p, C, (ox, C.at(1)))
  dseg(p, C, (C.at(0), oy))
  dseg(p, D, (ox, D.at(1)))
  dseg(p, D, (D.at(0), oy))
  for q in (A, B, C, D) { B-d(p, q) }
  B-t(p, (A.at(0) + 14, A.at(1) - 17), $A (-5, 3)$)
  B-t(p, (B.at(0) + 4, B.at(1) - 19), $B (6, 0.8)$)
  B-t(p, (D.at(0) + 3, D.at(1) + 24), $D (-10 / 3, -sqrt(3))$)
  B-t(p, (C.at(0) + 10, C.at(1) + 19), $C (5.2, -2 sqrt(3))$)
})

// ───────── 图 1·24（p.24）─────────
#let fig-B-1-24(width: 330 * k) = px-canvas(330, 360, origin: (130, 910), width: width, (p, u) => {
  import cetz.draw: *
  let O = (298, 1121)
  let A = (409, 1009)
  let B = (189, 1009)
  let C = (189, 1233)
  let D = (409, 1233)
  B-ax(p, (298, 1262), (298, 940))
  B-ax(p, (137, 1121), (480, 1121))
  B-t(p, (297, 924), $y$)
  B-t(p, (484, 1121), $x$)
  dseg(p, B, A)
  dseg(p, C, D)
  dseg(p, B, C)
  dseg(p, A, D)
  dseg(p, A, C)
  for q in (A, B, C, D) { B-d(p, q) }
  B-t(p, (222, 991), $B (-a, b)$)
  B-t(p, (434, 991), $A (a, b)$)
  B-t(p, (310, 998), $N$)
  B-t(p, (176, 1134), $M'$)
  B-t(p, (308, 1136), $O$)
  B-t(p, (423, 1134), $M$)
  B-t(p, (234, 1250), $C (-a, -b)$)
  B-t(p, (313, 1247), $N'$)
  B-t(p, (440, 1250), $D (a, -b)$)
})

// ───────── 图 1·25（p.25）─────────
#let fig-B-1-25(width: 380 * k) = px-canvas(380, 370, origin: (520, 1000), width: width, (p, u) => {
  import cetz.draw: *
  let R = (578, 1084)
  let P = (800, 1084)
  let S = (578, 1309)
  let Q = (800, 1309)
  B-ax(p, (525, 1199), (890, 1199))
  B-ax(p, (689, 1375), (689, 1027))
  B-t(p, (896, 1197), $x$)
  B-t(p, (687, 1010), $y$)
  dseg(p, R, P)
  dseg(p, S, Q)
  dseg(p, R, S)
  dseg(p, P, Q)
  for q in (R, P, S, Q) { B-d(p, q) }
  B-t(p, (578, 1068), $R$)
  B-t(p, (798, 1068), $P$)
  B-t(p, (701, 1074), $N$)
  B-t(p, (681, 1093), $a$)
  B-t(p, (566, 1186), $M'$)
  B-t(p, (813, 1186), $M$)
  B-t(p, (602, 1207), $-a$)
  B-t(p, (677, 1208), $O$)
  B-t(p, (788, 1207), $a$)
  B-t(p, (667, 1299), $-a$)
  B-t(p, (705, 1321), $N'$)
  B-t(p, (578, 1327), $S$)
  B-t(p, (800, 1327), $Q$)
})

// ───────── 图 1·26、1·27（p.26）─────────
#let fig-B-1-26(width: 380 * k) = px-canvas(380, 280, origin: (130, 825), width: width, (p, u) => {
  import cetz.draw: *
  let C = (220, 1005)
  let A = (331, 1005)
  let B = (304, 896)
  B-ax(p, (134, 1005), (456, 1005))
  B-ax(p, (220, 1096), (220, 846))
  poly(p, (C, B, A), close: true)
  for q in (C, A, B) { B-d(p, q) }
  B-t(p, (347, 889), $B (b, c)$)
  B-t(p, (339, 996), $a$)
  B-t(p, (207, 1019), $C$)
  B-t(p, (262, 1021), $C (0, 0)$)
  B-t(p, (356, 1024), $A (a, 0)$)
  B-t(p, (222, 835), $y$)
  B-t(p, (453, 1008), $x$)
})
#let fig-B-1-27(width: 390 * k) = px-canvas(390, 280, origin: (510, 825), width: width, (p, u) => {
  import cetz.draw: *
  let C = (578, 1012)
  let A = (747, 1012)
  let B = (686, 904)
  B-ax(p, (516, 1012), (862, 1012))
  B-ax(p, (662, 1089), (662, 858))
  poly(p, (C, B, A), close: true)
  for q in (C, A, B) { B-d(p, q) }
  B-t(p, (728, 902), $B (q, r)$)
  B-t(p, (605, 1030), $C (-p, 0)$)
  B-t(p, (672, 1026), $O$)
  B-t(p, (777, 1034), $A (p, 0)$)
  B-t(p, (666, 836), $y$)
  B-t(p, (878, 1016), $x$)
})

// ───────── 图 1·28(a)（p.27）─────────
#let fig-B-1-28a1(width: 380 * k) = px-canvas(380, 310, origin: (150, 660), width: width, (p, u) => {
  import cetz.draw: *
  let A = (245, 895)
  let B = (378, 895)
  let C = (311, 782)
  B-ax(p, (162, 895), (481, 895))
  B-ax(p, (311, 948), (311, 686))
  poly(p, (A, C, B), close: true)
  for q in (A, B, C) { B-d(p, q) }
  B-t(p, (375, 773), $C (0, sqrt(3) a)$)
  B-t(p, (259, 914), $A (-a, 0)$)
  B-t(p, (324, 910), $O$)
  B-t(p, (399, 914), $B (a, 0)$)
  B-t(p, (309, 667), $y$)
  B-t(p, (495, 893), $x$)
})
#let fig-B-1-28a2(width: 380 * k) = px-canvas(380, 310, origin: (520, 690), width: width, (p, u) => {
  import cetz.draw: *
  let A = (629, 792)
  let B = (761, 792)
  let C = (695, 906)
  B-ax(p, (550, 792), (856, 792))
  B-ax(p, (695, 957), (695, 711))
  poly(p, (A, C, B), close: true)
  for q in (A, B, C) { B-d(p, q) }
  B-t(p, (650, 773), $A (-a, 0)$)
  B-t(p, (797, 772), $B (a, 0)$)
  B-t(p, (684, 805), $O$)
  B-t(p, (772, 909), $C (0, -sqrt(3) a)$)
  B-t(p, (694, 692), $y$)
  B-t(p, (875, 788), $x$)
})

// ───────── 图 1·28(b)（p.28）：四幅，各自一个画布，章文件里排成 2×2 ─────────
// 每幅里 A 与原点重合，A 记作 (A)；虚线是 C 到 AB 的垂线。
#let fig-B-1-28b1(width: 320 * k) = px-canvas(320, 320, origin: (190, 210), width: width, (p, u) => {
  import cetz.draw: *
  let A = (257, 449)
  let B = (394, 449)
  let C = (326, 334)
  B-ax(p, (194, 449), (466, 449))
  B-ax(p, (257, 518), (257, 240))
  poly(p, (A, C, B), close: true)
  dseg(p, C, (326, 449))
  for q in (A, B, C) { B-d(p, q) }
  B-t(p, (347, 315), $C (a, sqrt(3) a)$)
  B-t(p, (239, 435), $(A)$)
  B-t(p, (247, 462), $O$)
  B-t(p, (425, 467), $B (2 a, 0)$)
  B-t(p, (257, 221), $y$)
  B-t(p, (481, 447), $x$)
})
#let fig-B-1-28b2(width: 360 * k) = px-canvas(360, 320, origin: (510, 225), width: width, (p, u) => {
  import cetz.draw: *
  let A = (713, 470)
  let B = (578, 470)
  let C = (646, 355)
  B-ax(p, (524, 470), (809, 470))
  B-ax(p, (713, 534), (713, 252))
  poly(p, (A, C, B), close: true)
  dseg(p, C, (646, 470))
  for q in (A, B, C) { B-d(p, q) }
  B-t(p, (634, 336), $C (-a, sqrt(3) a)$)
  B-t(p, (731, 457), $(A)$)
  B-t(p, (723, 485), $O$)
  B-t(p, (622, 485), $B (-2 a, 0)$)
  B-t(p, (717, 234), $y$)
  B-t(p, (824, 473), $x$)
})
#let fig-B-1-28b3(width: 330 * k) = px-canvas(330, 270, origin: (160, 555), width: width, (p, u) => {
  import cetz.draw: *
  let A = (223, 651)
  let B = (357, 651)
  let C = (290, 766)
  B-ax(p, (162, 651), (437, 651))
  B-ax(p, (223, 815), (223, 581))
  poly(p, (A, C, B), close: true)
  dseg(p, C, (290, 651))
  for q in (A, B, C) { B-d(p, q) }
  B-t(p, (242, 637), $(A)$)
  B-t(p, (212, 663), $O$)
  B-t(p, (384, 635), $B (2 a, 0)$)
  B-t(p, (453, 651), $x$)
  B-t(p, (222, 564), $y$)
  B-t(p, (318, 787), $C (a, -sqrt(3) a)$)
})
#let fig-B-1-28b4(width: 360 * k) = px-canvas(360, 270, origin: (500, 555), width: width, (p, u) => {
  import cetz.draw: *
  let A = (695, 654)
  let B = (562, 654)
  let C = (629, 769)
  B-ax(p, (512, 654), (797, 654))
  B-ax(p, (695, 818), (695, 581))
  poly(p, (A, C, B), close: true)
  dseg(p, C, (629, 654))
  for q in (A, B, C) { B-d(p, q) }
  B-t(p, (604, 637), $B (-2 a, 0)$)
  B-t(p, (716, 640), $(A)$)
  B-t(p, (706, 667), $O$)
  B-t(p, (811, 656), $x$)
  B-t(p, (696, 565), $y$)
  B-t(p, (608, 789), $C (-a, -sqrt(3) a)$)
})

// ───────── 图 1·29（p.28）斜坐标系 ─────────
// y 轴方向 (28, -22.5)/单位（页面坐标），x 轴单位 28 像素。
#let fig-B-1-29(width: 470 * k) = px-canvas(470, 280, origin: (280, 1130), width: width, (p, u) => {
  import cetz.draw: *
  let O = (434, 1317)
  let M = (575, 1317)
  let N = (547, 1227)
  let P = (684, 1230)
  B-ax(p, (289, 1317), (737, 1317))
  B-ax(p, (330, 1397), (653, 1141))
  dseg(p, N, P)
  dseg(p, M, P)
  for n in (-3, -2, -1, 1, 2, 3) {
    let x = O.at(0) + 28 * n
    line(p(x, 1317), p(x, 1311), stroke: lt)
    let yy = (O.at(0) + 28 * n, O.at(1) - 22.5 * n)
    line(p(yy.at(0), yy.at(1)), p(yy.at(0) - 7, yy.at(1)), stroke: lt)
  }
  for (x, n) in ((341, $-3$), (378, $-2$), (404, $-1$), (459, $1$), (489, $2$), (519, $3$)) {
    B-t(p, (x, 1330), n)
  }
  for (x, y, n) in ((470, 1296, $1$), (505, 1273, $2$), (532, 1251, $3$), (434, 1341, $-1$), (412, 1361, $-2$), (381, 1383, $-3$)) {
    B-t(p, (x, y), n)
  }
  B-t(p, (747, 1319), $x$)
  B-t(p, (656, 1139), $y$)
  B-t(p, (536, 1219), $N$)
  B-t(p, (684, 1214), $P (a, b)$)
  B-t(p, (572, 1331), $M$)
  B-t(p, (425, 1308), $O$)
  B-t(p, (466, 1309), $omega$)
  B-t(p, (531, 1181), $upright("II")(-, +)$)
  B-t(p, (666, 1181), $upright("I")(+, +)$)
  B-t(p, (303, 1366), $upright("III")(-, -)$)
  B-t(p, (487, 1366), $upright("IV")(+, -)$)
})

// ───────── 习题 1·1~1·5 第 2 题（p.20）─────────
#let fig-B-e15-q2(width: 380 * k) = px-canvas(380, 50, origin: (370, 640), width: width, (p, u) => {
  import cetz.draw: *
  let y = 661
  B-ax(p, (382, y), (647, y))
  B-t(p, (660, y + 2), $x$)
  for x in (487, 515, 542) { line(p(x, y), p(x, y - 7), stroke: lt) }
  for x in (432, 461, 570) { B-d(p, (x, y)) }
  B-t(p, (432, y + 16), $B$)
  B-t(p, (461, y + 16), $C$)
  B-t(p, (570, y + 16), $A$)
})

// ───────── 习题 1·6 第 6 题（p.29）：正六边形三幅 ─────────
// 正六边形边长 R = 102.4 像素，顶点按几何关系算出；A、B、C、D、E、F 依次逆时针。
#let B-hexpts(c, ang0, R: 102.4) = range(6).map(i => {
  let a = (ang0 + 60 * i) * 1deg
  (c.at(0) + R * calc.cos(a), c.at(1) - R * calc.sin(a))
})
#let B-hex(p, pts) = {
  import cetz.draw: *
  poly(p, pts, close: true)
  for q in pts { B-d(p, q) }
}
// (a)：中心在原点，C、F 在 x 轴上；A 在右上（60°），依次逆时针
#let fig-B-e6-q6a(width: 360 * k) = px-canvas(360, 320, origin: (550, 730), width: width, (p, u) => {
  import cetz.draw: *
  let O = (709, 894)
  B-ax(p, (568, 894), (879, 894))
  B-ax(p, (709, 1008), (709, 754))
  let pts = B-hexpts(O, 60)
  B-hex(p, pts)
  // pts: A B C D E F
  B-t(p, (pts.at(0).at(0) + 3, pts.at(0).at(1) - 12), $A$)
  B-t(p, (pts.at(1).at(0) - 3, pts.at(1).at(1) - 12), $B$)
  B-t(p, (pts.at(2).at(0) - 12, pts.at(2).at(1) - 12), $C$)
  B-t(p, (pts.at(3).at(0), pts.at(3).at(1) + 13), $D$)
  B-t(p, (pts.at(4).at(0), pts.at(4).at(1) + 13), $E$)
  B-t(p, (pts.at(5).at(0) + 10, pts.at(5).at(1) - 12), $F$)
  B-t(p, (820, 903), $a$)
  B-t(p, (700, 904), $O$)
  B-t(p, (891, 893), $x$)
  B-t(p, (707, 739), $y$)
  B-t(p, (707, 1031), text(style: "italic")[(a)])
})
// (b)：D 在原点，DE 在 x 轴上
#let fig-B-e6-q6b(width: 360 * k) = px-canvas(360, 330, origin: (190, 1060), width: width, (p, u) => {
  import cetz.draw: *
  B-ax(p, (202, 1316), (486, 1316))
  B-ax(p, (289, 1369), (289, 1086))
  let pts = B-hexpts((340, 1316 - 102.4 * calc.sqrt(3) / 2), 60)
  B-hex(p, pts)
  B-t(p, (pts.at(0).at(0) + 3, pts.at(0).at(1) - 12), $A$)
  B-t(p, (pts.at(1).at(0) - 11, pts.at(1).at(1) - 9), $B$)
  B-t(p, (pts.at(2).at(0) - 12, pts.at(2).at(1)), $C$)
  B-t(p, (pts.at(4).at(0) + 3, pts.at(4).at(1) + 13), $E$)
  B-t(p, (pts.at(5).at(0) + 12, pts.at(5).at(1)), $F$)
  B-t(p, (278, 1330), $O$)
  B-t(p, (498, 1319), $x$)
  B-t(p, (289, 1070), $y$)
  B-t(p, (334, 1380), text(style: "italic")[(b)])
})
// (c)：CD 在 x 轴上，y 轴过 CD 的中点
#let fig-B-e6-q6c(width: 360 * k) = px-canvas(360, 330, origin: (545, 1060), width: width, (p, u) => {
  import cetz.draw: *
  B-ax(p, (557, 1319), (850, 1319))
  B-ax(p, (700, 1354), (700, 1086))
  // A 在左上（120°），依次逆时针：A B C D E F
  let pts = B-hexpts((700, 1319 - 102.4 * calc.sqrt(3) / 2), 120)
  B-hex(p, pts)
  B-t(p, (pts.at(0).at(0) - 2, pts.at(0).at(1) - 12), $A$)
  B-t(p, (pts.at(1).at(0) - 13, pts.at(1).at(1)), $B$)
  B-t(p, (pts.at(2).at(0), pts.at(2).at(1) + 13), $C$)
  B-t(p, (pts.at(3).at(0), pts.at(3).at(1) + 13), $D$)
  B-t(p, (pts.at(4).at(0) + 14, pts.at(4).at(1)), $E$)
  B-t(p, (pts.at(5).at(0) + 2, pts.at(5).at(1) - 12), $F$)
  B-t(p, (690, 1332), $O$)
  B-t(p, (864, 1322), $x$)
  B-t(p, (699, 1071), $y$)
  B-t(p, (699, 1377), text(style: "italic")[(c)])
})

// ───────── 习题 1·6 第 7 题（p.30）─────────
// 原图 C 点方向约 225°，与题设 α₃ = 240° 不合；按 240° 画（长度取原图）。
#let fig-B-e6-q7(width: 340 * k) = px-canvas(340, 370, origin: (110, 255), width: width, (p, u) => {
  import cetz.draw: *
  let O = (252, 463)
  B-ax(p, (128, 463), (420, 463))
  B-ax(p, (252, 605), (252, 294))
  let A = (374, 390)
  let B = (182, 340)
  let Cc = (252 + 138 * calc.cos(240deg), 463 - 138 * calc.sin(240deg))
  let D = (354, 563)
  for q in (A, B, Cc, D) {
    seg(p, O, q)
    B-d(p, q)
  }
  let ma = (end: "stealth", fill: black, scale: 0.4)
  arc(p(252 + 45, 463), start: 0deg, stop: 30deg, radius: 45 * 1, anchor: "origin", stroke: lt)
  arc(p(252 + 36, 463), start: 0deg, stop: 120deg, radius: 36, anchor: "origin", stroke: lt, mark: ma)
  arc(p(252 + 29, 463), start: 0deg, stop: 240deg, radius: 29, anchor: "origin", stroke: lt, mark: ma)
  arc(p(252 + 21, 463), start: 0deg, stop: 315deg, radius: 21, anchor: "origin", stroke: lt, mark: ma)
  B-t(p, (376, 375), $A$)
  B-t(p, (183, 326), $B$)
  B-t(p, (Cc.at(0) - 2, Cc.at(1) + 17), $C$)
  B-t(p, (354, 580), $D$)
  B-t(p, (434, 462), $x$)
  B-t(p, (252, 273), $y$)
  B-t(p, (313, 452), $alpha_1$)
  B-t(p, (275, 416), $alpha_2$)
  B-t(p, (219, 447), $alpha_3$)
  B-t(p, (241, 487), $alpha_4$)
})

// ───────── 习题 1·6 第 11、12 题（p.30）─────────
#let fig-B-e6-q11(width: 360 * k) = px-canvas(360, 310, origin: (140, 1075), width: width, (p, u) => {
  import cetz.draw: *
  let O = (299, 1265)
  let P2 = (198, 1161)
  let N2 = (299, 1161)
  let M2 = (198, 1265)
  let P1 = (448, 1317)
  let M1 = (448, 1265)
  let N1 = (299, 1317)
  B-ax(p, (146, 1265), (486, 1265))
  B-ax(p, (299, 1373), (299, 1098))
  seg(p, P1, P2)
  dseg(p, P2, N2)
  dseg(p, P2, M2)
  dseg(p, P1, M1)
  dseg(p, P1, N1)
  B-d(p, P1)
  B-d(p, P2)
  B-t(p, (239, 1144), $P_2 (x_2, y_2)$)
  B-t(p, (313, 1162), $N_2$)
  B-t(p, (302, 1091), $y$)
  B-t(p, (452, 1256), $M_1$)
  B-t(p, (496, 1268), $x$)
  B-t(p, (198, 1277), $M_2$)
  B-t(p, (286, 1277), $O$)
  B-t(p, (280, 1317), $N_1$)
  B-t(p, (466, 1333), $P_1 (x_1, y_1)$)
})
#let fig-B-e6-q12(width: 320 * k) = px-canvas(320, 320, origin: (550, 1075), width: width, (p, u) => {
  import cetz.draw: *
  let O = (644, 1294)
  let M = (771, 1242)
  let Mp = (696, 1167)
  B-ax(p, (561, 1294), (864, 1294))
  B-ax(p, (644, 1384), (644, 1094))
  line(p(600, 1338), p(776, 1162), stroke: lb)
  dseg(p, M, Mp)
  B-d(p, M)
  B-d(p, Mp)
  B-t(p, (721, 1151), $M' (b, a)$)
  B-t(p, (795, 1259), $M (a, b)$)
  B-t(p, (644, 1080), $y$)
  B-t(p, (866, 1293), $x$)
  B-t(p, (653, 1304), $O$)
})
