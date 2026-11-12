// 图 2·26、2·27（原书 p.144）、图 2·28、2·29、2·30（p.145）；页面 200 dpi 坐标。
#import "H-base.typ": *

// 图 2·26 五棱锥被平行于底面的平面所截得的棱台
#let fig-H-2-26(width: 240 * k) = px-canvas(240, 280, origin: (635, 462), width: width, (p, u) => {
  import cetz.draw: *
  let V = (730, 492)
  let A = (664, 678)
  let B = (692, 710)
  let C = (788, 710)
  let D = (838, 676)
  let E = (752, 650)
  let O = (735, 675)
  let t = 0.57
  let (A1, B1, C1, D1, E1, O1) = (A, B, C, D, E, O).map(q => Hlerp(V, q, t))
  // 前面的侧棱（连同原棱锥部分）
  for q in (A, B, C, D) { Hb(p, V, q) }
  Hbp(p, (A, B, C, D))
  Hbp(p, (A1, B1, C1, D1))
  dseg(p, D, E)
  dseg(p, E, A)
  dseg(p, D1, E1)
  dseg(p, E1, A1)
  dseg(p, V, E)
  dseg(p, V, O)
  HL(p, 728, 472, $V$)
  HL(p, 668, 597, $A_1$)
  HL(p, 716, 602, $O_1$)
  HL(p, 713, 630, $B_1$)
  HL(p, 785, 628, $C_1$)
  HL(p, 813, 600, $D_1$)
  HL(p, 762, 570, $E_1$)
  HL(p, 760, 664, $E$)
  HL(p, 724, 690, $O$)
  HL(p, 650, 685, $A$)
  HL(p, 690, 733, $B$)
  HL(p, 786, 733, $C$)
  HL(p, 853, 680, $D$)
})

// 图 2·27 正四棱台
#let fig-H-2-27(width: 250 * k) = px-canvas(250, 235, origin: (610, 1155), width: width, (p, u) => {
  import cetz.draw: *
  let A = (633, 1360)
  let B = (772, 1360)
  let C = (836, 1296)
  let D = (700, 1296)
  let A1 = (697, 1197)
  let B1 = (752, 1198)
  let C1 = (777, 1172)
  let D1 = (718, 1172)
  let O = (734, 1328)
  let O1 = (737, 1185)
  let E = (804, 1328)
  let E1 = (764.5, 1185)
  Hbp(p, (A, B, C))
  Hbp(p, (A1, B1, C1, D1), close: true)
  Hb(p, A, A1)
  Hb(p, B, B1)
  Hb(p, C, C1)
  seg(p, E, E1)
  Ht(p, O, B)
  dseg(p, A, D)
  dseg(p, D, C)
  dseg(p, D, D1)
  dseg(p, O, O1)
  dseg(p, O, E)
  dseg(p, O1, E1)
  HL(p, 700, 1165, $D_1$)
  HL(p, 800, 1170, $C_1$)
  HL(p, 680, 1203, $A_1$)
  HL(p, 728, 1178, $O_1$)
  HL(p, 790, 1200, $E_1$)
  HL(p, 745, 1213, $B_1$)
  HL(p, 689, 1294, $D$)
  HL(p, 850, 1297, $C$)
  HL(p, 720, 1333, $O$)
  HL(p, 818, 1342, $E$)
  HL(p, 622, 1367, $A$)
  HL(p, 772, 1380, $B$)
})

// 图 2·28 (1) 各侧棱延长后交于一点的棱台
#let fig-H-2-28a(width: 205 * k) = px-canvas(205, 235, origin: (150, 705), width: width, (p, u) => {
  import cetz.draw: *
  let V = (256, 713)
  let A = (157, 927)
  let B = (288, 931)
  let C = (347, 882)
  let D = (214, 880)
  let t = 0.535
  let (A1, B1, C1, D1) = (A, B, C, D).map(q => Hlerp(V, q, t))
  Hbp(p, (A, B, C))
  Hbp(p, (A1, B1, C1, D1), close: true)
  Hb(p, A, A1)
  Hb(p, B, B1)
  Hb(p, C, C1)
  dseg(p, A, D)
  dseg(p, D, C)
  dseg(p, D, D1)
  for q in (A1, B1, C1, D1) { dseg(p, V, q) }
})

// 图 2·28 (2) 侧棱延长后不交于一点的图形
#let fig-H-2-28b(width: 205 * k) = px-canvas(205, 255, origin: (380, 692), width: width, (p, u) => {
  import cetz.draw: *
  let A = (386, 943)
  let B = (520, 943)
  let C = (578, 885)
  let D = (448, 884)
  let A1 = (426, 830)
  let B1 = (508, 831)
  let C1 = (541, 800)
  let D1 = (457, 800)
  let V1 = (466, 717)
  let V2 = (494, 697)
  Hbp(p, (A, B, C))
  Hbp(p, (A1, B1, C1, D1), close: true)
  Hb(p, A, A1)
  Hb(p, B, B1)
  Hb(p, C, C1)
  dseg(p, A, D)
  dseg(p, D, C)
  dseg(p, D, D1)
  dseg(p, V1, A1)
  dseg(p, V1, D1)
  dseg(p, V2, B1)
  dseg(p, V2, C1)
})

