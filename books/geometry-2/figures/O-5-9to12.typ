// 图 5·9、图 5·10（原书 p.279）、图 5·11、图 5·12（p.281）；页面 120 dpi 坐标。
#import "O-base.typ": *

// 图 5·9 1° 的角（原图两条半径夹角画得较大以便看清，这里照原样）
#let fig-O-5-9(width: 265 * k) = px-canvas(265, 275, origin: (180, 250), width: width, (p, u) => {
  import cetz.draw: *
  let O = (312, 387)
  let r = 125
  O-circ(p, O, r, st: lb)
  O-ln(p, O, O-pt(O, r, 1.9), st: lb)
  O-ln(p, O, O-pt(O, r, -1.9), st: lb)
  O-arc(p, O, 24, -42, 42)
  ring(p, O, r: 3)
  lbl(p, (352, 372), $1°$, dir: "c", d: 0)
  lbl(p, (297, 388), $O$, dir: "c", d: 0)
})

// 图 5·10 1 弧度的角：AB = R
#let fig-O-5-10(width: 290 * k) = px-canvas(290, 270, origin: (570, 255), width: width, (p, u) => {
  import cetz.draw: *
  let O = (702, 390)
  let r = 125
  let a = 28.65
  let A = O-pt(O, r, -a)
  let B = O-pt(O, r, a)
  O-circ(p, O, r, st: lb)
  O-ln(p, O, A, st: lb)
  O-ln(p, O, B, st: lb)
  anglearc(p, O, A, B, 22)
  let mk = (fill: black, scale: 0.45)
  O-arc(p, O, 140, 9, a, st: lt, mark: (end: "stealth", ..mk))
  O-arc(p, O, 140, -a, -9, st: lt, mark: (start: "stealth", ..mk))
  for t in (a, -a) {
    O-ln(p, O-pt(O, 133, t), O-pt(O, 147, t), st: lt)
  }
  ring(p, O, r: 3)
  lbl(p, (757, 390), [1 弧度], dir: "c", d: 0)
  lbl(p, (842, 382), $R$, dir: "c", d: 0)
  lbl(p, (690, 391), $O$, dir: "c", d: 0)
  lbl(p, (818, 313), $B$, dir: "c", d: 0)
  lbl(p, (820, 463), $A$, dir: "c", d: 0)
})

// 图 5·11 弧长公式 l = αR（原图 α 画成大于平角；弧长尺寸线标“2R”，照原图）
#let fig-O-5-11(width: 300 * k) = px-canvas(300, 300, origin: (190, 570), width: width, (p, u) => {
  import cetz.draw: *
  let O = (338, 719)
  let r = 126
  let B = O-pt(O, r, 191)
  let A = O-pt(O, r, -14)
  O-circ(p, O, r, st: lb)
  O-ln(p, O, A, st: lb)
  O-ln(p, O, B, st: lb)
  O-arc(p, O, 21, -10, 190)
  let mk = (fill: black, scale: 0.45)
  O-arc(p, O, 137, -14, 75, st: lt, mark: (start: "stealth", ..mk))
  O-arc(p, O, 137, 96, 191, st: lt, mark: (end: "stealth", ..mk))
  ring(p, O, r: 3)
  lbl(p, (348, 583), $2 R$, dir: "c", d: 0)
  lbl(p, (267, 723), $R$, dir: "c", d: 0)
  lbl(p, (413, 727), $R$, dir: "c", d: 0)
  lbl(p, (336, 688), $α$, dir: "c", d: 0)
  lbl(p, (337, 734), $O$, dir: "c", d: 0)
  lbl(p, (206, 756), $B$, dir: "c", d: 0)
  lbl(p, (466, 767), $A$, dir: "c", d: 0)
})

// 图 5·12 弦 AB = R，OA = OB = R（按题设画成正三角形）
#let fig-O-5-12(width: 290 * k) = px-canvas(290, 285, origin: (580, 570), width: width, (p, u) => {
  import cetz.draw: *
  let O = (718, 719)
  let r = 125
  let A = O-pt(O, r, 240)
  let B = O-pt(O, r, 300)
  O-circ(p, O, r, st: lb)
  O-ln(p, A, B, st: lb)
  dseg(p, O, A)
  dseg(p, O, B)
  anglearc(p, O, A, B, 18)
  ring(p, O, r: 3)
  lbl(p, O, $O$, dir: "n", d: 14)
  lbl(p, (673, 768), $R$, dir: "c", d: 0)
  lbl(p, (720, 813), $R$, dir: "c", d: 0)
  lbl(p, A, $A$, dir: "sw", d: 11)
  lbl(p, B, $B$, dir: "se", d: 11)
})
