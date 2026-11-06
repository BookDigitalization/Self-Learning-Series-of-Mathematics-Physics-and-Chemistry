// 图 5·8 匀减速直线运动的速度图线（原书 p.140）
// 坐标图，按原图重绘（v₀ = 10 米/秒，a = -1 米/秒²）。坐标取自 200 dpi 页面图的“显示图”坐标（宽 1568），画布原点取 (320, 190)。
#import "/common/series.typ": *

#let fig-5-8(width: 6.5cm) = px-canvas(440, 570, origin: (320, 190), width: width, (p, u) => {
  import cetz.draw: *
  let mk = (end: "stealth", fill: black, scale: 0.45)
  let (x0, y0) = (373, 710)
  let ux = 39.3
  let uy = 41.3
  let px(t) = x0 + t * ux
  let py(v) = y0 - v * uy
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  line(p(x0, y0), p(712, y0), stroke: 0.9pt, mark: mk)
  line(p(x0, y0), p(x0, 215), stroke: 0.9pt, mark: mk)
  for t in range(1, 8) { line(p(px(t), y0), p(px(t), y0 - 7), stroke: 0.6pt) }
  for v in range(1, 12) { line(p(x0, py(v)), p(x0 + 7, py(v)), stroke: 0.6pt) }
  for t in range(0, 8) { lab(px(t) - if t == 0 { 11 } else { 0 }, y0 + 20, str(t)) }
  for v in range(1, 12) { lab(x0 - 15, py(v), str(v)) }
  lab(448, 225, text(font: fonts.song, size: 8.5pt)[$v$（米/秒）])
  lab(693, y0 + 20, text(font: fonts.song, size: 8.5pt)[$t$（秒）])
  line(p(px(0), py(10)), p(px(6), py(4)), stroke: 1.4pt)
  for t in range(0, 7) {
    circle(p(px(t), py(10 - t)), radius: 3, stroke: 0.7pt, fill: white)
  }
})
