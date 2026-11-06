// 图 5·5 初速度不等于零的匀加速直线运动的速度图线（原书 p.137）
// 坐标图，按原图重绘。坐标取自 200 dpi 页面图的“显示图”坐标（宽 1568），画布原点取 (930, 100)。
#import "/common/series.typ": *

#let fig-5-5(width: 7cm) = px-canvas(450, 540, origin: (930, 100), width: width, (p, u) => {
  import cetz.draw: *
  let (x0, y0) = (993, 598)
  let ux = 45.5
  let uy = 46.5
  let px(t) = x0 + t * ux
  let py(v) = y0 - v * uy
  let mk = (end: "stealth", fill: black, scale: 0.45)
  line(p(x0, y0), p(1275, y0), stroke: 0.9pt, mark: mk)
  line(p(x0, y0), p(x0, 150), stroke: 0.9pt, mark: mk)
  for t in range(1, 6) { line(p(px(t), y0), p(px(t), y0 - 8), stroke: 0.6pt) }
  for v in range(1, 9) { line(p(x0, py(v)), p(x0 + 8, py(v)), stroke: 0.6pt) }
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  for t in range(1, 6) { lab(px(t), y0 + 20, str(t)) }
  for v in range(1, 9) { lab(x0 - 14, py(v), str(v)) }
  lab(x0 - 3, y0 + 20, $0$)
  lab(1050, 127, text(font: fonts.song, size: 8.5pt)[$v$（米/秒）])
  lab(1315, y0 + 4, text(font: fonts.song, size: 8.5pt)[$t$（秒）])
  // 图线：v = 2 + t
  line(p(x0, py(2)), p(1212, 278), stroke: 1.6pt)
  for (t, name, dx, dy) in ((0, $A$, 22, 0), (1, $B$, 20, -6), (2, $C$, 18, -8), (3, $D$, 18, -10), (4, $E$, 18, -10)) {
    let v = 2 + t
    if t > 0 {
      line(p(px(t), y0), p(px(t), py(v)), stroke: (thickness: if t >= 2 { 1.3pt } else { 0.6pt }, dash: "dashed"))
    }
    line(p(x0, py(v)), p(px(t), py(v)), stroke: (thickness: 0.6pt, dash: "dashed"))
    circle(p(px(t), py(v)), radius: 3, stroke: 0.7pt, fill: white)
    lab(px(t) + dx, py(v) + dy, name)
  }
})
