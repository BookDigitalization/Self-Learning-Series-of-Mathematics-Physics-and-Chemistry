// 图 1·55（原书 p.75）、1·56(1)(2)（p.75）、1·57（p.76）、1·58（p.77）、1·59（p.78）；页面 120 dpi 坐标。
#import "E-base.typ": *

// 图 1·55 两个相似三角形 ABC、A'B'C'
#let fig-E-1-55(width: 480 * k) = px-canvas(480, 230, origin: (300, 170), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((492, 200), (326, 352), (550, 351))
  let (A1, B1, C1) = ((719, 270), (627, 351), (752, 351))
  tri(p, A, B, C)
  tri(p, A1, B1, C1)
  lbl(p, A, $A$, dir: "n", d: 10)
  lbl(p, B, $B$, dir: "sw", d: 10)
  lbl(p, C, $C$, dir: "se", d: 10)
  lbl(p, A1, $A'$, dir: "nw", d: 11)
  lbl(p, B1, $B'$, dir: "sw", d: 11)
  lbl(p, C1, $C'$, dir: "se", d: 11)
})

// 图 1·56 (1) 锐角三角形的高；(2) 钝角三角形的高（高在形外，底边延长用虚线）
#let e-56a(width) = px-canvas(440, 190, origin: (320, 815), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D) = ((499, 838), (345, 971), (545, 971), (499, 971))
  let (A1, B1, C1, D1) = ((697, 890), (600, 971), (734, 971), (697, 971))
  tri(p, A, B, C)
  seg(p, A, D)
  rtmark(p, D, A, B, s: 7)
  tri(p, A1, B1, C1)
  seg(p, A1, D1)
  rtmark(p, D1, A1, B1, s: 7)
  lbl(p, A, $A$, dir: "n", d: 9)
  lbl(p, B, $B$, dir: "sw", d: 10)
  lbl(p, D, $D$, dir: "s", d: 10)
  lbl(p, C, $C$, dir: "se", d: 10)
  lbl(p, A1, $A'$, dir: "nw", d: 11)
  lbl(p, B1, $B'$, dir: "sw", d: 11)
  lbl(p, D1, $D'$, dir: "s", d: 11)
  lbl(p, C1, $C'$, dir: "se", d: 11)
})
#let e-56b(width) = px-canvas(480, 190, origin: (310, 1050), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D) = ((520, 1064), (326, 1211), (471, 1211), (524, 1211))
  let (A1, B1, C1, D1) = ((731, 1107), (607, 1209), (701, 1209), (736, 1209))
  poly(p, (B, A, C, B), close: false)
  seg(p, A, D)
  seg(p, B, C)
  dseg(p, C, (565, 1211))
  rtmark(p, D, A, C, s: 7)
  poly(p, (B1, A1, C1, B1), close: false)
  seg(p, A1, D1)
  dseg(p, C1, (770, 1209))
  rtmark(p, D1, A1, C1, s: 7)
  lbl(p, A, $A$, dir: "n", d: 9)
  lbl(p, B, $B$, dir: "sw", d: 10)
  lbl(p, C, $C$, dir: "s", d: 10)
  lbl(p, D, $D$, dir: "s", d: 10)
  lbl(p, A1, $A'$, dir: "nw", d: 11)
  lbl(p, B1, $B'$, dir: "sw", d: 11)
  lbl(p, C1, $C'$, dir: "s", d: 11)
  lbl(p, D1, $D'$, dir: "s", d: 11)
})
#let fig-E-1-56(width: 440 * k) = stack(
  dir: ttb, spacing: 0.4em,
  e-56a(width),
  text(font: fonts.kai, size: 9pt)[(1)],
  v(0.8em),
  e-56b(width * 480 / 440),
  text(font: fonts.kai, size: 9pt)[(2)],
)

// 图 1·57 相似三角形的外接圆直径：AD、A'D' 为直径
#let fig-E-1-57(width: 510 * k) = px-canvas(510, 270, origin: (230, 995), width: width, (p, u) => {
  import cetz.draw: *
  let c1 = (374, 1129)
  let r1 = 113.5
  let c2 = (612, 1088)
  let r2 = 76
  circ(p, c1, r1)
  circ(p, c2, r2)
  let (A, B, C, D) = (cpt(c1, r1, 75.4), cpt(c1, r1, 204.8), cpt(c1, r1, 333.7), cpt(c1, r1, 255.4))
  let (A1, B1, C1, D1) = (cpt(c2, r2, 47.8), cpt(c2, r2, 173.4), cpt(c2, r2, 325.4), cpt(c2, r2, 227.8))
  poly(p, (A, B, C, A), close: false)
  seg(p, A, D)
  seg(p, B, D)
  poly(p, (A1, B1, C1, A1), close: false)
  seg(p, A1, D1)
  seg(p, B1, D1)
  amk(p, C, A, B, 14, n: 2)
  amk(p, D, A, B, 16, n: 2)
  amk(p, C1, A1, B1, 12, n: 2)
  amk(p, D1, A1, B1, 12, n: 2)
  ring(p, c1, r: 3)
  ring(p, c2, r: 3)
  lbl(p, c1, $O$, dir: "e", d: 12)
  lbl(p, c2, $O'$, dir: "e", d: 13)
  lbl(p, A, $A$, dir: "n", d: 9)
  lbl(p, B, $B$, dir: "w", d: 10)
  lbl(p, C, $C$, dir: "se", d: 11)
  lbl(p, D, $D$, dir: "s", d: 10)
  lbl(p, A1, $A'$, dir: "ne", d: 11)
  lbl(p, B1, $B'$, dir: "nw", d: 11)
  lbl(p, C1, $C'$, dir: "se", d: 11)
  lbl(p, D1, $D'$, dir: "sw", d: 11)
})

// 图 1·58 △ABC 的内切圆 O，DE ∥ AC 且与圆相切于 L（D、E 按周长关系算出）
#let fig-E-1-58(width: 500 * k) = px-canvas(500, 290, origin: (270, 690), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((604, 701), (289, 956), (742.5, 956))
  let a = dist(B, C)
  let b = dist(C, A)
  let c = dist(A, B)
  let s = a + b + c
  let O = ((a * A.at(0) + b * B.at(0) + c * C.at(0)) / s, (a * A.at(1) + b * B.at(1) + c * C.at(1)) / s)
  let r = calc.abs(O.at(1) - B.at(1))
  let G = (O.at(0), B.at(1))
  let H = foot(O, C, A)
  let K = foot(O, A, B)
  let rho = (c + a - b) / s
  let D = lerp(B, A, rho)
  let E = lerp(B, C, rho)
  let L = foot(O, D, E)
  tri(p, A, B, C)
  circ(p, O, r)
  seg(p, D, E)
  ring(p, O, r: 2.5)
  lbl(p, A, $A$, dir: "n", d: 10)
  lbl(p, B, $B$, dir: "w", d: 11)
  lbl(p, C, $C$, dir: "e", d: 11)
  lbl(p, D, $D$, dir: "nw", d: 11)
  lbl(p, E, $E$, dir: "s", d: 11)
  lbl(p, G, $G$, dir: "s", d: 11)
  lbl(p, K, $K$, dir: "nw", d: 11)
  lbl(p, H, $H$, dir: "ne", d: 11)
  lbl(p, L, $L$, dir: "w", d: 11)
  lbl(p, O, $O$, dir: "s", d: 12)
})

// 图 1·59 作与 △ABC 相似、周长为 MN = m 的三角形
#let fig-E-1-59(width: 660 * k) = px-canvas(660, 320, origin: (170, 840), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((627.5, 852.5), (504, 976.5), (702.5, 976.5))
  let (M, N) = ((197, 1056), (805, 1056))
  let Mp = (699, 1146)
  let bc = dist(B, C)
  let ca = dist(C, A)
  let ab = dist(A, B)
  let per = bc + ca + ab
  let P = lerp(M, Mp, bc / per)
  let Q = lerp(M, Mp, (bc + ca) / per)
  let D = lerp(M, N, bc / per)
  let F = lerp(M, N, (bc + ca) / per)
  let sc = (N.at(0) - M.at(0)) / per
  let md = bc * sc
  let de = ca * sc
  let em = ab * sc
  let ex = (md * md + em * em - de * de) / (2 * md)
  let E = (M.at(0) + ex, M.at(1) - calc.sqrt(em * em - ex * ex))
  tri(p, A, B, C)
  poly(p, (M, E, D), close: false)
  line(p(..M), p(..N), stroke: lw, mark: (end: "stealth", fill: black, scale: 0.5))
  dseg(p, M, Mp)
  dseg(p, P, D)
  dseg(p, Q, F)
  dseg(p, Mp, N)
  lbl(p, A, $A$, dir: "n", d: 10)
  lbl(p, B, $B$, dir: "sw", d: 10)
  lbl(p, C, $C$, dir: "se", d: 10)
  lbl(p, E, $E$, dir: "n", d: 10)
  lbl(p, M, $M$, dir: "w", d: 11)
  lbl(p, D, $D$, dir: "ne", d: 11)
  lbl(p, F, $F$, dir: "n", d: 11)
  lbl(p, N, $N$, dir: "ne", d: 11)
  lbl(p, P, $P$, dir: "s", d: 11)
  lbl(p, Q, $Q$, dir: "s", d: 11)
  lbl(p, Mp, $M'$, dir: "se", d: 11)
  lbl(p, (505, 1044), $m$, dir: "c", d: 0)
})
