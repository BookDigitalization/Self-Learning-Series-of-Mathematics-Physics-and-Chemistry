// 图 5·4 初速度为零的匀加速直线运动的速度图线（原书 p.137）
// 坐标图，按原图重绘。坐标取自 200 dpi 页面图的“显示图”坐标（宽 1568），画布原点取 (380, 180)。
// 原图时间轴 5、6 两个刻度间距略不均匀，这里按等间距重绘。
#import "/common/series.typ": *

#let fig-5-4(width: 7cm) = px-canvas(520, 440, origin: (380, 180), width: width, (p, u) => {
  import cetz.draw: *
  let (x0, y0) = (472, 548)
  let ux = 46.5
  let uy = 33
  let px(t) = x0 + t * ux
  let py(v) = y0 - v * uy
  let mk = (end: "stealth", fill: black, scale: 0.45)
  // 坐标轴
  line(p(405, y0), p(858, y0), stroke: 0.9pt, mark: mk)
  line(p(x0, 600), p(x0, 200), stroke: 0.9pt, mark: mk)
  for t in range(1, 7) { line(p(px(t), y0), p(px(t), y0 - 8), stroke: 0.6pt) }
  for v in range(1, 9) { line(p(x0, py(v)), p(x0 + 8, py(v)), stroke: 0.6pt) }
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  for t in range(1, 7) { lab(px(t), y0 + 22, str(t)) }
  for v in range(1, 9) { lab(x0 - 16, py(v), str(v)) }
  lab(x0 - 15, y0 + 22, $0$)
  lab(545, 213, text(font: fonts.song, size: 8.5pt)[$v$（米/秒）])
  lab(820, y0 + 22, text(font: fonts.song, size: 8.5pt)[$t$（秒）])
  // 图线
  line(p(x0, y0), p(695, 240), stroke: 1.6pt)
  // 对应点及虚线
  for (t, name, dx, dy) in ((1, $A$, -16, -22), (2, $B$, -16, -22), (3, $C$, -12, -22), (4, $D$, -12, -22)) {
    let v = 2 * t
    line(p(px(t), y0), p(px(t), py(v)), stroke: (thickness: if t == 4 { 1.3pt } else { 0.6pt }, dash: "dashed"))
    line(p(x0, py(v)), p(px(t), py(v)), stroke: (thickness: 0.6pt, dash: "dashed"))
    circle(p(px(t), py(v)), radius: 3, stroke: 0.7pt, fill: white)
    lab(px(t) + dx, py(v) + dy, name)
  }
})
