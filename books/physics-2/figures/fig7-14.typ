// 图 7·14 水的饱和汽压跟温度关系的图线（原书 p.242，CeTZ 重绘）
// 坐标取自 200 dpi 带网格的页面图；曲线按表 7·4 水栏 0–100°C 的数值描点。
// 横轴：0°C 在 x = 375，每 °C 3.29 px；纵轴：0 在 y = 1270，每厘米汞柱 3.35 px。
#import "/common/series.typ": *

#let fig-7-14(width: 7cm) = px-canvas(560, 450, origin: (300, 890), width: width, (p, u) => {
  import cetz.draw: *
  let lw = 0.6pt
  set-style(stroke: lw)
  let tx(pt, body, anchor) = content(pt, anchor: anchor, text(size: 8pt, body))
  let X(t) = 375 + 3.29 * t
  let Y(v) = 1270 - 3.35 * v
  line(p(375, 1270), p(375, 910), mark: (end: ">", fill: black, scale: 0.5))
  line(p(375, 1270), p(770, 1270), mark: (end: ">", fill: black, scale: 0.5))
  for v in (20, 40, 60, 80) {
    line(p(375, Y(v)), p(381, Y(v)))
    tx(p(371, Y(v)), [#v], "east")
  }
  for t in (0, 20, 40, 60, 80, 100) {
    if t > 0 { line(p(X(t), 1270), p(X(t), 1264)) }
    tx(p(X(t), 1280), [#t], "north")
  }
  tx(p(335, 1090), std.rotate(-90deg, [饱和汽压（厘米高水银柱）]), "center")
  tx(p(600, 1322), [温度（°C）], "center")
  let data = ((0, 0.458), (10, 0.921), (20, 1.754), (30, 3.1), (40, 5.5), (50, 9.2), (60, 14.7), (70, 23.2), (80, 35.3), (90, 52.4), (100, 76))
  // 原图曲线止于约 98°C（图线末端略低于 76）
  let pts = data.slice(0, 10).map(((t, v)) => p(X(t), Y(v)))
  pts.push(p(X(97.5), Y(76)))
  catmull(..pts, stroke: 1.6pt, tension: 0.5)
})
