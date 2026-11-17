// 图 3·16 温度调节器的构造原理（原书 p.98）
// CeTZ 重绘；坐标是放大 2 倍的原图局部（540×810）的像素坐标，y 向下。
#import "/common/series.typ": *

#let fig-3-16(width: 5.4cm) = px-canvas(540, 810, width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let dash = (thickness: 2 * u, dash: (7 * u, 6 * u))
  // 外框
  rect(p(30, 24), p(416, 786), stroke: 3 * u)
  // 双金属片 C：圆环，缺口在左下，向下接到杠 M
  let (cx, cy, r) = (203, 180, 112)
  let ring-start = p(cx + r * calc.cos(-90deg), cy - r * calc.sin(-90deg))
  arc(ring-start, start: -90deg, stop: 211deg, radius: r, stroke: 17 * u)
  arc(ring-start, start: -90deg, stop: 211deg, radius: r, stroke: 2.5 * u + white)
  // 左端小方块（带孔）
  let blk = (p(84, 266), p(146, 240), p(156, 224), p(94, 250))
  line(..blk, close: true, fill: white, stroke: 2.4 * u)
  circle(p(142, 233), radius: 4 * u, stroke: 2 * u)
  // 杠 M
  rect(p(194, 300), p(210, 668), stroke: 2.4 * u, fill: white)
  for y in range(490, 548, step: 8) {
    line(p(195, y), p(209, y + 6), stroke: 1.6 * u)
  }
  line(p(194, 656), p(210, 668), stroke: 2 * u)
  // 虚线 A1、A 及小圆圈
  line(p(150, 233), p(368, 233), stroke: dash)
  circle(p(378, 232), radius: 7 * u, stroke: 2 * u, fill: white)
  line(p(386, 232), p(412, 232), stroke: 2 * u)
  line(p(414, 232), p(508, 232), stroke: dash)
  line(p(272, 592), p(368, 592), stroke: dash)
  circle(p(380, 592), radius: 7 * u, stroke: 2 * u, fill: white)
  line(p(388, 592), p(412, 592), stroke: 2 * u)
  line(p(414, 592), p(508, 592), stroke: dash)
  // 接触点 K：立柱与螺钉
  rect(p(252, 576), p(270, 660), stroke: 2.4 * u, fill: white)
  circle(p(262, 592), radius: 6 * u, stroke: 2 * u, fill: white)
  line(p(222, 636), p(252, 636), stroke: 3 * u)
  rect(p(278, 626), p(298, 652), stroke: 2 * u)
  // 标注
  lab(310, 92, $C$)
  lab(443, 205, $A_1$)
  lab(160, 448, $M$)
  lab(440, 562, $A$)
  lab(255, 690, $K$)
})
