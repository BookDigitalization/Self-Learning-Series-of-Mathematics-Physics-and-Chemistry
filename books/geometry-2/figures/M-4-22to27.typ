// 图 4·22（原书 p.248）、4·23、4·24（p.249）、4·25、4·26、4·27（p.250）；页面 120 dpi 坐标。
#import "M-base.typ": *

// 图 4·22：作图题 1 的分析图。正六边形 A1…A6，OA1、OA2 虚线
#let fig-M-4-22(width: 320 * k) = px-canvas(320, 340, origin: (530, 660), width: width, (p, u) => {
  import cetz.draw: *
  let O = (692, 822)
  let R = 140
  let (A1, A2, A3, A4, A5, A6) = range(6).map(i => M-pt(O, R, 270 + 60 * i - 360 * 0))
  circ(p, O, R)
  poly(p, (A1, A2, A3, A4, A5, A6), close: true)
  dseg(p, O, A1)
  dseg(p, O, A2)
  ring(p, O, r: 2.5)
  lbl(p, O, $O$, dir: "n", d: 11)
  lbl(p, A4, $A_4$, dir: "n", d: 10)
  lbl(p, A3, $A_3$, dir: "ne", d: 13)
  lbl(p, A5, $A_5$, dir: "nw", d: 13)
  lbl(p, A6, $A_6$, dir: "sw", d: 13)
  lbl(p, A2, $A_2$, dir: "se", d: 13)
  lbl(p, A1, $A_1$, dir: "s", d: 10)
})

// 图 4·23：以 A1、A4 为圆心、半径为半径作弧（虚线），截圆于 A2、A6 和 A3、A5
#let fig-M-4-23(width: 335 * k) = px-canvas(335, 320, origin: (545, 260), width: width, (p, u) => {
  import cetz.draw: *
  let O = (712, 413)
  let R = 140
  let (A4, A5, A6, A1, A2, A3) = M-ngon(O, R, 6, 0)
  circ(p, O, R)
  poly(p, (A1, A2, A3, A4, A5, A6), close: true)
  dseg(p, A1, A4)
  M-arc(p, A1, A6, A2, stroke: dsh)
  M-arc(p, A4, A5, A3, stroke: dsh)
  ring(p, O, r: 2.5)
  lbl(p, O, $O$, dir: "n", d: 11)
  lbl(p, A1, $A_1$, dir: "w", d: 12)
  lbl(p, A4, $A_4$, dir: "e", d: 12)
  lbl(p, A5, $A_5$, dir: "ne")
  lbl(p, A6, $A_6$, dir: "nw")
  lbl(p, A2, $A_2$, dir: "sw")
  lbl(p, A3, $A_3$, dir: "se")
})

// 图 4·24：正三角形 A1A3A5，A2、A4、A6 为圆周上的分点（短横记号）
#let fig-M-4-24(width: 250 * k) = px-canvas(250, 250, origin: (630, 870), width: width, (p, u) => {
  import cetz.draw: *
  let O = (755, 990)
  let R = 100
  let (A1, A2, A3, A4, A5, A6) = M-ngon(O, R, 6, 210)
  circ(p, O, R)
  poly(p, (A1, A3, A5), close: true)
  for a in (A2, A4, A6) { M-radtick(p, O, a, s: 5) }
  ring(p, O, r: 2.5)
  lbl(p, O, $O$, dir: "s", d: 10)
  lbl(p, A5, $A_5$, dir: "n", d: 10)
  lbl(p, A4, $A_4$, dir: "ne", d: 10)
  lbl(p, A6, $A_6$, dir: "nw", d: 10)
  lbl(p, A1, $A_1$, dir: "sw")
  lbl(p, A3, $A_3$, dir: "se")
  lbl(p, A2, $A_2$, dir: "s", d: 11)
})

// 图 4·25：以 B 为圆心、半径为半径作弧（虚线），截圆于 A2、A3
#let fig-M-4-25(width: 250 * k) = px-canvas(250, 270, origin: (160, 215), width: width, (p, u) => {
  import cetz.draw: *
  let O = (286, 347)
  let R = 100
  let (A1, A2, A3) = M-ngon(O, R, 3, 90)
  let B = (286, 447)
  circ(p, O, R)
  poly(p, (A1, A2, A3), close: true)
  dseg(p, A1, B)
  M-arc(p, B, A2, A3, stroke: dsh)
  ring(p, O, r: 2.5)
  lbl(p, O, $O$, dir: "e", d: 10)
  lbl(p, A1, $A_1$, dir: "n", d: 10)
  lbl(p, A2, $A_2$, dir: "w", d: 11)
  lbl(p, A3, $A_3$, dir: "e", d: 11)
  lbl(p, B, $B$, dir: "s", d: 10)
})

// 图 4·26：圆内接正方形 A1A2A3A4，对角线（虚线）
#let fig-M-4-26(width: 245 * k) = px-canvas(245, 235, origin: (545, 235), width: width, (p, u) => {
  import cetz.draw: *
  let O = (670, 347)
  let R = 100
  let (A3, A4, A1, A2) = M-ngon(O, R, 4, 45)
  circ(p, O, R)
  poly(p, (A1, A2, A3, A4), close: true)
  dseg(p, A1, A3)
  dseg(p, A2, A4)
  ring(p, O, r: 2.5)
  lbl(p, O, $O$, dir: "e", d: 10)
  lbl(p, A4, $A_4$, dir: "nw")
  lbl(p, A3, $A_3$, dir: "ne")
  lbl(p, A1, $A_1$, dir: "sw")
  lbl(p, A2, $A_2$, dir: "se")
})

// 图 4·27：作图题 4 的分析图。弧 A1A2 = 1/10 圆，∠OA1A2 = 72°，A2M 平分 ∠OA2A1
#let fig-M-4-27(width: 350 * k) = px-canvas(350, 350, origin: (510, 910), width: width, (p, u) => {
  import cetz.draw: *
  let O = (683.5, 1086)
  let R = 156
  let A1 = M-pt(O, R, 270 - 18)
  let A2 = M-pt(O, R, 270 + 18)
  let g = (calc.sqrt(5) - 1) / 2
  let M = M-at(O, A1, g)
  circ(p, O, R)
  seg(p, A1, A2)
  dseg(p, O, A1)
  dseg(p, O, A2)
  dseg(p, A2, M)
  anglearc(p, O, A1, A2, 24)
  anglearc(p, A1, O, A2, 20)
  anglearc(p, A2, O, M, 17)
  anglearc(p, A2, M, A1, 24)
  ring(p, O, r: 3)
  lbl(p, O, $O$, dir: "n", d: 11)
  lbl(p, M, $M$, dir: "nw", d: 11)
  lbl(p, A1, $A_1$, dir: "sw", d: 10)
  lbl(p, A2, $A_2$, dir: "se", d: 10)
  lbl(p, (O.at(0) + 20, O.at(1) + 19), $36°$, dir: "c", d: 0)
  lbl(p, (A1.at(0) - 31, A1.at(1) - 38), $72°$, dir: "c", d: 0)
  lbl(p, (A2.at(0) + 25, A2.at(1) - 38), $36°$, dir: "c", d: 0)
})
