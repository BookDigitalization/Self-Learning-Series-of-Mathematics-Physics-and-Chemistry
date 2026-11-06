// 图 4·3 路程和位移（原书 p.88）
// 线条图 CeTZ 重绘；坐标取自 200 dpi 页面图的显示坐标（原点 (780,1230)）。
#import "/common/series.typ": *

#let fig-4-3(width: 7cm) = px-canvas(480, 430, origin: (780, 1230), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  // 曲线路径 O → M，并向两端略延伸
  bezier(p(803, 1637), p(815, 1563), p(803, 1610), p(808, 1580), stroke: 0.9pt)
  bezier(p(815, 1563), p(945, 1465), p(850, 1520), p(900, 1470), stroke: 0.9pt)
  bezier(p(945, 1465), p(1070, 1265), p(990, 1450), p(1000, 1265), stroke: 0.9pt)
  bezier(p(1070, 1265), p(1185, 1302), p(1120, 1262), p(1160, 1280), stroke: 0.9pt)
  line(p(1185, 1302), p(1226, 1310), stroke: 0.9pt)
  // 位移：O → M 的直线
  line(p(815, 1563), p(1185, 1302), stroke: 0.7pt, mark: (end: "stealth", fill: black, scale: 0.4))
  circle(p(815, 1563), radius: 3.5 * u, stroke: 0.6pt, fill: white)
  circle(p(1185, 1302), radius: 3.5 * u, stroke: 0.6pt, fill: white)
  lab(800, 1562, $O$)
  lab(1197, 1277, $M$)
  lab(862, 1460, [路])
  lab(1085, 1243, [程])
  lab(958, 1497, [位])
  lab(1070, 1418, [移])
})
