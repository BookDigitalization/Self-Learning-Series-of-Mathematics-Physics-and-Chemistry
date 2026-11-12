// 图 2·6、2·7（原书 p.125）、2·8、2·9（p.126）、2·10（p.127）；页面 200 dpi 坐标。
#import "G-base.typ": *

#let fig-G-2-6(width: 200 * k) = px-canvas(200, 310, origin: (218, 855), width: width, (p, u) => {
  import cetz.draw: *
  let E1 = (250, 920)
  let D1 = (303, 883)
  let C1 = (385, 906)
  let B1 = (360, 953)
  let A1 = (292, 960)
  let E = (250, 1080)
  let D = (303, 1043)
  let C = (384, 1066)
  let B = (359, 1117)
  let A = (292, 1133)
  // 对角面 E₁ECC₁（“\”向阴影）与 B₁BEE₁（“/”向阴影），重叠处成网格
  ghatch(p, (E1, C1, C, E), gap: 9, deg: -45, th: 0.45pt)
  ghatch(p, (E1, B1, B, E), gap: 9, deg: 45, th: 0.45pt)
  seg(p, E1, C1, stroke: lt)
  seg(p, E1, B1, stroke: lt)
  dseg(p, E, C)
  dseg(p, E, B)
  tpoly(p, (E1, D1, C1, B1, A1, E1))
  for (t, b) in ((E1, E), (A1, A), (B1, B), (C1, C)) { tseg(p, t, b) }
  tpoly(p, (E, A, B, C))
  dseg(p, D1, D)
  dseg(p, E, D)
  dseg(p, D, C)
  let bg(pt, body) = content(p(..pt), box(fill: white, inset: 0.6pt, tt(body)))
  L(p, 300, 866, $D_1$)
  L(p, 399, 903, $C_1$)
  L(p, 232, 920, $E_1$)
  bg((282, 990), $A_1$)
  bg((373, 972), $B_1$)
  bg((312, 1030), $D$)
  L(p, 395, 1075, $C$)
  L(p, 229, 1093, $E$)
  L(p, 366, 1133, $B$)
  L(p, 293, 1155, $A$)
})

#let fig-G-2-7(width: 360 * k) = px-canvas(360, 320, origin: (505, 845), width: width, (p, u) => {
  import cetz.draw: *
  let (x0, x1, y0, y1) = (515, 842, 955, 1052)
  // 侧面展开的长方形，折痕虚线
  tpoly(p, ((x0, y0), (x1, y0), (x1, y1), (x0, y1), (x0, y0)))
  for x in (580, 646, 712, 776) { dseg(p, (x, y0), (x, y1)) }
  // 右端粘边
  line(p(x1, y0), p(854, y0 + 6), p(854, y1 - 6), p(x1, y1), stroke: lw)
  // 上、下底面：正五边形（底边 646–712），四条边外侧画粘边
  let G1flap(a, b, sgn) = {
    // 外侧单位法向（sgn 决定方向），粘边宽 8，两端各收 6
    let (dx, dy) = (b.at(0) - a.at(0), b.at(1) - a.at(1))
    let l = calc.sqrt(dx * dx + dy * dy)
    let (ux, uy) = (dx / l, dy / l)
    let (nx, ny) = (sgn * uy, -sgn * ux)
    let w = 8
    line(p(..a), p(a.at(0) + nx * w + ux * 6, a.at(1) + ny * w + uy * 6),
      p(b.at(0) + nx * w - ux * 6, b.at(1) + ny * w - uy * 6), p(..b), stroke: lt)
  }
  for (yb, dir) in ((y0, -1), (y1, 1)) {
    let s = 66
    let h1 = s * calc.sin(72deg)
    let h2 = s * calc.sin(72deg) + s * calc.sin(36deg)
    let P0 = (646, yb)
    let P1 = (712, yb)
    let P2 = (712 + s * calc.cos(72deg), yb + dir * h1)
    let P3 = (679, yb + dir * h2)
    let P4 = (646 - s * calc.cos(72deg), yb + dir * h1)
    tpoly(p, (P1, P2, P3, P4, P0))
    // 粘边朝五边形外侧
    let sg = if dir < 0 { -1 } else { 1 }
    for (a, b) in ((P1, P2), (P2, P3), (P3, P4), (P4, P0)) { G1flap(a, b, sg) }
  }
})

