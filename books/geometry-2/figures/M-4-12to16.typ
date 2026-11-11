// 图 4·12、4·13（原书 p.235）、4·14（p.236）、4·15（p.237）、4·16（p.238）；页面 120 dpi 坐标。
#import "M-base.typ": *

// 图 4·12：正六边形 ABCDEF，半径 OA…OF，边心距 OL、OM、ON、OP、OQ、OR
#let fig-M-4-12(width: 330 * k) = px-canvas(330, 310, origin: (560, 190), width: width, (p, u) => {
  import cetz.draw: *
  let O = (725, 345)
  let R = 135
  let r = R * calc.cos(30deg)
  let (C, D, E, F, A, B) = M-ngon(O, R, 6, 0)
  let (N, P, Q, Rr, L, M) = range(6).map(i => M-pt(O, r, 30 + 60 * i))
  circ(p, O, R)
  poly(p, (A, B, C, D, E, F), close: true)
  for v in (A, B, C, D, E, F) { seg(p, O, v) }
  for m in (L, M, N, P, Q, Rr) { seg(p, O, m) }
  lbl(p, C, $C$, dir: "e", d: 10)
  lbl(p, D, $D$, dir: "ne")
  lbl(p, E, $E$, dir: "nw")
  lbl(p, F, $F$, dir: "w", d: 10)
  lbl(p, A, $A$, dir: "sw")
  lbl(p, B, $B$, dir: "se")
  M-wlbl(p, (O.at(0) + 9, O.at(1) + 1), $O$)
  lbl(p, P, $P$, dir: "se", d: 11)
  lbl(p, N, $N$, dir: "sw", d: 12)
  lbl(p, Q, $Q$, dir: "e", d: 14)
  lbl(p, Rr, $R$, dir: "ne", d: 12)
  lbl(p, L, $L$, dir: "nw", d: 11)
  lbl(p, M, $M$, dir: "w", d: 15)
})

// 图 4·13：圆 O 的弦 AB，OL ⊥ AB，边心距 r
#let fig-M-4-13(width: 240 * k) = px-canvas(240, 230, origin: (640, 1020), width: width, (p, u) => {
  import cetz.draw: *
  let O = (753, 1135)
  let R = 100
  let h = 48
  let yy = O.at(1) + calc.sqrt(R * R - h * h)
  let (A, B, L) = ((O.at(0) - h, yy), (O.at(0) + h, yy), (O.at(0), yy))
  circ(p, O, R)
  seg(p, A, B)
  seg(p, O, A)
  seg(p, O, B)
  seg(p, O, L)
  ring(p, O, r: 2.5)
  lbl(p, O, $O$, dir: "n", d: 11)
  lbl(p, A, $A$, dir: "sw")
  lbl(p, B, $B$, dir: "se")
  lbl(p, L, $L$, dir: "nw", d: 11)
  lbl(p, M-at(O, L, 0.5), $r$, dir: "e", d: 9)
})

// 图 4·14：圆内接正三角形 ABC，直角三角形 OLB
#let fig-M-4-14(width: 240 * k) = px-canvas(240, 235, origin: (600, 1000), width: width, (p, u) => {
  import cetz.draw: *
  let O = (720, 1115)
  let R = 100
  let (C, A, B) = M-ngon(O, R, 3, 90)
  let L = (O.at(0), A.at(1))
  circ(p, O, R)
  poly(p, (A, B, C), close: true)
  seg(p, O, B)
  seg(p, O, L)
  anglearc(p, O, L, B, 20)
  rtmark(p, L, O, B, s: 7)
  ring(p, O, r: 2.5)
  lbl(p, C, $C$, dir: "n")
  lbl(p, A, $A$, dir: "sw")
  lbl(p, B, $B$, dir: "se")
  lbl(p, L, $L$, dir: "s", d: 10)
  lbl(p, O, $O$, dir: "nw", d: 10)
  lbl(p, M-at(O, B, 0.55), $R$, dir: "ne", d: 10)
  lbl(p, (O.at(0) + 21, O.at(1) + 38), $60°$, dir: "c", d: 0)
})

// 图 4·15：圆内接正方形 ABCD，直角三角形 OLB
#let fig-M-4-15(width: 240 * k) = px-canvas(240, 250, origin: (640, 960), width: width, (p, u) => {
  import cetz.draw: *
  let O = (759, 1080)
  let R = 101
  let (B, C, D, A) = M-ngon(O, R, 4, -45)
  let L = (O.at(0), A.at(1))
  circ(p, O, R)
  poly(p, (A, B, C, D), close: true)
  seg(p, O, B)
  seg(p, O, L)
  anglearc(p, O, L, B, 20)
  rtmark(p, L, O, B, s: 7)
  ring(p, O, r: 2.5)
  lbl(p, D, $D$, dir: "nw")
  lbl(p, C, $C$, dir: "ne")
  lbl(p, A, $A$, dir: "sw")
  lbl(p, B, $B$, dir: "se")
  lbl(p, L, $L$, dir: "s", d: 10)
  lbl(p, O, $O$, dir: "nw", d: 10)
  lbl(p, M-at(O, B, 0.6), $R$, dir: "ne", d: 10)
  lbl(p, (O.at(0) + 11, O.at(1) + 45), $45°$, dir: "c", d: 0)
})

// 图 4·16：圆内接正六边形 ABCDEF，OL 为边心距（虚线），OB 为半径，30°
#let fig-M-4-16(width: 330 * k) = px-canvas(330, 320, origin: (510, 790), width: width, (p, u) => {
  import cetz.draw: *
  let O = (670, 944)
  let R = 138
  let (C, D, E, F, A, B) = M-ngon(O, R, 6, 0)
  let L = (O.at(0), A.at(1))
  circ(p, O, R)
  poly(p, (A, B, C, D, E, F), close: true)
  seg(p, O, B)
  dseg(p, O, L)
  anglearc(p, O, L, B, 22)
  ring(p, O, r: 2.5)
  lbl(p, E, $E$, dir: "n")
  lbl(p, D, $D$, dir: "ne")
  lbl(p, C, $C$, dir: "e", d: 10)
  lbl(p, F, $F$, dir: "w", d: 10)
  lbl(p, A, $A$, dir: "sw")
  lbl(p, B, $B$, dir: "se")
  lbl(p, L, $L$, dir: "se", d: 10)
  lbl(p, O, $O$, dir: "nw", d: 10)
  lbl(p, M-at(O, B, 0.55), $R$, dir: "ne", d: 10)
  lbl(p, (O.at(0) + 28, O.at(1) + 6), $30°$, dir: "c", d: 0)
})
