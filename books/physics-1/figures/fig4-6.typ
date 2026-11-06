// 图 4·6 物体在不同时间内所通过的路程（原书 p.97）
// 坐标图 CeTZ 重绘；坐标取自 200 dpi 页面图的显示坐标（原点 (580,110)）。
#import "/common/series.typ": *

#let fig-4-6(width: 8cm) = px-canvas(620, 580, origin: (580, 110), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body, anchor: "center") = content(p(x, y), anchor: anchor, text(size: 8.5pt, body))
  let mk = (end: "stealth", fill: black, scale: 0.45)
  let (ox, oy) = (642, 641)
  let sx = 68.2   // 每 1 秒的像素
  let sy = 69.3   // 每 1 米的像素
  line(p(ox, oy), p(ox, 180), stroke: 0.9pt, mark: mk)
  line(p(ox, oy), p(1150, oy), stroke: 0.9pt, mark: mk)
  for k in range(1, 7) {
    line(p(ox, oy - k * sy), p(ox + 7, oy - k * sy), stroke: 0.6pt)
    lab(ox - 20, oy - k * sy + 3, str(k))
    line(p(ox + k * sx, oy), p(ox + k * sx, oy - 7), stroke: 0.6pt)
    lab(ox + k * sx, oy + 20, str(k))
  }
  lab(ox - 20, oy + 8, [0])
  lab(665, 140, [$s$（米）])
  lab(1135, oy + 20, [$t$（秒）])
  // A(3, 2)、B(6, 4)
  for (t, s, name, ax, ay) in ((3, 2, [$A(3, 2)$], 888, 480), (6, 4, [$B(6, 4)$], 1085, 331)) {
    let (x, y) = (ox + t * sx, oy - s * sy)
    line(p(ox, y), p(x, y), stroke: 0.7pt, dash: "dashed")
    line(p(x, oy), p(x, y), stroke: 0.7pt, dash: "dashed")
    circle(p(x, y), radius: 3 * u, stroke: none, fill: black)
    lab(ax, ay, name)
  }
})
