// 图 3·22（原书 p.195）：把多边形划分为三角形或梯形。页面 120 dpi 坐标。
// (1) 从顶点 A 引对角线 AC、AD、AE，并作各三角形的高（虚线）；(2) 对角线 CG 及其垂线。
#import "K-base.typ": *

#let K-roman(p, pt, s) = { import cetz.draw: *; content(p(..pt), K-sm(s)) }

#let fig-K-3-22a(width: 280 * k) = px-canvas(280, 190, origin: (190, 975), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D, E, F) = ((361, 1157), (464, 1112), (461, 1036), (392, 996), (296, 994), (200, 1090))
  poly(p, (A, B, C, D, E, F), close: true)
  seg(p, A, C, stroke: dsh)
  seg(p, A, D, stroke: dsh)
  seg(p, A, E, stroke: dsh)
  seg(p, D, K-foot(D, A, C), stroke: dsh)
  seg(p, D, K-foot(D, A, E), stroke: dsh)
  seg(p, F, K-foot(F, A, E), stroke: dsh)
  seg(p, B, K-foot(B, A, C), stroke: dsh)
  lbl(p, E, $E$, dir: "n", d: 10)
  lbl(p, D, $D$, dir: "ne", d: 10)
  lbl(p, C, $C$, dir: "ne", d: 10)
  lbl(p, B, $B$, dir: "e", d: 10)
  lbl(p, A, $A$, dir: "s", d: 10)
  lbl(p, F, $F$, dir: "w", d: 10)
  K-roman(p, (398, 1058), [II])
  K-roman(p, (354, 1058), [III])
  K-roman(p, (297, 1107), [IV])
  K-roman(p, (427, 1107), [I])
})

#let fig-K-3-22b(width: 410 * k) = px-canvas(410, 290, origin: (480, 940), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D, E, F, G, H) = ((664, 1162), (714, 1214), (869, 1074), (751, 994), (627, 984), (589, 955), (496, 1072), (541, 1147))
  poly(p, (A, B, C, D, E, F, G, H), close: true)
  seg(p, G, C, stroke: dsh)
  for q in (F, E, D, H, A, B) { seg(p, q, (q.at(0), 1072), stroke: dsh) }
  lbl(p, F, $F$, dir: "n", d: 10)
  lbl(p, E, $E$, dir: "ne", d: 9)
  lbl(p, D, $D$, dir: "ne", d: 10)
  lbl(p, C, $C$, dir: "e", d: 10)
  lbl(p, G, $G$, dir: "w", d: 10)
  lbl(p, H, $H$, dir: "sw", d: 9)
  lbl(p, A, $A$, dir: "sw", d: 9)
  lbl(p, B, $B$, dir: "s", d: 10)
  K-roman(p, (561, 1027), [VIII])
  K-roman(p, (603, 1027), [VII])
  K-roman(p, (688, 1027), [VI])
  K-roman(p, (775, 1027), [V])
  K-roman(p, (529, 1109), [I])
  K-roman(p, (599, 1112), [II])
  K-roman(p, (690, 1116), [III])
  K-roman(p, (760, 1117), [IV])
})

