// 图 1·20（原书 p.40）：不等式组 (II) 的两个不等式的解在数轴上的表示（没有公共部分）。
// 坐标取自 300 dpi 裁图的像素（y 向下）：数轴 y=130，折线 y=47；−2、−1、1 三点 x = 427、595、931。
#import "/common/series.typ": *

#let fig-1-20(width: 10cm) = px-canvas(1340, 190, width: width, (p, u) => {
  import cetz.draw: *
  let t(x, y, body) = content(p(x, y), text(font: fonts.song, size: 8pt, body))
  let ar = (end: "stealth", fill: black, scale: 0.5)
  let ay = 130
  line(p(95, ay), p(1270, ay), stroke: 0.6pt, mark: ar)
  t(1312, ay, $x$)
  // (4)：x<−2
  line(p(427, ay), p(427, 47), p(95, 47), stroke: 0.6pt, mark: ar)
  // (3)：−1<x<1
  line(p(595, ay), p(595, 47), p(931, 47), p(931, ay), stroke: 0.6pt)
  for x in (427, 595, 931) { circle(p(x, ay), radius: 8 * u, fill: white, stroke: 0.6pt) }
  t(427, 165, [−2])
  t(595, 165, [−1])
  t(931, 165, [1])
  t(270, 18, [(4)])
  t(765, 18, [(3)])
})
