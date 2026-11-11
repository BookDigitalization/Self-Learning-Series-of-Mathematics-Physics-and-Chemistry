// 图 1·15、1·16（原书 p.24）、图 1·17、1·18（p.26）、图 1·19（p.27）、图 1·20（p.28）；页面 120 dpi 坐标。
// p.24、p.26 原图上有读者的手写涂画（边上的“3”、小记号等），不属于原图，未画。
#import "B-base.typ": *

// 图 1·15 例 2：DE ∥ BC，DF ∥ AC
#let fig-B-1-15(width: 380 * k) = px-canvas(380, 190, origin: (480, 245), width: width, (p, u) => {
  import cetz.draw: *
  let A = (742, 258)
  let B = (492, 399)
  let C = (831, 399)
  let D = B-lerp(A, B, 0.596)
  let E = B-lerp(A, C, 0.596)
  let F = (B.at(0) + (C.at(0) - B.at(0)) * 0.404, 399)
  poly(p, (A, B, C), close: true)
  seg(p, D, E)
  seg(p, D, F)
  lbl(p, A, $A$, dir: "n", d: 12)
  lbl(p, D, $D$, dir: "nw", d: 11)
  lbl(p, E, $E$, dir: "e", d: 12)
  lbl(p, F, $F$, dir: "s", d: 12)
  lbl(p, B, $B$, dir: "w", d: 11)
  lbl(p, C, $C$, dir: "e", d: 11)
})

// 图 1·16 逆定理：过 D 作 DE' ∥ BC（虚线）
#let fig-B-1-16(width: 380 * k) = px-canvas(380, 225, origin: (490, 975), width: width, (p, u) => {
  import cetz.draw: *
  let A = (726, 986)
  let B = (501, 1180)
  let C = (835, 1180)
  let D = B-lerp(A, B, 0.567)
  let E = B-lerp(A, C, 0.567)
  let E1 = B-lerp(A, C, 0.49)
  poly(p, (A, B, C), close: true)
  seg(p, D, E)
  dseg(p, D, E1)
  lbl(p, A, $A$, dir: "n", d: 12)
  lbl(p, D, $D$, dir: "nw", d: 11)
  lbl(p, E, $E$, dir: "e", d: 12)
  lbl(p, E1, $E'$, dir: "ne", d: 11)
  lbl(p, B, $B$, dir: "w", d: 11)
  lbl(p, C, $C$, dir: "e", d: 11)
})

// 图 1·17 逆定理的推论
#let fig-B-1-17(width: 340 * k) = px-canvas(340, 250, origin: (515, 305), width: width, (p, u) => {
  import cetz.draw: *
  let A = (727, 321)
  let B = (535, 538)
  let C = (816, 538)
  let D = B-lerp(A, B, 0.477)
  let E = B-lerp(A, C, 0.477)
  poly(p, (A, B, C), close: true)
  seg(p, D, E)
  lbl(p, A, $A$, dir: "n", d: 12)
  lbl(p, D, $D$, dir: "nw", d: 11)
  lbl(p, E, $E$, dir: "ne", d: 11)
  lbl(p, B, $B$, dir: "w", d: 11)
  lbl(p, C, $C$, dir: "e", d: 11)
})

// 图 1·18 例 3：AB' = 3AB，AC' = 3AC
#let fig-B-1-18(width: 340 * k) = px-canvas(340, 190, origin: (520, 955), width: width, (p, u) => {
  import cetz.draw: *
  let A = (639, 966)
  let B1 = (546, 1122)
  let C1 = (827, 1122)
  let B = B-lerp(A, B1, 1 / 3)
  let C = B-lerp(A, C1, 1 / 3)
  poly(p, (A, B1, C1), close: true)
  seg(p, B, C)
  lbl(p, A, $A$, dir: "n", d: 12)
  lbl(p, B, $B$, dir: "nw", d: 11)
  lbl(p, C, $C$, dir: "ne", d: 11)
  lbl(p, B1, $B'$, dir: "sw", d: 11)
  lbl(p, C1, $C'$, dir: "se", d: 11)
})

// 图 1·19 例 4：AB ∥ DE，BC ∥ EF，证 AF ∥ CD
#let fig-B-1-19(width: 410 * k) = px-canvas(410, 240, origin: (455, 455), width: width, (p, u) => {
  import cetz.draw: *
  let O = (477, 646)
  let A = (540, 604)
  let C = (576, 581)
  let E = (640, 539)
  let B = (607, 649.5)
  let F = (692, 652)
  let D = (822, 655.5)
  seg(p, O, (754, 464))
  seg(p, O, (842, 657))
  seg(p, A, B)
  seg(p, A, F)
  seg(p, C, B)
  seg(p, C, D)
  seg(p, E, F)
  seg(p, E, D)
  lbl(p, O, $O$, dir: "w", d: 11)
  lbl(p, A, $A$, dir: "nw", d: 11)
  lbl(p, C, $C$, dir: "nw", d: 11)
  lbl(p, E, $E$, dir: "nw", d: 11)
  lbl(p, B, $B$, dir: "s", d: 12)
  lbl(p, F, $F$, dir: "s", d: 12)
  lbl(p, D, $D$, dir: "s", d: 12)
})

// 图 1·20 平行线截得比例线段定理 2
#let fig-B-1-20(width: 380 * k) = px-canvas(380, 275, origin: (490, 430), width: width, (p, u) => {
  import cetz.draw: *
  let xat(a, b, y) = a.at(0) + (y - a.at(1)) * (b.at(0) - a.at(0)) / (b.at(1) - a.at(1))
  let (a0, a1) = ((607, 447), (526, 692))
  let (b0, b1) = ((737, 454), (824, 686))
  let (c0, c1) = ((587, 510), (652, 692))
  let (y1, y2, y3) = (510, 570, 651)
  for y in (y1, y2, y3) {
    seg(p, (507, y), (855, y))
  }
  seg(p, a0, a1)
  seg(p, b0, b1)
  dseg(p, c0, c1)
  let A1 = (xat(a0, a1, y1), y1)
  let A2 = (xat(a0, a1, y2), y2)
  let A3 = (xat(a0, a1, y3), y3)
  let B1 = (xat(b0, b1, y1), y1)
  let B2 = (xat(b0, b1, y2), y2)
  let B3 = (xat(b0, b1, y3), y3)
  let C2 = (xat(c0, c1, y2), y2)
  let C3 = (xat(c0, c1, y3), y3)
  lbl(p, A1, $A_1$, dir: "nw", d: 12)
  lbl(p, A2, $A_2$, dir: "nw", d: 12)
  lbl(p, A3, $A_3$, dir: "nw", d: 12)
  lbl(p, B1, $B_1$, dir: "ne", d: 12)
  lbl(p, B2, $B_2$, dir: "ne", d: 12)
  lbl(p, B3, $B_3$, dir: "ne", d: 12)
  lbl(p, C2, $B'_2$, dir: "ne", d: 12)
  lbl(p, C3, $B'_3$, dir: "ne", d: 12)
  lbl(p, (497, y1 + 2), $l_1$, dir: "c", d: 0)
  lbl(p, (497, y2 + 2), $l_2$, dir: "c", d: 0)
  lbl(p, (497, y3 + 2), $l_3$, dir: "c", d: 0)
  lbl(p, (606, 438), $a$, dir: "c", d: 0)
  lbl(p, (737, 443), $b$, dir: "c", d: 0)
})
