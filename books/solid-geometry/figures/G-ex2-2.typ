// 习题 2·2 第 12 题的图（原书 p.128）；页面 200 dpi 坐标。
#import "G-base.typ": *

#let fig-G-ex2-2-12(width: 190 * k) = px-canvas(190, 245, origin: (660, 1112), width: width, (p, u) => {
  import cetz.draw: *
  let A1 = (692, 1130)
  let C1 = (816, 1127)
  let B1 = (751, 1180)
  let A = (687, 1294)
  let B = (752, 1324)
  let C = (812, 1276)
  let P = (812, 1212)
  let D = lerp(A, B, 0.5)
  // 截面 △ABP（阴影）
  ghatch(p, (A, B, P), gap: 7, deg: 70, th: 0.45pt)
  tpoly(p, (A1, B1, C1, A1))
  for (t, b) in ((A1, A), (B1, B), (C1, C)) { tseg(p, t, b) }
  tpoly(p, (A, B, C))
  tseg(p, B, P)
  dseg(p, A, P)
  dseg(p, A, C)
  dseg(p, D, C)
  dseg(p, D, P)
  L(p, 677, 1127, $A_1$)
  L(p, 835, 1127, $C_1$)
  L(p, 765, 1200, $B_1$)
  L(p, 829, 1220, $P$)
  L(p, 826, 1285, $C$)
  L(p, 672, 1303, $A$)
  L(p, 707, 1326, $D$)
  L(p, 752, 1350, $B$)
})