// 图 2·29 正五棱台的制作图（展开图，双线为粘贴边）
#let H-off(a, b, c, d) = {
  // 把线段 ab 向远离点 c 的一侧平移 d 像素
  let (dx, dy) = (b.at(0) - a.at(0), b.at(1) - a.at(1))
  let l = calc.sqrt(dx * dx + dy * dy)
  let (nx, ny) = (-dy / l, dx / l)
  let m = ((a.at(0) + b.at(0)) / 2, (a.at(1) + b.at(1)) / 2)
  let s = if (c.at(0) - m.at(0)) * nx + (c.at(1) - m.at(1)) * ny > 0 { -1 } else { 1 }
  ((a.at(0) + s * d * nx, a.at(1) + s * d * ny), (b.at(0) + s * d * nx, b.at(1) + s * d * ny))
}
#let fig-H-2-29(width: 270 * k) = px-canvas(270, 285, origin: (610, 693), width: width, (p, u) => {
  import cetz.draw: *
  let P1 = (684, 819)
  let P2 = (684, 853)
  let Q1 = (751, 798)
  let Q2 = (751, 875)
  let R = (712, 734)
  let S = (668, 795)
  let T1 = (640, 704)
  let T2 = (630, 771)
  let R2 = (712, 937)
  let S2 = (668, 880)
  let T3 = (640, 966)
  let T4 = (636, 893)
  // 大五边形（下底面）
  let s = 77
  let V3 = (Q1.at(0) + s * calc.cos(18deg), Q1.at(1) - s * calc.sin(18deg))
  let V4 = (V3.at(0) + s * calc.cos(54deg), V3.at(1) + s * calc.sin(54deg))
  let V5 = (Q2.at(0) + s * calc.cos(18deg), Q2.at(1) + s * calc.sin(18deg))
  let bc = (800, 836)
  // 小五边形（上底面）
  poly(p, (P1, (643, 812), (622, 834), (644, 862), P2))
  dseg(p, P1, P2)
  // 中间的侧面
  dseg(p, P1, Q1)
  dseg(p, P2, Q2)
  dseg(p, Q1, Q2)
  // 上方两个侧面
  poly(p, (Q1, R, T1, T2, S, P1))
  dseg(p, R, S)
  // 下方两个侧面
  poly(p, (Q2, R2, T3, T4, S2, P2))
  dseg(p, R2, S2)
  // 大五边形
  poly(p, (Q1, V3, V4, V5, Q2))
  // 粘贴边（双线）
  let fc1 = (670, 760)
  let fc2 = (670, 925)
  for (a, b, c) in ((T1, T2, fc1), (T2, S, fc1), (S, P1, (720, 800)), (T3, T4, fc2), (T4, S2, fc2), (S2, P2, (720, 870)),
    (Q1, V3, bc), (V3, V4, bc), (V4, V5, bc), (V5, Q2, bc)) {
    let (a2, b2) = H-off(a, b, c, 5)
    line(p(..a2), p(..b2), stroke: lw)
  }
})

// 图 2·30 例 1 的正三棱台
#let fig-H-2-30(width: 250 * k) = px-canvas(250, 215, origin: (645, 1088), width: width, (p, u) => {
  import cetz.draw: *
  let A1 = (704, 1105)
  let C1 = (838, 1108)
  let B1 = (796, 1158)
  let A = (672, 1203)
  let C = (870, 1210)
  let B = (810, 1281)
  let O1 = (779, 1124)
  let O = (781, 1231)
  let D1 = (750, 1131.5)
  let D = (741, 1242)
  let E = (704, 1211)
  let F = (750, 1240)
  Hbp(p, (A1, C1, B1), close: true)
  Hbp(p, (A, B, C))
  Hb(p, A, A1)
  Hb(p, B, B1)
  Hb(p, C, C1)
  Hb(p, D1, D)
  Ht(p, A1, O1)
  Ht(p, O1, D1)
  dseg(p, A, C)
  dseg(p, A, O)
  dseg(p, O, D)
  dseg(p, O1, O)
  dseg(p, A1, E)
  dseg(p, D1, F)
  HL(p, 683, 1100, $A_1$)
  HL(p, 857, 1110, $C_1$)
  HL(p, 800, 1122, $O_1$)
  HL(p, 732, 1144, $D_1$)
  HL(p, 820, 1170, $B_1$)
  HL(p, 718, 1198, $E$)
  HL(p, 658, 1203, $A$)
  HL(p, 883, 1212, $C$)
  HL(p, 732, 1260, $D$)
  HL(p, 760, 1252, $F$)
  HL(p, 796, 1240, $O$)
  HL(p, 810, 1300, $B$)
})
