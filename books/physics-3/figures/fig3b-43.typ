// 图 3·43 均匀辐向磁场（原书 p.204）
// CeTZ 重绘：半圆柱形磁极 N、S 之间的软铁圆柱 K，空隙里沿半径向内的磁力线，套在 K 外的矩形线圈 C。
// 坐标是 200 dpi 以上渲染的局部图（786×613）的像素坐标，圆心 (410, 295)。
#import "fig3b-lib.typ": *

#let fig-3-43(width: 5.6cm) = px-canvas(786, 613, width: width, (p, u) => {
  import cetz.draw: *
  let cx = 410
  let cy = 295
  let pt(r, deg) = (cx + r * calc.cos(deg * 1deg), cy - r * calc.sin(deg * 1deg))
  // 磁极：N 在左，S 在右
  line(p(355, 45), p(30, 40), p(42, 140), p(28, 300), p(40, 440), p(40, 545), p(350, 545), stroke: 1.1pt)
  line(p(470, 45), p(745, 45), p(752, 150), p(742, 300), p(752, 440), p(750, 545), p(470, 545), stroke: 1.1pt)
  arc(p(cx, cy), start: 102deg, stop: 258deg, radius: 255, anchor: "origin", stroke: 1.1pt)
  arc(p(cx, cy), start: -78deg, stop: 78deg, radius: 255, anchor: "origin", stroke: 1.1pt)
  // 软铁圆柱
  circle(p(cx, cy), radius: 175, fill: white, stroke: 1pt)
  // 径向磁力线
  for a in range(106, 255, step: 9) { ar(p, pt(252, a), pt(178, a), st: 0.7pt, scale: 0.4) }
  for a in range(-74, 75, step: 9) { ar(p, pt(252, a), pt(178, a), st: 0.7pt, scale: 0.4) }
  // 线圈
  line(p(215, 338), p(230, 383), p(612, 258), p(598, 208), close: true, fill: white, stroke: 1pt)
  circle(p(cx, 297), radius: 3, fill: black, stroke: none)
  lab(p, 87, 293, $N$)
  lab(p, 722, 290, $S$)
  lab(p, 495, 205, $C$)
  lab(p, 410, 350, $K$)
})
