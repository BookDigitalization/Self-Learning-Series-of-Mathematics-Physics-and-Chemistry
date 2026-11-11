// 图 1·69、1·70、1·71（原书 p.97，每图左右两幅）、图 1·72（p.98）；页面 120 dpi 坐标。
// 1·69–1·71：位似中心取在形内 / 边上 / 顶点，各画外位似（左）和内位似（右）；位似比按位似关系计算。
#import "F-base.typ": *

// 一对位似多边形：大多边形 pts，位似中心 O，比 r；dashes 为各顶点射线（起止倍数），labs 为各点标注
#let F-pair(p, O, pts, r, dashes, lab-big, lab-small, polys-small: true) = {
  import cetz.draw: *
  let small = pts.map(t => hom(O, r, t))
  for (i, d) in dashes.enumerate() {
    if d != none { dray(p, O, pts.at(i), d.at(0), d.at(1)) }
  }
  bpoly(p, pts, close: true)
  bpoly(p, small, close: true)
  for (i, l) in lab-big.enumerate() {
    if l != none { lbl(p, pts.at(i), l.at(0), dir: l.at(1), d: l.at(2)) }
  }
  for (i, l) in lab-small.enumerate() {
    if l != none { lbl(p, small.at(i), l.at(0), dir: l.at(1), d: l.at(2)) }
  }
}

// 图 1·69 位似中心 O 在多边形内部：左图位似比为正（外位似），右图为负（内位似）
#let fig-F-1-69(width: 650 * k) = px-canvas(650, 270, origin: (220, 185), width: width, (p, u) => {
  import cetz.draw: *
  // 左：O 在形内，大多边形 ABCDE 与小多边形 A'B'C'D'E' 在 O 的同侧（外位似）
  let O = (378, 352)
  F-pair(p, O, ((287, 413), (450, 418), (500, 295), (325, 205), (253, 290)), 0.58,
    ((0, 1), (0, 1), (0, 1), (0, 1), (0, 1)),
    (($A$, "s", 10), ($B$, "s", 10), ($C$, "ne", 9), ($D$, "n", 10), ($E$, "nw", 9)),
    (($A'$, "se", 10), ($B'$, "se", 10), ($C'$, "ne", 10), ($D'$, "ne", 9), ($E'$, "sw", 10)))
  lbl(p, O, $O$, dir: "s", d: 9)
  // 右：位似比为负（内位似），小多边形倒置在 O 附近
  let O2 = (715, 348)
  F-pair(p, O2, ((625, 428), (787, 425), (838, 303), (658, 205), (588, 298)), -0.47,
    ((-0.66, 1), (-0.66, 1), (-0.66, 1), (-0.66, 1), (-0.66, 1)),
    (($A$, "s", 10), ($B$, "s", 11), ($C$, "ne", 9), ($D$, "n", 10), ($E$, "nw", 9)),
    (($A''$, "n", 11), ($B''$, "nw", 11), ($C''$, "w", 12), ($D''$, "se", 12), ($E''$, "e", 12)))
  lbl(p, O2, $O$, dir: "s", d: 10)
})

// 图 1·70 位似中心 O 是两个位似多边形边上的一点（在边 AB 上）
#let fig-F-1-70(width: 620 * k) = px-canvas(620, 360, origin: (230, 500), width: width, (p, u) => {
  import cetz.draw: *
  let O = (371, 741)
  F-pair(p, O, ((296, 741), (466, 741), (510, 618), (330, 533), (262, 615)), 0.46,
    (none, none, (0, 1), (0, 1), (0, 1)),
    (($A$, "sw", 9), ($B$, "se", 9), ($C$, "ne", 9), ($D$, "n", 10), ($E$, "nw", 9)),
    (($A'$, "s", 10), ($B'$, "s", 10), ($C'$, "ne", 10), ($D'$, "ne", 10), ($E'$, "w", 10)))
  lbl(p, O, $O$, dir: "s", d: 10)
  let O2 = (693, 745)
  F-pair(p, O2, ((620, 745), (782, 745), (840, 628), (653, 538), (583, 625)), -0.40,
    (none, none, (-0.55, 1), (-0.5, 1), (-0.5, 1)),
    (($A$, "sw", 9), ($B$, "se", 10), ($C$, "ne", 9), ($D$, "n", 10), ($E$, "nw", 9)),
    (($A''$, "ne", 12), ($B''$, "nw", 12), ($C''$, "s", 12), ($D''$, "sw", 11), ($E''$, "ne", 12)))
  lbl(p, O2, $O$, dir: "n", d: 10)
})

// 图 1·71 位似中心 O（= A）是多边形的一个顶点
#let fig-F-1-71(width: 690 * k) = px-canvas(690, 370, origin: (190, 905), width: width, (p, u) => {
  import cetz.draw: *
  let A = (262, 1133)
  F-pair(p, A, ((262, 1133), (425, 1133), (473, 1015), (296, 927), (227, 1008)), 0.55,
    (none, none, (0, 1), (0, 1), none),
    (($A$, "s", 11), ($B$, "s", 11), ($C$, "ne", 9), ($D$, "n", 10), ($E$, "nw", 9)),
    (none, ($B'$, "s", 11), ($C'$, "ne", 10), ($D'$, "ne", 10), ($E'$, "w", 10)))
  let A2 = (645, 1140)
  // 虚线：直线 AB、AC、AD、AE 的延长部分
  dray(p, A2, (810, 1140), -0.95, 0)
  dray(p, A2, (860, 1023), -0.75, 0)
  dray(p, A2, (683, 932), -0.58, 0)
  dray(p, A2, (612, 1018), -1.0, 0)
  dray(p, A2, (860, 1023), 0, 1)
  dray(p, A2, (683, 932), 0, 1)
  F-pair(p, A2, ((645, 1140), (810, 1140), (860, 1023), (683, 932), (612, 1018)), -0.48,
    (none, none, none, none, none),
    (($A$, "se", 11), ($B$, "s", 11), ($C$, "ne", 9), ($D$, "n", 10), ($E$, "nw", 9)),
    (none, ($B''$, "n", 12), ($C''$, "nw", 12), ($D''$, "e", 12), ($E''$, "e", 12)))
})

// 图 1·72 对应边平行、对应顶点连线过同一点 O，但不是位似形（原图 D'、C' 与 D、C 在同一射线上）
#let fig-F-1-72(width: 500 * k) = px-canvas(500, 250, origin: (220, 175), width: width, (p, u) => {
  import cetz.draw: *
  let O = (238, 367)
  let (A1, B1, C1, D1) = ((342, 367), (480, 367), (432, 283), (361, 314))
  let (A, B, C, D) = ((505, 367), (665, 367), (581, 214), (567, 222))
  dray(p, O, (665, 367), 0, 1.065)
  dray(p, O, C, 0, 1.13)
  poly(p, (A1, B1, C1, D1), close: true)
  poly(p, (A, B, C, D), close: true)
  lbl(p, O, $O$, dir: "w", d: 9)
  lbl(p, A1, $A'$, dir: "s", d: 11)
  lbl(p, B1, $B'$, dir: "s", d: 11)
  lbl(p, C1, $C'$, dir: "n", d: 10)
  lbl(p, D1, $D'$, dir: "nw", d: 11)
  lbl(p, A, $A$, dir: "s", d: 11)
  lbl(p, B, $B$, dir: "s", d: 11)
  lbl(p, C, $C$, dir: "ne", d: 10)
  lbl(p, D, $D$, dir: "nw", d: 10)
})
