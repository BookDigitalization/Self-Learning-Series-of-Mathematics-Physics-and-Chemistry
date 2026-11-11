// 习题 5·1 的插图（几何第二册 p.271–272）：第 8、9、12、13、14 题。页面渲染 dpi：120。
#import "N-base.typ": *

// 第 8 题（p.271）：两滑轮与皮带
#let fig-N-ex8(width: 560 * k) = px-canvas(560, 90, origin: (243, 815), width: width, (p, u) => {
  import cetz.draw: *
  let (a, b) = ((287, 862), (760, 862))
  let R = 36
  line(p(a.at(0), 826), p(b.at(0), 826), stroke: lb)
  line(p(a.at(0), 898), p(b.at(0), 898), stroke: lb)
  carc(p, a, R, 90, 270, stroke: lb)
  carc(p, b, R, -90, 90, stroke: lb)
  circ(p, a, 34)
  circ(p, b, 34)
  seg(p, (a.at(0), 826), (a.at(0), 898), stroke: lt)
  seg(p, (b.at(0), 826), (b.at(0), 898), stroke: lt)
  seg(p, a, b, stroke: lt)
  lbl(p, (270, 858), tt[20], dir: "c", d: 0)
  lbl(p, (773, 860), tt[20], dir: "c", d: 0)
  lbl(p, (525, 846), tt[140], dir: "c", d: 0)
})

// 第 9 题（p.271）：同心圆，半径 x
#let fig-N-ex9(width: 200 * k) = px-canvas(200, 200, origin: (679, 1040), width: width, (p, u) => {
  import cetz.draw: *
  let O = (780, 1140)
  circ(p, O, 95, stroke: lb)
  circ(p, O, 62, stroke: lb)
  line(p(..O), p(838, 1140), stroke: dsh)
  line(p(871, 1140), p(875, 1140), stroke: lw)
  ring(p, O, r: 2.4)
  lbl(p, (856, 1141), $x$, dir: "c", d: 0)
})

// 第 12 题（p.272）：半圆组成的螺线
#let fig-N-ex12(width: 400 * k) = px-canvas(400, 340, origin: (125, 262), width: width, (p, u) => {
  import cetz.draw: *
  let O1 = (293, 430)
  let O2 = (313, 430)
  seg(p, (132, 430), (490, 430), stroke: (paint: black, thickness: 1.1pt, dash: "dashed"))
  // 下方半圆（圆心 O1，半径 r、r+h、r+2h）与上方半圆（圆心 O2，半径 r+h/2、r+3h/2、r+5h/2）
  for r in (40, 80, 120) { carc(p, O1, r, 180, 360, stroke: lb) }
  for r in (60, 100, 140) { carc(p, O2, r, 0, 180, stroke: lb) }
  // 半径标注
  let rad(c, r, a, ..style) = {
    let q = (c.at(0) + r * calc.cos(a * 1deg), c.at(1) - r * calc.sin(a * 1deg))
    line(p(..c), p(..q), stroke: lt, mark: arw)
  }
  rad(O2, 60, 100)
  rad(O2, 100, 62)
  rad(O2, 140, 40)
  rad(O1, 40, 270)
  rad(O1, 80, 239)
  rad(O1, 120, 205)
  // 引线
  line(p(196, 337), p(298, 408), stroke: lt)
  line(p(375, 318), p(340, 355), stroke: lt)
  line(p(425, 357), p(396, 372), stroke: lt)
  wl(p, (190, 318), $r + h / 2$)
  wl(p, (376, 298), $r + 3 / 2 h$)
  wl(p, (440, 348), $r + 5 / 2 h$)
  content(p(268, 468), tt($r + h$), angle: 50deg)
  content(p(218, 468), tt($r + 2 h$), angle: 25deg)
  lbl(p, (296, 456), tsi($r$), dir: "c", d: 0)
  ring(p, O1, r: 2.2)
  ring(p, O2, r: 2.8)
  lbl(p, O1, $O_1$, dir: "nw", d: 12)
  lbl(p, O2, $O_2$, dir: "se", d: 13)
})

// 第 13 题（p.272）：圆 O 与四个半圆组成的曲线
#let fig-N-ex13(width: 245 * k) = px-canvas(245, 240, origin: (568, 326), width: width, (p, u) => {
  import cetz.draw: *
  let O = (686, 436)
  circ(p, O, 101, stroke: lb)
  carc(p, (619.5, 436), 33.5, 0, 180, stroke: lb)
  carc(p, (653, 436), 67, 0, 180, stroke: lb)
  carc(p, (720, 436), 67, 180, 360, stroke: lb)
  carc(p, (753, 436), 33.5, 180, 360, stroke: lb)
  seg(p, (585, 436), (787, 436), stroke: lb)
  ring(p, O, r: 2.2)
  lbl(p, (585, 436), $A$, dir: "w", d: 11)
  lbl(p, (653, 436), $B$, dir: "ne", d: 11)
  lbl(p, O, $O$, dir: "s", d: 12)
  lbl(p, (720, 436), $C$, dir: "ne", d: 11)
  lbl(p, (787, 436), $D$, dir: "e", d: 11)
})

// 第 14 题（p.272）：皮带连结的两个轮子 A、B
#let fig-N-ex14(width: 420 * k) = px-canvas(420, 210, origin: (290, 880), width: width, (p, u) => {
  import cetz.draw: *
  let A = (350, 987)
  let B = (592, 987)
  let (r1, r2) = (49, 95)
  let phi = calc.asin((r2 - r1) / (B.at(0) - A.at(0)))
  let up = 90deg + phi
  let ua = up.deg()
  // 圆（细）与皮带包住的圆弧（粗）
  carc(p, A, r1, 360 - ua, 360 + ua, stroke: lt)
  carc(p, A, r1, ua, 360 - ua, stroke: lb)
  carc(p, B, r2, -ua, ua, stroke: lb)
  carc(p, B, r2, ua, 360 - ua, stroke: lt)
  let tpt(c, r, a) = (c.at(0) + r * calc.cos(a * 1deg), c.at(1) - r * calc.sin(a * 1deg))
  tseg(p, tpt(A, r1, ua), tpt(B, r2, ua))
  tseg(p, tpt(A, r1, 360 - ua), tpt(B, r2, 360 - ua))
  seg(p, A, B, stroke: lt)
  seg(p, A, tpt(A, r1, 360 - ua), stroke: lt)
  seg(p, B, tpt(B, r2, 360 - ua), stroke: lt)
  anglearc(p, B, A, tpt(B, r2, 360 - ua), 26)
  ring(p, A, r: 2.8)
  ring(p, B, r: 2.8)
  lbl(p, A, $A$, dir: "w", d: 13)
  lbl(p, B, $B$, dir: "e", d: 13)
})
