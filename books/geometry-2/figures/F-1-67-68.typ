// 图 1·67（原书 p.93）、图 1·68（p.95）；页面 120 dpi 坐标。
// 两图都是多边形 ABCDE 与它的位似形（外位似中心、内位似中心 O）；位似比取约 0.70、0.75，按位似关系计算。
#import "F-base.typ": *

// 图 1·67 位似中心 O，相似比 ≈ 0.70；虚线为射线 OA、OB、OC、OD、OE；左上为线段 a
#let fig-F-1-67(width: 560 * k) = px-canvas(560, 300, origin: (260, 975), width: width, (p, u) => {
  import cetz.draw: *
  let O = (283, 1143)
  let (A, B, C, D, E) = ((527, 1225), (703, 1225), (750, 1103), (568, 1018), (498, 1100))
  let r = 0.70
  let (A1, B1, C1, D1, E1) = (A, B, C, D, E).map(t => hom(O, r, t))
  // 射线（虚线），终点超出多边形顶点
  dray(p, O, A, 0, 1.5)
  dray(p, O, B, 0, 1.12)
  dray(p, O, C, 0, 1.06)
  dray(p, O, D, 0, 1.24)
  dray(p, O, E, 0, 1.6)
  bpoly(p, (A, B, C, D, E), close: true)
  bpoly(p, (A1, B1, C1, D1, E1), close: true)
  pseg(p, (282, 1000), (402, 1000))
  lbl(p, (342, 1000), $a$, dir: "n", d: 8)
  lbl(p, O, $O$, dir: "w", d: 9)
  lbl(p, A, $A$, dir: "s", d: 11)
  lbl(p, B, $B$, dir: "s", d: 11)
  lbl(p, C, $C$, dir: "n", d: 10)
  lbl(p, D, $D$, dir: "n", d: 10)
  lbl(p, E, $E$, dir: "n", d: 12)
  lbl(p, A1, $A'$, dir: "sw", d: 10)
  lbl(p, B1, $B'$, dir: "se", d: 10)
  lbl(p, C1, $C'$, dir: "ne", d: 10)
  lbl(p, D1, $D'$, dir: "n", d: 10)
  lbl(p, E1, $E'$, dir: "nw", d: 10)
})

// 图 1·68 位似中心 O 在两个多边形之间（内位似中心），相似比 ≈ 0.75
#let fig-F-1-68(width: 700 * k) = px-canvas(700, 260, origin: (180, 825), width: width, (p, u) => {
  import cetz.draw: *
  let O = (508, 962)
  let (A, B, C, D, E) = ((672, 1032), (793, 1022), (832, 935), (700, 872), (652, 930))
  let r = -0.75
  let (A2, B2, C2, D2, E2) = (A, B, C, D, E).map(t => hom(O, r, t))
  dray(p, O, A, -1.25, 1.32)
  dray(p, O, B, -0.97, 1.15)
  dray(p, O, C, -0.9, 1.12)
  dray(p, O, D, -0.97, 1.23)
  dray(p, O, E, -0.85, 1.45)
  bpoly(p, (A, B, C, D, E), close: true)
  bpoly(p, (A2, B2, C2, D2, E2), close: true)
  pseg(p, (185, 846), (275, 846))
  lbl(p, (230, 846), $a$, dir: "n", d: 8)
  lbl(p, O, $O$, dir: "s", d: 9)
  lbl(p, A, $A$, dir: "sw", d: 10)
  lbl(p, B, $B$, dir: "s", d: 11)
  lbl(p, C, $C$, dir: "ne", d: 10)
  lbl(p, D, $D$, dir: "n", d: 10)
  lbl(p, E, $E$, dir: "w", d: 10)
  lbl(p, A2, $A''$, dir: "ne", d: 12)
  lbl(p, B2, $B''$, dir: "n", d: 11)
  lbl(p, C2, $C''$, dir: "w", d: 12)
  lbl(p, D2, $D''$, dir: "s", d: 11)
  lbl(p, E2, $E''$, dir: "se", d: 12)
})
