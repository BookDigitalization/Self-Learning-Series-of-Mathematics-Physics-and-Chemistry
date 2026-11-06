// 图 4·10 速度图线和路程（原书 p.100）
// 坐标图 CeTZ 重绘；坐标取自 200 dpi 页面图的显示坐标（原点 (320,880)）。
#import "/common/series.typ": *

#let fig-4-10(width: 7cm) = px-canvas(500, 480, origin: (320, 880), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 8.5pt, body))
  let mk = (end: "stealth", fill: black, scale: 0.45)
  let (ox, oy) = (362, 1300)
  let sx = 45.2    // 每 1 秒
  let sy = 47.5    // 每 1 米/秒
  line(p(ox, oy), p(ox, 935), stroke: 0.9pt, mark: mk)
  line(p(ox, oy), p(785, oy), stroke: 0.9pt, mark: mk)
  for k in range(1, 7) { line(p(ox, oy - k * sy), p(ox + 7, oy - k * sy), stroke: 0.6pt) }
  for k in (2, 4, 6) { lab(ox - 16, oy - k * sy, str(k)) }
  for k in range(1, 8) { line(p(ox + k * sx, oy), p(ox + k * sx, oy - 6), stroke: 0.6pt) }
  for k in (2, 4, 6) { lab(ox + k * sx, oy + 20, str(k)) }
  lab(ox, oy + 20, [0])
  lab(395, 915, [$v$（米/秒）])
  lab(758, oy + 28, [$t$（秒）])
  // v = 5 米/秒 的速度图线 PM，7 秒处作垂线 MN
  let (mx, my) = (ox + 7 * sx, oy - 5 * sy)
  line(p(ox, my), p(738, my), stroke: 1.4pt)
  line(p(mx, my), p(mx, oy), stroke: 0.8pt, dash: "dashed")
  lab(ox - 17, my, $P$)
  lab(mx, my - 18, $M$)
  lab(mx, oy + 22, $N$)
  lab(525, my - 26, [$v = 5$ 米/秒])
})
