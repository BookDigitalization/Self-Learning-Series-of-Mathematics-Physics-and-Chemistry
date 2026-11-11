// 图 4·9（原书 p.230）、图 4·10、图 4·11（p.232）；页面 120 dpi 坐标。
#import "M-base.typ": *

// 图 4·9：正五边形 ABCDE 及外接圆 O。DC、AB 各 2 道短横，OC、OB 各 1 道
#let fig-M-4-9(width: 340 * k) = px-canvas(340, 360, origin: (540, 900), width: width, (p, u) => {
  import cetz.draw: *
  let O = (700, 1064)
  let R = 140
  let (D, E, A, B, C) = M-ngon(O, R, 5, 90)
  circ(p, O, R)
  poly(p, (E, A, B, C, D), close: true)
  dseg(p, O, D)
  dseg(p, O, C)
  dseg(p, O, B)
  dseg(p, O, A)
  ticks(p, D, C, 2)
  ticks(p, A, B, 2)
  ticks(p, O, C, 1)
  ticks(p, O, B, 1)
  anglearc(p, B, A, C, 15)
  anglearc(p, B, A, C, 19)
  anglearc(p, C, B, D, 15)
  anglearc(p, C, B, D, 19)
  ring(p, O, r: 2.5)
  lbl(p, D, $D$, dir: "n")
  lbl(p, E, $E$, dir: "w")
  lbl(p, A, $A$, dir: "sw")
  lbl(p, B, $B$, dir: "se")
  lbl(p, C, $C$, dir: "e")
  lbl(p, O, $O$, dir: "w", d: 11)
})

// 图 4·10：正六边形 ABCDEF 的外接圆、内切圆，半径 OA…OF，边心距 OL、OM、ON、OP、OQ、OR
#let fig-M-4-10(width: 290 * k) = px-canvas(290, 300, origin: (555, 300), width: width, (p, u) => {
  import cetz.draw: *
  let O = (700, 446)
  let R = 117
  let r = R * calc.cos(30deg)
  let (C, D, E, F, A, B) = M-ngon(O, R, 6, 0)
  let (N, P, Q, Rr, L, M) = range(6).map(i => M-pt(O, r, 30 + 60 * i))
  circ(p, O, R)
  circ(p, O, r)
  poly(p, (A, B, C, D, E, F), close: true)
  for v in (A, B, C, D, E, F) { seg(p, O, v) }
  for m in (L, M, N, P, Q, Rr) { seg(p, O, m) }
  anglearc(p, O, A, B, 14)
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

// 图 4·11：正三、四、五、六边形的对称轴（虚线）
#let M-axes(p, c, R, n, a0) = {
  import cetz.draw: *
  let ext = 1.45 * R
  if calc.rem(n, 2) == 1 {
    for i in range(n) {
      let a = a0 + 360 / n * i
      dseg(p, M-pt(c, ext, a), M-pt(c, ext, a + 180))
    }
  } else {
    for i in range(n) {
      let a = a0 + 180 / n * i
      dseg(p, M-pt(c, ext, a), M-pt(c, ext, a + 180))
    }
    for i in range(calc.quo(n, 2)) {
      let a = a0 + 360 / n * i
      M-line(p, M-pt(c, R, a), M-pt(c, R, a + 180), lt)
    }
  }
  line(..M-ngon(c, R, n, a0).map(t => p(..t)), close: true, stroke: lb)
  pdot(p, c, r: 1.3)
}
#let fig-M-4-11(width: 730 * k) = px-canvas(730, 240, origin: (130, 1065), width: width, (p, u) => {
  import cetz.draw: *
  M-axes(p, (243, 1176), 65, 3, 90)
  M-axes(p, (413, 1168), 71, 4, 45)
  M-axes(p, (588, 1168), 65, 5, 90)
  M-axes(p, (759, 1167), 54, 6, 0)
  lbl(p, (260, 1280), $(1)$, dir: "c", d: 0)
  lbl(p, (418, 1280), $(2)$, dir: "c", d: 0)
  lbl(p, (578, 1280), $(3)$, dir: "c", d: 0)
  lbl(p, (737, 1280), $(4)$, dir: "c", d: 0)
})
