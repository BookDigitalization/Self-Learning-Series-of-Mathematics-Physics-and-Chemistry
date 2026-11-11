// 图 5·13（原书 p.283）、图 5·14（p.284）、图 5·15（p.285）、图 5·16（p.286）；页面 120 dpi 坐标。
#import "O-base.typ": *

// 带间隙的线段：从 a 到 b，在比例 t1..t2 之间断开（放文字）
#let O-gap(p, a, b, t1, t2) = {
  let at(t) = (a.at(0) + (b.at(0) - a.at(0)) * t, a.at(1) + (b.at(1) - a.at(1)) * t)
  O-ln(p, a, at(t1))
  O-ln(p, at(t2), b)
}

// 图 5·13 圆内接正 6、12、24 边形的边 a 和边心距 r（按几何关系算出）
#let fig-O-5-13(width: 380 * k) = px-canvas(380, 370, origin: (500, 745), width: width, (p, u) => {
  import cetz.draw: *
  let O = (692, 929)
  let r = 169
  let A = O-pt(O, r, 240)
  let B = O-pt(O, r, 300)
  let C = O-pt(O, r, 270)
  let D = O-pt(O, r, 255)
  let mid(a, b) = ((a.at(0) + b.at(0)) / 2, (a.at(1) + b.at(1)) / 2)
  let M6 = mid(A, B)
  let M12 = mid(A, C)
  let M24 = mid(A, D)
  O-circ(p, O, r, st: lb)
  O-ln(p, A, B)
  O-ln(p, A, C)
  O-ln(p, A, D)
  O-ln(p, D, C)
  O-gap(p, O, M6, 0.5, 0.62)
  O-gap(p, O, M12, 0.37, 0.49)
  O-gap(p, O, M24, 0.5, 0.64)
  ring(p, O, r: 3)
  lbl(p, (693, 912), $O$, dir: "c", d: 0)
  lbl(p, A, $A$, dir: "w", d: 16)
  lbl(p, B, $B$, dir: "se", d: 13)
  lbl(p, C, $C$, dir: "se", d: 10)
  lbl(p, D, $D$, dir: "sw", d: 11)
  lbl(p, (728, 1057), $a_6$, dir: "c", d: 0)
  lbl(p, (692, 1078), $a_(12)$, dir: "c", d: 0)
  lbl(p, (617, 1087), $a_(24)$, dir: "c", d: 0)
  lbl(p, (693, 985), $r_6$, dir: "c", d: 0)
  lbl(p, (676, 997), $r_(12)$, dir: "c", d: 0)
  lbl(p, (654, 1017), $r_(24)$, dir: "c", d: 0)
})

// 图 5·14 圆形铁片，中间挖去一个小圆片（阴影部分）
#let fig-O-5-14(width: 240 * k) = px-canvas(240, 235, origin: (615, 935), width: width, (p, u) => {
  import cetz.draw: *
  let O = (735, 1053)
  let (R1, R2) = (109, 74)
  O-circ(p, O, R1, st: lb)
  O-circ(p, O, R2, st: lb)
  O-hatch(p, (x, y) => {
    let d2 = calc.pow(x - O.at(0), 2) + calc.pow(y - O.at(1), 2)
    d2 < R1 * R1 and d2 > R2 * R2
  }, (620, 940, 850, 1166), 8, 7.5)
  ring(p, O, r: 2.5)
  lbl(p, (746, 1056), $O$, dir: "c", d: 0)
})

// 图 5·15 正十边形 A₁…A₁₀ 及其边心距 OM
#let fig-O-5-15(width: 335 * k) = px-canvas(335, 315, origin: (565, 500), width: width, (p, u) => {
  import cetz.draw: *
  let O = (729, 656)
  let r = 132
  let vs = range(10).map(i => O-pt(O, r, -108 + 36 * i))
  let M = (729, vs.at(0).at(1))
  O-circ(p, O, r)
  O-poly(p, vs, st: lb, close: true)
  O-ln(p, O, vs.at(0))
  O-ln(p, O, vs.at(1))
  O-ln(p, O, M)
  ring(p, O, r: 3)
  for i in range(10) {
    let q = O-pt(O, r + 17, -108 + 36 * i)
    lbl(p, q, [$A_#(i + 1)$], dir: "c", d: 0)
  }
  lbl(p, M, $M$, dir: "s", d: 13)
  lbl(p, (729, 640), $O$, dir: "c", d: 0)
  lbl(p, (700, 722), $R$, dir: "c", d: 0)
  lbl(p, (763, 718), $R$, dir: "c", d: 0)
})

// 图 5·16 周长都是 a 的圆、正三角形、正方形、正六边形
#let fig-O-5-16(width: 730 * k) = px-canvas(730, 220, origin: (110, 235), width: width, (p, u) => {
  import cetz.draw: *
  let y0 = 420
  // 圆
  O-circ(p, (204, 339), 80, st: lb)
  pdot(p, (204, 339), r: 2.5)
  lbl(p, (193, 345), $O$, dir: "c", d: 0)
  lbl(p, (208, 440), $r = display(a / (2 π))$, dir: "c", d: 0)
  // 正三角形
  let A1 = (287.5, y0)
  let A2 = (453.2, y0)
  let A3 = (370.4, y0 - 143.5)
  O-poly(p, (A1, A2, A3), st: lb, close: true)
  lbl(p, A3, $A_3$, dir: "n", d: 11)
  lbl(p, A1, $A_1$, dir: "w", d: 10)
  lbl(p, A2, $A_2$, dir: "e", d: 12)
  lbl(p, (370, 440), $a_3 = display(a / 3)$, dir: "c", d: 0)
  // 正方形
  let B1 = (496, y0)
  let B2 = (620, y0)
  let B3 = (620, y0 - 124)
  let B4 = (496, y0 - 124)
  O-poly(p, (B1, B2, B3, B4), st: lb, close: true)
  lbl(p, B4, $B_4$, dir: "nw", d: 10)
  lbl(p, B3, $B_3$, dir: "ne", d: 10)
  lbl(p, B1, $B_1$, dir: "sw", d: 10)
  lbl(p, B2, $B_2$, dir: "se", d: 10)
  lbl(p, (553, 440), $b_4 = display(a / 4)$, dir: "c", d: 0)
  // 正六边形
  let C1 = (699.5, y0)
  let C2 = (782.5, y0)
  let C3 = (824, y0 - 71.9)
  let C4 = (782.5, y0 - 143.8)
  let C5 = (699.5, y0 - 143.8)
  let C6 = (658, y0 - 71.9)
  O-poly(p, (C1, C2, C3, C4, C5, C6), st: lb, close: true)
  lbl(p, C5, $C_5$, dir: "nw", d: 10)
  lbl(p, C4, $C_4$, dir: "ne", d: 10)
  lbl(p, C3, $C_3$, dir: "e", d: 12)
  lbl(p, C6, $C_6$, dir: "w", d: 12)
  lbl(p, C1, $C_1$, dir: "sw", d: 10)
  lbl(p, C2, $C_2$, dir: "se", d: 10)
  lbl(p, (734, 440), $c_6 = display(a / 6)$, dir: "c", d: 0)
  // 线段 a
  pseg(p, (288, 250), (784, 250), s: 5)
  lbl(p, (536, 240), $a$, dir: "c", d: 0)
})
