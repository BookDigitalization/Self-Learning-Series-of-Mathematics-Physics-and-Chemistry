// 图 1·95（p.84）、1·96（p.84）、1·97（p.85）、1·98（p.86）；页面 200 dpi 坐标。
#import "E-base.typ": *

// 图 1·95 (1)(2)
#let fig-E-1-95(width: 640 * k) = px-canvas(640, 175, origin: (160, 893), width: width, (p, u) => {
  import cetz.draw: *
  // (1)
  let L = (172, 1011)
  let T = (285, 964)
  let R = (462, 1008)
  let Bt = (352, 1054)
  let D = (261, 1031)
  let E = (376, 986)
  seg(p, L, Bt)
  seg(p, Bt, R)
  seg(p, R, E)
  dseg(p, T, E)
  dseg(p, T, (262, 974))
  seg(p, (262, 974), L)
  poly(p, ((260, 954), (373, 913), E, D), close: true)
  seg(p, D, E)   // 原图交线 DE 是普通线宽
  let A = (302, 940)
  let C = (302, 1015)
  let B = (322, 1031)
  E-bold(p, (A, C))
  E-bold(p, (A, B))
  lbl(p, A, $A$, dir: "nw", d: 11)
  lbl(p, B, $B$, dir: "se", d: 11)
  lbl(p, C, $C$, dir: "s", d: 11)
  lbl(p, D, $D$, dir: "sw", d: 11)
  lbl(p, E, $E$, dir: "ne", d: 12)
  lbl(p, (355, 936), $M$, dir: "c", d: 0)
  lbl(p, (417, 1011), $N$, dir: "c", d: 0)
  lbl(p, (296, 1101), [(1)], dir: "c", d: 0)
  // (2)
  let L = (509, 1008)
  let T = (622, 963)
  let R = (793, 1009)
  let Bt = (678, 1055)
  let D = (595, 1032)
  let E = (708, 987)
  seg(p, L, Bt)
  seg(p, Bt, R)
  seg(p, R, E)
  dseg(p, T, E)
  dseg(p, T, (600, 974))
  seg(p, (600, 974), L)
  poly(p, ((594, 954), (706, 913), E, D), close: true)
  seg(p, D, E)   // 原图交线 DE 是普通线宽
  let C = (639, 937)
  let A = (639, 1015)
  let B = (660, 908)
  E-bold(p, (C, A))
  E-bold(p, (B, A))
  lbl(p, C, $C$, dir: "nw", d: 11)
  lbl(p, A, $A$, dir: "se", d: 11)
  lbl(p, B, $B$, dir: "n", d: 11)
  lbl(p, D, $D$, dir: "sw", d: 11)
  lbl(p, E, $E$, dir: "ne", d: 12)
  lbl(p, (692, 934), $M$, dir: "c", d: 0)
  lbl(p, (755, 1011), $N$, dir: "c", d: 0)
  lbl(p, (652, 1101), [(2)], dir: "c", d: 0)
})

