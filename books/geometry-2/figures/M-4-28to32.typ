// 图 4·28（原书 p.252）、4·29（p.253）、4·30（p.254）、4·31（p.255）、4·32（p.256）；页面 120 dpi 坐标。
#import "M-base.typ": *

// 图 4·28：正十边形 A1…A10 及作法的辅助线（B、C、M）
#let fig-M-4-28(width: 370 * k) = px-canvas(370, 380, origin: (490, 165), width: width, (p, u) => {
  import cetz.draw: *
  let O = (671, 353)
  let R = 157
  let V = range(10).map(i => M-pt(O, R, 270 + 36 * i))
  let (A1, A2, A3, A4, A5, A6, A7, A8, A9, A10) = V
  let B = (A1.at(0) - R / 2, A1.at(1))
  let ob = M-dist(O, B)
  let C = M-at(B, O, (R / 2) / ob)
  let om = ob - R / 2
  let M = M-at(O, A1, om / R)
  circ(p, O, R)
  line(..V.map(t => p(..t)), close: true, stroke: lb)
  dseg(p, O, A1)
  dseg(p, O, A2)
  dseg(p, M, A2)
  dseg(p, B, A1)
  dseg(p, B, O)
  M-arc(p, B, A1, C, stroke: dsh)
  M-arc(p, O, C, M, stroke: dsh)
  ring(p, O, r: 2.5)
  lbl(p, O, $O$, dir: "n", d: 11)
  lbl(p, A6, $A_6$, dir: "n", d: 10)
  lbl(p, A5, $A_5$, dir: "ne", d: 9)
  lbl(p, A4, $A_4$, dir: "ne", d: 9)
  lbl(p, A3, $A_3$, dir: "e", d: 11)
  lbl(p, A2, $A_2$, dir: "se", d: 10)
  lbl(p, A1, $A_1$, dir: "se", d: 10)
  lbl(p, A10, $A_(10)$, dir: "sw", d: 12)
  lbl(p, A9, $A_9$, dir: "w", d: 12)
  lbl(p, A8, $A_8$, dir: "nw", d: 12)
  lbl(p, A7, $A_7$, dir: "nw", d: 10)
  lbl(p, B, $B$, dir: "sw", d: 10)
  lbl(p, C, $C$, dir: "nw", d: 10)
  lbl(p, M, $M$, dir: "ne", d: 10)
})

// 图 4·29：正五边形 A1A3A5A7A9（A2、A4、A6、A8、A10 为十等分点，短横记号）
#let fig-M-4-29(width: 360 * k) = px-canvas(360, 370, origin: (520, 895), width: width, (p, u) => {
  import cetz.draw: *
  let O = (700, 1070)
  let R = 156
  let V = range(10).map(i => M-pt(O, R, 234 + 36 * i))
  let (A1, A2, A3, A4, A5, A6, A7, A8, A9, A10) = V
  circ(p, O, R)
  line(..(A1, A3, A5, A7, A9).map(t => p(..t)), close: true, stroke: lb)
  for a in (A2, A4, A6, A8, A10) { M-radtick(p, O, a, s: 5) }
  ring(p, O, r: 2.5)
  lbl(p, O, $O$, dir: "n", d: 11)
  lbl(p, A7, $A_7$, dir: "n", d: 10)
  lbl(p, A6, $A_6$, dir: "ne", d: 10)
  lbl(p, A5, $A_5$, dir: "e", d: 12)
  lbl(p, A4, $A_4$, dir: "e", d: 14)
  lbl(p, A3, $A_3$, dir: "se", d: 10)
  lbl(p, A2, $A_2$, dir: "s", d: 11)
  lbl(p, A1, $A_1$, dir: "sw", d: 10)
  lbl(p, A10, $A_(10)$, dir: "w", d: 16)
  lbl(p, A9, $A_9$, dir: "w", d: 12)
  lbl(p, A8, $A_8$, dir: "nw", d: 10)
})

// 图 4·30：圆内接正方形和正八边形
#let fig-M-4-30(width: 350 * k) = px-canvas(350, 350, origin: (520, 820), width: width, (p, u) => {
  import cetz.draw: *
  let O = (692, 990)
  let R = 155
  circ(p, O, R)
  line(..M-ngon(O, R, 8, 0).map(t => p(..t)), close: true, stroke: lb)
  line(..M-ngon(O, R, 4, 0).map(t => p(..t)), close: true, stroke: lb)
  ring(p, O, r: 3)
})

