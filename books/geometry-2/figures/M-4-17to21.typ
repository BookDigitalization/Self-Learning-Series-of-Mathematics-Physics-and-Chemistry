// 图 4·17（原书 p.239）、4·18（p.240）、4·19（p.242）、4·20（p.243）、4·21（p.244）；页面 120 dpi 坐标。
#import "M-base.typ": *

// 图 4·17：两个正六边形（及外接圆）
#let fig-M-4-17(width: 580 * k) = px-canvas(580, 320, origin: (255, 640), width: width, (p, u) => {
  import cetz.draw: *
  let O1 = (420, 798)
  let (C, D, E, F, A, B) = M-ngon(O1, 140, 6, 0)
  circ(p, O1, 140)
  poly(p, (A, B, C, D, E, F), close: true)
  lbl(p, C, $C$, dir: "e", d: 10)
  lbl(p, D, $D$, dir: "ne")
  lbl(p, E, $E$, dir: "nw")
  lbl(p, F, $F$, dir: "w", d: 10)
  lbl(p, A, $A$, dir: "sw")
  lbl(p, B, $B$, dir: "se")
  let O2 = (710, 812)
  let (C2, D2, E2, F2, A2, B2) = M-ngon(O2, 89, 6, 0)
  circ(p, O2, 89)
  poly(p, (A2, B2, C2, D2, E2, F2), close: true)
  lbl(p, C2, $C'$, dir: "e", d: 11)
  lbl(p, D2, $D'$, dir: "ne")
  lbl(p, E2, $E'$, dir: "nw")
  lbl(p, F2, $F'$, dir: "w", d: 11)
  lbl(p, A2, $A'$, dir: "sw")
  lbl(p, B2, $B'$, dir: "se")
})

// 图 4·18：圆 O 的内接弦 AB 与外切线 A'B'（O A A'、O B B' 共线）
#let fig-M-4-18(width: 260 * k) = px-canvas(260, 270, origin: (590, 990), width: width, (p, u) => {
  import cetz.draw: *
  let O = (720, 1110)
  let R = 110
  let h = 48
  let yy = O.at(1) + calc.sqrt(R * R - h * h)
  let (A, B, M) = ((O.at(0) - h, yy), (O.at(0) + h, yy), (O.at(0), yy))
  let yt = O.at(1) + R
  let t = R * h / (yy - O.at(1))
  let (A1, B1, M1) = ((O.at(0) - t, yt), (O.at(0) + t, yt), (O.at(0), yt))
  circ(p, O, R)
  seg(p, O, A1)
  seg(p, O, B1)
  seg(p, O, M1)
  seg(p, A, B)
  seg(p, A1, B1)
  ring(p, O, r: 3)
  lbl(p, O, $O$, dir: "n", d: 11)
  lbl(p, A, $A$, dir: "nw", d: 16)
  lbl(p, B, $B$, dir: "ne", d: 16)
  lbl(p, M, $M$, dir: "ne", d: 16)
  lbl(p, A1, $A'$, dir: "sw", d: 10)
  lbl(p, B1, $B'$, dir: "se", d: 10)
  lbl(p, M1, $M'$, dir: "s", d: 10)
})

// 图 4·19：倍边公式的推导。AB = a_n，C 为弧 AB 的中点，OC ⊥ AB 于 D
#let fig-M-4-19(width: 320 * k) = px-canvas(320, 340, origin: (520, 180), width: width, (p, u) => {
  import cetz.draw: *
  let O = (680, 342)
  let R = 139.4
  let (A, B, D) = ((609, 462), (751, 462), (680, 462))
  let C = (680, 342 + R)
  circ(p, O, R)
  seg(p, A, B)
  seg(p, A, C)
  seg(p, B, C)
  dseg(p, O, A)
  dseg(p, O, C)
  ring(p, O, r: 2.5)
  lbl(p, O, $O$, dir: "n", d: 11)
  lbl(p, A, $A$, dir: "nw", d: 15)
  lbl(p, B, $B$, dir: "ne", d: 15)
  lbl(p, D, $D$, dir: "ne", d: 14)
  lbl(p, C, $C$, dir: "s", d: 10)
})

// 图 4·20：圆 O 的内接正四边形 ABCD 和正八边形 AEBFCGDH，OA、OM（M 为 AE 中点）
#let fig-M-4-20(width: 380 * k) = px-canvas(380, 370, origin: (500, 190), width: width, (p, u) => {
  import cetz.draw: *
  let O = (693, 375)
  let R = 155
  let o8 = M-ngon(O, R, 8, -90)   // A E B F C G D H
  let (A, E, B, F, C, G, D, H) = o8
  let M = M-mid(A, E)
  circ(p, O, R)
  poly(p, o8, close: true)
  poly(p, (A, B, C, D), close: true)
  seg(p, O, A)
  seg(p, O, M)
  ring(p, O, r: 2.5)
  lbl(p, O, $O$, dir: "n", d: 11)
  lbl(p, C, $C$, dir: "n", d: 10)
  lbl(p, G, $G$, dir: "nw")
  lbl(p, F, $F$, dir: "ne")
  lbl(p, B, $B$, dir: "e", d: 10)
  lbl(p, D, $D$, dir: "w", d: 11)
  lbl(p, H, $H$, dir: "sw")
  lbl(p, E, $E$, dir: "se")
  lbl(p, A, $A$, dir: "s", d: 10)
  lbl(p, M, $M$, dir: "ne", d: 10)
})

// 图 4·21：圆 O 的内接正六边形 ABCDEF 和正十二边形 AGBHCIDJEKFL
#let fig-M-4-21(width: 360 * k) = px-canvas(360, 380, origin: (480, 445), width: width, (p, u) => {
  import cetz.draw: *
  let O = (655, 625)
  let R = 155
  let d12 = M-ngon(O, R, 12, 0)   // C I D J E K F L A G B H（每 30°）
  let (C, I, D, J, E, K, F, L, A, G, B, H) = d12
  circ(p, O, R)
  poly(p, d12, close: true)
  line(..(A, B, C, D, E, F).map(t => p(..t)), close: true, stroke: lb)
  ring(p, O, r: 3)
  lbl(p, J, $J$, dir: "n", d: 10)
  lbl(p, E, $E$, dir: "nw")
  lbl(p, D, $D$, dir: "ne")
  lbl(p, K, $K$, dir: "nw")
  lbl(p, I, $I$, dir: "ne")
  lbl(p, F, $F$, dir: "w", d: 10)
  lbl(p, C, $C$, dir: "e", d: 10)
  lbl(p, L, $L$, dir: "sw")
  lbl(p, H, $H$, dir: "se")
  lbl(p, A, $A$, dir: "sw")
  lbl(p, B, $B$, dir: "se")
  lbl(p, G, $G$, dir: "s", d: 10)
  lbl(p, O, $O$, dir: "n", d: 11)
})
