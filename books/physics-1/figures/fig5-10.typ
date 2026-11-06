// 图 5·10 甲、乙的速度图线（原书 p.142）
// 坐标图，按原图重绘。坐标取自 200 dpi 页面图的“显示图”坐标（宽 1568），画布原点取 (480, 1390)。
#import "/common/series.typ": *
#import "fig5-6.typ": hatch

#let fig-5-10(width: 8cm) = px-canvas(740, 500, origin: (480, 1390), width: width, (p, u) => {
  import cetz.draw: *
  let mk = (end: "stealth", fill: black, scale: 0.45)
  let (x0, y0) = (558, 1838)
  let ux = 126
  let uy = 58
  let px(t) = x0 + t * ux
  let py(v) = y0 - v * uy
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let cn(x, y, body) = content(p(x, y), anchor: "center", text(font: fonts.song, size: 9pt, body))
  // 阴影：矩形内“／”；三角形内交叉
  hatch(p, ((x0, y0), (px(3), y0), (px(3), py(6)), (x0, py(6))), step: 62, up: true)
  hatch(p, ((x0, y0), (px(3), y0), (px(3), py(6))), step: 30, up: true)
  hatch(p, ((x0, y0), (px(3), y0), (px(3), py(6))), step: 30)
  line(p(505, y0), p(1205, y0), stroke: 0.9pt, mark: mk)
  line(p(x0, y0), p(x0, 1420), stroke: 0.9pt, mark: mk)
  for t in range(1, 5) { line(p(px(t), y0), p(px(t), y0 - 7), stroke: 0.6pt); lab(px(t), y0 + 20, str(t)) }
  for v in range(1, 8) { line(p(x0, py(v)), p(x0 + 7, py(v)), stroke: 0.6pt); lab(x0 - 14, py(v), str(v)) }
  lab(x0 - 12, y0 + 20, $0$)
  lab(630, 1418, text(font: fonts.song, size: 8.5pt)[$v$（米/秒）])
  lab(1160, y0 + 20, text(font: fonts.song, size: 8.5pt)[$t$（秒）])
  // 甲：v = 6 的水平线；乙：过原点的直线
  line(p(x0, py(6)), p(1165, py(6)), stroke: 1.6pt)
  line(p(x0, y0), p(1003, 1420), stroke: 1.6pt)
  cn(1140, 1512, [甲])
  cn(985, 1425, [乙])
  lab(925, 1468, $M$)
  line(p(x0, py(4)), p(px(2), py(4)), stroke: (thickness: 0.7pt, dash: "dash-dotted"))
  line(p(px(2), y0), p(px(2), py(4)), stroke: (thickness: 0.8pt, dash: "dashed"))
  line(p(px(3), y0), p(px(3), py(6)), stroke: (thickness: 1.2pt, dash: "dashed"))
})
