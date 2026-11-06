// 图 13·30 小球在竖直平面内的圆槽上运动的受力图（原书 p.450）
// 示意图，按原图重绘：圆槽（心 O），小球在 A 处受 G（分为 G_1、G_2）、N，在 B 处受 G、G_1′、G_2′、N′，速度 v_1、v_2。
// 坐标是页面显示图（宽 1568）上的像素坐标；位置为目测，各矢量方向按原图大致画出。
#import "/common/series.typ": *

#let fig-13-30(width: 8.4cm) = px-canvas(560, 520, origin: (320, 1240), width: width, (p, u) => {
  import cetz.draw: *
  let arr = (end: "stealth", fill: black, scale: 0.5)
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let dsh = (thickness: 0.8pt, dash: "dashed")
  let o = (590, 1485)
  circle(p(..o), radius: 215 * u, stroke: 1.2pt)
  let A = (770, 1393)
  let B = (430, 1590)
  line(p(..A), p(..B), stroke: dsh)
  circle(p(..A), radius: 8 * u, fill: black)
  circle(p(..B), radius: 8 * u, fill: black)
  // A 处
  line(p(783, 1333), p(808, 1368), stroke: 1.4pt, mark: arr)
  line(p(..A), p(700, 1412), stroke: 1.4pt, mark: arr)
  line(p(..A), p(745, 1525), stroke: 1.4pt, mark: arr)
  line(p(..A), p(815, 1488), stroke: 1.4pt, mark: arr)
  line(p(815, 1488), p(745, 1525), stroke: dsh)
  line(p(700, 1412), p(745, 1525), stroke: dsh)
  lab(823, 1352, $v_1$)
  lab(680, 1396, $G_2$)
  lab(718, 1380, $N$)
  lab(742, 1538, $G$)
  lab(832, 1495, $G_1$)
  lab(780, 1385, $A$)
  lab(583, 1478, $O$)
  // B 处
  line(p(..B), p(385, 1548), stroke: 1.4pt, mark: arr)
  line(p(..B), p(390, 1620), stroke: 1.4pt, mark: arr)
  line(p(..B), p(433, 1700), stroke: 1.4pt, mark: arr)
  line(p(..B), p(475, 1665), stroke: 1.4pt, mark: arr)
  line(p(..B), p(540, 1522), stroke: 1.4pt, mark: arr)
  lab(345, 1565, $v_2$)
  lab(345, 1632, $G_2'$)
  lab(415, 1717, $G$)
  lab(490, 1688, $G_1'$)
  lab(540, 1540, $N'$)
  lab(430, 1575, $B$)
})
