// 图 3·65（原书 p.274）、3·66、3·67（p.275）、3·68 (1)(2)(3)（p.277）、3·69（p.278）；页面 200 dpi 坐标。
#import "O-base.typ": *

// 空心小圆点（球面上的点、轴上的点）
#let O-hole(p, c) = {
  import cetz.draw: *
  circle(p(..c), radius: 2.6, stroke: lt, fill: white)
}

// 图 3·65 球冠
#let fig-O-3-65(width: 200 * k) = px-canvas(200, 230, origin: (648, 1118), width: width, (p, u) => {
  import cetz.draw: *
  let O = (748, 1233)
  let r = 97
  circ(p, O, r, stroke: lb)
  let H = (748, 1186)
  O-ell(p, H, 84.6, 28)
  let A = (748, 1136)
  let B = (748, 1330)
  seg(p, A, H)
  dseg(p, H, B)
  let P = O-ept(H, 84.6, 28, 112)
  let Q = O-ept(H, 84.6, 28, 232)
  let S = O-ept(H, 84.6, 28, 312)
  for X in (P, Q, S, H, O) { O-hole(p, X) }
  L(p, 749, 1125, $A$)
  L(p, 718, 1176, $P$)
  L(p, 761, 1189, $H$)
  L(p, 697, 1224, $Q$)
  L(p, 806, 1223, $S$)
  L(p, 762, 1236, $O$)
  L(p, 748, 1347, $B$)
})

// 图 3·66 球带
#let fig-O-3-66(width: 215 * k) = px-canvas(215, 240, origin: (188, 498), width: width, (p, u) => {
  import cetz.draw: *
  let O = (303, 621)
  let r = 101
  circ(p, O, r, stroke: lb)
  let H = (303, 556)
  let rx1 = calc.sqrt(r * r - 65 * 65)
  O-ell(p, H, rx1, 20)
  let H1 = (303, 678)
  let rx2 = calc.sqrt(r * r - 57 * 57)
  O-ell(p, H1, rx2, 24)
  let A = (303, 520)
  let B = (303, 722)
  seg(p, A, H)
  dseg(p, H, B)
  let P = O-ept(H, rx1, 20, 125)
  let Q = O-ept(H, rx1, 20, 228)
  let S = O-ept(H, rx1, 20, 310)
  let P1 = O-ept(H1, rx2, 24, 130)
  let Q1 = O-ept(H1, rx2, 24, 240)
  let S1 = O-ept(H1, rx2, 24, 300)
  for X in (P, Q, S, H, O, H1, P1, Q1, S1) { O-hole(p, X) }
  L(p, 303, 508, $A$)
  L(p, 196, 543, $M_1$)
  L(p, 393, 541, $M$)
  L(p, 283, 552, $P$)
  L(p, 317, 559, $H$)
  L(p, 257, 584, $Q$)
  L(p, 348, 584, $S$)
  L(p, 317, 624, $O$)
  L(p, 273, 670, $P_1$)
  L(p, 323, 681, $H_1$)
  L(p, 202, 692, $N_1$)
  L(p, 395, 690, $N$)
  L(p, 252, 716, $Q_1$)
  L(p, 364, 712, $S_1$)
  L(p, 304, 731, $B$)
})

// 图 3·67 地球的五带
#let fig-O-3-67(width: 290 * k) = px-canvas(290, 290, origin: (565, 450), width: width, (p, u) => {
  import cetz.draw: *
  let c = (725, 602)
  let r = 123
  circ(p, c, r, stroke: lb)
  // 赤道（中间断开写“热带”）
  seg(p, (602, 602), (848, 602))
  // 回归线、极圈：北半球向下弯，南半球向上弯
  for (phi, s) in ((23.5, 25), (66.5, 13)) {
    let rx = r * calc.cos(phi * 1deg)
    let dy = r * calc.sin(phi * 1deg)
    O-earc(p, (725, 602 - dy), rx, s, 180, 360)
    O-earc(p, (725, 602 + dy), rx, s, 0, 180)
  }
  content(p(725, 463), tt[北寒带])
  content(p(725, 540), tt[北温带])
  content(p(725, 602), box(fill: white, inset: 1pt, tt[热带]))
  content(p(725, 668), tt[南温带])
  content(p(725, 740), tt[南寒带])
  let deg(n) = tsm($#n (1°)/2$)
  content(p(622, 478), deg(66))
  content(p(580, 542), deg(23))
  content(p(590, 602), tsm[0])
  content(p(580, 660), deg(23))
  content(p(625, 725), deg(66))
})

