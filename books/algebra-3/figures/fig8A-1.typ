// 图 8·1（原书 p.285）：例 2 中不等式组 x²−x−3>0、2x+1>0 的解在数轴上的表示。
// 坐标取自 200 dpi 渲染页面图的显示读数（显示宽 1596，真实宽 1654，缩放 1.04），不是精量；
// 三个空心圈的位置照扫描（手绘，并不按 (1−√13)/2、−1/2、(1+√13)/2 的数值比例）。
#import "/common/series.typ": *

#let fig-8-1(width: 9cm) = px-canvas(930, 160, origin: (360, 1545), width: width, (p, u) => {
  import cetz.draw: *
  let t(x, y, body) = content(p(x, y), text(font: fonts.song, size: 8pt, body))
  let ar = (end: "stealth", fill: black, scale: 0.5)
  let ay = 1615
  // 数轴，右端箭头与 x
  line(p(380, ay), p(1245, ay), stroke: 0.6pt, mark: ar)
  t(1265, ay - 2, $x$)
  // 公共解 x>(1+√13)/2：轴上加粗
  line(p(1003, ay), p(1240, ay), stroke: 1.8pt)
  // x²−x−3>0 的左半：x<(1−√13)/2，向左的折线
  line(p(671, ay), p(671, 1560), p(380, 1560), stroke: 0.6pt, mark: ar)
  // 2x+1>0：x>−1/2，向右的折线
  line(p(702, ay), p(702, 1560), p(1232, 1560), stroke: 0.6pt, mark: ar)
  // x²−x−3>0 的右半：x>(1+√13)/2，向右的折线
  line(p(1003, ay), p(1003, 1583), p(1232, 1583), stroke: 0.6pt, mark: ar)
  // 空心圈
  for x in (671, 702, 1003) { circle(p(x, ay), radius: 6 * u, fill: white, stroke: 0.6pt) }
  // 刻度值
  t(625, 1665, $(1 - sqrt(13)) / 2$)
  t(728, 1665, $-1 / 2$)
  t(1010, 1665, $(1 + sqrt(13)) / 2$)
})
