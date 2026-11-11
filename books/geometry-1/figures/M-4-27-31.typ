// 图 4·27（原书 p.231）、图 4·28（p.231）、图 4·29（p.232）、图 4·30、4·31（p.233）；页面 200 dpi 坐标。
#import "M-base.typ": *

#let M-far(pair, c) = {
  let d0 = calc.pow(pair.at(0).at(0) - c.at(0), 2) + calc.pow(pair.at(0).at(1) - c.at(1), 2)
  let d1 = calc.pow(pair.at(1).at(0) - c.at(0), 2) + calc.pow(pair.at(1).at(1) - c.at(1), 2)
  if d0 > d1 { pair.at(0) } else { pair.at(1) }
}

// 图 4·27 圆内角：过 C 作 CS ∥ AB
#let fig-M-4-27(width: 290 * k) = px-canvas(290, 285, origin: (140, 800), width: width, (p, u) => {
  import cetz.draw: *
  let O = (280, 935)
  let r = 114
  circ(p, O, r)
  let A = M-pt(O, r, 173)
  let B = M-pt(O, r, 66.4)
  let D = M-pt(O, r, 120)
  let C = M-pt(O, r, -7)
  let P = M-isect(A, B, D, C)
  let S = M-far(M-sec(O, r, C, (B.at(0) - A.at(0), B.at(1) - A.at(1))), C)
  M-bold(p, A, B)
  M-bold(p, D, C)
  dseg(p, C, S)
  anglearc(p, P, A, D, 16)
  anglearc(p, C, S, D, 16)
  lbl(p, D, $D$, dir: "nw", d: 9)
  lbl(p, B, $B$, dir: "ne", d: 9)
  lbl(p, P, $P$, dir: "n", d: 11)
  lbl(p, A, $A$, dir: "w", d: 10)
  lbl(p, C, $C$, dir: "e", d: 10)
  lbl(p, S, $S$, dir: "s", d: 10)
})

// 图 4·28 圆外角：过 C 作 CS ∥ AB
#let fig-M-4-28(width: 270 * k) = px-canvas(270, 360, origin: (565, 725), width: width, (p, u) => {
  import cetz.draw: *
  let O = (695, 946)
  let r = 112
  let P = (703, 740)
  let (B, A) = M-sec(O, r, P, (-92, 284))
  let (C, D) = M-sec(O, r, P, (109, 230))
  let S = M-far(M-sec(O, r, C, (A.at(0) - B.at(0), A.at(1) - B.at(1))), C)
  circ(p, O, r)
  M-bold(p, P, A)
  M-bold(p, P, D)
  dseg(p, C, S)
  anglearc(p, P, B, C, 24)
  lbl(p, P, $P$, dir: "n", d: 9)
  lbl(p, B, $B$, dir: "nw", d: 9)
  lbl(p, C, $C$, dir: "ne", d: 9)
  lbl(p, D, $D$, dir: "e", d: 10)
  lbl(p, A, $A$, dir: "sw", d: 9)
  lbl(p, S, $S$, dir: "s", d: 10)
})

// 图 4·29 例 1：△ABC 的三内角（弧 AB = 80°，弧 BC = 110°）
#let fig-M-4-29(width: 245 * k) = px-canvas(245, 250, origin: (625, 535), width: width, (p, u) => {
  import cetz.draw: *
  let O = (744, 657)
  let r = 107
  circ(p, O, r)
  let A = M-pt(O, r, 85)
  let B = M-pt(O, r, 165)
  let C = M-pt(O, r, -85)
  M-bold(p, A, B)
  M-bold(p, B, C)
  M-bold(p, A, C)
  lbl(p, A, $A$, dir: "ne", d: 9)
  lbl(p, B, $B$, dir: "w", d: 10)
  lbl(p, C, $C$, dir: "se", d: 10)
})

// 图 4·30 例 2：已知直角边 a 和斜边 c 作直角三角形（左边是已知线段 a、c）
#let fig-M-4-30(width: 700 * k) = px-canvas(700, 205, origin: (130, 310), width: width, (p, u) => {
  import cetz.draw: *
  pseg(p, (147, 446), (398, 446))
  pseg(p, (147, 478), (444, 478))
  lbl(p, (265, 436), $a$, dir: "c", d: 0)
  lbl(p, (296, 467), $c$, dir: "c", d: 0)
  let A = (499, 481)
  let B = (801, 481)
  let C = (590.7, 342)
  M-arc(p, (650, 481), 151, 0, 180, stroke: dsh)
  M-arc(p, B, 252, 139, 152, stroke: dsh)
  M-bold(p, A, B)
  M-bold(p, A, C)
  M-bold(p, B, C)
  rtmark(p, C, A, B, s: 9)
  lbl(p, A, $A$, dir: "sw", d: 10)
  lbl(p, B, $B$, dir: "se", d: 10)
  lbl(p, C, $C$, dir: "nw", d: 10)
  lbl(p, (701, 404), $a$, dir: "c", d: 0)
  lbl(p, (652, 493), $c$, dir: "c", d: 0)
})

// 图 4·31 例 3：四段弧的中点 P、M、Q、N（PQ ⊥ MN）
#let fig-M-4-31(width: 265 * k) = px-canvas(265, 280, origin: (585, 995), width: width, (p, u) => {
  import cetz.draw: *
  let O = (713, 1130)
  let r = 109
  circ(p, O, r)
  let P = M-pt(O, r, 85)
  let C = M-pt(O, r, 51.5)
  let D = M-pt(O, r, 118)
  let M = M-pt(O, r, 158.5)
  let A = M-pt(O, r, 198.6)
  let Q = M-pt(O, r, 275)
  let B = M-pt(O, r, -8.5)
  let N = M-pt(O, r, 21.5)
  let S = M-isect(P, Q, M, N)
  M-bold(p, P, Q)
  M-bold(p, M, N)
  for a in (118, 51.5, 198.6, -8.5) { M-rtick(p, O, r, a) }
  for t in (P, M, N, Q, S) { ring(p, t, r: 3) }
  lbl(p, P, $P$, dir: "n", d: 11)
  lbl(p, D, $D$, dir: "nw", d: 10)
  lbl(p, C, $C$, dir: "ne", d: 10)
  lbl(p, M, $M$, dir: "w", d: 11)
  lbl(p, N, $N$, dir: "e", d: 11)
  lbl(p, A, $A$, dir: "w", d: 10)
  lbl(p, B, $B$, dir: "e", d: 10)
  lbl(p, Q, $Q$, dir: "s", d: 11)
  lbl(p, S, $S$, dir: "se", d: 9)
})
