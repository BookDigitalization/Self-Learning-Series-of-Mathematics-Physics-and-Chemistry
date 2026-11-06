// 复习题十三 第 4 题附图（原书 p.470）：斜抛轨迹，A、B（同高）… C、D（同高），A′B′、C′D′ 为水平距离。
// 线条图，按原图重绘；坐标是页面显示图（宽 1568）上的像素坐标，抛物线取标准形状，位置为目测。
#import "/common/series.typ": *

#let fig-rev-13-4(width: 7.6cm) = px-canvas(560, 380, origin: (810, 500), width: width, (p, u) => {
  import cetz.draw: *
  let arr = (end: "stealth", fill: black, scale: 0.5)
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let dsh = (thickness: 0.7pt, dash: "dashed")
  let (ox, oy, xe, h) = (840, 800, 1262, 165)
  let L = xe - ox
  let par(x) = oy - 4 * h * (x - ox) * (xe - x) / (L * L)
  line(p(ox, oy), p(838, 520), stroke: 1.4pt, mark: arr)
  line(p(ox, oy), p(1340, oy), stroke: 1.4pt, mark: arr)
  lab(855, 525, $y$)
  lab(1338, 790, $x$)
  lab(822, 818, $O$)
  line(..range(0, 43).map(k => { let x = ox + k * L / 42; p(x, par(x)) }), stroke: 1.5pt)
  // A、B、C、D
  let xa = 880
  let xb = 940
  let xc = 1162
  let xd = 1222
  line(p(838, par(xb)), p(xc, par(xc)), stroke: dsh)
  line(p(838, par(xa)), p(xd, par(xd)), stroke: dsh)
  for x in (xa, xb, xc, xd) {
    line(p(x, par(x)), p(x, oy), stroke: dsh)
    circle(p(x, par(x)), radius: 2.5 * u, fill: black, stroke: none)
  }
  lab(878, 712, $A$)
  lab(938, 655, $B$)
  lab(1167, 650, $C$)
  lab(1232, 710, $D$)
  lab(xa + 6, 818, $A'$)
  lab(xb + 6, 818, $B'$)
  lab(xc - 8, 818, $C'$)
  lab(xd - 8, 818, $D'$)
})