// 图 3·68 半圆的内接正折线 ABCDEF（五条边，每边所对圆心角 36°）
#let O-poly68(c, R) = (90, 54, 18, -18, -54, -90).map(t => O-cpt(c, R, t))
#let O-half(p, c, R, pts) = {
  import cetz.draw: *
  O-arc(p, c, R, -90, 90, st: (paint: black, thickness: lb))
  seg(p, pts.at(0), pts.at(5))
  poly(p, pts)
}

// 图 3·68 (1) 旋转 AB 得圆锥侧面
#let fig-O-3-68a(width: 200 * k) = px-canvas(200, 380, origin: (160, 210), width: width, (p, u) => {
  import cetz.draw: *
  let O = (187, 400)
  let R = 169
  let pts = O-poly68(O, R)
  O-half(p, O, R, pts)
  let (A, B, C, D, E, F) = pts
  let B1 = (187, B.at(1))
  let M = O-lerp(A, B, 0.5)
  dseg(p, B1, B)
  dseg(p, O, M)
  dseg(p, O, B)
  L(p, 187, 220, $A$)
  L(p, 168, 270, $B_1$)
  L(p, 212, 252, $M$)
  L(p, 296, 250, $B$)
  L(p, 220, 305, $a$)
  L(p, 360, 340, $C$)
  L(p, 172, 412, $O$)
  L(p, 360, 458, $D$)
  L(p, 297, 548, $E$)
  L(p, 187, 582, $F$)
})

// 图 3·68 (2) 旋转 BC 得圆台侧面
#let fig-O-3-68b(width: 200 * k) = px-canvas(200, 350, origin: (415, 205), width: width, (p, u) => {
  import cetz.draw: *
  let O = (446, 381)
  let R = 156
  let pts = O-poly68(O, R)
  O-half(p, O, R, pts)
  let (A, B, C, D, E, F) = pts
  let B1 = (446, B.at(1))
  let C1 = (446, C.at(1))
  let N = O-lerp(B, C, 0.5)
  let N1 = (446, N.at(1))
  let G = (B.at(0), C.at(1))
  seg(p, B1, B)
  seg(p, N1, N)
  seg(p, C1, C)
  seg(p, B, G)
  seg(p, O, N)
  L(p, 446, 214, $A$)
  L(p, 428, 255, $B_1$)
  L(p, 548, 243, $B$)
  L(p, 428, 291, $N_1$)
  L(p, 568, 306, $N$)
  L(p, 428, 335, $C_1$)
  L(p, 540, 347, $G$)
  L(p, 606, 330, $C$)
  L(p, 498, 351, $a$)
  L(p, 433, 383, $O$)
  L(p, 606, 436, $D$)
  L(p, 552, 520, $E$)
  L(p, 448, 550, $F$)
})

// 图 3·68 (3) 旋转 CD 得圆柱侧面
#let fig-O-3-68c(width: 200 * k) = px-canvas(200, 350, origin: (668, 200), width: width, (p, u) => {
  import cetz.draw: *
  let O = (702, 372.5)
  let R = 157
  let pts = O-poly68(O, R)
  O-half(p, O, R, pts)
  let (A, B, C, D, E, F) = pts
  let S = O-lerp(C, D, 0.5)
  seg(p, (702, C.at(1)), C)
  seg(p, O, S)
  seg(p, (702, D.at(1)), D)
  L(p, 702, 205, $A$)
  L(p, 805, 238, $B$)
  L(p, 683, 324, $C_1$)
  L(p, 864, 318, $C$)
  L(p, 690, 376, $O$)
  L(p, 864, 366, $S$)
  L(p, 683, 423, $D_1$)
  L(p, 864, 424, $D$)
  L(p, 808, 504, $E$)
  L(p, 704, 543, $F$)
})

// 图 3·69 球冠的面积
#let fig-O-3-69(width: 180 * k) = px-canvas(180, 340, origin: (680, 460), width: width, (p, u) => {
  import cetz.draw: *
  let O = (701, 628)
  let R = 155
  O-arc(p, O, R, -90, 90, st: (paint: black, thickness: lb))
  let pts = (90, 54, 18, -18).map(t => O-cpt(O, R, t))
  poly(p, pts)
  let (A, B, C, D) = pts
  let F = (701, 783)
  seg(p, A, F)
  for X in (B, C, D) { seg(p, (701, X.at(1)), X) }
  circle(p(..O), radius: 2.4, stroke: lt, fill: white)
  L(p, 701, 464, $A$)
  L(p, 688, 512, $B_1$)
  L(p, 803, 499, $B$)
  L(p, 688, 584, $C_1$)
  L(p, 853, 577, $C$)
  L(p, 690, 628, $O$)
  L(p, 688, 672, $D_1$)
  L(p, 853, 676, $D$)
  L(p, 703, 795, $F$)
})