// 图 4·31：已知边心距 r 作正八边形。A1…A8，OA1、OA2、OM 及另两条边心距为虚线，线段 r
#let fig-M-4-31(width: 380 * k) = px-canvas(380, 385, origin: (500, 505), width: width, (p, u) => {
  import cetz.draw: *
  let O = (686, 711)
  let R = 155.7
  let (A1, A2, A3, A4, A5, A6, A7, A8) = range(8).map(i => M-pt(O, R, 270 + 45 * i))
  let r = R * calc.cos(22.5deg)
  let M = M-mid(A1, A2)
  circ(p, O, R)
  line(..(A1, A2, A3, A4, A5, A6, A7, A8).map(t => p(..t)), close: true, stroke: lb)
  dseg(p, O, A1)
  dseg(p, O, A2)
  dseg(p, O, M)
  dseg(p, O, M-mid(A8, A1))
  dseg(p, O, M-mid(A7, A8))
  anglearc(p, O, A1, M, 24)
  pseg(p, (O.at(0) - r, 534), (O.at(0), 534), s: 5)
  ring(p, O, r: 3)
  lbl(p, (O.at(0) - r / 2, 523), $r$, dir: "c", d: 0)
  lbl(p, O, $O$, dir: "n", d: 11)
  lbl(p, (O.at(0) + 59, O.at(1) + 9), $22.5°$, dir: "c", d: 0)
  lbl(p, A5, $A_5$, dir: "ne", d: 9)
  lbl(p, A4, $A_4$, dir: "ne", d: 10)
  lbl(p, A3, $A_3$, dir: "e", d: 12)
  lbl(p, A2, $A_2$, dir: "se", d: 10)
  lbl(p, A1, $A_1$, dir: "s", d: 11)
  lbl(p, A8, $A_8$, dir: "sw", d: 10)
  lbl(p, A7, $A_7$, dir: "w", d: 12)
  lbl(p, A6, $A_6$, dir: "nw", d: 10)
  lbl(p, M, $M$, dir: "ne", d: 10)
})

// 图 4·32：已知对角线 d 作正五边形（位似）。小圆 O 内接正五边形 A1A2'A3'A4'A5'，大五边形 A1A2A3A4A5
#let fig-M-4-32(width: 350 * k) = px-canvas(350, 335, origin: (510, 185), width: width, (p, u) => {
  import cetz.draw: *
  let O = (669, 409)
  let R = 102
  let (A4s, A5s, A1, A2s, A3s) = M-ngon(O, R, 5, 90)
  let lam = 1.27
  let big(q) = (A1.at(0) + lam * (q.at(0) - A1.at(0)), A1.at(1) + lam * (q.at(1) - A1.at(1)))
  let (A2, A3, A4, A5) = (big(A2s), big(A3s), big(A4s), big(A5s))
  circle(p(..O), radius: R, stroke: lb)
  line(p(..A1), p(..A2), p(..A3), p(..A4), p(..A5), p(..A1), stroke: lw)
  // 边的延长（虚线）和对角线（点划线）
  line(p(..A2), p(..M-at(A1, A2, 1.34)), stroke: dsh)
  line(p(..A5), p(..M-at(A1, A5, 1.28)), stroke: dsh)
  line(p(..A3), p(..M-at(A1, A3, 1.1)), stroke: dashdot)
  line(p(..A1), p(..A3s), stroke: dashdot)
  line(p(..A1), p(..M-at(A1, A4, 1.05)), stroke: dashdot)
  // 内五边形（虚线）
  line(p(..A2s), p(..A3s), p(..A4s), p(..A5s), stroke: dashb)
  pseg(p, (529, 206), (675, 206), s: 5)
  lbl(p, (602, 193), $d$, dir: "c", d: 0)
  ring(p, O, r: 3)
  lbl(p, O, $O$, dir: "n", d: 11)
  lbl(p, A1, $A_1$, dir: "sw", d: 10)
  lbl(p, A2, $A_2$, dir: "se", d: 10)
  lbl(p, A3, $A_3$, dir: "e", d: 12)
  lbl(p, A4, $A_4$, dir: "ne", d: 10)
  lbl(p, A5, $A_5$, dir: "w", d: 12)
  lbl(p, A2s, $A'_2$, dir: "se", d: 10)
  lbl(p, A3s, $A'_3$, dir: "e", d: 12)
  lbl(p, A4s, $A'_4$, dir: "ne", d: 10)
  lbl(p, A5s, $A'_5$, dir: "w", d: 12)
})
