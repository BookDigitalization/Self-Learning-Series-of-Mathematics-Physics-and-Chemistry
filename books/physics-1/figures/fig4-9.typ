// 图 4·9 匀速直线运动的速度图线（原书 p.99）
// 坐标图 CeTZ 重绘；坐标取自 200 dpi 页面图的显示坐标（原点 (420,1460)）。
// 纵轴刻度原图只标了 2、4（中间的短刻度未标数字，按等分补为 1、3 的位置）。
#import "/common/series.typ": *

#let fig-4-9(width: 7cm) = px-canvas(560, 440, origin: (420, 1460), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body, anchor: "center") = content(p(x, y), anchor: anchor, text(size: 8.5pt, body))
  let mk = (end: "stealth", fill: black, scale: 0.45)
  let (ox, oy) = (462, 1828)
  let sx = 52.2    // 每 1 秒
  let sy = 64.2    // 每 1 米/秒
  line(p(ox, oy), p(ox, 1508), stroke: 0.9pt, mark: mk)
  line(p(ox, oy), p(945, oy), stroke: 0.9pt, mark: mk)
  for k in range(1, 5) { line(p(ox, oy - k * sy), p(ox + 7, oy - k * sy), stroke: 0.6pt) }
  lab(ox - 18, oy - 2 * sy, [2])
  lab(ox - 18, oy - 4 * sy, [4])
  for k in range(1, 9) { line(p(ox + k * sx, oy), p(ox + k * sx, oy - 6), stroke: 0.6pt) }
  for k in (2, 4, 6, 8) { lab(ox + k * sx, oy + 20, str(k)) }
  lab(ox - 14, oy + 12, [0])
  lab(520, 1478, [$v$（米/秒）])
  lab(938, oy + 28, [$t$（秒）])
  // 速度图线 MN：v = 4 米/秒，8 秒内
  let (nx, ny) = (ox + 8 * sx, oy - 4 * sy)
  line(p(ox, ny), p(nx, ny), stroke: 1.4pt)
  line(p(nx, ny), p(nx, oy), stroke: 0.8pt, dash: "dashed")
  lab(ox + 14, ny - 18, $M$)
  lab(nx, ny - 18, $N$)
  lab(640, ny - 20, [$v = 4$ 米/秒])
})
