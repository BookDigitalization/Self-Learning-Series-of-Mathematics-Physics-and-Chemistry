// 习题 3·12 插图：第 6、7、8、9 题（原书 p.272）、第 10、11 题（p.273）、第 17 题（p.274）；页面 200 dpi 坐标。
// 第 6 题图坐标在放大 1.3 倍的裁图上读取，用 c() 换回页面坐标。
#import "O-base.typ": *

// 第 6 题：两个切面成二面角
#let fig-O-ex12-6(width: 300 * k) = px-canvas(300, 270, origin: (150, 215), width: width, (p, u) => {
  import cetz.draw: *
  let c(x, y) = (150 + x / 1.3, 170 + y / 1.3)
  let O = c(235, 192)
  let r = 96
  circ(p, O, r, stroke: lb)
  O-ell(p, O, 96, 36)
  let P1 = c(72, 147)
  let P2 = c(8, 245)
  let E0 = c(158, 398)   // 二面角棱的下端
  let E1 = c(222, 298)   // 棱的上端（在球后）
  let Q1 = c(370, 338)
  let Q2 = c(435, 238)
  let P = c(205, 330)
  poly(p, (P1, P2, E0, Q1, Q2))
  // 被球挡住的部分画虚线
  let X1 = c(110, 183)
  seg(p, P1, X1)
  dseg(p, X1, E1)
  let X2 = c(195, 338)
  seg(p, E0, P)
  dseg(p, P, E1)
  let X3 = c(338, 266)
  dseg(p, E1, X3)
  seg(p, X3, Q2)
  let A = c(150, 263)
  let B = c(262, 313)
  seg(p, c(110, 252), P)
  seg(p, P, c(340, 292))
  dseg(p, O, A)
  dseg(p, O, B)
  L(p, ..c(140, 302), $A$)
  L(p, ..c(272, 333), $B$)
  L(p, ..c(218, 350), $P$)
  L(p, ..c(242, 180), $O$)
})

// 第 7 题：两球的交线
#let fig-O-ex12-7(width: 260 * k) = px-canvas(260, 175, origin: (562, 302), width: width, (p, u) => {
  import cetz.draw: *
  let O = (641, 389)
  let O1 = (742, 389)
  circ(p, O, 73)
  circ(p, O1, 80)
  let A = (686, 331.7)
  let P = (686, 389)
  line(p(..O), p(..A), p(..O1), p(..O), stroke: lb)
  line(p(..A), p(..P), stroke: lb)
  L(p, 682, 315, $A$)
  L(p, 626, 389, $O$)
  L(p, 760, 393, $O_1$)
  L(p, 681, 405, $P$)
})

// 第 8 题：两等球，一球的球心在另一球面上
#let fig-O-ex12-8(width: 195 * k) = px-canvas(195, 145, origin: (212, 1218), width: width, (p, u) => {
  import cetz.draw: *
  let O1 = (278, 1295)
  let O = (340, 1295)
  circ(p, O1, 62, stroke: lb)
  circ(p, O, 62, stroke: lb)
  let A = (309, 1241.3)
  let B = (309, 1348.7)
  line(p(..O1), p(..A), p(..O), p(..O1), stroke: lw)
  seg(p, A, B)
  L(p, 313, 1227, $A$)
  L(p, 262, 1293, $O_1$)
  L(p, 353, 1295, $O$)
  L(p, 320, 1310, $M$)
})

// 第 9 题：等腰三角形与它的内切圆
#let fig-O-ex12-9(width: 160 * k) = px-canvas(160, 175, origin: (593, 1203), width: width, (p, u) => {
  import cetz.draw: *
  let V = (676, 1225)
  let A = (618, 1355)
  let B = (734, 1355)
  let O = (676, 1355)
  poly(p, (V, A, B), close: true, stroke: lb)
  seg(p, V, O)
  // 内切圆
  let h = 130
  let s = calc.sqrt(58 * 58 + h * h)
  let rr = 58 * h / (58 + s)
  circ(p, (676, 1355 - rr), rr)
  L(p, 674, 1211, $V$)
  L(p, 602, 1361, $A$)
  L(p, 745, 1356, $B$)
  L(p, 678, 1372, $O$)
  L(p, 692, 1318, $O_1$)
})

// 第 10 题：圆锥的外接球
#let fig-O-ex12-10(width: 205 * k) = px-canvas(205, 200, origin: (245, 715), width: width, (p, u) => {
  import cetz.draw: *
  let O = (342, 820)
  let r = 88
  circ(p, O, r, stroke: lb)
  let D = (342, 863)
  let C = (342, 732)
  let A = (273, 863)
  let B = (411, 863)
  O-earc(p, D, 69, 23, 0, 180, st: dsh)
  O-earc(p, D, 69, 23, 180, 360, st: (paint: black, thickness: lb))
  dseg(p, C, A)
  dseg(p, C, B)
  dseg(p, C, D)
  dseg(p, A, B)
  dseg(p, O, A)
  pdot(p, O, r: 1.5)
  L(p, 346, 722, $C$)
  L(p, 351, 800, $h$)
  L(p, 389, 796, $l$)
  L(p, 354, 822, $O$)
  L(p, 342, 878, $D$)
  L(p, 259, 875, $A$)
  L(p, 427, 876, $B$)
})

// 第 11 题：圆台的轴截面与内切圆
#let fig-O-ex12-11(width: 210 * k) = px-canvas(210, 160, origin: (605, 742), width: width, (p, u) => {
  import cetz.draw: *
  let A = (667, 760)
  let D = (757, 760)
  let B = (626, 885)
  let C = (798, 885)
  poly(p, (A, D, C, B), close: true, stroke: lb)
  let O = (712, 822.5)
  circ(p, O, 62.5)
  dseg(p, (712, 760), (712, 885))
  dseg(p, D, (757, 885))
  circle(p(..O), radius: 2.4, stroke: lt, fill: white)
  L(p, 653, 762, $A$)
  L(p, 713, 749, $E$)
  L(p, 766, 758, $D$)
  L(p, 613, 887, $B$)
  L(p, 712, 900, $F$)
  L(p, 757, 900, $G$)
  L(p, 812, 884, $C$)
  L(p, 726, 821, $O$)
})

// 第 17 题：外切于球的四面体
#let fig-O-ex12-17(width: 240 * k) = px-canvas(240, 260, origin: (600, 305), width: width, (p, u) => {
  import cetz.draw: *
  let A = (732, 317)
  let B = (612, 481)
  let C = (666, 555)
  let D = (828, 524)
  let O = (705, 474)
  circle(p(..O), radius: 52, stroke: dsh)
  O-earc(p, (705, 470), 52, 18, 0, 360, st: dsh)
  for X in ((722, 424), (667, 442), (754, 456), (700, 523)) {
    dseg(p, O, X)
  }
  poly(p, (A, B, C, D, A, C), stroke: lb)
  dseg(p, B, D)
  L(p, 731, 305, $A$)
  L(p, 600, 482, $B$)
  L(p, 666, 571, $C$)
  L(p, 842, 527, $D$)
  L(p, 716, 481, $O$)
  L(p, 731, 416, $S$)
  L(p, 659, 434, $R$)
  L(p, 762, 452, $Q$)
  L(p, 697, 535, $P$)
})
