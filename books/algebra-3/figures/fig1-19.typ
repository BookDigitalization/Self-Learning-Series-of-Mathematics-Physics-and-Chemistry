// 图 1·19（原书 p.40）：不等式组 (I) 的两个不等式的解在数轴上的表示。
// 坐标取自 300 dpi 裁图的像素（y 向下）：数轴 y=205，(1) 的折线 y=157，(2) 的折线 y=125；
// −2、−1、1 三点（空心圈）x = 372、541、876。
#import "/common/series.typ": *

#let fig-1-19(width: 10cm) = px-canvas(1340, 270, width: width, (p, u) => {
  import cetz.draw: *
  let t(x, y, body) = content(p(x, y), text(font: fonts.song, size: 8pt, body))
  let ar = (end: "stealth", fill: black, scale: 0.5)
  let ay = 205
  // 数轴（右端箭头与 x）
  line(p(40, ay), p(1290, ay), stroke: 0.6pt, mark: ar)
  t(1312, ay, $x$)
  // 公共解 −2<x<−1 与 x>1：轴上加粗
  line(p(372, ay), p(541, ay), stroke: 1.6pt)
  line(p(876, ay), p(1290, ay), stroke: 1.6pt)
  // (2)：x>−2
  line(p(372, ay), p(372, 125), p(1255, 125), stroke: 0.6pt, mark: ar)
  // (1)：x<−1 或 x>1
  line(p(541, ay), p(541, 157), p(40, 157), stroke: 0.6pt, mark: ar)
  line(p(876, ay), p(876, 157), p(1255, 157), stroke: 0.6pt, mark: ar)
  // 空心圈
  for x in (372, 541, 876) { circle(p(x, ay), radius: 8 * u, fill: white, stroke: 0.6pt) }
  // 刻度值
  t(372, 243, [−2])
  t(541, 243, [−1])
  t(876, 243, [1])
  // 标注 (1)(2)
  t(245, 120, [(1)])
  t(770, 92, [(2)])
  content(p(1050, 157), box(fill: white, inset: (x: 1pt, y: 0pt), text(font: fonts.song, size: 8pt)[(1)]))
})
