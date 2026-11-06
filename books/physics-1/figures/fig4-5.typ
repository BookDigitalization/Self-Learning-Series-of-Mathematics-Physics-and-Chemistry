// 图 4·5 匀速直线运动（原书 p.91）
// 线条图 CeTZ 重绘；坐标取自 200 dpi 页面图的显示坐标（原点 (590,1400)）。
#import "/common/series.typ": *

#let fig-4-5(width: 8cm) = px-canvas(600, 120, origin: (590, 1400), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  line(p(626, 1461), p(1030, 1453), stroke: 0.8pt)
  line(p(1030, 1453), p(1150, 1451), stroke: 0.8pt, dash: "dashed")
  for (x, y, l) in ((626, 1461, $A$), (724, 1459, $B$), (825, 1457, $C$), (927, 1455, $D$), (1028, 1453, $E$)) {
    circle(p(x, y), radius: 3.5 * u, stroke: 0.7pt, fill: white)
    lab(x, y - 28, l)
  }
  // 运动方向
  line(p(778, 1497), p(885, 1497), stroke: 0.9pt, mark: (end: "stealth", fill: black, scale: 0.4))
})
