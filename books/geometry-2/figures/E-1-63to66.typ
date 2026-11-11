// 图 1·63（原书 p.85）、1·64（p.88）、1·65（p.89）、1·66（p.91）；页面 120 dpi 坐标。
#import "E-base.typ": *

// 图 1·63 相似五边形 ABCDE、A'B'C'D'E'，对角线 AC、AD 与 A'C'、A'D'
#let fig-E-1-63(width: 470 * k) = px-canvas(470, 220, origin: (275, 390), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D, E) = ((352, 584), (504, 564), (521, 449), (359, 406), (305, 499))
  let (A1, B1, C1, D1, E1) = ((614, 544), (712, 530), (722, 458), (614, 429), (579, 487))
  poly(p, (A, B, C, D, E), close: true)
  poly(p, (A1, B1, C1, D1, E1), close: true)
  seg(p, A, C)
  seg(p, A, D)
  seg(p, A1, C1)
  seg(p, A1, D1)
  lbl(p, A, $A$, dir: "s", d: 10)
  lbl(p, B, $B$, dir: "se", d: 10)
  lbl(p, C, $C$, dir: "ne", d: 10)
  lbl(p, D, $D$, dir: "n", d: 10)
  lbl(p, E, $E$, dir: "w", d: 10)
  lbl(p, A1, $A'$, dir: "s", d: 11)
  lbl(p, B1, $B'$, dir: "se", d: 11)
  lbl(p, C1, $C'$, dir: "ne", d: 11)
  lbl(p, D1, $D'$, dir: "n", d: 11)
  lbl(p, E1, $E'$, dir: "w", d: 11)
})

// 图 1·64 同上，用于判定
// 原书作 E'（p.88 图 1·64 右图右下角顶点，扫描确印像 E'；该点与左图 B 对应，且 E' 已在左上，唯一应为 B'），这里订正作 B'。
#let fig-E-1-64(width: 470 * k) = px-canvas(470, 220, origin: (240, 375), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D, E) = ((307, 571), (460, 569), (493, 458), (337, 395), (271, 475))
  let (A1, B1, C1, D1, E1) = ((570, 568), (670, 567), (691, 496), (589, 451), (545, 506))
  poly(p, (A, B, C, D, E), close: true)
  poly(p, (A1, B1, C1, D1, E1), close: true)
  seg(p, A, C)
  seg(p, A, D)
  seg(p, A1, C1)
  seg(p, A1, D1)
  lbl(p, A, $A$, dir: "s", d: 10)
  lbl(p, B, $B$, dir: "s", d: 10)
  lbl(p, C, $C$, dir: "ne", d: 10)
  lbl(p, D, $D$, dir: "n", d: 10)
  lbl(p, E, $E$, dir: "w", d: 10)
  lbl(p, A1, $A'$, dir: "s", d: 11)
  lbl(p, B1, $B'$, dir: "s", d: 11)
  lbl(p, C1, $C'$, dir: "ne", d: 11)
  lbl(p, D1, $D'$, dir: "n", d: 11)
  lbl(p, E1, $E'$, dir: "w", d: 11)
})

// 图 1·65 两圆外切于 P，过 P 的四条直线交两圆于 A,A'；B,B'；C,C'；D,D'；TT' 为内公切线
#let fig-E-1-65(width: 440 * k) = px-canvas(440, 375, origin: (310, 895), width: width, (p, u) => {
  import cetz.draw: *
  let c1 = (450, 1076)
  let r1 = 128
  let c2 = (650, 1076)
  let r2 = 72
  let P = (578, 1076)
  let other(X) = {
    let l = dist(P, X)
    let dx = (P.at(0) - X.at(0)) / l
    let dy = (P.at(1) - X.at(1)) / l
    let s = 2 * r2 * dx
    (P.at(0) + dx * s, P.at(1) + dy * s)
  }
  let (A, B, C, D) = (cpt(c1, r1, 67.5), cpt(c1, r1, 131.4), cpt(c1, r1, 202.7), cpt(c1, r1, 292.2))
  let (A1, B1, C1, D1) = (other(A), other(B), other(C), other(D))
  circ(p, c1, r1)
  circ(p, c2, r2)
  line(p(578, 908), p(578, 1256), stroke: (paint: black, thickness: 1.2pt, dash: "dashed"))
  poly(p, (A, B, C, D), close: true)
  poly(p, (A1, B1, C1, D1), close: true)
  seg(p, A, A1)
  seg(p, B, B1)
  seg(p, C, C1)
  seg(p, D, D1)
  dseg(p, B, D)
  dseg(p, B1, D1)
  pdot(p, P, r: 2)
  lbl(p, (578, 899), $T$, dir: "c", d: 0)
  lbl(p, (578, 1265), $T'$, dir: "c", d: 0)
  wlbl(p, (565, 1087), $P$)
  lbl(p, A, $A$, dir: "n", d: 9)
  lbl(p, B, $B$, dir: "nw", d: 10)
  lbl(p, C, $C$, dir: "sw", d: 10)
  lbl(p, D, $D$, dir: "s", d: 10)
  lbl(p, A1, $A'$, dir: "s", d: 11)
  lbl(p, B1, $B'$, dir: "se", d: 11)
  lbl(p, C1, $C'$, dir: "ne", d: 11)
  lbl(p, D1, $D'$, dir: "nw", d: 11)
})

// 图 1·66 作与五边形 ABCDE 相似、A'B' = a 的五边形（A'B'C'D'E' 按相似算出）
#let fig-E-1-66(width: 420 * k) = px-canvas(420, 240, origin: (280, 380), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D, E) = ((350, 564), (469, 564), (499, 477), (375, 428), (324, 489))
  let A1 = (579, 563)
  let sc = 81 / 119
  let tr(X) = (A1.at(0) + sc * (X.at(0) - A.at(0)), A1.at(1) + sc * (X.at(1) - A.at(1)))
  let (B1, C1, D1, E1) = (tr(B), tr(C), tr(D), tr(E))
  poly(p, (A, B, C, D, E), close: true)
  poly(p, (A1, B1, C1, D1, E1), close: true)
  dseg(p, A, C)
  dseg(p, A, D)
  dseg(p, A1, C1)
  dseg(p, A1, D1)
  amk(p, A, B, C, 25)
  amk(p, A1, B1, C1, 17)
  amk(p, C, A, B, 13, n: 2)
  amk(p, C1, A1, B1, 9, n: 2)
  pseg(p, (505, 399), (586, 400), s: 4)
  lbl(p, (545, 388), $a$, dir: "c", d: 0)
  lbl(p, A, $A$, dir: "s", d: 10)
  lbl(p, B, $B$, dir: "s", d: 10)
  lbl(p, C, $C$, dir: "e", d: 10)
  lbl(p, D, $D$, dir: "n", d: 10)
  lbl(p, E, $E$, dir: "w", d: 10)
  lbl(p, A1, $A'$, dir: "s", d: 11)
  lbl(p, B1, $B'$, dir: "s", d: 11)
  lbl(p, C1, $C'$, dir: "e", d: 11)
  lbl(p, D1, $D'$, dir: "n", d: 11)
  lbl(p, E1, $E'$, dir: "w", d: 11)
})
