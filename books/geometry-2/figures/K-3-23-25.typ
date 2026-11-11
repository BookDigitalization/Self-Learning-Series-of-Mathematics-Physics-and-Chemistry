// 图 3·23（原书 p.198）、图 3·24、图 3·25（p.199）；页面 120 dpi 坐标。
#import "K-base.typ": *

// 图 3·23 相似三角形的高 CD、C'D'
#let fig-K-3-23(width: 480 * k) = px-canvas(480, 190, origin: (240, 305), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D) = ((262, 473), (430, 473), (370, 350), (370, 473))
  let (A1, B1, C1, D1) = ((503, 470), (700, 470), (627, 327), (627, 470))
  poly(p, (A, B, C), close: true)
  seg(p, C, D)
  poly(p, (A1, B1, C1), close: true)
  seg(p, C1, D1)
  lbl(p, C, $C$, dir: "n")
  lbl(p, A, $A$, dir: "sw")
  lbl(p, D, $D$, dir: "s", d: 11)
  lbl(p, B, $B$, dir: "se")
  lbl(p, C1, $C'$, dir: "n")
  lbl(p, A1, $A'$, dir: "sw")
  lbl(p, D1, $D'$, dir: "s", d: 11)
  lbl(p, B1, $B'$, dir: "se")
})

// 图 3·24 例 1：∠A = ∠A'，高 CD、C'D'（C'D'、B'D' 为虚线）
#let fig-K-3-24(width: 510 * k) = px-canvas(510, 270, origin: (250, 160), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D) = ((272, 404), (507, 404), (377, 270), (374, 404))
  let (A1, B1, C1, D1) = ((575, 404), (690, 404), (740, 185), (742, 404))
  poly(p, (A, B, C), close: true)
  seg(p, C, D)
  anglearc(p, A, B, C, 20)
  poly(p, (A1, B1))
  seg(p, A1, C1)
  seg(p, B1, C1)
  seg(p, B1, D1, stroke: dsh)
  seg(p, C1, D1, stroke: dsh)
  anglearc(p, A1, B1, C1, 20)
  lbl(p, C, $C$, dir: "n", d: 10)
  lbl(p, A, $A$, dir: "sw")
  lbl(p, D, $D$, dir: "s", d: 11)
  lbl(p, B, $B$, dir: "se")
  lbl(p, C1, $C'$, dir: "n", d: 10)
  lbl(p, A1, $A'$, dir: "sw")
  lbl(p, B1, $B'$, dir: "s", d: 11)
  lbl(p, D1, $D'$, dir: "s", d: 11)
})

// 图 3·25 ∠BAC + ∠B'A'C' = 180°；高 BD、B'D'（虚线）。∠BAC 与 ∠B'A'D' 各画双弧表示相等
#let fig-K-3-25(width: 650 * k) = px-canvas(650, 220, origin: (190, 1030), width: width, (p, u) => {
  import cetz.draw: *
  let (C, A, B, D) = ((211, 1216), (475, 1216), (300, 1043), (300, 1216))
  let (A1, B1, C1, D1) = ((673, 1216), (540, 1083), (823, 1213), (540, 1216))
  poly(p, (C, A, B), close: true)
  seg(p, B, D, stroke: dsh)
  anglearc(p, A, C, B, 14)
  anglearc(p, A, C, B, 19)
  seg(p, B1, A1)
  seg(p, B1, C1)
  seg(p, A1, C1)
  seg(p, D1, A1, stroke: dsh)
  seg(p, B1, D1, stroke: dsh)
  anglearc(p, A1, D1, B1, 14)
  anglearc(p, A1, D1, B1, 19)
  anglearc(p, A1, B1, C1, 25)
  lbl(p, B, $B$, dir: "n", d: 10)
  lbl(p, C, $C$, dir: "sw", d: 10)
  lbl(p, D, $D$, dir: "s", d: 11)
  lbl(p, A, $A$, dir: "se", d: 10)
  lbl(p, B1, $B'$, dir: "nw", d: 10)
  lbl(p, D1, $D'$, dir: "s", d: 11)
  lbl(p, A1, $A'$, dir: "s", d: 11)
  lbl(p, C1, $C'$, dir: "se", d: 11)
})