// 图 1·96 性质定理 2
#let fig-E-1-96(width: 360 * k) = px-canvas(360, 235, origin: (510, 1155), width: width, (p, u) => {
  import cetz.draw: *
  // 平面 P
  let L = (519, 1281)
  let T = (617, 1224)
  let R = (852, 1269)
  let Bt = (722, 1327)
  seg(p, L, Bt)
  seg(p, Bt, R)
  seg(p, R, (774, 1251))
  dseg(p, (774, 1251), T)
  dseg(p, T, (602, 1241))
  seg(p, (602, 1241), L)
  // 平面 M
  poly(p, ((602, 1161), (773, 1195), (776, 1381), (606, 1348), (602, 1161)))
  // 平面 N（画影线）：原图分成两块——P 上方一块（下边是 N 与 P 的交线），
  // P 前边以下一块（挡住 M 的下边）；N 在 M 后面露出 M 上边的一小角也画影线。
  let tl = (639, 1213)
  let tr = (687, 1194)
  let br = (688, 1274)
  let bl = (642, 1293)
  for i in range(0, 19) {
    let y = 1198 + i * 5
    let xs = if y < 1213 { 639 + (1213 - y) * 48 / 19 } else { 640 }
    let xe = if y > 1274 { 642 + (1293 - y) * 46 / 19 } else { 688 }
    line(p(xs, y), p(xe, y), stroke: 0.4pt)
  }
  poly(p, (tl, tr, br, bl), close: true)
  // 下块
  let lt = (642, 1310)
  let rt = (689, 1319)
  let rb = (689, 1350)
  let lb = (643, 1368)
  line(p(..lt), p(..rt), p(..rb), p(..lb), close: true, fill: white, stroke: lw)
  for i in range(0, 11) {
    let y = 1313 + i * 5
    let xe = if y < 1319 { 642 + (y - 1310) * 47 / 9 } else if y > 1350 { 643 + (1368 - y) * 46 / 18 } else { 689 }
    line(p(643, y), p(xe, y), stroke: 0.4pt)
  }
  // M 上边以上露出的一小角
  line(p(707, 1182), p(728, 1172), p(728, 1186), close: true, stroke: lw)
  for y in (1176, 1180, 1184) { line(p(calc.max(707, 707 + (1182 - y) * 21 / 10), y), p(728, y), stroke: 0.4pt) }
  let A = (687, 1194)
  let B = (688, 1274)   // AB 即 N 的右边（M、N 的交线）
  let B1 = (706, 1276)
  seg(p, A, B)
  E-bold(p, (A, B1))
  lbl(p, A, $A$, dir: "e", d: 10)
  lbl(p, B, $B$, dir: "sw", d: 10)
  lbl(p, B1, [$B_1$], dir: "se", d: 10)
  lbl(p, (755, 1207), $M$, dir: "c", d: 0)
  lbl(p, (815, 1273), $P$, dir: "c", d: 0)
  lbl(p, (655, 1350), $N$, dir: "c", d: 0)
})

// 图 1·97 例 1
#let fig-E-1-97(width: 330 * k) = px-canvas(330, 270, origin: (555, 585), width: width, (p, u) => {
  import cetz.draw: *
  // 平面 Q
  let L = (561, 814)
  let TL = (645, 726)
  let TR = (894, 728)
  let BR = (813, 816)
  seg(p, L, TL)
  seg(p, L, BR)
  seg(p, BR, TR)
  dseg(p, TL, (770, 726))
  seg(p, (770, 726), TR)
  // 平面 P
  let A = (682, 814)
  let B = (771, 726)
  seg(p, A, (682, 672))
  seg(p, (682, 672), (772, 588))
  seg(p, (771, 588), B)
  seg(p, A, B)
  // 辅助线
  let E = (726, 672)
  let F = (729, 771)
  let G = (793, 771)
  E-bold(p, (E, F))
  E-bold(p, (F, G))
  E-bold(p, (E, G))
  let C = (768, 800)
  let D = (821, 745)
  E-bold(p, (C, D))
  lbl(p, (754, 612), $P$, dir: "c", d: 0)
  lbl(p, E, $E$, dir: "nw", d: 10)
  lbl(p, B, $B$, dir: "ne", d: 12)
  lbl(p, F, $F$, dir: "sw", d: 11)
  lbl(p, G, $G$, dir: "se", d: 10)
  lbl(p, (596, 803), $Q$, dir: "c", d: 0)
  lbl(p, A, $A$, dir: "s", d: 12)
  lbl(p, C, $C$, dir: "se", d: 10)
  lbl(p, D, $D$, dir: "ne", d: 11)
})

// 图 1·98 三个互相垂直的平面
#let fig-E-1-98(width: 220 * k) = px-canvas(220, 190, origin: (680, 280), width: width, (p, u) => {
  import cetz.draw: *
  E-bold(p, ((746, 287), (869, 286), (870, 395), (746, 395)), close: true)
  E-bold(p, ((746, 287), (689, 344), (689, 455), (746, 395)))
  E-bold(p, ((689, 455), (811, 456), (870, 395)))
  lbl(p, (760, 341), $a$, dir: "c", d: 0)
  lbl(p, (810, 391), $c$, dir: "c", d: 0)
  lbl(p, (718, 411), $b$, dir: "c", d: 0)
  lbl(p, (847, 301), $M$, dir: "c", d: 0)
  lbl(p, (701, 354), $N$, dir: "c", d: 0)
  lbl(p, (801, 442), $P$, dir: "c", d: 0)
})