#let fig-G-2-8(width: 210 * k) = px-canvas(210, 270, origin: (665, 258), width: width, (p, u) => {
  import cetz.draw: *
  let A1 = (687, 343)
  let E1 = (768, 282)
  let D1 = (811, 276)
  let C1 = (843, 320)
  let B1 = (749, 383)
  let A = (690, 468)
  let E = (770, 410)
  let D = (812, 405)
  let C = (848, 446)
  let B = (752, 513)
  let Q = lerp(A1, E1, 0.43)
  let P = lerp(B1, C1, 0.45)
  let R = lerp(A, E, 0.43)
  let S = lerp(B, C, 0.45)
  tpoly(p, (A1, E1, D1, C1, B1, A1))
  tseg(p, Q, P)
  for (t, b) in ((A1, A), (B1, B), (C1, C), (P, S)) { tseg(p, t, b) }
  tpoly(p, (A, B, C))
  dseg(p, E1, E)
  dseg(p, D1, D)
  dseg(p, Q, R)
  dseg(p, A, E)
  dseg(p, E, D)
  dseg(p, D, C)
  dseg(p, R, S)
  L(p, 770, 265, $E_1$)
  L(p, 826, 268, $D_1$)
  L(p, 712, 303, $Q$)
  L(p, 861, 322, $C_1$)
  L(p, 670, 345, $A_1$)
  L(p, 795, 338, $P$)
  L(p, 753, 368, $B_1$)
  L(p, 782, 400, $E$)
  L(p, 828, 397, $D$)
  L(p, 712, 437, $R$)
  L(p, 862, 446, $C$)
  L(p, 678, 478, $A$)
  L(p, 785, 461, $M$)
  L(p, 809, 490, $S$)
  L(p, 758, 524, $B$)
})

#let fig-G-2-9(width: 245 * k) = px-canvas(245, 190, origin: (618, 945), width: width, (p, u) => {
  import cetz.draw: *
  let F1 = (651, 992)
  let E1 = (726, 968)
  let D1 = (808, 974)
  let C1 = (830, 1007)
  let B1 = (752, 1030)
  let A1 = (668, 1025)
  let dy = 83
  let (F, E, D, C, B, A) = (F1, E1, D1, C1, B1, A1).map(q => (q.at(0) - 2, q.at(1) + dy))
  tpoly(p, (F1, E1, D1, C1, B1, A1, F1))
  tseg(p, A1, C1)
  tseg(p, A1, D1)
  for (t, b) in ((F1, F), (A1, A), (B1, B), (C1, C)) { tseg(p, t, b) }
  tpoly(p, (F, A, B, C))
  dseg(p, E1, E)
  dseg(p, D1, D)
  dseg(p, F, E)
  dseg(p, E, D)
  dseg(p, D, C)
  dseg(p, A, C)
  dseg(p, A, D)
  L(p, 727, 955, $E_1$)
  L(p, 821, 966, $D_1$)
  L(p, 631, 998, $F_1$)
  L(p, 846, 1007, $C_1$)
  L(p, 680, 1044, $A_1$)
  L(p, 767, 1043, $B_1$)
  L(p, 816, 1049, $D$)
  L(p, 730, 1068, $E$)
  L(p, 632, 1081, $F$)
  L(p, 839, 1096, $C$)
  L(p, 662, 1126, $A$)
  L(p, 752, 1127, $B$)
})

#let fig-G-2-10(width: 300 * k) = px-canvas(300, 200, origin: (605, 830), width: width, (p, u) => {
  import cetz.draw: *
  let A1 = (636, 905)
  let D1 = (752, 853)
  let C1 = (871, 857)
  let B1 = (760, 912)
  let dy = 92
  let (A, D, C, B) = (A1, D1, C1, B1).map(q => (q.at(0) - 1, q.at(1) + dy))
  tpoly(p, (A1, D1, C1, B1, A1))
  for (t, b) in ((A1, A), (B1, B), (C1, C)) { tseg(p, t, b) }
  tpoly(p, (A, B, C))
  dseg(p, D1, D)
  dseg(p, A, D)
  dseg(p, D, C)
  dseg(p, A, C)
  dseg(p, B, D)
  dseg(p, A1, C)
  dseg(p, D1, B)
  L(p, 752, 838, $D_1$)
  L(p, 889, 862, $C_1$)
  L(p, 616, 911, $A_1$)
  L(p, 781, 924, $B_1$)
  L(p, 738, 944, $D$)
  L(p, 885, 954, $C$)
  L(p, 741, 983, $O$)
  L(p, 621, 1019, $A$)
  L(p, 770, 1021, $B$)
})
