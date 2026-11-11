// 复习题四的插图（几何第二册 p.259–261）：第 6、14、18、19、20 题。页面渲染 dpi：120。
// 第 18 题左图（纸条打结的写实图）为扫描裁剪的二值化 PNG（p.261，N-knot.png）；右图重绘。
#import "N-base.typ": *

// 第 6 题（p.259）：正三角形内三个内切等圆
#let fig-N-rev6(width: 215 * k) = px-canvas(215, 215, origin: (672, 795), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((780, 805), (676, 985), (884, 985))
  let r = 38
  poly(p, (A, B, C), close: true)
  circ(p, (742, 985 - r), r)
  circ(p, (818, 985 - r), r)
  circ(p, (780, 985 - r - 66), r)
  // 尺寸线 2 米
  let y = 993
  line(p(676, y), p(764, y), stroke: lt, mark: (start: "stealth", fill: black, scale: 0.45))
  line(p(796, y), p(884, y), stroke: lt, mark: (end: "stealth", fill: black, scale: 0.45))
  lbl(p, (780, y), tsm[2 米], dir: "c", d: 0)
  seg(p, (676, y - 5), (676, y + 5))
  seg(p, (884, y - 5), (884, y + 5))
})

// 第 14 题（p.260）：正八边形 ABCDEFGH
#let fig-N-rev14(width: 330 * k) = px-canvas(330, 320, origin: (505, 505), width: width, (p, u) => {
  import cetz.draw: *
  let O = (664, 664)
  let R = 138
  let (A, B, C, D, E, F, G, H) = range(8).map(i => cpt(O, R, -45 * i))
  let M = lerp(A, C, 0.5)
  poly(p, (A, B, C, D, E, F, G, H), close: true, stroke: lb)
  seg(p, E, A)
  seg(p, G, C)
  seg(p, O, B)
  seg(p, A, C)
  rtmark(p, M, O, A, s: 6)
  pdot(p, O, r: 1.6)
  lbl(p, G, $G$, dir: "n", d: 11)
  lbl(p, H, $H$, dir: "ne", d: 10)
  lbl(p, A, $A$, dir: "e", d: 11)
  lbl(p, B, $B$, dir: "se", d: 10)
  lbl(p, C, $C$, dir: "s", d: 11)
  lbl(p, D, $D$, dir: "sw", d: 10)
  lbl(p, E, $E$, dir: "w", d: 11)
  lbl(p, F, $F$, dir: "nw", d: 10)
  lbl(p, O, $O$, dir: "ne", d: 9)
  lbl(p, M, $M$, dir: "ne", d: 11)
})

// 第 18 题（p.261）：左为纸条打结（PNG），右为压平后的正五边形，两侧阴影为裁去的部分
#let fig-N-rev18(width: 705 * k) = px-canvas(705, 220, origin: (185, 450), width: width, (p, u) => {
  import cetz.draw: *
  pimg(p, u, "/books/geometry-2/figures/N-knot.png", (185, 455, 510, 675))
  let (T, L, BL, BR, Rt) = ((722, 452), (644, 515), (678, 602), (772, 603), (778, 518))
  let L2 = (557, 583)
  let L3 = (610, 653)
  let R2 = (881, 586)
  let R3 = (834, 651)
  // 阴影区
  line(p(..L), p(..L2), p(..L3), p(..BL), close: true, stroke: lw, fill: hhatch)
  line(p(..Rt), p(..R2), p(..R3), p(..BR), close: true, stroke: lw, fill: hhatch)
  // 五边形及对角线
  poly(p, (T, L, BL, BR, Rt), close: true, stroke: lb)
  seg(p, T, BL, stroke: dsh)
  seg(p, L, BR, stroke: dsh)
  seg(p, Rt, BL, stroke: dsh)
  tseg(p, T, BR)
  content(p(606, 588), tt[裁去], angle: 32deg)
  content(p(826, 584), tt[裁去], angle: -34deg)
})

// 第 19 题（p.261）：房顶纵断面，正八边形的一半
#let fig-N-rev19(width: 300 * k) = px-canvas(300, 190, origin: (212, 1075), width: width, (p, u) => {
  import cetz.draw: *
  let O = (361, 1225)
  let R = 139
  let (A, B, C, D, E) = (cpt(O, R, 180), cpt(O, R, 135), cpt(O, R, 90), cpt(O, R, 45), cpt(O, R, 0))
  carc(p, O, R, 0, 180, stroke: dsh)
  poly(p, (A, B, C, D, E), stroke: lb)
  seg(p, A, E, stroke: lb)
  seg(p, B, D, stroke: lb)
  lbl(p, C, $C$, dir: "n", d: 10)
  lbl(p, B, $B$, dir: "nw", d: 10)
  lbl(p, D, $D$, dir: "ne", d: 10)
  lbl(p, A, $A$, dir: "sw", d: 10)
  lbl(p, E, $E$, dir: "se", d: 10)
})

// 第 20 题（p.261）：圆内接八角星形（两个正方形 ACEG、BDFH）
#let fig-N-rev20(width: 340 * k) = px-canvas(340, 360, origin: (542, 888), width: width, (p, u) => {
  import cetz.draw: *
  let O = (712, 1065)
  let R = 156
  let (G, H, A, B, C, D, E, F) = range(8).map(i => cpt(O, R, 45 * i))
  circ(p, O, R)
  poly(p, (A, C, E, G), close: true, stroke: lb)
  poly(p, (B, D, F, H), close: true, stroke: lb)
  seg(p, A, O)
  seg(p, B, O)
  rtmark(p, (A.at(0), B.at(1)), A, B, s: 7)
  ring(p, O, r: 3)
  lbl(p, A, $A$, dir: "n", d: 10)
  lbl(p, B, $B$, dir: "nw", d: 10)
  lbl(p, C, $C$, dir: "w", d: 10)
  lbl(p, D, $D$, dir: "sw", d: 10)
  lbl(p, E, $E$, dir: "s", d: 10)
  lbl(p, F, $F$, dir: "se", d: 10)
  lbl(p, G, $G$, dir: "e", d: 10)
  lbl(p, H, $H$, dir: "ne", d: 10)
  lbl(p, O, $O$, dir: "s", d: 9)
  lbl(p, (718, 965), $M$, dir: "c", d: 0)
  lbl(p, (669, 933), $L$, dir: "c", d: 0)
})
